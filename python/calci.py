from flask import Flask, request
from flask_cors import CORS

app = Flask(__name__)
CORS(app)  # Enable CORS for all routes

@app.route('/', methods=['POST'])
def analyze_data():
    if request.method == 'POST':
        # Get the hour and minute parameters from the request body
        hour = request.form.get('hour')
        minute = request.form.get('minute')
        
        # Example: Perform some analysis using the received parameters
        result = f"Analysis for time {hour}:{minute}..."

        # Return the result
        return result, 200
    else:
        return 'Method Not Allowed', 405

if __name__ == '__main__':
    app.run(debug=True)


