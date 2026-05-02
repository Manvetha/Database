<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Course Directory | EduManage Pro</title>
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700&display=swap');
        :root {
            --primary: #4f46e5;
            --primary-hover: #4338ca;
            --bg-color: #f3f4f6;
            --card-bg: #ffffff;
            --text-main: #111827;
            --text-muted: #6b7280;
            --border: #e5e7eb;
        }
        body { 
            font-family: 'Inter', sans-serif; 
            background-color: var(--bg-color); 
            color: var(--text-main);
            margin: 0; 
            padding: 0; 
            min-height: 100vh; 
        }
        .navbar { 
            background: var(--card-bg); 
            padding: 0 2rem; 
            height: 4.5rem;
            border-bottom: 1px solid var(--border); 
            display: flex; 
            justify-content: space-between; 
            align-items: center; 
            position: sticky;
            top: 0;
            z-index: 10;
        }
        .navbar-brand { 
            font-size: 1.25rem; 
            font-weight: 700; 
            color: var(--primary); 
            text-decoration: none; 
            letter-spacing: -0.025em;
            display: flex;
            align-items: center;
            gap: 10px;
        }
        .navbar-brand::before {
            content: '🎓';
            font-size: 1.5rem;
        }
        .navbar-links { display: flex; gap: 2rem; height: 100%; align-items: center; }
        .navbar-links a { 
            text-decoration: none; 
            color: var(--text-muted); 
            font-weight: 500; 
            font-size: 0.95rem;
            transition: color 0.2s; 
            height: 100%;
            display: flex;
            align-items: center;
            border-bottom: 2px solid transparent;
        }
        .navbar-links a:hover { color: var(--text-main); }
        .navbar-links a.active { color: var(--primary); border-bottom-color: var(--primary); }
        
        .main-content { padding: 3rem 2rem; max-width: 1100px; margin: 0 auto; }
        
        .card { 
            background: var(--card-bg); 
            border-radius: 12px; 
            box-shadow: 0 1px 3px 0 rgba(0, 0, 0, 0.1), 0 1px 2px 0 rgba(0, 0, 0, 0.06); 
            overflow: hidden;
            border: 1px solid var(--border);
        }
        .card-header {
            padding: 1.5rem 2rem;
            border-bottom: 1px solid var(--border);
            display: flex;
            justify-content: space-between;
            align-items: center;
            background: #fafafa;
        }
        h2 { margin: 0; font-weight: 600; font-size: 1.25rem; color: var(--text-main); }
        
        table { width: 100%; border-collapse: collapse; }
        th, td { padding: 1.25rem 2rem; text-align: left; border-bottom: 1px solid var(--border); }
        th { 
            background-color: #f9fafb; 
            color: var(--text-muted); 
            font-weight: 600; 
            text-transform: uppercase; 
            font-size: 0.75rem; 
            letter-spacing: 0.05em; 
        }
        tr:last-child td { border-bottom: none; }
        tr:hover td { background-color: #f9fafb; }
        
        .btn { 
            display: inline-flex; 
            align-items: center; 
            justify-content: center; 
            padding: 0.5rem 1rem; 
            border-radius: 6px; 
            font-weight: 500; 
            font-size: 0.875rem;
            transition: all 0.2s; 
            border: 1px solid transparent; 
            cursor: pointer; 
            text-decoration: none;
        }
        .btn-primary { 
            background-color: var(--primary); 
            color: white; 
            box-shadow: 0 1px 2px 0 rgba(0, 0, 0, 0.05);
        }
        .btn-primary:hover { background-color: var(--primary-hover); transform: translateY(-1px); }
        
        .badge { 
            background: #eff6ff; 
            color: #1d4ed8; 
            padding: 0.25rem 0.75rem; 
            border-radius: 9999px; 
            font-size: 0.75rem; 
            font-weight: 500; 
            display: inline-block;
        }
        .badge-id { background: #f3f4f6; color: #4b5563; }
    </style>
</head>
<body>

<div class="navbar">
    <a href="${pageContext.request.contextPath}/" class="navbar-brand">EduManage Pro</a>
    <div class="navbar-links">
        <a href="${pageContext.request.contextPath}/">Students</a>
        <a href="${pageContext.request.contextPath}/courses" class="active">Courses</a>
    </div>
</div>

<div class="main-content">
    <div class="card">
        <div class="card-header">
            <h2>Course Directory</h2>
            <a href="${pageContext.request.contextPath}/courses/add" class="btn btn-primary">+ Add Course</a>
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
                        <td><span class="badge badge-id">#${course.id}</span></td>
                        <td><strong style="color: var(--text-main); font-weight: 500;">${course.courseName}</strong></td>
                    </tr>
                </c:forEach>
                <c:if test="${empty courses}">
                    <tr>
                        <td colspan="2" style="text-align: center; color: var(--text-muted); padding: 3rem;">No courses available.</td>
                    </tr>
                </c:if>
            </tbody>
        </table>
    </div>
</div>

</body>
</html>
