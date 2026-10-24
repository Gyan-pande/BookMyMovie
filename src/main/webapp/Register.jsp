<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Sign Up - BookMyMovie</title>

    <link rel="icon" type="image/svg+xml" href="<%= request.getContextPath() %>/logo.svg">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600&display=swap" rel="stylesheet">

<style>
    /* ===== GLOBAL STYLE ===== */
    * { margin: 0; padding: 0; box-sizing: border-box; }

    body {
        font-family: 'Poppins', sans-serif;
        background: #f4f7fb;
        display: flex;
        justify-content: center;
        align-items: center;
        min-height: 100vh;
        color: #1f2937;
        padding: 20px;
    }

    /* ===== CONTAINER ===== */
    .container {
        width: 100%;
        max-width: 450px;
        background: #ffffff;
        padding: 40px;
        border-radius: 24px;
        box-shadow: 0 10px 30px rgba(0,0,0,0.05);
        animation: fadeIn 0.6s ease;
        text-align: center;
    }

    .logo-section { margin-bottom: 30px; }

    .logo-circle {
        width: 80px; height: 80px; margin: 0 auto 15px;
        border-radius: 50%;
        background: linear-gradient(135deg, #ff9800, #ffb300);
        display: flex; justify-content: center; align-items: center;
        font-size: 35px; color: white;
        box-shadow: 0 8px 20px rgba(255,152,0,0.3);
        animation: floatLogo 3s ease-in-out infinite;
    }

    h2 { font-size: 24px; font-weight: 700; color: #111827; margin-bottom: 5px; }
    .subtitle { font-size: 13px; color: #6b7280; }

    /* ===== INPUTS ===== */
    .input-group { margin-bottom: 18px; text-align: left; }
    label { display: block; margin-bottom: 6px; font-size: 13px; font-weight: 600; color: #4b5563; }
    
    input {
        width: 100%; padding: 12px 16px; border-radius: 12px;
        border: 1px solid #d1d5db; outline: none; transition: 0.3s;
        font-family: 'Poppins', sans-serif; font-size: 14px;
    }

    input:focus {
        border-color: #ff9800;
        box-shadow: 0 0 0 4px rgba(255, 152, 0, 0.1);
    }

    /* ===== BUTTONS ===== */
    .btn {
        width: 100%; padding: 14px; border-radius: 12px;
        font-size: 15px; font-weight: 600; cursor: pointer;
        transition: 0.3s; border: none; font-family: 'Poppins', sans-serif;
        margin-top: 10px;
    }

    .signup-btn {
        background: linear-gradient(135deg, #ff9800, #ffb300);
        color: white; box-shadow: 0 4px 15px rgba(255, 152, 0, 0.2);
    }

    .signup-btn:hover { transform: translateY(-2px); box-shadow: 0 6px 20px rgba(255, 152, 0, 0.3); }

    .login-link { margin-top: 25px; font-size: 14px; color: #6b7280; }
    .login-link a { color: #ff9800; text-decoration: none; font-weight: 600; }

    /* ===== MODERN ALERT CSS ===== */
    .alert-overlay {
        display: none; position: fixed; top: 0; left: 0; width: 100%; height: 100%;
        background: rgba(0, 0, 0, 0.3); backdrop-filter: blur(8px);
        z-index: 9999; justify-content: center; align-items: center;
    }
    .alert-card {
        background: white; width: 90%; max-width: 350px; padding: 30px;
        border-radius: 24px; text-align: center; box-shadow: 0 20px 40px rgba(0,0,0,0.1);
        animation: popIn 0.3s cubic-bezier(0.175, 0.885, 0.32, 1.275);
    }
    .alert-icon {
        width: 60px; height: 60px; margin: 0 auto 15px; border-radius: 50%;
        display: flex; align-items: center; justify-content: center; font-size: 30px;
        background: #fee2e2; color: #dc2626;
    }
    .alert-confirm-btn {
        width: 100%; padding: 12px; background: #111827; color: white;
        border: none; border-radius: 12px; font-weight: 600; cursor: pointer; margin-top: 20px;
    }

    /* ===== ANIMATIONS ===== */
    @keyframes floatLogo { 0%, 100% { transform: translateY(0); } 50% { transform: translateY(-6px); } }
    @keyframes fadeIn { from { opacity: 0; transform: translateY(15px); } to { opacity: 1; transform: translateY(0); } }
    @keyframes popIn { from { transform: scale(0.8); opacity: 0; } to { transform: scale(1); opacity: 1; } }

</style>
</head>

<body>

<div class="container">
    <div class="logo-section">
        <div class="logo-circle">🍿</div>
        <h2>Create Account</h2>
        <p class="subtitle">Join BookMyMovie and start your journey</p>
    </div>

    <form action="Register" method="post" onsubmit="return validateForm()">
        <div class="input-group">
            <label>Full Name</label>
            <input type="text" name="name" placeholder="Enter your name">
        </div>

        <div class="input-group">
            <label>Email Address</label>
            <input type="email" name="email" placeholder="Enter your email">
        </div>

        <div class="input-group">
            <label>Phone Number</label>
            <input type="tel" name="phone" placeholder="10-digit mobile number">
        </div>

        <div class="input-group">
            <label>Password</label>
            <input type="password" name="password" placeholder="Min. 6 characters">
        </div>

        <button type="submit" class="btn signup-btn">Sign Up</button>
    </form>

    <div class="login-link">
        Already have an account? <a href="Login.html">Log In</a>
    </div>
</div>

<!-- MODERN ALERT MODAL -->
<div id="customAlert" class="alert-overlay">
    <div class="alert-card">
        <div class="alert-icon">✕</div>
        <h3 style="margin-bottom: 10px;">Action Required</h3>
        <p id="alertMsg" style="color: #6b7280; font-size: 14px; line-height: 1.5;"></p>
        <button class="alert-confirm-btn" onclick="closeAlert()">Understand</button>
    </div>
</div>

<script>
    function showAlert(message) {
        document.getElementById("alertMsg").innerText = message;
        document.getElementById("customAlert").style.display = "flex";
    }

    function closeAlert() {
        document.getElementById("customAlert").style.display = "none";
    }

    function validateForm() {
        const name = document.getElementsByName("name")[0].value.trim();
        const email = document.getElementsByName("email")[0].value.trim();
        const phone = document.getElementsByName("phone")[0].value.trim();
        const password = document.getElementsByName("password")[0].value;

        if (name.length < 3) {
            showAlert("Please enter your full name (at least 3 characters).");
            return false;
        }

        const emailPattern = /^[^ ]+@[^ ]+\.[a-z]{2,3}$/;
        if (!email.match(emailPattern)) {
            showAlert("Please enter a valid email address.");
            return false;
        }

        const phonePattern = /^[0-9]{10}$/;
        if (!phone.match(phonePattern)) {
            showAlert("Please enter a valid 10-digit phone number.");
            return false;
        }

        if (password.length < 6) {
            showAlert("Password must be at least 6 characters long.");
            return false;
        }

        return true;
    }

    // Capture server-side error messages from the Servlet
    window.onload = function() {
        <% String serverError = (String) request.getAttribute("errorMessage"); %>
        <% if (serverError != null) { %>
            showAlert("<%= serverError %>");
        <% } %>
    };
</script>

</body>
</html>