<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%
/* GET ALL DATA FROM URL */
String movie = request.getParameter("movie");
String theater = request.getParameter("theater");
String time = request.getParameter("time");
String seats = request.getParameter("seats");
String price = request.getParameter("price");
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Payment - BookMyMovie</title>
    
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet">

<style>
    /* ===== GLOBAL STYLE ===== */
    * { margin: 0; padding: 0; box-sizing: border-box; }

    body {
        font-family: 'Poppins', sans-serif;
        background: #f4f7fb;
        color: #1f2937;
        display: flex;
        flex-direction: column;
        min-height: 100vh;
    }

    .payment-wrapper {
        flex: 1;
        display: flex;
        justify-content: center;
        align-items: center;
        padding: 40px 20px;
    }

    .container {
        width: 100%;
        max-width: 450px;
        background: #ffffff;
        padding: 35px;
        border-radius: 24px;
        box-shadow: 0 10px 30px rgba(0,0,0,0.05);
    }

    h2 { text-align: center; color: #111827; margin-bottom: 25px; font-weight: 700; }

    /* ===== SUMMARY CARD ===== */
    .summary-card {
        background: #f9fafb;
        padding: 20px;
        border-radius: 15px;
        margin-bottom: 25px;
        border: 1px solid #e5e7eb;
    }

    .summary-card p { font-size: 14px; margin-bottom: 8px; display: flex; justify-content: space-between; }
    .total-row {
        margin-top: 10px; padding-top: 10px; border-top: 1px dashed #d1d5db;
        font-size: 18px !important; font-weight: 700; color: #ff9800;
    }

    /* ===== FORM INPUTS ===== */
    .form-group { margin-bottom: 15px; }
    input {
        width: 100%; padding: 12px 15px; border-radius: 12px;
        border: 1px solid #d1d5db; outline: none; transition: 0.3s;
    }
    input:focus { border-color: #ff9800; box-shadow: 0 0 0 3px rgba(255, 152, 0, 0.1); }
    .row { display: flex; gap: 10px; }

    .pay-btn {
        width: 100%; padding: 14px; margin-top: 10px;
        background: linear-gradient(135deg, #ff9800, #ffb300);
        color: white; border: none; border-radius: 12px;
        font-size: 16px; font-weight: 600; cursor: pointer;
        box-shadow: 0 4px 15px rgba(255, 152, 0, 0.3);
    }

    /* ===== MODERN PROFESSIONAL ALERT CSS ===== */
    .alert-overlay {
        display: none;
        position: fixed;
        top: 0; left: 0; width: 100%; height: 100%;
        background: rgba(0, 0, 0, 0.3);
        backdrop-filter: blur(8px);
        z-index: 9999;
        justify-content: center;
        align-items: center;
    }

    .alert-card {
        background: white;
        width: 90%;
        max-width: 350px;
        padding: 30px;
        border-radius: 24px;
        text-align: center;
        box-shadow: 0 20px 40px rgba(0,0,0,0.1);
        animation: popIn 0.3s cubic-bezier(0.175, 0.885, 0.32, 1.275);
    }

    .alert-icon {
        width: 60px; height: 60px; margin: 0 auto 15px;
        border-radius: 50%; display: flex; align-items: center;
        justify-content: center; font-size: 30px;
    }

    .alert-success { background: #dcfce7; color: #16a34a; }
    .alert-error { background: #fee2e2; color: #dc2626; }

    .alert-confirm-btn {
        width: 100%; padding: 12px; background: #111827;
        color: white; border: none; border-radius: 12px;
        font-weight: 600; cursor: pointer; margin-top: 20px;
    }

    @keyframes popIn { 
        from { transform: scale(0.8); opacity: 0; } 
        to { transform: scale(1); opacity: 1; } 
    }
</style>
</head>

<body>

<jsp:include page="Header.jsp" />

<div class="payment-wrapper">
    <div class="container">
        <h2>Payment</h2>

        <div class="summary-card">
            <p><b>Movie:</b> <span><%= movie %></span></p>
            <p><b>Theater:</b> <span><%= theater %></span></p>
            <p><b>Time:</b> <span><%= time %></span></p>
            <p><b>Seats:</b> <span><%= seats %></span></p>
            <p class="total-row"><b>Total:</b> <span>₹<%= price %></span></p>
        </div>

        <form onsubmit="return handlePayment(event)">
            <div class="form-group">
                <input type="text" id="name" placeholder="Card Holder Name" required>
            </div>
            <div class="form-group">
                <input type="text" id="card" placeholder="Card Number" maxlength="16" required>
            </div>
            <div class="row">
                <div class="form-group" style="flex: 2;">
                    <input type="text" id="expiry" placeholder="MM/YY" required>
                </div>
                <div class="form-group" style="flex: 1;">
                    <input type="password" id="cvv" placeholder="CVV" maxlength="3" required>
                </div>
            </div>
            <button type="submit" class="pay-btn">Pay Now</button>
        </form>
    </div>
</div>

<jsp:include page="Footer.jsp" />

<!-- MODERN ALERT MODAL -->
<div id="customAlert" class="alert-overlay">
    <div class="alert-card">
        <div class="alert-icon" id="alertIcon"></div>
        <h3 id="alertTitle" style="margin-bottom: 10px;">Notification</h3>
        <p id="alertMsg" style="color: #6b7280; font-size: 14px; line-height: 1.5;"></p>
        <button class="alert-confirm-btn" id="alertBtn" onclick="closeAlert()">Continue</button>
    </div>
</div>

<script>
    let paymentSuccessful = false;

    function handlePayment(event) {
        event.preventDefault();
        
        let card = document.getElementById("card").value.trim().replace(/\s+/g, '');
        let cvv = document.getElementById("cvv").value.trim();

        if (card.length !== 16 || isNaN(card)) {
            showProfessionalAlert('error', 'Invalid Card', 'Please enter a valid 16-digit card number.');
            paymentSuccessful = false;
            return false;
        }

        if (cvv.length !== 3 || isNaN(cvv)) {
            showProfessionalAlert('error', 'Invalid CVV', 'The CVV must be a 3-digit number found on the back of your card.');
            paymentSuccessful = false;
            return false;
        }

        // If valid
        paymentSuccessful = true;
        showProfessionalAlert('success', 'Payment Successful', 'Your transaction was processed! Redirecting to your tickets...');
    }

    function showProfessionalAlert(type, title, message) {
        const icon = document.getElementById("alertIcon");
        document.getElementById("alertTitle").innerText = title;
        document.getElementById("alertMsg").innerText = message;
        
        icon.className = "alert-icon " + (type === 'success' ? 'alert-success' : 'alert-error');
        icon.innerHTML = (type === 'success' ? '✓' : '✕');
        
        document.getElementById("customAlert").style.display = "flex";
    }

    function closeAlert() {
        document.getElementById("customAlert").style.display = "none";
        
        if (paymentSuccessful) {
            let urlParams = new URLSearchParams(window.location.search);
            window.location.href = "Success.jsp?" + urlParams.toString();
        }
    }
</script>

</body>
</html>