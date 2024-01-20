from flask import Flask, jsonify, request,render_template,json
from operations import DBOperations
import boto3
from dotenv import load_dotenv
import os
import pandas as pd

load_dotenv()
app = Flask(__name__)
operations_obj = DBOperations()

def get_file_url(file):
    file_extension = get_file_extension(file.filename)
    image_id = operations_obj.generate_uuid() + file_extension
    s3_base_url = f"https://{os.getenv('S3_BUCKET')}.s3.amazonaws.com/"
    image_url = f"{s3_base_url}{image_id}"
    return image_id, image_url

def upload_image_s3(data):
    try:
        file = request.files['file']
        image_id, image_url = get_file_url(file)
        s3 = boto3.client('s3', aws_access_key_id=os.getenv("S3_ACCESS_KEY"), aws_secret_access_key=os.getenv("S3_SECRET_KEY"))
        s3.upload_fileobj(file, os.getenv("S3_BUCKET"), image_id)
        return image_url

    except Exception as e:
        return jsonify({"error": f"Error processing request: {e}"}), 500

def delete_image_from_s3(image_key):
    s3 = boto3.client('s3', aws_access_key_id=os.getenv("S3_ACCESS_KEY"), aws_secret_access_key=os.getenv("S3_SECRET_KEY"))
    filename = os.path.basename(image_key)
    try:
        # Delete the object
        s3.delete_object(Bucket=os.getenv("S3_BUCKET"), Key=filename)
        print(f"Image {filename} deleted successfully from {os.getenv("S3_BUCKET")}")
    except Exception as e:
        print(f"Error deleting image {filename} from {os.getenv("S3_BUCKET")}: {e}")

@app.route('/')
def home():
    return "Hello world"

# Upload Question Operation STARTS

@app.route('/upload/upload_questions_page')
def upload_questions_page():
    return render_template('upload_questions.html')

@app.route('/api/upload_questions', methods=['POST'])
def upload_questions():
    if 'csvFile' not in request.files:
        return jsonify({"error": "No file provided"}), 400
    csv_file = request.files['csvFile']
    if not csv_file.filename.endswith('.csv'):
        return jsonify({"error": "Invalid file format. Please upload a CSV file"}), 400
    else:
        df = pd.read_csv(csv_file)
        json_data = df.to_json(orient='records', default_handler=str)
        json_data = json.loads(json_data)
        response =  operations_obj.add_questions(json_data)
        return response

@app.route('/api/get_questions/all', methods=['POST'])
def get_all_questions():
    data = operations_obj.get_questions("select * from question_bank")
    return data

@app.route('/api/get_questions/filtered', methods=['POST'])
def get_filtered_questions():
    data = request.json
    category = data.get("category")
    data = operations_obj.get_questions(f"SELECT * FROM question_bank WHERE category = '{category}'")
    return data

# Upload Question Operation ENDS

# User Operations STARTS
@app.route('/api/get_user_details/all', methods=['POST'])
def get_all_user_data():
    data = operations_obj.get_user_details("select * from users")
    return data

@app.route('/api/get_user_details/filtered', methods=['POST'])
def get_filtered_user_data():
    data = request.json
    user_id = data.get("user_id")
    data = operations_obj.get_user_details(f"SELECT * FROM users WHERE user_id = '{user_id}'")
    return data

# User Operations ENDS
@app.route('/api/add_users', methods=['POST'])
def add_users():
    data = request.form
    full_name = data.get("full_name")
    email = data.get("email")
    phone_number = data.get("phone_number")
    date_of_birth = data.get("date_of_birth")
    gender = data.get("gender")
    grade = data.get("grade")
    print(request.form)

    return operations_obj.add_users(
        user_id=operations_obj.generate_uuid(),
        full_name=full_name,
        email=email,
        phone_number=phone_number,
        date_of_birth=date_of_birth,
        gender=gender,
        image_url=upload_image_s3(data=data),
        grade=grade
    )

def get_file_extension(file_name):
    _, file_extension = os.path.splitext(file_name)
    return file_extension

if __name__ == '__main__':
    app.run(debug=True, port=4000)