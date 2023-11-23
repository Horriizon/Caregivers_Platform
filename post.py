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
        job_id = request.form('job_id')
        member_user_id = request.form['member_user_id']  # Get this value from your authentication system
        required_caregiving_type = request.form['required_caregiving_type']
        other_requirements = request.form['other_requirements']
        date_posted = request.form['date_posted']

        Job(job_id, member_user_id, required_caregiving_type, other_requirements, date_posted)
        return redirect(url_for('index'))

    return render_template('post_job.html')

if __name__ == '__main__':
    app.run(debug=True)
