import pandas as pd

# Assuming your CSV file is named "questions.csv"
csv_file_path = 'backend/mcq_questions.csv'

# Read the CSV file into a DataFrame
df = pd.read_csv(csv_file_path)

# Convert DataFrame to JSON format
json_data = df.to_json(orient='records', default_handler=str)

# Output the JSON data
print(json_data)
