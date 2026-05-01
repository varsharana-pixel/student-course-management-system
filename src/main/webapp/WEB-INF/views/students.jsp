<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
    <title>Student Dashboard</title>

    <style>
        * {
            box-sizing: border-box;
        }

        :root {
            --bg: #f4f7fb;
            --text: #172033;
            --card: #ffffff;
            --muted: #64748b;
            --border: #b9d7ff;
            --border-strong: #93c5fd;
            --blue: #2563eb;
            --purple: #7c3aed;
            --green: #16a34a;
            --orange: #ea580c;
            --red: #e11d48;
        }

        body.dark-mode {
            --bg: #0f172a;
            --text: #e5e7eb;
            --card: #1e293b;
            --muted: #cbd5e1;
            --border: #475569;
            --border-strong: #64748b;
        }

        body {
            margin: 0;
            font-family: Arial, sans-serif;
            background:
                radial-gradient(circle at top left, #dbeafe 0, transparent 28%),
                radial-gradient(circle at top right, #ede9fe 0, transparent 30%),
                var(--bg);
            color: var(--text);
        }

        .topbar {
            height: 76px;
            background: linear-gradient(135deg, #2563eb, #7c3aed);
            color: white;
            display: flex;
            align-items: center;
            justify-content: space-between;
            padding: 0 34px;
            border-bottom: 2px solid rgba(255,255,255,0.35);
            box-shadow: 0 8px 28px rgba(37, 99, 235, 0.35);
            position: sticky;
            top: 0;
            z-index: 20;
        }

        .brand {
            font-size: 20px;
            font-weight: bold;
        }

        .top-search input {
            width: 350px;
            padding: 13px 17px;
            border: 1.5px solid rgba(255,255,255,0.55);
            border-radius: 16px;
            background: rgba(255,255,255,0.18);
            color: white;
            outline: none;
        }

        .top-search input::placeholder {
            color: #e0e7ff;
        }

        .top-actions {
            display: flex;
            align-items: center;
            gap: 14px;
        }

        .theme-btn,
        .admin-box {
            border: 1.5px solid rgba(255,255,255,0.45);
            background: rgba(255,255,255,0.16);
            color: white;
            padding: 10px 14px;
            border-radius: 14px;
            cursor: pointer;
            font-weight: bold;
            box-shadow: inset 0 0 0 1px rgba(255,255,255,0.12);
        }

        .admin-box {
            position: relative;
        }

        .admin-menu {
            display: none;
            position: absolute;
            right: 0;
            top: 48px;
            width: 190px;
            background: var(--card);
            color: var(--text);
            border: 2px solid var(--border);
            border-radius: 16px;
            box-shadow: 0 18px 42px rgba(15,23,42,0.28);
            overflow: hidden;
            z-index: 30;
        }

        .admin-box:hover .admin-menu {
            display: block;
        }

        .admin-menu a {
            display: block;
            padding: 12px 15px;
            color: var(--text);
            text-decoration: none;
            font-size: 14px;
            border-bottom: 1px solid var(--border);
        }

        .admin-menu a:last-child {
            border-bottom: none;
        }

        .admin-menu a:hover {
            background: #eff6ff;
            color: #2563eb;
        }

        .layout {
            display: flex;
        }

        .sidebar {
            width: 270px;
            min-height: calc(100vh - 76px);
            background: linear-gradient(180deg, #ffffff, #eff6ff 45%, #f5f3ff);
            border-right: 2px solid var(--border-strong);
            padding: 28px 20px;
            box-shadow: 10px 0 32px rgba(37, 99, 235, 0.12);
        }

        body.dark-mode .sidebar {
            background: linear-gradient(180deg, #1e293b, #172554, #312e81);
        }

        .menu-section {
            border-bottom: 1.5px solid var(--border);
            padding-bottom: 22px;
        }

        .menu a,
        .quick a {
            display: flex;
            align-items: center;
            gap: 12px;
            padding: 14px 16px;
            margin-bottom: 10px;
            border-radius: 16px;
            text-decoration: none;
            color: #475569;
            font-weight: bold;
            background: rgba(255,255,255,0.82);
            border: 1.5px solid #dbeafe;
            transition: 0.22s ease;
            box-shadow: 0 5px 16px rgba(15,23,42,0.04);
        }

        body.dark-mode .menu a,
        body.dark-mode .quick a {
            color: #e5e7eb;
            background: rgba(30,41,59,0.7);
            border-color: #475569;
        }

        .nav-icon {
            width: 32px;
            height: 32px;
            border-radius: 12px;
            display: inline-flex;
            align-items: center;
            justify-content: center;
            background: linear-gradient(135deg, #dbeafe, #ede9fe);
            color: #2563eb;
            border: 1px solid #bfdbfe;
        }

        .menu a.active {
            background: linear-gradient(135deg, #2563eb, #7c3aed);
            color: white;
            border: 2px solid #bfdbfe;
            box-shadow: 0 12px 26px rgba(37,99,235,0.32);
        }

        .menu a.active .nav-icon {
            background: rgba(255,255,255,0.22);
            color: white;
            border-color: rgba(255,255,255,0.35);
        }

        .menu a:hover,
        .quick a:hover {
            background: linear-gradient(135deg, #dbeafe, #ede9fe);
            color: #1d4ed8;
            transform: translateX(5px);
            border-color: #93c5fd;
        }

        .quick-title {
            margin: 26px 0 12px;
            font-size: 13px;
            color: #94a3b8;
            font-weight: bold;
            letter-spacing: 0.5px;
        }

        .help-card {
            margin-top: 70px;
            padding: 20px;
            border-radius: 22px;
            background: linear-gradient(135deg, #2563eb, #7c3aed);
            color: white;
            border: 1.5px solid rgba(255,255,255,0.35);
            box-shadow: 0 14px 32px rgba(37,99,235,0.32);
        }

        .help-card p {
            color: #e0e7ff;
            font-size: 14px;
            line-height: 1.5;
        }

        .main {
            flex: 1;
            padding: 32px;
        }

        .page-head {
            background: linear-gradient(135deg, var(--card), rgba(239,246,255,0.9));
            border: 2px solid var(--border);
            border-left: 8px solid #2563eb;
            border-radius: 24px;
            padding: 26px 28px;
            margin-bottom: 28px;
            box-shadow: 0 16px 40px rgba(15,23,42,0.10);
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .page-head h1 {
            margin: 0;
            font-size: 30px;
        }

        .page-head p {
            color: var(--muted);
            margin-top: 7px;
            font-size: 16px;
        }

        .primary-btn {
            background: linear-gradient(135deg, #2563eb, #4f46e5);
            color: white;
            padding: 14px 20px;
            border-radius: 14px;
            text-decoration: none;
            font-weight: bold;
            border: 1.5px solid #93c5fd;
            box-shadow: 0 12px 24px rgba(37,99,235,0.32);
            transition: 0.22s ease;
        }

        .primary-btn:hover {
            transform: translateY(-2px);
        }

        .cards {
            display: grid;
            grid-template-columns: repeat(4, 1fr);
            gap: 22px;
            margin-bottom: 30px;
        }

        .card {
            position: relative;
            overflow: hidden;
            padding: 24px;
            border-radius: 22px;
            border: 2px solid var(--border);
            box-shadow: 0 14px 34px rgba(15,23,42,0.10);
            transition: 0.24s ease;
        }

        .card::after {
            content: "";
            position: absolute;
            width: 90px;
            height: 90px;
            border-radius: 50%;
            right: -30px;
            top: -30px;
            opacity: 0.45;
        }

        .card:nth-child(1) {
            background: linear-gradient(135deg, #ffffff, #eff6ff);
            border-color: #93c5fd;
        }

        .card:nth-child(1)::after {
            background: #93c5fd;
        }

        .card:nth-child(2) {
            background: linear-gradient(135deg, #ffffff, #ecfdf5);
            border-color: #86efac;
        }

        .card:nth-child(2)::after {
            background: #86efac;
        }

        .card:nth-child(3) {
            background: linear-gradient(135deg, #ffffff, #fff7ed);
            border-color: #fdba74;
        }

        .card:nth-child(3)::after {
            background: #fdba74;
        }

        .card:nth-child(4) {
            background: linear-gradient(135deg, #ffffff, #f5f3ff);
            border-color: #c4b5fd;
        }

        .card:nth-child(4)::after {
            background: #c4b5fd;
        }

        body.dark-mode .card {
            background: #1e293b;
            border-color: #475569;
        }

        .card:hover {
            transform: translateY(-6px);
            box-shadow: 0 20px 46px rgba(37,99,235,0.18);
        }

        .card h3 {
            margin: 0;
            color: #64748b;
            font-size: 15px;
        }

        .card strong {
            display: block;
            font-size: 34px;
            margin-top: 12px;
            color: #1d4ed8;
        }

        .card:nth-child(2) strong {
            color: #059669;
        }

        .card:nth-child(3) strong {
            color: #ea580c;
        }

        .card:nth-child(4) strong {
            color: #7c3aed;
        }

        .card span {
            display: block;
            margin-top: 8px;
            color: #16a34a;
            font-size: 13px;
            font-weight: bold;
        }

        .table-card {
            background: var(--card);
            border-radius: 24px;
            padding: 26px;
            border: 2px solid var(--border);
            box-shadow: 0 18px 44px rgba(15,23,42,0.11);
        }

        .table-toolbar {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 22px;
            padding-bottom: 18px;
            border-bottom: 2px solid var(--border);
        }

        .table-toolbar h2 {
            margin: 0;
            font-size: 25px;
        }

        .filters {
            display: flex;
            gap: 12px;
        }

        .filters input,
        .filters select {
            padding: 12px 14px;
            border: 1.5px solid #b9c9dd;
            border-radius: 14px;
            min-width: 220px;
            background: white;
            outline: none;
        }

        .filters input:focus,
        .filters select:focus {
            border-color: #2563eb;
            box-shadow: 0 0 0 4px rgba(37,99,235,0.12);
        }

        .filters button {
            border: 1.5px solid #93c5fd;
            background: linear-gradient(135deg, #2563eb, #4f46e5);
            color: white;
            padding: 12px 19px;
            border-radius: 14px;
            font-weight: bold;
            cursor: pointer;
            box-shadow: 0 9px 18px rgba(37,99,235,0.28);
        }

        .clear-btn {
            padding: 12px 16px;
            border-radius: 14px;
            text-decoration: none;
            color: #475569;
            background: #f8fafc;
            border: 1.5px solid #b9c9dd;
            font-weight: bold;
        }

        table {
            width: 100%;
            border-collapse: separate;
            border-spacing: 0 11px;
        }

        th {
            text-align: left;
            padding: 16px;
            background: linear-gradient(135deg, #eaf3ff, #eef2ff);
            color: #334155;
            font-size: 14px;
            border-top: 2px solid #bfdbfe;
            border-bottom: 2px solid #bfdbfe;
        }

        th::after {
            content: " ↕";
            color: #94a3b8;
            font-size: 12px;
        }

        th:first-child {
            border-left: 2px solid #bfdbfe;
            border-radius: 16px 0 0 16px;
        }

        th:last-child {
            border-right: 2px solid #bfdbfe;
            border-radius: 0 16px 16px 0;
        }

        td {
            padding: 16px;
            color: var(--text);
            background: var(--card);
            border-top: 1.8px solid var(--border);
            border-bottom: 1.8px solid var(--border);
            box-shadow: 0 7px 18px rgba(15,23,42,0.05);
            transition: 0.22s ease;
        }

        td:first-child {
            border-left: 1.8px solid var(--border);
            border-radius: 16px 0 0 16px;
            font-weight: bold;
            color: #2563eb;
        }

        td:last-child {
            border-right: 1.8px solid var(--border);
            border-radius: 0 16px 16px 0;
        }

        tr:hover td {
            background: #f0f7ff;
            border-color: #60a5fa;
            box-shadow: 0 10px 24px rgba(37,99,235,0.12);
        }

        body.dark-mode tr:hover td {
            background: #172554;
        }

        .student-cell {
            display: flex;
            align-items: center;
            gap: 12px;
            font-weight: bold;
        }

        .avatar {
            width: 42px;
            height: 42px;
            border-radius: 50%;
            background: linear-gradient(135deg, #dbeafe, #bfdbfe);
            color: #2563eb;
            display: flex;
            align-items: center;
            justify-content: center;
            font-weight: bold;
            border: 1.8px solid #93c5fd;
            box-shadow: 0 7px 16px rgba(37,99,235,0.18);
        }

        .badge {
            padding: 8px 14px;
            border-radius: 999px;
            background: linear-gradient(135deg, #dbeafe, #e0f2fe);
            color: #1d4ed8;
            font-size: 13px;
            font-weight: bold;
            border: 1.5px solid #93c5fd;
            white-space: nowrap;
        }

        .action-buttons {
            display: flex;
            gap: 10px;
            align-items: center;
        }

        .edit-btn,
        .delete-btn {
            display: inline-flex;
            align-items: center;
            justify-content: center;
            padding: 9px 13px;
            border-radius: 12px;
            font-weight: bold;
            font-size: 14px;
            text-decoration: none;
            transition: 0.22s ease;
            white-space: nowrap;
        }

        .edit-btn {
            background: linear-gradient(135deg, #2563eb, #4f46e5);
            color: white;
            border: 1.5px solid #93c5fd;
            box-shadow: 0 8px 17px rgba(37,99,235,0.28);
        }

        .delete-btn {
            background: linear-gradient(135deg, #fff1f2, #ffe4e6);
            color: #e11d48;
            border: 1.5px solid #fda4af;
        }

        .edit-btn:hover,
        .delete-btn:hover {
            transform: translateY(-2px);
        }

        .delete-btn:hover {
            background: linear-gradient(135deg, #e11d48, #be123c);
            color: white;
        }

        .empty {
            text-align: center;
            padding: 32px;
            color: var(--muted);
            font-weight: bold;
        }

        .footer {
            margin-top: 28px;
            text-align: center;
            color: var(--muted);
            font-size: 13px;
            padding: 18px;
            background: var(--card);
            border: 2px solid var(--border);
            border-radius: 18px;
            box-shadow: 0 10px 24px rgba(15,23,42,0.06);
        }

        @media (max-width: 900px) {
            .sidebar {
                display: none;
            }

            .cards {
                grid-template-columns: 1fr 1fr;
            }

            .page-head,
            .table-toolbar {
                flex-direction: column;
                align-items: flex-start;
                gap: 18px;
            }

            .filters {
                flex-direction: column;
                width: 100%;
            }

            .filters input,
            .filters select {
                width: 100%;
            }

            .top-search input {
                width: 200px;
            }

            .action-buttons {
                flex-direction: column;
                align-items: flex-start;
            }
        }
    </style>
</head>

<body>

<div class="topbar">
    <div class="brand">☰ &nbsp; Student Course Management</div>

    <form class="top-search" action="/students" method="get">
        <input type="text" name="keyword" value="${keyword}" placeholder="Search students..." />
    </form>

    <div class="top-actions">
        <button type="button" class="theme-btn" onclick="toggleTheme()">🌙 Mode</button>

        <div class="admin-box">
            🔔 &nbsp; 👤 Admin ▾
            <div class="admin-menu">
                <a href="/students">Dashboard</a>
                <a href="/students/new">Add Student</a>
                <a href="/courses">Courses</a>
                <a href="/reports">Reports</a>
            </div>
        </div>
    </div>
</div>

<div class="layout">

    <aside class="sidebar">
        <div class="menu-section">
            <div class="menu">
                <a href="/students" class="active"><span class="nav-icon">▦</span> Dashboard</a>
                <a href="${pageContext.request.contextPath}/student-list"><span class="nav-icon">👥</span> Students</a>
                <a href="/courses"><span class="nav-icon">📘</span> Courses</a>
                <a href="/reports"><span class="nav-icon">📊</span> Reports</a>
                <a href="/settings"><span class="nav-icon">⚙</span> Settings</a>
            </div>
        </div>

        <div class="quick-title">QUICK ACTIONS</div>

        <div class="quick">
            <a href="/students/new"><span class="nav-icon">＋</span> Add New Student</a>
            <a href="${pageContext.request.contextPath}/courses/new"><span class="nav-icon">＋</span> Add New Course</a>
            <a href="/students/export"><span class="nav-icon">☁</span> Export Data</a>
        </div>

        <div class="help-card">
            <strong>Need Help?</strong>
            <p>Use the search and course filter to quickly manage student enrollment records.</p>
        </div>
    </aside>

    <main class="main">

        <div class="page-head">
            <div>
                <h1>Dashboard</h1>
                <p>Overview of students, courses and enrollment details</p>
            </div>

            <a href="/students/new" class="primary-btn">＋ Add New Student</a>
        </div>

        <div class="cards">
            <div class="card">
                <h3>Total Students</h3>
                <strong>${totalStudents}</strong>
                <span>Live</span>
            </div>

            <div class="card">
                <h3>Total Courses</h3>
                <strong>${totalCourses}</strong>
                <span>Available courses</span>
            </div>

            <div class="card">
                <h3>Total Enrollments</h3>
                <strong>${totalEnrollments}</strong>
                <span>Active</span>
            </div>

            <div class="card">
                <h3>Visible Records</h3>
                <strong>${visibleStudents}</strong>
                <span>Updated</span>
            </div>
        </div>

        <div class="table-card">

            <div class="table-toolbar">
                <h2>Enrolled Students</h2>

                <form class="filters" action="/students" method="get">
                    <select name="courseId">
                        <option value="">All Courses</option>

                        <c:forEach var="course" items="${courses}">
                            <option value="${course.id}"
                                <c:if test="${selectedCourseId == course.id}">selected</c:if>>
                                ${course.courseName}
                            </option>
                        </c:forEach>
                    </select>

                    <input type="text" name="keyword" value="${keyword}" placeholder="Search by name, email, city..." />

                    <button type="submit">Search</button>
                    <a href="/students" class="clear-btn">Clear</a>
                </form>
            </div>

            <table>
                <tr>
                    <th>ID</th>
                    <th>Student Name</th>
                    <th>Email</th>
                    <th>Age</th>
                    <th>City</th>
                    <th>Course</th>
                    <th>Action</th>
                </tr>

                <c:choose>
                    <c:when test="${empty students}">
                        <tr>
                            <td colspan="7" class="empty">No student records found.</td>
                        </tr>
                    </c:when>

                    <c:otherwise>
                        <c:forEach var="student" items="${students}">
                            <tr>
                                <td>${student.id}</td>

                                <td>
                                    <div class="student-cell">
                                        <div class="avatar">${student.studentName.substring(0,1)}</div>
                                        ${student.studentName}
                                    </div>
                                </td>

                                <td>${student.email}</td>
                                <td>${student.age}</td>
                                <td>${student.city}</td>
                                <td><span class="badge">${student.course.courseName}</span></td>

                                <td>
                                    <div class="action-buttons">
                                        <a href="/students/edit/${student.id}" class="edit-btn">✎ Edit</a>

                                        <a href="/students/delete/${student.id}"
                                           class="delete-btn"
                                           onclick="return confirm('Are you sure you want to delete this student?');">
                                            🗑 Delete
                                        </a>
                                    </div>
                                </td>
                            </tr>
                        </c:forEach>
                    </c:otherwise>
                </c:choose>
            </table>

        </div>

        <div class="footer">
            © 2025 Student Course Management System | ${todayDate} | Version 1.0.0
        </div>

    </main>

</div>

<script>
    function toggleTheme() {
        document.body.classList.toggle("dark-mode");

        if (document.body.classList.contains("dark-mode")) {
            localStorage.setItem("theme", "dark");
        } else {
            localStorage.setItem("theme", "light");
        }
    }

    window.onload = function () {
        if (localStorage.getItem("theme") === "dark") {
            document.body.classList.add("dark-mode");
        }
    };
</script>

</body>
</html>