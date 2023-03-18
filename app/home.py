import os
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


@app.route("/metadata")
def metadata():
    data = {}
    try:
        data['ENV'] = os.environ.get('ENV', 'default')
        data['PORT'] = os.environ.get("PORT", 3000)
    except Exception:
        pass
    return jsonify(data)