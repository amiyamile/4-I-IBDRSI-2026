from MyDataBase import MyDatabase
from Constants import Constants

class CRUD:
    const = Constants()
    conn = MyDatabase(
        const.decrypt(Constants.e_host),
        int(const.decrypt(Constants.e_port)),
        const.decrypt(Constants.e_database),
        const.decrypt(Constants.e_user),
        const.decrypt(Constants.e_password)
    )
    
    def create_profile(self):
        sql = """
        CREATE TABLE IF NOT EXISTS Amy.profiles (
            idx INTEGER PRIMARY KEY AUTO_INCREMENT,
            name VARCHAR(255) NOT NULL,
            alias VARCHAR(255) NOT NULL,
            token VARCHAR(255) NOT NULL,
            birthdate DATE NOT NULL,
            email VARCHAR(255) NOT NULL,
            lang_code VARCHAR(10) NOT NULL,
            `routine` BOOLEAN NOT NULL,
            alarm BOOLEAN NOT NULL,
            inactivity_time INTEGER NOT NULL,
            inactivity_type VARCHAR(50) NOT NULL
        );
        """
        result = self.conn.query(sql)
        print(result)

    def set_profile(self, name, alias, token, birthdate, email, lang_code, routine, alarm, inactivity_time, inactivity_type):
        sql = """
        INSERT INTO Amy.profiles
        (idx, name, alias, token, birthdate, email, lang_code, `routine`, alarm, inactivity_time, inactivity_type)
        VALUES (0, '{}', '{}', '{}', '{}', '{}', '{}', {}, {}, {}, {});
        """.format(name, alias, token, birthdate, email, lang_code, routine, alarm, inactivity_time, inactivity_type)
        result = self.conn.query(sql)
        print(result)

    def update_profile(self, name, alias, token, birthdate, email, lang_code, routine, alarm, inactivity_time, inactivity_type, idx):
        sql = """
        UPDATE Amy.profiles
        SET name='{}', alias='{}', token='{}', birthdate='{}', email='{}', lang_code='{}',
            `routine`={}, alarm={}, inactivity_time={}, inactivity_type='{}'
        WHERE idx={};
        """.format(name, alias, token, birthdate, email, lang_code, routine, alarm, inactivity_time, inactivity_type, idx)
        result = self.conn.query(sql)
        print(result)

    def delete_profile(self, idx):
        sql = "DELETE FROM Amy.profiles WHERE idx={};".format(idx)
        result = self.conn.query(sql)
        print(result)

test = CRUD()
test.create_profile()
test.set_profile("Juana", "cubana123", "token101", "1994-12-12", "juana@example.com", "en", True, True, 300, "1")
test.set_profile("Shakira", "shakira123", "tok111", "1977-02-02", "shakira@example.com", "en", True, True, 300, "1")
test.set_profile("Rihanna", "rihanna123", "tok222", "1988-02-20", "rihanna@example.com", "en", True, True, 300, "1")
test.set_profile("Adele", "adele123", "tok333", "1988-05-05", "adele@example.com", "en", True, True, 300, "1")
test.set_profile("Beyonce", "beyonce123", "tok444", "1981-09-04", "beyonce@example.com", "en", True, True, 300, "1")
test.set_profile("Madonna", "madonna123", "tok555", "1958-08-16", "madonna@example.com", "en", True, True, 300, "1")
test.set_profile("BrunoMars", "brunoMars123", "tok666", "1985-10-08", "brunomars@example.com", "en", True, True, 300, "1")
test.set_profile("EdSheeran", "edSheeran123", "tok777", "1991-02-17", "edsheeran@example.com", "en", True, True, 300, "1")
test.set_profile("TaylorSwift", "taylorSwift123", "tok888", "1989-12-13", "taylorswift@example.com", "en", True, True, 300, "1")
test.set_profile("LuisMiguel", "luisMiguel123", "tok999", "1970-04-19", "luismiguel@example.com", "en", True, True, 300, "1")
