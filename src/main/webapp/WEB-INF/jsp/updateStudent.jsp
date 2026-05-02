<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Update Student | EduManage Pro</title>
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
        
        .main-content { padding: 3rem 2rem; display: flex; justify-content: center; }
        
        .form-container { 
            width: 100%;
            max-width: 480px; 
            background: var(--card-bg); 
            padding: 2.5rem 3rem; 
            border-radius: 12px; 
            box-shadow: 0 4px 6px -1px rgba(0, 0, 0, 0.1), 0 2px 4px -1px rgba(0, 0, 0, 0.06); 
            border: 1px solid var(--border);
        }
        .form-container h2 { text-align: center; margin-top: 0; margin-bottom: 2rem; font-size: 1.5rem; color: var(--text-main); font-weight: 600; }
        
        .form-group { margin-bottom: 1.5rem; }
        label { display: block; margin-bottom: 0.5rem; color: #374151; font-weight: 500; font-size: 0.875rem; }
        input[type="text"], input[type="email"], select { 
            width: 100%; 
            padding: 0.625rem 0.875rem; 
            border: 1px solid #d1d5db; 
            border-radius: 6px; 
            box-sizing: border-box; 
            font-family: 'Inter', sans-serif; 
            font-size: 0.875rem; 
            color: #111827;
            transition: border-color 0.15s, box-shadow 0.15s; 
            background: #fff;
            box-shadow: 0 1px 2px 0 rgba(0, 0, 0, 0.05);
        }
        input:focus, select:focus { 
            outline: none; 
            border-color: var(--primary); 
            box-shadow: 0 0 0 3px rgba(79, 70, 229, 0.1); 
        }
        
        .form-actions { display: flex; gap: 1rem; margin-top: 2rem; }
        .btn { 
            flex: 1;
            display: inline-flex; 
            align-items: center; 
            justify-content: center; 
            padding: 0.625rem 1rem; 
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
        .btn-primary:hover { background-color: var(--primary-hover); }
        .btn-outline {
            background-color: white;
            border-color: #d1d5db;
            color: #374151;
            box-shadow: 0 1px 2px 0 rgba(0, 0, 0, 0.05);
        }
        .btn-outline:hover { background-color: #f9fafb; color: #111827; }
        
        .error-msg { 
            background: #fef2f2; 
            color: #991b1b; 
            padding: 0.75rem 1rem; 
            border-radius: 6px; 
            margin-bottom: 1.5rem; 
            font-size: 0.875rem; 
            font-weight: 500; 
            border: 1px solid #fecaca; 
            text-align: center;
        }
    </style>
</head>
<body>

<div class="navbar">
    <a href="${pageContext.request.contextPath}/" class="navbar-brand">EduManage Pro</a>
    <div class="navbar-links">
        <a href="${pageContext.request.contextPath}/" class="active">Students</a>
        <a href="${pageContext.request.contextPath}/courses">Courses</a>
    </div>
</div>

<div class="main-content">
    <div class="form-container">
        <h2>Update Student Record</h2>

        <c:if test="${not empty error}">
            <div class="error-msg">${error}</div>
        </c:if>

        <form action="${pageContext.request.contextPath}/update" method="post">
            <input type="hidden" name="id" value="${student.id}" />

            <div class="form-group">
                <label for="name">Full Name</label>
                <input type="text" id="name" name="name" value="${student.name}" required />
            </div>
            
            <div class="form-group">
                <label for="email">Email Address</label>
                <input type="email" id="email" name="email" value="${student.email}" required />
            </div>

            <div class="form-group">
                <label for="course">Assign Course</label>
                <select id="course" name="course.id" required>
                    <option value="" disabled>Select a course...</option>
                    <c:forEach var="course" items="${courses}">
                        <option value="${course.id}" ${course.id == student.course.id ? 'selected' : ''}>${course.courseName}</option>
                    </c:forEach>
                </select>
            </div>

            <div class="form-actions">
                <a href="${pageContext.request.contextPath}/" class="btn btn-outline">Cancel</a>
                <button type="submit" class="btn btn-primary">Save Changes</button>
            </div>
        </form>
    </div>
</div>

</body>
</html>
