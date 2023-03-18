from flask import Flask


def create_app():
    app = Flask(__name__)
    with app.app_context():
        from . import home
        from . import apis  # noqa: E402,F401
    return app