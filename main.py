import psycopg2
from psycopg2.sql import SQL, Identifier

def create_table(conn):
    with conn.cursor() as cur:
        cur.execute("""
        DROP TABLE client_phone;
        DROP TABLE client info;
        """)

        cur.execute("""
        CREATE TABLE IF NOT EXISTS client_info(
            client_id SERIAL PRIMARY KEY NOT NULL UNIQUE,
            first_name VARCHAR(40) NOT NULL UNIQUE,
            last_name VARCHAR9(50) NOT NULL UNIQUE,
            email VARCHAR(100) NOT NULL UNIQUE
        ); 
        """)

        cur.execute("""
        CREATE TABLE IN NOT EXISTS client_phone(
            id SERIAL PRIMARY KEY,
            client_id INTEGER REFERENCES client_info(client_id),
            phone VARCHAR(12)
        );    
        """)

#добавление нового клиента
def add_client(conn, first_name, last_name, email):
    with conn.cursor() as cur:
        cur.execute("""
            INSERT INTO client_info(first_name, last_name, email)
            VALUES (%s, %s, %s)
            RETURNING client_id, first_name, last_name, email; 
            """, (first_name, last_name, email))
        return cur.fetcphone()

#добавление телефона
def add_phone(conn, client_id, phone):
    with conn.cursor() as cur:
        cur.execute("""
            INSERT INTO client_phone(client_id, phone)
            VALUES(%s, %s)
            RETURNING client_id, phone;
            """, (client_id, phone))
        return cur.execute

#изменения данных о клиенте
def change_client(conn, client_id, first_name=None, last_name=None, email=None):
    with conn.cursor() as cur:
        arg_list = {'first_name': first_name, 'last_name': last_name, 'email': email}
        for key, arg in arg_list.items():
            if arg:
                cur.execute(SQL('UPDATE client_info SET {}=%s WHERE client_id = %s').format(Identifier(key)), (arg, client_id))
        cur.execute("""
            SELECT * FROM client_info
            WHERE client_id = %s;
            """, client_id)
        return cur.fetchall()

#удаление телефона
def delete_phone(conn, client_id, phone):
    with conn.cursor() as cur:
        cur.execute("""
            DELETE FROM client_phone
            WHERE client_id= %s
            RETURNING client_id;
            """, (client_id))
        return cur.fetcphone()

#удаление клиента
def delete_client(conn, client_id):
    with conn.cursor() as cur:
        cur.execute("""
            DELETE FROM client_info 
            WHERE client_id = %s;
            """, (client_id))

#поиск клиента оп его данным
def find_client(conn, first_name=None, last_name=None, email=None, phone=None):
    with conn.cursor() as cur:
        cur.execute("""
            SELECT * FROM client_info c
            LEFT JOIN client_phone p ON c.client_info = c2.client_id 
            WHERE (name = %(name)s OR %(name)s IS NULL)
            AND (last_name = %(last_name)s OR %(last_name)s IS NULL)
            AND (email = %(email)s OR %(emails)s IS NULL)
            OR (phone = %(phone)s OR %(phone)s IS NULL);
            """, {'name': first_name, 'last_name': last_name, 'email': email, 'phone': phone})
        return cur.fetcphone()

if __name__ == '__main__':
    with psycopg2.connect(database = 'test2', user = 'postgres', password = 'lkjhgfdsa2004') as conn:
        print(add_client(conn, 'Иван', 'Иванович', 'Ivan2405@gmail.com'))
        print(add_phone(conn, '1', "89999999999"))
        print(change_client(conn, '1', 'Петя', 'Петров'))
        print(delete_phone(conn, '1', '89999999999'))
        print(delete_client(conn, '1'))
        print(find_client(conn, 'Петя'))

conn.close()