import os
from app import create_app

app = create_app()

if __name__ == "__main__":
    port = int(os.getenv("PORT", 3000))
    print(f'port: {port}')
    stage = os.getenv("ENV", 'local')
    app.jinja_env.auto_reload = True
    app.config["TEMPLATES_AUTO_RELOAD"] = True
    debug = True if stage in ['local', 'dev'] else False
    app.run(host="0.0.0.0", port=port, debug=debug)
