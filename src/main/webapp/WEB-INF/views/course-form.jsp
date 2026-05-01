
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
    <title>Course Form</title>

    <style>
        * { box-sizing: border-box; }

        body {
            margin: 0;
            font-family: Arial, sans-serif;
            background: #f4f7fb;
            color: #172033;
        }

        .topbar {
            height: 76px;
            background: linear-gradient(135deg, #2563eb, #6d28d9);
            color: white;
            display: flex;
            align-items: center;
            padding: 0 34px;
            font-size: 20px;
            font-weight: bold;
            border-bottom: 4px solid #1d4ed8;
            box-shadow: 0 6px 20px rgba(37, 99, 235, 0.25);
        }

        .layout {
            display: flex;
        }

        .sidebar {
            width: 270px;
            min-height: calc(100vh - 76px);
            background: white;
            padding: 28px 20px;
            border-right: 4px solid #1d4ed8;
            box-shadow: 6px 0 20px rgba(15, 23, 42, 0.08);
        }

        .sidebar a {
            display: block;
            padding: 14px 16px;
            margin-bottom: 8px;
            border-radius: 12px;
            text-decoration: none;
            color: #475569;
            font-weight: bold;
            border: 2px solid transparent;
        }

        .sidebar a.active,
        .sidebar a:hover {
            background: #eef4ff;
            color: #2563eb;
            border-color: #2563eb;
        }

        .main {
            flex: 1;
            padding: 40px;
        }

        .page-head {
            max-width: 680px;
            margin: 0 auto 24px;
            background: #ffffff;
            padding: 22px 24px;
            border-radius: 18px;
            border: 3px solid #1d4ed8;
            border-left: 8px solid #2563eb;
            box-shadow: 0 10px 26px rgba(15, 23, 42, 0.08);
        }

        .page-head h1 {
            margin: 0;
        }

        .page-head p {
            color: #64748b;
            margin-bottom: 0;
        }

        .form-card {
            max-width: 680px;
            margin: auto;
            background: white;
            padding: 34px;
            border-radius: 20px;
            border: 3px solid #1d4ed8;
            box-shadow: 0 14px 34px rgba(15, 23, 42, 0.10);
        }

        label {
            font-weight: bold;
            margin-bottom: 8px;
            display: block;
            color: #334155;
        }

        input {
            width: 100%;
            padding: 14px;
            margin-bottom: 22px;
            font-size: 15px;
            border-radius: 14px;
            background: #eaf3ff;
            border: 2px solid #2563eb;
            box-shadow:
                inset 0 2px 4px rgba(0,0,0,0.06),
                0 2px 6px rgba(37, 99, 235, 0.08);
            transition: all 0.2s ease;
        }

        input:focus {
            outline: none;
            background: #f5f9ff;
            border-color: #1d4ed8;
            box-shadow:
                inset 0 2px 4px rgba(0,0,0,0.05),
                0 0 0 3px #bfdbfe,
                0 4px 10px rgba(37, 99, 235, 0.15);
        }

        button {
            width: 100%;
            padding: 14px;
            background: linear-gradient(135deg,#2563eb,#1d4ed8);
            color: white;
            border-radius: 12px;
            font-size: 16px;
            font-weight: bold;
            cursor: pointer;
            border: 2px solid #1d4ed8;
            transition: 0.2s;
        }

        button:hover {
            transform: translateY(-1px);
            box-shadow: 0 6px 14px rgba(37,99,235,0.3);
        }

        .back {
            display: block;
            text-align: center;
            margin-top: 18px;
            color: #2563eb;
            font-weight: bold;
            text-decoration: none;
        }
    </style>
</head>

<body>

<div class="topbar">
    ☰ &nbsp; Student Course Management
</div>

<div class="layout">

    <aside class="sidebar">
        <a href="/students">▦ Dashboard</a>
        <a href="/students">👥 Students</a>
        <a href="/courses" class="active">📘 Courses</a>
        <a href="/reports">📊 Reports</a>
        <a href="/settings">⚙ Settings</a>
    </aside>

    <main class="main">

        <div class="page-head">
            <h1>Add New Course</h1>
            <p>Add or update course information.</p>
        </div>

        <div class="form-card">

            <form action="/courses/save" method="post">

                <input type="hidden" name="id" value="${course.id}" />

                <label>Course Name</label>
                <input type="text"
                       name="courseName"
                       value="${course.courseName}"
                       required />

                <label>Duration</label>
                <input type="text"
                       name="duration"
                       value="${course.duration}"
                       placeholder="Example: 3 Months"
                       required />

                <label>Instructor</label>
                <input type="text"
                       name="instructor"
                       value="${course.instructor}"
                       required />

                <button type="submit">Save Course</button>

            </form>

            <a href="/courses" class="back">← Back to Courses</a>

        </div>

    </main>

</div>

</body>
</html>