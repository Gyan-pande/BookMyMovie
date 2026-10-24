<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%
/* GET MOVIE NAME FROM URL */
String movie = request.getParameter("movie");
if(movie == null) movie = "Unknown Movie";
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Select Theater - <%= movie %></title>
    
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
        line-height: 1.6;
    }

    /* ===== THEATER PAGE HEADER ===== */
    .theater-header {
        background: white;
        padding: 40px 20px;
        text-align: center;
        box-shadow: 0 4px 12px rgba(0,0,0,0.05);
        margin-bottom: 30px;
    }

    .theater-header h1 {
        font-size: 24px;
        color: #111827;
        font-weight: 700;
    }

    .theater-header p {
        color: #ff9800;
        font-weight: 500;
        font-size: 14px;
        margin-top: 5px;
    }

    /* ===== CONTAINER ===== */
    .container {
        width: 94%;
        max-width: 900px;
        margin: auto;
        padding-bottom: 50px;
    }

    /* THEATER CARD */
    .theater-card {
        background: white;
        margin-bottom: 20px;
        padding: 25px;
        border-radius: 15px;
        display: flex;
        justify-content: space-between;
        align-items: center;
        box-shadow: 0 4px 15px rgba(0,0,0,0.03);
        transition: 0.3s;
    }

    .theater-card:hover {
        transform: translateY(-3px);
        box-shadow: 0 8px 25px rgba(0,0,0,0.06);
    }

    .theater-info h2 {
        font-size: 18px;
        color: #111827;
        margin-bottom: 5px;
    }

    .theater-info p {
        font-size: 12px;
        color: #9ca3af;
    }

    /* TIME BUTTONS */
    .timings {
        display: flex;
        flex-wrap: wrap;
        gap: 10px;
        justify-content: flex-end;
    }

    .time-btn {
        padding: 10px 18px;
        background: white;
        border: 1px solid #e5e7eb;
        border-radius: 10px;
        color: #4b5563;
        font-family: 'Poppins', sans-serif;
        font-size: 13px;
        font-weight: 500;
        cursor: pointer;
        transition: 0.2s;
    }

    .time-btn:hover {
        border-color: #ff9800;
        color: #ff9800;
        background: rgba(255, 152, 0, 0.05);
    }

    /* BUTTON WHEN SELECTED/BOOKING STYLE */
    .time-btn:active {
        background: #ff9800;
        color: white;
    }

    /* RESPONSIVE */
    @media (max-width: 768px) {
        .theater-card {
            flex-direction: column;
            text-align: center;
        }
        .timings {
            margin-top: 20px;
            justify-content: center;
        }
    }

</style>
</head>

<body>

<jsp:include page="Header.jsp" />

<div class="theater-header">
    <p>Now Showing</p>
    <h1><%= movie %></h1>
</div>

<div class="container">

    <!-- ===== THEATER 1 ===== -->
    <div class="theater-card">
        <div class="theater-info">
            <h2>PVR Cinemas</h2>
            <p>📍 Premium Experience, Mall Road</p>
        </div>
        <div class="timings">
            <button class="time-btn" onclick="selectTheater('PVR Cinemas','10:00 AM')">10:00 AM</button>
            <button class="time-btn" onclick="selectTheater('PVR Cinemas','02:00 PM')">02:00 PM</button>
            <button class="time-btn" onclick="selectTheater('PVR Cinemas','06:00 PM')">06:00 PM</button>
        </div>
    </div>

    <!-- ===== THEATER 2 ===== -->
    <div class="theater-card">
        <div class="theater-info">
            <h2>INOX Movies</h2>
            <p>📍 Digital 4K, City Center</p>
        </div>
        <div class="timings">
            <button class="time-btn" onclick="selectTheater('INOX','11:00 AM')">11:00 AM</button>
            <button class="time-btn" onclick="selectTheater('INOX','03:00 PM')">03:00 PM</button>
            <button class="time-btn" onclick="selectTheater('INOX','09:00 PM')">09:00 PM</button>
        </div>
    </div>
    
    <!-- ===== THEATER 3 ===== -->
    <div class="theater-card">
        <div class="theater-info">
            <h2>Carnival Cinemas</h2>
            <p>📍 Luxury Seating, North Plaza</p>
        </div>
        <div class="timings">
            <button class="time-btn" onclick="selectTheater('Carnival Cinemas','11:00 AM')">11:00 AM</button>
            <button class="time-btn" onclick="selectTheater('Carnival Cinemas','03:30 PM')">03:30 PM</button>
            <button class="time-btn" onclick="selectTheater('Carnival Cinemas','07:00 PM')">07:00 PM</button>
        </div>
    </div>

    <!-- ===== THEATER 4 ===== -->
    <div class="theater-card">
        <div class="theater-info">
            <h2>Cinepolis</h2>
            <p>📍 IMAX Theatre, Grand Square</p>
        </div>
        <div class="timings">
            <button class="time-btn" onclick="selectTheater('Cinepolis','12:00 PM')">12:00 PM</button>
            <button class="time-btn" onclick="selectTheater('Cinepolis','04:00 PM')">04:00 PM</button>
            <button class="time-btn" onclick="selectTheater('Cinepolis','08:30 PM')">08:30 PM</button>
        </div>
    </div>

</div>

<jsp:include page="Footer.jsp" />

<script>
function selectTheater(theater, time) {
    let movie = "<%= movie %>";
    window.location.href =
        "Booking.jsp?movie=" + encodeURIComponent(movie) +
        "&theater=" + encodeURIComponent(theater) +
        "&time=" + encodeURIComponent(time);
}
</script>

</body>
</html>