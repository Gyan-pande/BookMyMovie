<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%
String movie = request.getParameter("movie");
if(movie == null) movie = "Unknown Movie";
String theater = request.getParameter("theater");
if(theater == null) theater = "Main Cinema";
String time = request.getParameter("time");
if(time == null) time = "07:00 PM";
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Book Tickets - <%= movie %></title>
    
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
        text-align: center;
        padding-bottom: 50px;
    }

    /* ===== HEADER ===== */
    .booking-header {
        background: white;
        padding: 30px 15px;
        box-shadow: 0 4px 12px rgba(0,0,0,0.05);
        margin-bottom: 30px;
    }

    .booking-header h1 { font-size: 28px; color: #111827; }
    .highlight { color: #ff9800; font-weight: 600; }

    /* ===== SEAT LAYOUT CONTAINER ===== */
    .container {
        width: 94%;
        max-width: 800px;
        margin: auto;
        background: white;
        padding: 30px;
        border-radius: 24px;
        box-shadow: 0 10px 25px rgba(0,0,0,0.05);
    }

    .screen {
        width: 80%;
        height: 6px;
        background: #e5e7eb;
        margin: 0 auto 45px auto;
        border-radius: 50%;
        box-shadow: 0 8px 15px rgba(0,0,0,0.1);
    }

    .seat-grid {
        display: grid;
        grid-template-columns: repeat(8, 1fr);
        gap: 12px;
        margin-top: 20px;
    }

    .seat {
        aspect-ratio: 1;
        background: #f3f4f6;
        border: 1px solid #e5e7eb;
        border-radius: 10px;
        display: flex;
        align-items: center;
        justify-content: center;
        font-size: 12px;
        cursor: pointer;
        transition: 0.2s;
    }

    .seat:hover { border-color: #ff9800; color: #ff9800; }
    .seat.selected { background: #ff9800 !important; border-color: #ff9800; color: white; }

    /* ===== SUMMARY CARD ===== */
    .summary-card {
        margin-top: 30px;
        padding-top: 25px;
        border-top: 1px dashed #e5e7eb;
        display: flex;
        justify-content: space-between;
        align-items: center;
        text-align: left;
    }

    .confirm-btn {
        padding: 14px 35px;
        border: none;
        border-radius: 12px;
        background: linear-gradient(135deg, #ff9800, #ffb300);
        color: white;
        font-weight: 600;
        cursor: pointer;
        box-shadow: 0 4px 15px rgba(255, 152, 0, 0.3);
    }

    /* ===== MODERN ALERT CSS ===== */
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

    @keyframes popIn { from { transform: scale(0.8); opacity: 0; } to { transform: scale(1); opacity: 1; } }
</style>
</head>

<body>

    <jsp:include page="Header.jsp" />

    <div class="booking-header">
        <h1><%= movie %></h1>
        <p><%= theater %> | <span class="highlight"><%= time %></span></p>
    </div>

    <div class="container">
        <div class="screen"></div>

        <div class="seat-grid">
            <%
            char row = 'A';
            for(int i=1; i<=40; i++) {
                if(i % 8 == 1 && i != 1) row++;
                String seatNo = row + "" + ((i-1)%8 + 1);
            %>
            <div class="seat" onclick="selectSeat(this)">
                <%= seatNo %>
            </div>
            <% } %>
        </div>

        <div class="summary-card">
            <div class="summary-info">
                <p style="font-size: 13px; color: #6b7280;">Selected: <span id="seat-list" class="highlight">None</span></p>
                <h2 style="font-size: 24px;">Total: ₹<span id="total-price">0</span></h2>
            </div>
            <button class="confirm-btn" onclick="validateAndProcess()">Confirm Booking</button>
        </div>
    </div>

    <!-- ===== THE MODERN ALERT MODAL ===== -->
    <div id="customAlert" class="alert-overlay">
        <div class="alert-card">
            <div class="alert-icon" id="alertIcon"></div>
            <h3 id="alertTitle" style="margin-bottom: 10px;">Notification</h3>
            <p id="alertMsg" style="color: #6b7280; font-size: 14px;"></p>
            <button class="alert-confirm-btn" id="alertActionBtn" onclick="closeAlert()">Continue</button>
        </div>
    </div>

    <jsp:include page="Footer.jsp" />

<script>
    let selectedSeats = [];
    const pricePerSeat = 150;
    let canRedirect = false;

    function selectSeat(el) {
        let seat = el.innerText.trim();
        el.classList.toggle("selected");

        if (selectedSeats.includes(seat)) {
            selectedSeats = selectedSeats.filter(s => s !== seat);
        } else {
            selectedSeats.push(seat);
        }

        document.getElementById("seat-list").innerText = selectedSeats.length ? selectedSeats.join(", ") : "None";
        document.getElementById("total-price").innerText = selectedSeats.length * pricePerSeat;
    }

    function validateAndProcess() {
        if (selectedSeats.length === 0) {
            showProfessionalAlert('error', 'No Seats Selected', 'Please pick at least one seat to continue.');
            canRedirect = false;
        } else {
            showProfessionalAlert('success', 'Ready to Pay', 'Your seats are reserved. Let\'s proceed to payment.');
            canRedirect = true;
        }
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
        
        if (canRedirect) {
            let movie = "<%= movie %>";
            let theater = "<%= theater %>";
            let time = "<%= time %>";
            let seats = selectedSeats.join(", ");
            let price = selectedSeats.length * pricePerSeat;

            window.location.href = "Payment.jsp?movie=" + encodeURIComponent(movie) +
                                   "&theater=" + encodeURIComponent(theater) +
                                   "&time=" + encodeURIComponent(time) +
                                   "&seats=" + encodeURIComponent(seats) +
                                   "&price=" + price;
        }
    }
</script>

</body>
</html>