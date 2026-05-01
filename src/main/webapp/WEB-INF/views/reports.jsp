<%@ page contentType="text/html;charset=UTF-8" %>

<!DOCTYPE html>
<html>
<head>
    <title>Reports</title>

    <style>
        * { box-sizing: border-box; }

        body {
            font-family: Arial, sans-serif;
            background: linear-gradient(135deg, #eef4ff, #f8fbff);
            margin: 0;
            padding: 34px;
            color: #172033;
        }

        .box {
            background: rgba(255, 255, 255, 0.96);
            padding: 30px;
            border-radius: 24px;
            border: 2px solid #2563eb;
            box-shadow: 0 18px 45px rgba(37, 99, 235, 0.14);
        }

        .back {
            display: inline-block;
            color: #2563eb;
            font-weight: bold;
            text-decoration: none;
            margin-bottom: 22px;
            padding: 9px 14px;
            border-radius: 12px;
            background: #eff6ff;
            border: 1px solid #bfdbfe;
        }

        .back:hover {
            background: #dbeafe;
        }

        .head {
            background: linear-gradient(135deg, #ffffff, #eff6ff);
            border-left: 7px solid #2563eb;
            padding: 18px 22px;
            margin-bottom: 26px;
            border-radius: 16px;
            box-shadow: 0 8px 22px rgba(37, 99, 235, 0.08);
        }

        h1 {
            color: #2563eb;
            margin: 0 0 8px;
            font-size: 34px;
        }

        p {
            color: #64748b;
            margin: 0;
            font-size: 15px;
        }

        .cards {
            display: flex;
            gap: 22px;
        }

        .card {
            flex: 1;
            padding: 28px;
            border: 2px solid #2563eb;
            border-radius: 20px;
            background: linear-gradient(135deg, #ffffff, #eff6ff);
            box-shadow: 0 12px 28px rgba(37, 99, 235, 0.12);
            transition: 0.2s ease;
        }

        .card:hover {
            transform: translateY(-3px);
            box-shadow: 0 16px 36px rgba(37, 99, 235, 0.18);
        }

        .card h3 {
            color: #64748b;
            margin: 0 0 14px;
            font-size: 17px;
        }

        .num {
            font-size: 42px;
            font-weight: bold;
            color: #2563eb;
        }
    </style>
</head>

<body>

<div class="box">

    <a class="back" href="/students">← Back to Dashboard</a>

    <div class="head">
        <h1>Reports</h1>
        <p>Summary report of students, courses and enrollments.</p>
    </div>

    <div class="cards">
        <div class="card">
            <h3>Total Students</h3>
            <div class="num">${students.size()}</div>
        </div>

        <div class="card">
            <h3>Total Courses</h3>
            <div class="num">${courses.size()}</div>
        </div>

        <div class="card">
            <h3>Total Enrollments</h3>
            <div class="num">${students.size()}</div>
        </div>
    </div>

</div>

</body>
</html>