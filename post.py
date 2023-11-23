from flask import Flask, render_template, request, redirect, url_for
import mysql.connector

app = Flask(__name__)

# Configure your MySQL connection
db = mysql.connector.connect(
    host="localhost",
    user="root",
    passwd="1234567zxcvbnm",
    port="3306",
    database="Caregivers"
)

mycursor = db.cursor()

@app.route('/')
def index():
    # Implement your home page
    return render_template('index.html')

@app.route('/post_job', methods=['GET', 'POST'])
def post_job():
    if request.method == 'POST':
        member_user_id = request.form['member_user_id']  # Get this value from your authentication system
        criteria = request.form['criteria']
        preferred_time_intervals = request.form['preferred_time_intervals']
        frequency = request.form['frequency']

        post_job_advertisement(member_user_id, criteria, preferred_time_intervals, frequency)
        return redirect(url_for('index'))

    return render_template('post_job.html')

if __name__ == '__main__':
    app.run(debug=True)
