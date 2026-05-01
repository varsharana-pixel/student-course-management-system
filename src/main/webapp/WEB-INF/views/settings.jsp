<%@ page contentType="text/html;charset=UTF-8" %>

<!DOCTYPE html>
<html>
<head>
    <title>Settings</title>

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

        .item {
            padding: 18px 20px;
            border: 2px solid #bfdbfe;
            border-radius: 16px;
            margin-bottom: 14px;
            background: linear-gradient(135deg, #ffffff, #f8fbff);
            box-shadow: 0 8px 20px rgba(37, 99, 235, 0.08);
            transition: 0.2s ease;
        }

        .item:hover {
            border-color: #2563eb;
            background: #eff6ff;
            transform: translateY(-2px);
        }

        .item strong {
            color: #2563eb;
        }
    </style>
</head>

<body>

<div class="box">

    <a class="back" href="/students">← Back to Dashboard</a>

    <div class="head">
        <h1>Settings</h1>
        <p>Application configuration details.</p>
    </div>

    <div class="item">
        <strong>Application:</strong> Student Course Management System
    </div>

    <div class="item">
        <strong>Backend:</strong> Spring Boot
    </div>

    <div class="item">
        <strong>Frontend:</strong> JSP + JSTL
    </div>

    <div class="item">
        <strong>Database:</strong> MySQL
    </div>

    <div class="item">
        <strong>Status:</strong> Active
    </div>

</div>

</body>
</html>