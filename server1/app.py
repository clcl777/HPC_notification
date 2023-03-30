from flask import Flask, redirect
app = Flask(__name__)


@app.route("/")
def hello():
    URL = "https://hpc-notification.onrender.com/notification/1"
    return redirect(URL)


if __name__ == "__main__":
    app.run(debug=True, host='localhost', port=5050)
