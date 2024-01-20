from flask import jsonify
import json
import psycopg
from dotenv import load_dotenv
import os
from datetime import datetime
import pytz
import uuid

load_dotenv()

class DBOperations:

    def create_connection(self):
        try:
            conn= psycopg.connect(dbname=os.getenv("DB_NAME"),
                user=os.getenv("DB_USER"),
                password=os.getenv("DB_PASSWORD"),
                host=os.getenv("DB_HOST"),
                port=os.getenv("DB_PORT")
             )
            return conn
        except Exception as e:
            print(f"Error connecting to the database: {e}")
            return None
    
    def generate_uuid(self):
        return str(uuid.uuid4())

    def add_questions(self, records):
        db_connect = self.create_connection()

        if db_connect:
            cur = db_connect.cursor()

            for item in records:
                question_id = str(self.generate_uuid())
                question = item["Question"]
                options = [item[f"options_{char.lower()}"] for char in ['A', 'B', 'C', 'D']]
                correct_answer = item["correct_answer"]
                points = item["points"]
                category = item['category']

                options_json = json.dumps(options)

                query = """
                        INSERT INTO question_bank (question_id, question, question_options, correct_answer, points, category, last_modified_date)
                        VALUES (%s, %s, %s, %s, %s, %s, %s)
                        """

                data = (question_id, question, options_json, correct_answer, points, category, self.get_current_date_time())
                cur.execute(query, data)

            db_connect.commit()
            cur.close()

        return jsonify({"message": "Question bank added successfully."}), 200
    
    def get_questions(self, query):
        try:
            conn = self.create_connection()
            if conn:
                cur = conn.cursor()     
                cur.execute(query)
                questions = cur.fetchall()
                cur.close()
                conn.close()
                users_list = {
                    "response": {
                        "msg": "We have successfully fetched records for Questions",
                        "records": [
                            {
                                'question_id': row[0],
                                'questions': row[1],
                                'options': row[2],
                                'correct_answer': row[3],
                                'category': row[4],
                                'points' : row[5],
                                'last_modified_date_time':row[6]
                            } for row in questions
                        ],
                        "status": True,
                    }
                }
                return jsonify(users_list)

        except Exception as e:
            print(f"Error retrieving user details from the database: {e}")
            return jsonify({f"Error retrieving user details from the database: {e}"})       
   
    def get_current_date_time(self):

        utc_now = datetime.utcnow()
        utc_timezone = pytz.timezone('UTC')
        utc_now = utc_timezone.localize(utc_now)
        ist_timezone = pytz.timezone('Asia/Kolkata')
        ist_now = utc_now.astimezone(ist_timezone)
        return ist_now.strftime("%Y-%m-%d %H:%M:%S %Z")
    
    def get_user_details(self, query):
        print(f"User table Query {query}")
        try:
            conn = self.create_connection()
            if conn:
                cur = conn.cursor()     
                cur.execute(query)
                user_details = cur.fetchall()
                cur.close()
                conn.close()

                users_list = {
                    "response": {
                        "msg": "We have successfully fetched filtered records for User",
                        "records": [
                            {
                                'user_id': row[0],
                                'full_name': row[1],
                                'email': row[2],
                                'phone_number': row[3],
                                'image_url': row[4],
                                'date_of_birth':row[8],
                                'gender':row[6],
                                'grade':row[5],
                                'last_modified_date_time':row[7]
                            } for row in user_details
                        ],
                        "status": True,
                    }
                }

                return jsonify(users_list)

        except Exception as e:
            print(f"Error retrieving user details from the database: {e}")
            return jsonify({f"Error retrieving user details from the database: {e}"})
        
    def add_users(self, user_id, full_name, email, phone_number,date_of_birth, gender, image_url,grade):
        try:
            db_connect = self.create_connection()
            if db_connect:
                cur = db_connect.cursor()

                query = """
                    INSERT INTO users (user_id, full_name, email, phone_number, image_url, last_modified_date_time, date_of_birth, gender,grade)
                    VALUES (%s, %s, %s, %s, %s, %s, %s, %s, %s)
                """

                print("Modified Date Time ",self.get_current_date_time())
                data = (user_id, full_name, email, phone_number, image_url, self.get_current_date_time(), date_of_birth, gender,grade)

                cur.execute(query, data)
                db_connect.commit()

                cur.close()

                return jsonify({"message": "User added successfully."}),200
        except Exception as e:
            print(f"Error inserting user: {e}")
            return jsonify({"error": f"Failed to add user. {e}"}), 500