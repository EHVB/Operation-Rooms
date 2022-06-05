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
      if 'loggedin' in session :      
        return render_template('home.html', authority= session['authority'])
      else: 
        return redirect(url_for('login'))
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
        mycursor.execute('SELECT * FROM doctors WHERE user_name = %s AND password = %s and active = 1 limit 1', (user, passw))
        # Fetch one record and return result
        account = mycursor.fetchone()
        mycursor.execute('SELECT * FROM nurse WHERE user_name = %s AND password = %s and active = 1 limit 1', (user, passw))
        account1 = mycursor.fetchone()
        mycursor.execute('SELECT * FROM engineer WHERE user_name = %s AND password = %s and active = 1 limit 1', (user, passw))
        account2 = mycursor.fetchone()
        print (account, account1,account2)
        if account:
            session['loggedin']= True
            session['username']= account[1]
            session['authority']='doctor' 
            return redirect(url_for('home'))
            
        if account1:
            session['loggedin']= True
            session['username']= account1[0]
            session['authority']='nurse' 
            return redirect(url_for('home'))
            
        if account2:
            session['loggedin']= True
            session['username']= account2[0]
            if account2[8]==1:
                session['authority']='admin' 
                return redirect(url_for('home'))
            else:
                session['authority']='engineer'  
                return redirect(url_for('home'))
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
@app.route('/sign_up',methods=['POST','GET'])
def sign_up():
   if request.method=='POST':
      username=request.form["user_name"]
      password=request.form["password"]
      fname=request.form["first_name"]
      lname=request.form["last_name"]
      ssn=request.form["ssn"]
      sex=request.form["gender"]
      #bday=request.form['birthday']
      #formatteddTE=bday.strftime('%Y-%m-%d')
      phone=request.form["phone"]
      job=request.form["job"]
      #code=request.form['phoneInput']
      #print(code)
      if job == 'Doctor':
         spec=request.form["specialization"]
      mycursor.execute('SELECT * FROM doctors WHERE user_name = %s OR ssn  = %s  ', (username, ssn))
      account = mycursor.fetchone()
      mycursor.execute('SELECT * FROM nurse WHERE user_name = %s OR ssn  = %s  ', (username, ssn))
      account1 = mycursor.fetchone()
      mycursor.execute('SELECT * FROM engineer WHERE user_name = %s OR ssn  = %s  ', (username, ssn))
      account2 = mycursor.fetchone()
      print (account, account1,account2)
        
        
        
      if account or account1 or account2:
         return redirect(url_for('home'))

                      
            

      if job=='Nurse':
         try:

            mycursor.execute("insert into nurse(user_name,password,fname,lname,ssn,sex,phone,active) values(%s,%s,%s,%s,%s,%s,%s,0)",(username,password,fname,lname,ssn,sex,phone))
            mydb.commit()
            return redirect(url_for('login'))
         except: 
            return redirect(url_for('home'))

      elif job == 'Doctor':
         try:

             mycursor.execute("insert into doctors(user_name,password,fname,lname,ssn,sex,phone,specialization,active) values(%s,%s,%s,%s,%s,%s,%s,%s,0)",(username,password,fname,lname,ssn,sex,phone,spec))
             mydb.commit()
             return redirect(url_for('login'))
         except: 
            return redirect(url_for('home'))    
      else :
         try: 

            mycursor.execute("insert into engineer(user_name,password,fname,lname,ssn,sex,phone,active) values(%s,%s,%s,%s,%s,%s,%s,0)",(username,password,fname,lname,ssn,sex,phone))
            mydb.commit()
            return redirect(url_for('login'))
         except: 
            return redirect(url_for('home'))   

      
      
   else :
      return render_template('sign_up.html')

########################################################
@app.route('/info')
def info():
   if 'loggedin' in session: 
      if session['authority']=='nurse':
         username=session['username']
         sqlquery='select * from nurse where user_name = %s'
         mycursor.execute(sqlquery,(username,))
         result=mycursor.fetchone()
         data= {'fname': result[2],
         'lname':result[3]



         }
         return render_template('info.html',data=data,authority=session['authority'])

   else: return redirect(url_for('login'))
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
   session.pop('authority', None) 
   # Redirect to login page
   return redirect(url_for('login'))
########################################################

if __name__ == '__main__':
   app.run()
