from flask import Flask, render_template, request
import mysql.connector
app = Flask(__name__)
db = mysql.connector.connect(
    host = "localhost",
    user = "root",
    passwd = "1234567zxcvbnm",
    port = "3306",
    database = "Caregivers"
)

mycursor = db.cursor()

#3.1
mycursor.execute("UPDATE USER SET phone_number = '+77771010001' WHERE given_name = 'Askar' AND surname = 'Askarov'")


#3.2
mycursor.execute("UPDATE CAREGIVER SET hourly_rate = CASE WHEN hourly_rate < 9.00 THEN hourly_rate + 0.5 ELSE hourly_rate * 1.1 END")


#4.1
mycursor.execute("DELETE FROM JOB WHERE member_user_id IN (SELECT user_id FROM USER WHERE given_name = 'Bolat' AND surname = 'Bolatov')")


#4.2
mycursor.execute("DELETE FROM APPOINTMENT WHERE member_user_id IN (SELECT member_user_id FROM ADDRESS WHERE street = 'Turan')")
mycursor.execute("DELETE FROM JOB WHERE member_user_id IN (SELECT member_user_id FROM ADDRESS WHERE street = 'Turan')")
mycursor.execute("DELETE FROM MEMBER WHERE member_user_id IN (SELECT member_user_id FROM ADDRESS WHERE street = 'Turan')")
mycursor.execute("DELETE FROM ADDRESS WHERE street = 'Turan'")

def execute_query(query):
    mycursor.execute(query)
    result = mycursor.fetchall()
    return result
#5.1
query_5_1 = """
SELECT
   CONCAT(U1.given_name, ' ', U1.surname) AS caregiver_name,
   CONCAT(U2.given_name, ' ', U2.surname) AS member_name
FROM
   APPOINTMENT A
   JOIN CAREGIVER C ON A.caregiver_user_id = C.caregiver_user_id
   JOIN MEMBER M ON A.member_user_id = M.member_user_id
   JOIN USER U1 ON C.caregiver_user_id = U1.user_id
   JOIN USER U2 ON M.member_user_id = U2.user_id
WHERE
   A.status = 'Confirmed';
"""


mycursor.execute(query_5_1)
print(mycursor.fetchall())


#5.2
query_5_2 = """
SELECT
   job_id
FROM
   JOB
WHERE
   LOWER(other_requirements) LIKE '%gentle%';
"""


mycursor.execute(query_5_2)
print(mycursor.fetchall())


#5.3
query_5_3 = """
SELECT
   A.work_hours
FROM
   CAREGIVER C
   JOIN APPOINTMENT A ON C.caregiver_user_id = A.caregiver_user_id
WHERE
   C.caregiving_type = 'Baby Sitter'
"""


mycursor.execute(query_5_3)
print(mycursor.fetchall())


#5.4
query_5_4 = """
SELECT
   CONCAT(U.given_name, ' ' , U.surname) AS member_name
FROM
   USER U
   JOIN MEMBER M ON U.user_id = M.member_user_id
   JOIN ADDRESS A ON M.member_user_id = A.member_user_id
WHERE
   M.house_rules LIKE '%No pets%'
   AND M.member_user_id IN (
       SELECT
           member_user_id
       FROM
           JOB
       WHERE
           required_caregiving_type = 'Elderly Care'
   )
   AND A.town = 'Astana';
"""


mycursor.execute(query_5_4)
print(mycursor.fetchall())


#6.1
query_6_1 = """
SELECT
   J.job_id,
   COUNT(JA.caregiver_user_id) AS applicant_count
FROM
   JOB J
   LEFT JOIN JOB_APPLICATION JA ON J.job_id = JA.job_id
GROUP BY
   J.job_id;
"""


mycursor.execute(query_6_1)
print(mycursor.fetchall())


#6.2
query_6_2 = """
SELECT
   SUM(A.work_hours) AS total_hours_spent
FROM
   APPOINTMENT A
WHERE
   A.status = 'Confirmed';
"""


mycursor.execute(query_6_2)
print(mycursor.fetchall())


#6.3
query_6_3 = """
SELECT
   AVG(C.hourly_rate) AS average_pay
FROM
   APPOINTMENT A
   JOIN CAREGIVER C ON A.caregiver_user_id = C.caregiver_user_id
WHERE
   A.status = 'Confirmed';
"""


mycursor.execute(query_6_3)
print(mycursor.fetchall())


#6.4
query_avg_pay = """
SELECT
   AVG(C.hourly_rate) AS average_pay
FROM
   APPOINTMENT A
   JOIN CAREGIVER C ON A.caregiver_user_id = C.caregiver_user_id
WHERE
   A.status = 'Confirmed';
"""


mycursor.execute(query_avg_pay)
result_avg_pay = mycursor.fetchone()
average_pay = result_avg_pay[0]


query_6_4 = f"""
SELECT
   CONCAT(U.given_name, ' ', U.surname) AS caregiver_name,
   C.hourly_rate
FROM
   CAREGIVER C
   JOIN APPOINTMENT A ON C.caregiver_user_id = A.caregiver_user_id
   JOIN USER U ON C.caregiver_user_id = U.user_id
WHERE
   A.status = 'Confirmed'
   AND C.hourly_rate > {average_pay};
"""


mycursor.execute(query_6_4)
print(mycursor.fetchall())


#7
query_7 = """
SELECT
   A.caregiver_user_id,
   SUM(A.work_hours * C.hourly_rate) AS total_cost
FROM
   APPOINTMENT A
   JOIN CAREGIVER C ON A.caregiver_user_id = C.caregiver_user_id
WHERE
   A.status = 'Confirmed'
GROUP BY
   A.caregiver_user_id;
"""


mycursor.execute(query_7)
print(mycursor.fetchall())


#8
query_8 = """
SELECT
   JA.job_id,
   U.given_name AS applicant_given_name,
   U.surname AS applicant_surname,
   J.required_caregiving_type,
   J.other_requirements,
   JA.date_applied
FROM
   JOB_APPLICATION JA
   JOIN USER U ON JA.caregiver_user_id = U.user_id
   JOIN JOB J ON JA.job_id = J.job_id;
"""


mycursor.execute(query_8)
print(mycursor.fetchall())


db.commit()
@app.route('/search', methods=['GET'])
def search_caregivers():
    caregiving_type = request.args.get('caregiving_type')
    city = request.args.get('city')
    search_query = f"""
        SELECT CONCAT(U1.given_name, ' ', U1.surname) AS caregiver_name, U1.city
        FROM CAREGIVER C
        JOIN USER U1 ON C.caregiver_user_id = U1.user_id
        WHERE C.caregiving_type = '{caregiving_type}' AND U1.city = '{city}';
    """
    search_results = execute_query(search_query)
    return render_template('index.html', search_results=search_results)

@app.route('/')
def index():
    result_5_1 = []
    return render_template('index.html', result_5_1=result_5_1)

if __name__ == '__main__':
    app.run(debug=True)
