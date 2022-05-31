import mysql.connector
from flask import Flask, redirect, url_for, request,render_template,session

mydb = mysql.connector.connect(
  host="localhost",
  user="root",
  passwd="ehab",
  database="datatry"
)
mycursor = mydb.cursor()

app = Flask(__name__)
app.secret_key = 'very secret key'

@app.route('/')
def index():
   return render_template('index.html')
########################################################
@app.route('/home')
def home():
   return render_template('home.html')
########################################################
@app.route('/about_us')
def about_us():
   return render_template('about us.html')
########################################################
@app.route('/appointments')
def appointments():
   return render_template('appointments.html')
########################################################
@app.route('/complain')
def complain():
   return render_template('complain.html')
########################################################
@app.route('/doctors')
def doctors():
   return render_template('doctors.html')
########################################################
@app.route('/engineers')
def engineers():
   return render_template('engineers.html')
########################################################
@app.route('/login',methods = ['POST', 'GET'])
def login():
   
        # Check if "username" and "password" POST requests exist (user submitted form)
    if request.method == 'POST' :
       
        # Create variables for easy access
        user = request.form['username']
        passw= request.form['password']
        #print(user,passw,  file=sys.stdout, flush=True)
        mycursor.execute('SELECT * FROM logintry WHERE username = %s AND password = %s limit 1', (user, passw))
        # Fetch one record and return result
        account = mycursor.fetchone()
        if account:
            
            # Create session data, we can access this data in other routes
            session['loggedin'] = True
            session['username'] = account[0]
            #print (session['username'])
            return redirect(url_for('home'))
        else:
           return redirect(url_for('login'))
                
    else:
      return render_template('login.html')        

########################################################
@app.route('/nurses')
def nurses():
   return render_template('nurses.html')
########################################################
@app.route('/patients')
def patients():
   return render_template('patients.html')
########################################################
@app.route('/rooms_info')
def rooms_info():
   return render_template('rooms info.html')
########################################################
@app.route('/sign_up')
def sign_up():
   return render_template('sign_up.html')
########################################################
@app.route('/info')
def info():
   return render_template('info.html')
########################################################
@app.route('/data')
def data():
   return render_template('data.html')
########################################################
@app.route('/logout')
def logout():
    # Remove session data, this will log the user out
   session.pop('loggedin', None)
   session.pop('username', None)
   # Redirect to login page
   return redirect(url_for('login'))
########################################################

if __name__ == '__main__':
   app.run()
