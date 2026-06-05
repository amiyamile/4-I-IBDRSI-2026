from flask import Flask
from flask_sqlalchemy import SQLAlchemy

db = SQLAlchemy()

def create_app():
    app = Flask(__name__)

    app.config.from_object('config.Config')

    db.init_app(app)

    from app.routes import alumnos
    from app.routes import grupos
    from app.routes import materias
    from app.routes import planeacion
    from app.routes import usuarios

    app.register_blueprint(alumnos.bp)
    app.register_blueprint(grupos.bp)
    app.register_blueprint(materias.bp)
    app.register_blueprint(planeacion.bp)
    app.register_blueprint(usuarios.bp)

    return app