from flask import Flask, jsonify

app = Flask(__name__)

@app.route('/')
def welcome():
    return "Welcome to ITIL exam"

@app.route('/modules')
def get_modules():
    modules_list = ["Cosa", "ndc/pki", "fcn", "devops", "ca"]
    return jsonify(modules=modules_list)

@app.route('/me')
def get_me():
    my_info = {
        "Prn": 230944223005,
        "name": "Ayush Maindolia",
        "Phone": 7253048433
    }
    return jsonify(my_info)

if __name__ == '__main__':
    app.run(debug=True)

