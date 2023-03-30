from flask import Flask, redirect
app = Flask(__name__)


@app.route("/notification/<int:id>")
def notification(id):
    URL = "https://hpc-notification.onrender.com/notification/" + str(id)
    return redirect(URL)


if __name__ == "__main__":
    app.run(host='localhost', port=5050)
