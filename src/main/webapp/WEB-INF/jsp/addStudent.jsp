<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Add Student</title>
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600&display=swap');
        body { font-family: 'Inter', sans-serif; background: linear-gradient(135deg, #fdfbfb 0%, #ebedee 100%); margin: 0; padding: 20px; min-height: 100vh; display: flex; flex-direction: column; align-items: center; justify-content: center; }
        .form-container { background: white; padding: 40px; border-radius: 16px; box-shadow: 0 10px 30px rgba(0,0,0,0.08); width: 100%; max-width: 450px; }
        h2 { text-align: center; color: #2c3e50; margin-top: 0; margin-bottom: 30px; font-weight: 600; }
        .form-group { margin-bottom: 20px; }
        label { display: block; margin-bottom: 8px; color: #475569; font-weight: 500; font-size: 0.9em; }
        input[type="text"], input[type="email"], select { width: 100%; padding: 12px 16px; border: 1px solid #cbd5e1; border-radius: 8px; box-sizing: border-box; font-family: 'Inter', sans-serif; font-size: 1em; transition: all 0.3s; background: #f8fafc; }
        input[type="text"]:focus, input[type="email"]:focus, select:focus { outline: none; border-color: #667eea; box-shadow: 0 0 0 3px rgba(102,126,234,0.1); background: white; }
        .btn { width: 100%; padding: 12px; border: none; border-radius: 8px; color: white; cursor: pointer; font-size: 1em; font-weight: 500; margin-top: 15px; transition: all 0.3s; }
        .btn:hover { transform: translateY(-2px); box-shadow: 0 5px 15px rgba(0,0,0,0.1); }
        .btn-success { background: linear-gradient(135deg, #667eea 0%, #764ba2 100%); }
        .btn-secondary { background: white; color: #64748b; border: 1px solid #cbd5e1; text-align: center; display: block; text-decoration: none; box-sizing: border-box; }
        .btn-secondary:hover { background: #f8fafc; color: #334155; transform: none; box-shadow: none; }
        .error-msg { background: #fee2e2; color: #b91c1c; padding: 12px; border-radius: 8px; margin-bottom: 20px; text-align: center; font-size: 0.9em; font-weight: 500; border: 1px solid #fecaca; }
    </style>
</head>
<body>

<div class="form-container">
    <h2>Add New Student</h2>

    <c:if test="${not empty error}">
        <div class="error-msg">${error}</div>
    </c:if>

    <form action="/save" method="post">
        <div class="form-group">
            <label for="name">Full Name</label>
            <input type="text" id="name" name="name" placeholder="John Doe" required />
        </div>
        
        <div class="form-group">
            <label for="email">Email Address</label>
            <input type="email" id="email" name="email" placeholder="john@example.com" required />
        </div>

        <div class="form-group">
            <label for="course">Course Assignment</label>
            <select id="course" name="course.id" required>
                <option value="">-- Select Course --</option>
                <c:forEach var="course" items="${courses}">
                    <option value="${course.id}">${course.courseName}</option>
                </c:forEach>
            </select>
        </div>

        <button type="submit" class="btn btn-success">Save Student</button>
        <a href="/" class="btn btn-secondary">Cancel</a>
    </form>
</div>

</body>
</html>
