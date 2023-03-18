from flask import jsonify, current_app as app


@app.route("/")
def welcome():
    data = {}
    try:
        data['function'] = __name__
        data["processes"] = "success"
    except Exception:
        pass
    return jsonify(data)

@app.route("/home")
def home_process():
    data = {}
    try:
        data['function'] = __name__
        data["processes"] = "success"
    except Exception:
        pass
    return jsonify(data)