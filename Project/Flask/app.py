from flask import Flask, render_template
app = Flask(__name__)

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
@app.route('/login')
def login():
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
@app.route('/profile')
def profile():
   return render_template('profile.html')
########################################################
if __name__ == '__main__':
   app.run()