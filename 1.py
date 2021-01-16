import sqlite3
from bottle import route, run, debug, template, request , static_file, error # Importing all the needed bottle modules 


# Creating the database and loading the database with data

connection = sqlite3.connect('todo.db')
cur = connection.cursor()
cur.execute("DROP TABLE IF EXISTS Todo")
cur.execute("CREATE TABLE Todo (Id INTEGER PRIMARY KEY, Task varchar(100) NOT NULL, Description varchar(2048) NOT NULL); ")
cur.execute("INSERT INTO Todo (Task, Description) VALUES ('Take the first 2 courses of Python 4 Everybody by Charles Severance for a good intro to Python','This is the first description')")
cur.execute("INSERT INTO Todo (Task, Description) VALUES ('Visit the Python website and read some docs','This is the second description') ")
cur.execute("INSERT INTO Todo (Task, Description) VALUES ('VS Code is the best editor', 'This is the third description')")
cur.execute("INSERT INTO Todo (Task, Description) VALUES ('Choose your favourite WSGI-Framework', 'This is the fourth description')")
connection.commit()

@route('/')  # URL that causes the function to be executed 
def todo_list():
    connection = sqlite3.connect('todo.db')
    c = connection.cursor() 
    c.execute("SELECT Id, Task, Description FROM Todo;")
    result = c.fetchall() # Returns a list of tuple from the database
    c.close()
    output = template('table', rows=result)
    return output

@route('/new', method = 'GET')
def new_item():
    if request.GET.get('save','').strip():

        new = request.GET.get('task', '').strip()
        description = request.GET.get('description','').strip()

        conn = sqlite3.connect('todo.db')
        c = conn.cursor()

        c.execute("INSERT INTO Todo (Task,Description) VALUES (?,?)", (new,description))
        new_id = c.lastrowid

        conn.commit()
        c.close()

        return template('success', new_id = new_id)
    else:
        return template('new')


@route('/edit/:number' ,method = 'GET' )
def edit_item(number):
    if request.GET.get('save','').strip():
        edit = request.GET.get('task','').strip()
        description = request.GET.get('description','').strip()

        connection = sqlite3.connect('todo.db')
        cur = connection.cursor()
        cur.execute('UPDATE Todo SET Task = ?, Description = ? WHERE Id LIKE ?',(edit, description, number))
        connection.commit()

        return '<p> The item %s was sucessfully edited</p>' %str(number)

    else:
        connection = sqlite3.connect('todo.db')
        cur = connection.cursor()
        cur.execute('SELECT Task, Description FROM Todo WHERE Id = ?', (str(number),))
        cur_data = cur.fetchmany()
        for i in cur_data:
            task_data = cur_data[0]
            description_data = cur_data[0]
        return template('edit',old_task = task_data, description = description_data  ,number=number)    

@route('/help') # The custome help page that provides information about the developer
def help():
    return static_file ('help.html', root='.')
    
@error(403)
def mistake403 (code):
    return template('403')

@error(404)           #This block of code handles 404 (not found errors)
def mistake404 (code):
    return template('404')


if __name__ == "__main__":
    run(debug=True, reloader=True)