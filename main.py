from flask import Flask, render_template, request
# import socket
# from flask_restful import Resource, Api

app = Flask(__name__, template_folder='templates')


# def get_local_ip():
#     return socket.gethostbyname(socket.gethostname())


@app.route('/')
def homepage():
    return render_template('home.html')


@app.route('/knockout')
def knockout():
    def shutdown_server():
        func = request.environ.get('werkzeug.server.shutdown')
        if func is None:
            raise RuntimeError('Not running with the Werkzeug Server')
        func()
    shutdown_server()
    return render_template('knockout.html')


# app.run(port=8082, host=get_local_ip())
app.run(debug=True, host='0.0.0.0')
