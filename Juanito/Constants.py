from cryptography.fernet import Fernet
import base64

class Constants:    
    e_host = 'Z0FBQUFBQnA0QVlSYUJhTXNmcjRrczNjYVo3a1BOVjg4aVRDVnE3dkdmaktYcWVQUWRFSk1kZms0WTltaHF4UjBSYkNhLWVzM2pLYW12VXN1T1NGYVJQYjFOdkh5Qll5dEVkR0RKbW52QUR3dEFIVkdzT0E3djUtQlZnckJxSS1GTFE1ZnVJRHdzbHQ='
    e_port = 'Z0FBQUFBQnA0QVlSR0dXdzFxbmVuYmJleU5lcUlaTnZxMG1JVW9MRTR1THFZZkFFOFdZOU5Pc05tclE0QUc0UjFXLVF4bEMtTlVGa3B4WUNGN1NMVHhMemZhckkyMTZxd2c9PQ=='
    e_database = 'Z0FBQUFBQnA0QVlSUDZyUkw4LUxyVDVkVlRfaHlZNTZ0VTI0dm9nTThST2JaZGFabDl1RFA5WlA3NmJQTGs5NkdRcWVmekZwQS15RmJwQnBVakhILS1yNUVyRkxQUU81eXc9PQ=='
    e_user = 'Z0FBQUFBQnA0QVlSNmJxS1VfeTlxMzdfV0c1Vlo2Y0NfZmZxYndJN1dWU0lSd0hKOFRRSTRQQzZlWVZKQ0k0RVVqeFV3QllwR01XNjFFRnhHSFNBUnR5MzNuaThDaDh0b3c9PQ=='
    e_password  = 'Z0FBQUFBQnA0QVlSb0puUG8tcElMMlV0RldnTzdzeGVRZDVRbHVPcHlBS29LYWdMLWJEck9aODVQZXdmaTJ2bjZhLS1KaXFsMWNVcUI4bTVoS2R2RUFhZmI5NnNuSzdReGp2bjliOFp3NXpieG5XcnktWVRQSE09'

    host = "mysql-311adbba-juanalacubana.g.aivencloud.com"
    port = "25488"
    database = "defaultdb"
    user = "avnadmin"
    password  = "AVNS_Spx2XHXh8J0CEjnkdib"
    

    def generate_and_save_key(self, key_filename="secret.key"):
        """Generates a key and saves it to a file."""
        key = Fernet.generate_key()
        with open(key_filename, "wb") as key_file:
            key_file.write(key)
        print(f"New key generated and saved to {key_filename}")

    def load_key(self, key_filename="secret.key"):
        """Loads the key from the current directory's file."""
        return open(key_filename, "rb").read()
    
    
    def encrypt(self, string):
        # You only need to run this once to create the key file
        #self.generate_and_save_key() 
        # Load the key from the file
        key = self.load_key()
        f = Fernet(key)
        # Strings must be encoded to bytes before encryption
        encoded_string = string.encode()
        # Encrypt the bytes
        encrypted_bytes = f.encrypt(encoded_string)
        # The result is bytes, often stored or transmitted as a base64 encoded string
        return base64.urlsafe_b64encode(encrypted_bytes).decode('utf-8')

    def decrypt(self, string):
        key = self.load_key()
        f = Fernet(key)
        encoded_string = string.encode()
        decrypted_bytes = f.decrypt(base64.urlsafe_b64decode(encoded_string).decode('utf-8'))
        return decrypted_bytes.decode()


const = Constants()
print(f"e_host = '{const.encrypt(Constants.host)}'")
print(f"e_port = '{const.encrypt(Constants.port)}'")
print(f"e_database = '{const.encrypt(Constants.database)}'")
print(f"e_user = '{const.encrypt(Constants.user)}'")
print(f"e_password  = '{const.encrypt(Constants.password)}'")

"""
print(f"Original Host : {const.decrypt(Constants.e_host)}")
print(f"Original Port : {const.decrypt(Constants.e_port)}")
print(f"Original Database : {const.decrypt(Constants.e_database)}")
print(f"Original User : {const.decrypt(Constants.e_user)}")
print(f"Original password : {const.decrypt(Constants.e_password)}")
"""