from flask import Flask, request, jsonify
import requests
from dotenv import load_dotenv
import os

load_dotenv()
URL_SERVER2 = os.getenv("URL_SERVER2")
app = Flask(__name__)


@app.route("/")
def home():
    return "It works!"


@app.route("/notification", methods=['GET'])
def notification():
    id = request.args.get('id', '')
    job_name = request.args.get('job_name', '') or 'No Name'
    job_id = request.args.get('job_id', '')
    computer_name = request.args.get('computer_name', '')
    URL = URL_SERVER2 + "/notification/" + str(id) + "/" + str(job_id) + "/" + job_name + "/" + computer_name
    response = requests.get(URL)
    return response.text


if __name__ == "__main__":
    app.run(host='localhost', port=5050)
