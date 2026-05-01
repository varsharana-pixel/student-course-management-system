<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
    <title>Courses</title>

    <style>
        * {
            box-sizing: border-box;
        }

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

        .table-wrap {
            border: 2px solid #2563eb;
            border-radius: 18px;
            overflow: hidden;
            background: white;
            box-shadow: 0 10px 28px rgba(37, 99, 235, 0.12);
        }

        table {
            width: 100%;
            border-collapse: collapse;
        }

        th, td {
            padding: 16px 18px;
            text-align: left;
        }

        th {
            background: linear-gradient(135deg, #dbeafe, #eff6ff);
            color: #1d4ed8;
            font-size: 15px;
            border-bottom: 1px solid #bfdbfe;
        }

        td {
            color: #172033;
            border-bottom: 1px solid #e5eaf2;
            background: white;
        }

        tr:nth-child(even) td {
            background: #f8fbff;
        }

        tr:hover td {
            background: #eef4ff;
        }

        tr:last-child td {
            border-bottom: none;
        }

        .course-name {
            font-weight: bold;
            color: #0f172a;
        }

        .id-badge {
            display: inline-block;
            min-width: 30px;
            text-align: center;
            padding: 5px 8px;
            border-radius: 10px;
            background: #eff6ff;
            color: #2563eb;
            font-weight: bold;
            border: 1px solid #bfdbfe;
        }

        .empty {
            text-align: center;
            color: #64748b;
            padding: 28px;
            font-weight: bold;
            background: #f8fbff;
        }
    </style>
</head>

<body>

<div class="box">

    <a class="back" href="/students">← Back to Dashboard</a>

    <div class="head">
        <h1>Courses</h1>
        <p>List of all available courses in the system.</p>
    </div>

    <div class="table-wrap">
        <table>
            <tr>
                <th>ID</th>
                <th>Course Name</th>
                <th>Duration</th>
                <th>Instructor</th>
            </tr>

            <c:forEach var="course" items="${courses}">
                <tr>
                    <td><span class="id-badge">${course.id}</span></td>
                    <td><span class="course-name">${course.courseName}</span></td>
                    <td>${course.duration}</td>
                    <td>${course.instructor}</td>
                </tr>
            </c:forEach>

            <c:if test="${empty courses}">
                <tr>
                    <td colspan="4" class="empty">No course records found.</td>
                </tr>
            </c:if>
        </table>
    </div>

</div>

</body>
</html>