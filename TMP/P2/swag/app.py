from flask import Flask, request
from flask_restful import Api, Resource
from flasgger import Swagger, swag_from

from MyDataBase import MyDatabase
from Constants import Constants
from CRUD import CRUD

app = Flask(__name__)
api = Api(app)

# Configuring Swagger
app.config['SWAGGER'] = {
    'title': 'My First REST API',
    'uiversion': 3
}
swagger = Swagger(app)

class Welcome(Resource):
    @swag_from({
        'responses': {
            200: {
                'description': 'A status code 200 means successful and returns a message.',
                'content': {
                    'application/json': {
                        'examples': {
                            'example1': {
                                'summary': 'Successful response',
                                'value': {'message': 'Welcome GeeksforGeeks!!'}
                            }
                        }
                    }
                }
            }
        }
    })
    def get(self):
        """
        This is an example endpoint which returns a simple message.
        """
        return {'message': 'Welcome Database Implementators!!'}

class Items(Resource):
    @swag_from({
        'responses': {
            200: {
                'description': 'A status code 200 means successful and returns a list of items.',
                'content': {
                    'application/json': {
                        'examples': {
                            'example1': {
                                'summary': 'Successful response',
                                'value': {'items': ['Item 1', 'Item 2', 'Item 3']}
                            }
                        }
                    }
                }
            }
        }
    })
    def get(self):
        """
        This endpoint returns a list of items.
        """
        crud = CRUD()
        #print(test.query("INSERT INTO mytest (id) VALUES (3)"))
        items = crud.testing()
        return {'items': items}

class Profile(Resource):
    def get(self):
        """
        Obtener un perfil por email y token
        ---
        parameters:
          - name: email
            in: query
            type: string
            required: true
          - name: token
            in: query
            type: string
            required: true
        responses:
          200:
            description: Perfil encontrado
        """
        email = request.args.get('email')
        token = request.args.get('token')
        crud = CRUD()
        profile = crud.get_profile(email, token)
        return profile if profile else {'message': 'No encontrado'}, 404

    def post(self):
        """
        Guardar un perfil
        ---
        parameters:
          - name: body
            in: body
            required: true
            schema:
              type: object
              properties:
                name: {type: string}
                alias: {type: string}
                token: {type: string}
                birthdate: {type: string}
                email: {type: string}
                lang_code: {type: string}
                routine: {type: integer}
                alarm: {type: integer}
                inactivity_time: {type: integer}
                inactivity_type: {type: integer}
        responses:
          201:
            description: Perfil creado
        """
        data = request.get_json()
        crud = CRUD()
        result = crud.set_profile(
            data['name'], data['alias'], data['token'], data['birthdate'],
            data['email'], data['lang_code'], data['routine'], data['alarm'],
            data['inactivity_time'], data['inactivity_type']
        )
        return result, 2001

    def put(self):
        """
        Actualizar un perfil
        ---
        parameters:
          - name: body
            in: body
            required: true
            schema:
              type: object
              properties:
                idx: {type: integer}
                name: {type: string}
                alias: {type: string}
                token: {type: string}
                birthdate: {type: string}
                email: {type: string}
                lang_code: {type: string}
                routine: {type: integer}
                alarm: {type: integer}
                inactivity_time: {type: integer}
                inactivity_type: {type: integer}
        responses:
          200:
            description: Perfil actualizado
        """
        data = request.get_json()
        crud = CRUD()
        result = crud.update_profile(
            data['name'], data['alias'], data['token'], data['birthdate'],
            data['email'], data['lang_code'], data['routine'], data['alarm'],
            data['inactivity_time'], data['inactivity_type'], data['idx']
        )
        return result, 200

    def delete(self):
        """
        Eliminar un perfil
        ---
        parameters:
          - name: idx
            in: query
            type: integer
            required: true
        responses:
          200:
            description: Perfil eliminado
        """
        idx = request.args.get('idx')
        crud = CRUD()
        result = crud.delete_profile(idx)
        return result, 200

api.add_resource(Welcome, '/')
api.add_resource(Items, '/items')
api.add_resource(Profile, '/items/profile')


#if __name__ == '__main__':
#    app.run(debug=True)
if __name__ == '__main__':
    crud = CRUD()
    print(crud.insert_test_profile())  # Inserta el perfil de prueba
    app.run(debug=True)