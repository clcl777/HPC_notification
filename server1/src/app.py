from flask import Flask
import requests
from dotenv import load_dotenv
import os

load_dotenv()
URL_SERVER2 = os.getenv("URL_SERVER2")
app = Flask(__name__)


@app.route("/")
def home():
    return "It works!"


@app.route("/notification/<int:id>")
def notification(id):
    URL = URL_SERVER2 + "/notification/" + str(id)
    response = requests.get(URL)
    return response.text


if __name__ == "__main__":
    app.run(host='localhost', port=5050)
