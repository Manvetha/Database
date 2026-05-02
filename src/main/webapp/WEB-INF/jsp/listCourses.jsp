<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Course Directory</title>
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600&display=swap');
        body { font-family: 'Inter', sans-serif; background: linear-gradient(135deg, #fdfbfb 0%, #ebedee 100%); margin: 0; padding: 20px; min-height: 100vh; }
        .navbar { background: white; padding: 20px 30px; border-radius: 12px; margin-bottom: 30px; box-shadow: 0 4px 15px rgba(0,0,0,0.05); display: flex; justify-content: space-between; align-items: center; max-width: 1000px; margin-left: auto; margin-right: auto; }
        .navbar-brand { font-size: 1.2em; font-weight: 600; color: #2c3e50; text-decoration: none; }
        .navbar-links a { text-decoration: none; color: #6c757d; font-weight: 500; margin-left: 20px; transition: color 0.3s; }
        .navbar-links a:hover, .navbar-links a.active { color: #667eea; }
        .container { max-width: 1000px; margin: auto; background: white; padding: 40px; border-radius: 16px; box-shadow: 0 10px 30px rgba(0,0,0,0.08); }
        h2 { color: #2c3e50; text-align: left; margin: 0; font-weight: 600; }
        .header-actions { display: flex; justify-content: space-between; align-items: center; margin-bottom: 30px; }
        table { width: 100%; border-collapse: separate; border-spacing: 0; }
        th, td { padding: 16px; text-align: left; border-bottom: 1px solid #edf2f7; }
        th { background-color: #f8fafc; color: #64748b; font-weight: 600; text-transform: uppercase; font-size: 0.75em; letter-spacing: 0.05em; }
        th:first-child { border-top-left-radius: 8px; border-bottom-left-radius: 8px; }
        th:last-child { border-top-right-radius: 8px; border-bottom-right-radius: 8px; }
        tr { transition: all 0.2s ease; }
        tr:hover td { background-color: #f8fafc; }
        .btn { display: inline-flex; align-items: center; justify-content: center; padding: 10px 20px; text-decoration: none; border-radius: 8px; color: white; font-weight: 500; transition: all 0.3s ease; border: none; cursor: pointer; font-size: 0.9em; }
        .btn:hover { transform: translateY(-2px); box-shadow: 0 5px 15px rgba(0,0,0,0.1); }
        .btn-primary { background: linear-gradient(135deg, #10b981 0%, #059669 100%); }
        .badge { background: #e2e8f0; color: #475569; padding: 4px 12px; border-radius: 9999px; font-size: 0.85em; font-weight: 500; }
    </style>
</head>
<body>

<div class="navbar">
    <a href="/" class="navbar-brand">EduManage Pro</a>
    <div class="navbar-links">
        <a href="/">Students</a>
        <a href="/courses" class="active">Courses</a>
    </div>
</div>

<div class="container">
    <div class="header-actions">
        <h2>Course Directory</h2>
        <a href="/courses/add" class="btn btn-primary">+ Add New Course</a>
    </div>

    <table>
        <thead>
            <tr>
                <th>ID</th>
                <th>Course Name</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach var="course" items="${courses}">
                <tr>
                    <td><span class="badge">#${course.id}</span></td>
                    <td><strong style="color: #1e293b; font-size: 1.1em;">${course.courseName}</strong></td>
                </tr>
            </c:forEach>
            <c:if test="${empty courses}">
                <tr>
                    <td colspan="2" style="text-align: center; color: #94a3b8; padding: 40px;">No courses found. Add a new course to get started!</td>
                </tr>
            </c:if>
        </tbody>
    </table>
</div>

</body>
</html>
