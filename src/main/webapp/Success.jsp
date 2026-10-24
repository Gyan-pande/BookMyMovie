<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<%
/* ===== GET BOOKING DATA FROM URL ===== */
String movie = request.getParameter("movie");
String theater = request.getParameter("theater");
String time = request.getParameter("time");
String seats = request.getParameter("seats");
String price = request.getParameter("price");

/* ===== GET USER FROM SESSION ===== */
String user = (String) session.getAttribute("user");
if(user == null) user = "Guest User";

/* ===== GENERATE RANDOM BOOKING ID ===== */
int bookingId = (int)(Math.random() * 1000000);
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Booking Confirmed - BookMyMovie</title>
    
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet">

<style>
    /* ===== GLOBAL STYLE ===== */
    * {
        margin: 0;
        padding: 0;
        box-sizing: border-box;
    }

    body {
        font-family: 'Poppins', sans-serif;
        background: #f4f7fb;
        color: #1f2937;
        text-align: center;
        padding: 40px 20px;
    }

    /* ===== SUCCESS CARD ===== */
    .success-container {
        max-width: 450px;
        margin: auto;
    }

    .icon-circle {
        width: 70px;
        height: 70px;
        background: #dcfce7;
        color: #16a34a;
        font-size: 35px;
        display: flex;
        align-items: center;
        justify-content: center;
        border-radius: 50%;
        margin: 0 auto 20px auto;
        box-shadow: 0 4px 10px rgba(22, 163, 74, 0.1);
    }

    h2 {
        font-size: 24px;
        font-weight: 700;
        color: #111827;
        margin-bottom: 10px;
    }

    p.subtext {
        color: #6b7280;
        margin-bottom: 30px;
    }

    /* ===== TICKET CARD DESIGN ===== */
    .ticket {
        background: white;
        border-radius: 20px;
        overflow: hidden;
        box-shadow: 0 10px 25px rgba(0,0,0,0.05);
        text-align: left;
        position: relative;
    }

    .ticket-header {
        background: #111827;
        color: white;
        padding: 20px;
        display: flex;
        justify-content: space-between;
        align-items: center;
    }

    .ticket-header span {
        font-size: 12px;
        text-transform: uppercase;
        letter-spacing: 1px;
        opacity: 0.8;
    }

    .ticket-body {
        padding: 25px;
    }

    .detail-grid {
        display: grid;
        grid-template-columns: 1fr 1fr;
        gap: 20px;
    }

    .detail-item {
        margin-bottom: 15px;
    }

    .detail-item label {
        display: block;
        font-size: 11px;
        color: #9ca3af;
        text-transform: uppercase;
        font-weight: 600;
    }

    .detail-item span {
        display: block;
        font-size: 14px;
        color: #1f2937;
        font-weight: 500;
    }

    .full-width {
        grid-column: span 2;
    }

    /* THE DASHED DIVIDER */
    .divider {
        border-top: 2px dashed #e5e7eb;
        margin: 10px 0;
        position: relative;
    }

    .divider::before, .divider::after {
        content: "";
        position: absolute;
        top: -10px;
        width: 20px;
        height: 20px;
        background: #f4f7fb; /* Matches body background */
        border-radius: 50%;
    }

    .divider::before { left: -35px; }
    .divider::after { right: -35px; }

    /* ===== BUTTONS ===== */
    .actions {
        margin-top: 30px;
        display: flex;
        gap: 15px;
        justify-content: center;
    }

    .btn {
        padding: 12px 25px;
        border-radius: 10px;
        font-size: 14px;
        font-weight: 600;
        cursor: pointer;
        transition: 0.3s;
        border: none;
        font-family: 'Poppins', sans-serif;
    }

    .btn-print {
        background: #111827;
        color: white;
    }

    .btn-home {
        background: linear-gradient(135deg, #ff9800, #ffb300);
        color: white;
        box-shadow: 0 4px 15px rgba(255, 152, 0, 0.3);
    }

    .btn:hover {
        transform: translateY(-2px);
        opacity: 0.9;
    }

    /* Print styling to hide buttons and background during print */
    @media print {
        .actions, .subtext, .icon-circle { display: none; }
        body { background: white; padding: 0; }
        .ticket { box-shadow: none; border: 1px solid #eee; }
        .divider::before, .divider::after { display: none; }
    }
</style>
</head>

<body>

    <div class="success-container">
        <!-- SUCCESS ICON -->
        <div class="icon-circle">✔</div>

        <h2>Booking Confirmed!</h2>
        <p class="subtext">Your seats have been reserved successfully.</p>

        <!-- ===== THE TICKET ===== -->
        <div class="ticket">
            <div class="ticket-header">
                <strong>🎬 BookMyMovie</strong>
                <span>ID: #<%= bookingId %></span>
            </div>

            <div class="ticket-body">
                <div class="detail-grid">
                    <div class="detail-item full-width">
                        <label>Movie</label>
                        <span style="font-size: 18px; color: #ff9800; font-weight: 700;"><%= movie %></span>
                    </div>

                    <div class="detail-item">
                        <label>Name</label>
                        <span><%= user %></span>
                    </div>

                    <div class="detail-item">
                        <label>Time</label>
                        <span><%= time %></span>
                    </div>

                    <div class="detail-item full-width">
                        <label>Theater</label>
                        <span><%= theater %></span>
                    </div>
                </div>

                <div class="divider"></div>

                <div class="detail-grid" style="margin-top: 15px;">
                    <div class="detail-item">
                        <label>Seats</label>
                        <span style="color: #111827;"><%= seats %></span>
                    </div>

                    <div class="detail-item" style="text-align: right;">
                        <label>Total Paid</label>
                        <span style="font-size: 18px; font-weight: 700;">₹<%= price %></span>
                    </div>
                </div>
            </div>
        </div>

        <!-- ===== ACTION BUTTONS ===== -->
        <div class="actions">
            <button class="btn btn-print" onclick="window.print()">Print Ticket</button>
            <button class="btn btn-home" onclick="location.href='HomePage.jsp'">Go Home</button>
        </div>
    </div>

</body>
</html>