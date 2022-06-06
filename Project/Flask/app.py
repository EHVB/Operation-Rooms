import mysql.connector
from flask import Flask, redirect, url_for, request,render_template,session
import datetime

mydb = mysql.connector.connect(
  host="localhost",
  user="root",
  passwd="admin",
  database="operation"
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
   return render_template('about us.html', authority=session['authority'])
########################################################
@app.route('/appointments')
def appointments():
     if 'loggedin' in session: 

        username = session['username']
        currentdate= datetime.datetime.now()
        print(currentdate)
        if session ['authority']== 'nurse': 
            sql_select_Query = "select DISTINCT patient.fname as'patient.fname', patient.lname as 'patient.lname' ,patient_ssn,start_date,end_date, OR_number, doctors.fname as 'dr.fname' ,doctors .lname as'dr.lastname'  from nurse join appointments on nuser_name=N_user_name join doctors on D_user_name = user_name join patient on patient_ssn = patient.ssn  Where nuser_name= %s And  DATE(start_date) > %s"
            mycursor.execute(sql_select_Query,(username,currentdate,))
            myresult= mycursor.fetchall()
            row_headers=[x[0] for x in mycursor.description] 
            data={

         'rec':myresult,
         'header':row_headers
         
         
      }
            return render_template('data.html',data=data,authority=session['authority'])
        if session ['authority']== 'doctor': 
            sql_select_Query = "select DISTINCT patient.fname as'patient.fname', patient.lname as 'patient.lname' ,patient_ssn,start_date,end_date, OR_number, nurse.fname as 'nurse.fname' ,nurse .lname as'nurse.lastname'  from doctors join appointments on doctors.user_name=D_user_name join nurse on N_user_name = nuser_name join patient on patient_ssn = patient.ssn  Where doctors.user_name= %s And  DATE(start_date) > %s"
            mycursor.execute(sql_select_Query,(username,currentdate,))
            myresult= mycursor.fetchall()
            row_headers=[x[0] for x in mycursor.description] 
            data={

         'rec':myresult,
         'header':row_headers
         
         
      }
            return render_template('data.html',data=data,authority=session['authority'])

        if session ['authority']== 'engineer' :
           
           sql_select_Query = "select appointments.OR_number,appointments.start_date,appointments.end_date,  nurse.fname as 'nurse.fname' ,nurse .lname as'nurse.lastname',doctors.fname as 'Doctor fName', doctors.lname 'Doctor lName' from doctors join appointments on doctors.user_name=D_user_name join nurse on N_user_name = nuser_name join patient on patient_ssn = patient.ssn  Where DATE(start_date) > %s"
           mycursor.execute(sql_select_Query,(currentdate,))
           myresult= mycursor.fetchall()
           row_headers=[x[0] for x in mycursor.description]
           data={
              'rec':myresult,
              'header':row_headers
           }
           return render_template('data.html',data=data,authority=session['authority'])

        if session['authority'] == 'admin':
               sql_select_Query = "select appointments.OR_number,appointments.start_date,appointments.end_date,  nurse.fname as 'nurse.fname' ,nurse .lname as'nurse.lastname',doctors.fname as 'Doctor fName', doctors.lname 'Doctor lName' from doctors join appointments on doctors.user_name=D_user_name join nurse on N_user_name = nuser_name join patient on patient_ssn = patient.ssn  Order by (start_date)"
               mycursor.execute(sql_select_Query)
               myresult= mycursor.fetchall()
               row_headers=[x[0] for x in mycursor.description]
               data={
              'rec':myresult,
              'header':row_headers
           }
               return render_template('data.html',data=data,authority=session['authority'])


                        
     else:
      return redirect(url_for('login'))
########################################################
@app.route('/complain',methods = ['POST', 'GET'])
def complain():
    if request.method == 'POST' :
        name = request.form['name']
        email= request.form['email']
        subject = request.form['subject']
        msg= request.form['message']
        sqlquery=' insert into complaints(name,email,subject,message,answered) values(%s,%s,%s,%s,0)'
        values=(name,email,subject,msg)
        mycursor.execute(sqlquery,values)
        mydb.commit()
        return render_template('complain.html',msg="thank you for contacting us!")
    else:    
        return render_template('complain.html')
########################################################
@app.route('/doctors')
def doctors():
   if 'loggedin' in session: 
       
      if session ['authority']== 'doctor' or session ['authority']== 'nurse' or session ['authority']== 'admin' : 
        
          showdoc= 'SELECT fname,lname,phone,specialization from doctors'
          mycursor.execute(showdoc)
          result=mycursor.fetchall()
          row_headers=[x[0] for x in mycursor.description ]
          data={'rec': result,
         'header':row_headers

      }
      
         
          return render_template('doctors.html',data=data,authority=session['authority'])
      else : 
          return redirect(url_for('home'))




   else: 
       return redirect(url_for('login'))
########################################################
@app.route('/engineers')
def engineers():
   if 'loggedin' in session:
       
       if session ['authority']== 'engineer' or session ['authority']== 'admin' : 
           
      
        showeng= 'SELECT fname,lname,phone from engineer'
        mycursor.execute(showeng)
        result=mycursor.fetchall()
        row_headers=[x[0] for x in mycursor.description ]
        data={'rec': result,
         'header':row_headers

      }
      
         
        return render_template('engineers.html',data=data,authority=session['authority'])
       else : 
          return redirect(url_for('home')) 
      
   else:
       return redirect(url_for('login'))
 ########################################################################
@app.route('/login',methods = ['POST', 'GET'])
def login():
    if 'loggedin' in session:
        return redirect(url_for('home')) 
   
        # Check if "username" and "password" POST requests exist (user submitted form)
    if request.method == 'POST' :
       
        # Create variables for easy access
        user = request.form['username']
        passw= request.form['password']
        #print(user,passw,  file=sys.stdout, flush=True)
        mycursor.execute('SELECT * FROM doctors WHERE user_name = %s AND password = %s and active = 1 limit 1', (user, passw))
        # Fetch one record and return result
        account = mycursor.fetchone()
        mycursor.execute('SELECT * FROM nurse WHERE nuser_name = %s AND password = %s and active = 1 limit 1', (user, passw))
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
   if 'loggedin' in session: 
       if session ['authority']== 'doctor' or session ['authority']== 'nurse' or session ['authority']== 'admin' : 
      
       
          shownurse= 'SELECT fname,lname,phone from nurse'
          mycursor.execute(shownurse)
          result=mycursor.fetchall()
          row_headers=[x[0] for x in mycursor.description ]
          data={'rec': result,
         'header':row_headers

      }
          return render_template('nurses.html',data=data ,authority=session['authority'])
       else : 
          return redirect(url_for('home')) 
      
   else:
       return redirect(url_for('login'))
   #################################################################
@app.route('/patients')
def patients():
   if 'loggedin' in session:
       if session ['authority']== 'doctor' or session ['authority']== 'nurse' or session ['authority']== 'admin' : 
      
           showpatient= 'SELECT fname,lname,sex,birth_date,phone from patient'
           mycursor.execute(showpatient)
           result=mycursor.fetchall()
           row_headers=[x[0] for x in mycursor.description ]
           data={'rec': result,
         'header':row_headers

      }
           return render_template('patients.html',data=data ,authority=session['authority'])
       else : 
          return redirect(url_for('home'))
    
      
   else:
       return redirect(url_for('login'))
########################################################
@app.route('/rooms_info')
def rooms_info():
   if 'loggedin' in session: 
       if session ['authority']== 'admin' or session ['authority']== 'engineer' : 
       
           roominfo = "SELECT medical_equipment.or_number as 'OR Number', medical_equipment.name as 'Device Name', medical_equipment.model_number as 'Model Number', medical_equipment.next_calibration_date as 'Next Calibration Date', maintenance.last_m_date as 'Last Maintnance Date', supplier.name as 'Supplier Name' from medical_equipment join maintenance on serial_number = MD_serial_number join supply on MD_serial_number = mdserial_number join supplier on supplier_id = supplier.id  ORDER BY or_number "
           mycursor.execute(roominfo)
           result=mycursor.fetchall()
           row_headers=[x[0] for x in mycursor.description ]
           data={'rec': result,
         'header':row_headers

      }
           return render_template('rooms info.html',data=data ,authority=session['authority'])
       else : 
          return redirect(url_for('home'))
      
   else:
       return redirect(url_for('login'))
#########################################################################
@app.route('/sign_up',methods=['POST','GET'])
def sign_up():
   if request.method=='POST':
      username=request.form["user_name"]
      password=request.form["password"]
      fname=request.form["first_name"]
      lname=request.form["last_name"]
      ssn=request.form["ssn"]
      sex=request.form["gender"]
      bday=request.form['birthday']
      formatteddate=datetime.datetime.strptime(bday,"%d/%m/%Y").strftime("%Y-%m-%d")
      phone=request.form["phone"]
      job=request.form["job"]
      #code=request.form['phoneInput']
      #print(code)
      if job == 'Doctor':
         spec=request.form["specialization"]
      mycursor.execute('SELECT * FROM doctors WHERE user_name = %s OR ssn  = %s  ', (username, ssn))
      account = mycursor.fetchone()
      mycursor.execute('SELECT * FROM nurse WHERE nuser_name = %s OR ssn  = %s  ', (username, ssn))
      account1 = mycursor.fetchone()
      mycursor.execute('SELECT * FROM engineer WHERE user_name = %s OR ssn  = %s  ', (username, ssn))
      account2 = mycursor.fetchone()
      print (account, account1,account2)
        
        
        
      if account or account1 or account2:
         return redirect(url_for('sign_up', msg="username or SSN already exists"))

                      
            

      if job=='Nurse':
         try:

            mycursor.execute("insert into nurse(nuser_name,password,fname,lname,ssn,sex,phone,active,birth_date) values(%s,%s,%s,%s,%s,%s,%s,0,%s)",(username,password,fname,lname,ssn,sex,phone,formatteddate))
            mydb.commit()
            return redirect(url_for('login'))
         except: 
            return redirect(url_for('home'))

      elif job == 'Doctor':
         try:

             mycursor.execute("insert into doctors(user_name,password,fname,lname,ssn,sex,phone,specialization,active,birth_date) values(%s,%s,%s,%s,%s,%s,%s,%s,0,%s)",(username,password,fname,lname,ssn,sex,phone,spec,formatteddate))
             mydb.commit()
             return redirect(url_for('login'))
         except: 
            return redirect(url_for('home'))    
      else :
         try: 

            mycursor.execute("insert into engineer(user_name,password,fname,lname,ssn,sex,phone,active,birth_date) values(%s,%s,%s,%s,%s,%s,%s,0,%s)",(username,password,fname,lname,ssn,sex,phone,formatteddate))
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
      username=session['username'] 
      if session['authority']=='nurse':
         sqlquery='select * from nurse where nuser_name = %s'
         mycursor.execute(sqlquery,(username,))
         result=mycursor.fetchone()
         data= {'fname': result[2],
                'lname':result[3], 
                'username':  result[0], 
                'phone': result[9], 
                'sex': result[5],
                'ssn': result[4], 
                'birthdate': result[7].strftime('%d/%m/%Y'),   
                'salary': result[6]  
                        }
         return render_template('info.html',data=data,authority=session['authority'])
     
      elif session['authority']=='doctor':
          sqlquery='select * from doctors where user_name = %s'
          mycursor.execute(sqlquery,(username,))
          result=mycursor.fetchone()
          data= {'fname': result[2],
                'lname':result[3], 
                'username':  result[1], 
                'phone': result[10], 
                'sex': result[5],
                'ssn': result[4], 
                'birthdate': result[7].strftime('%d/%m/%Y'), 
                'spec': result[8],
                'salary': result[6]  
                        }
          return render_template('info.html',data=data,authority=session['authority'])
      else: 
          sqlquery='select * from engineer where user_name = %s'
          mycursor.execute(sqlquery,(username,))
          result=mycursor.fetchone()
          data= {'fname': result[2],
                'lname':result[3], 
                'username':  result[0], 
                'phone': result[10], 
                'sex': result[5],
                'ssn': result[4], 
                'birthdate': result[7].strftime('%d/%m/%Y'), 
                'salary': result[6]                        }
          
          return render_template('info.html',data=data,authority=session['authority'])
          
          

   else: return redirect(url_for('login'))
########################################################
@app.route('/data')
def data():
    if 'loggedin' in session: 
        username = session['username']
        currentdate= datetime.datetime.now()
        print(currentdate)
        if session ['authority']== 'nurse': 
            sql_select_Query = "select DISTINCT patient.fname as'patient.fname', patient.lname as 'patient.lname' ,patient_ssn,start_date,end_date, OR_number, doctors.fname as 'dr.fname' ,doctors .lname as'dr.lastname'  from nurse join appointments on nuser_name=N_user_name join doctors on D_user_name = user_name join patient on patient_ssn = patient.ssn  Where nuser_name= %s And  DATE(end_date) < %s "
            mycursor.execute(sql_select_Query,(username,currentdate,))
            myresult= mycursor.fetchall()
            row_headers=[x[0] for x in mycursor.description] 
            data={

         'rec':myresult,
         'header':row_headers
         
         
      }
            return render_template('data.html',data=data,authority=session['authority'])
        if session ['authority']== 'doctor': 
            sql_select_Query = "select DISTINCT patient.fname as'patient.fname', patient.lname as 'patient.lname' ,patient_ssn,start_date,end_date, OR_number, nurse.fname as 'nurse.fname' ,nurse .lname as'nurse.lastname'  from doctors join appointments on doctors.user_name=D_user_name join nurse on N_user_name = nuser_name join patient on patient_ssn = patient.ssn  Where doctors.user_name= %s And  DATE(end_date) < %s"
            mycursor.execute(sql_select_Query,(username,currentdate,))
            myresult= mycursor.fetchall()
            row_headers=[x[0] for x in mycursor.description] 
            data={

         'rec':myresult,
         'header':row_headers
         
         
      }
            return render_template('data.html',data=data,authority=session['authority'])
        if session ['authority']== 'engineer' or session ['authority']== 'admin' : 
            sql_select_Query = "select DISTINCT  medical_equipment.name as 'device name', medical_equipment.id as 'device id',medical_equipment.or_number as 'OR', medical_equipment.next_calibration_date as 'next calibration date', maintenance.last_m_date, supplier.name as 'supplier name' from medical_equipment join maintenance on serial_number = MD_serial_number join supply on MD_serial_number = mdserial_number join supplier on supplier_id = supplier.id Where maintenance.E_user_name = %s  "
            mycursor.execute(sql_select_Query,(username,))
            myresult= mycursor.fetchall()
            row_headers=[x[0] for x in mycursor.description] 
            data={

         'rec':myresult,
         'header':row_headers
         
         
      }
            return render_template('data.html',data=data,authority=session['authority'])


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
@app.route('/viewcomplaints')
def viewcomplaints():
    if 'loggedin' in session: 
        if session ['authority']== 'admin': 
            sql_select_Query = 'select * from complaints'
            mycursor.execute(sql_select_Query)
            myresult= mycursor.fetchall()
            row_headers=[x[0] for x in mycursor.description] 
            data={

         'rec':myresult,
         'header':row_headers
         
         
      }
            return render_template('viewcomplaints.html',data=data,authority=session['authority'])
        else:
            return redirect(url_for('home'))
            
    else:
        
        return redirect(url_for('login'))
# =============================================================================
# @app.route('/sign_up',methods=['POST','GET'])
# def sign_up():
#     if request.method=='POST':
#         bday=request.form['birthday']
#         Formatteddate=datetime.datetime.strptime(bday, "%d/%m/%Y").strftime("%Y-%m-%d")
#         print(Formatteddate)
#         return redirect(url_for('login'))
#     else :
#       return render_template('sign_up.html')
# =============================================================================


if __name__ == '__main__':
   app.run()
