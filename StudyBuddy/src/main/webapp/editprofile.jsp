<%@ page session="true" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String username = (String) session.getAttribute("user");
    if (username == null) {
        response.sendRedirect("login.jsp");
        return;
    }
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Edit Profile - Study Buddy</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" />
    <style>
        :root {
            --primary: #4e73df;
            --bg-light: #f4f6f8;
            --bg-dark: #1e1e2f;
            --text-light: #333;
            --text-dark: #eee;
        }

        body {
            font-family: 'Segoe UI', sans-serif;
            margin: 0;
            padding: 0;
            background: var(--bg-light);
            color: var(--text-light);
            transition: background 0.3s, color 0.3s;
        }

        .dark-mode {
            background: var(--bg-dark);
            color: var(--text-dark);
        }

        .container {
            max-width: 600px;
            margin: 40px auto;
            background: white;
            padding: 30px;
            border-radius: 15px;
            box-shadow: 0 8px 20px rgba(0,0,0,0.1);
        }

        .dark-mode .container {
            background: #2e324a;
        }

        h2 {
            text-align: center;
            margin-bottom: 30px;
        }

        .form-group {
            margin-bottom: 20px;
        }

        label {
            display: block;
            font-weight: 600;
            margin-bottom: 5px;
        }

        input[type="text"],
        input[type="email"],
        input[type="password"],
        textarea {
            width: 100%;
            padding: 10px;
            border-radius: 8px;
            border: 1px solid #ccc;
            font-size: 16px;
        }

        input[type="file"] {
            border: none;
            font-size: 15px;
            margin-top: 5px;
        }

        button {
            width: 100%;
            background: var(--primary);
            color: white;
            padding: 12px;
            border: none;
            border-radius: 8px;
            font-size: 18px;
            cursor: pointer;
            transition: background 0.3s;
        }

        button:hover {
            background: #3a5ecc;
        }

        .toggle-mode {
            position: absolute;
            top: 20px;
            right: 30px;
            font-size: 18px;
            cursor: pointer;
            color: var(--primary);
        }

        .dark-mode .toggle-mode {
            color: #f9c74f;
        }

        .back-link {
            display: block;
            text-align: center;
            margin-top: 20px;
            color: var(--primary);
            text-decoration: none;
            font-weight: bold;
        }

        .back-link:hover {
            text-decoration: underline;
        }

    </style>
</head>
<body>

    <div class="toggle-mode" onclick="toggleDarkMode()">
        <i class="fas fa-moon"></i> Dark Mode
    </div>

    <div class="container">
        <h2>Edit Profile</h2>
        <form action="UpdateProfileServlet" method="post" enctype="multipart/form-data">
            <div class="form-group">
                <label for="fullName">Full Name</label>
                <input type="text" id="fullName" name="fullName" value="Your Name">
            </div>

            <div class="form-group">
                <label for="email">Email ID</label>
                <input type="email" id="email" name="email" value="placeholder@example.com">
            </div>

            <div class="form-group">
                <label for="bio">Short Bio</label>
                <textarea id="bio" name="bio" rows="4" placeholder="Tell us about yourself..."></textarea>
            </div>

            <div class="form-group">
                <label for="password">New Password <small>(optional)</small></label>
                <input type="password" id="password" name="password" placeholder="Leave blank to keep current">
            </div>

            <div class="form-group">
                <label for="profilePic">Upload Profile Picture</label>
                <input type="file" id="profilePic" name="profilePic" accept="image/*">
            </div>

            <button type="submit"><i class="fas fa-save"></i> Save Changes</button>
        </form>

        <a class="back-link" href="profile.jsp">&larr; Cancel & Go Back</a>
    </div>

    <script>
        function toggleDarkMode() {
            document.body.classList.toggle("dark-mode");
        }
    </script>
</body>
</html>
