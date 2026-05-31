import binascii
import os

from datetime import date
from MyDataBase import MyDatabase
from Constants import Constants

class CRUD:
    const = Constants()
    conn = MyDatabase(
            const.decrypt(Constants.host),
            int(const.decrypt(Constants.port)),
            const.decrypt(Constants.database),
            const.decrypt(Constants.user),
            const.decrypt(Constants.password)
        )

    def generate_key():
        return binascii.hexlify(os.urandom(20)).decode()
    
    def testing(self):
        sql = "SELECT * FROM mytest"
        result = self.conn.query(sql)
        return result

    def get_profile(self, email, token):
        sql = f"SELECT * FROM profiles WHERE email='{email}' AND token='{token}'"
        result = self.conn.query(sql)

        if result:
            # Convertir a date 
            for row in result:
                for key, value in row.items():
                    if isinstance(value, date):
                        row[key] = value.isoformat()  # YYYY-MM-DD
            return result
        else:
            return {"message": "No encontrado"}

    def set_profile(self, name, alias, token, birthdate, email, lang_code, routine, alarm, inactivity_time, inactivity_type):
        sql = """
        INSERT INTO defaultdb.profiles 
        (idx, name, alias, token, birthdate, email, lang_code, routine, alarm, inactivity_time, inactivity_type)
        VALUES (0, '{}', '{}', '{}', '{}', '{}', '{}', {}, {}, {}, {});
        """.format(name, alias, token, birthdate, email, lang_code, routine, alarm, inactivity_time, inactivity_type)
        
        result = self.conn.query(sql)
        return {"message": "Perfil creado", "result": result}


    def update_profile(self, name, alias, token, birthdate, email, lang_code, routine, alarm, inactivity_time, inactivity_type, idx):
        sql = """
        UPDATE defaultdb.profiles 
        SET name='{}', alias='{}', token='{}', birthdate='{}', email='{}', lang_code='{}', routine={}, alarm={}, inactivity_time={}, inactivity_type={}
        WHERE idx={};
        """.format(name, alias, token, birthdate, email, lang_code, routine, alarm, inactivity_time, inactivity_type, idx)
    
        result = self.conn.query(sql)
        return {"message": "Perfil actualizado", "result": result}


    def delete_profile(self, idx):
        sql = "DELETE FROM defaultdb.profiles WHERE idx={};".format(idx)
        result = self.conn.query(sql)
        return {"message": "Perfil eliminado", "result": result}

    
    #perfil de pruebita
    def insert_test_profile(self):
        sql = """
        INSERT INTO profiles 
        (idx, name, alias, token, birthdate, email, lang_code, routine, alarm, inactivity_time, inactivity_type)
        VALUES
        (0, 'Yamile', 'Isa', 'abc123', '1999-01-01', 'yamile@example.com', 'es', 1, 0, 30, 1);
        """
        result = self.conn.query(sql)
        return {"message": "Perfil de prueba insertado", "result": result}
    



#crud = CRUD()
#crud.get_usuario_info()