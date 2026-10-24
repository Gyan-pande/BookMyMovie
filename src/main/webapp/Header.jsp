<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
String user = (String) session.getAttribute("user");
String email = (String) session.getAttribute("email");
String phone = (String) session.getAttribute("phone");

if(user == null) user = "Guest User";
if(email == null) email = "Not Available";
if(phone == null) phone = "Not Available";
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<style>
/* ===== GLOBAL FIXES ===== */
body {
    margin: 0;
    font-family: 'Poppins', sans-serif;
    overflow-x: hidden; /* Crucial: Prevents horizontal scroll */
}

/* ===== HEADER ===== */
.header {
    width: 100%;
    background: #ffffff;
    padding: 14px 30px;
    display: flex;
    align-items: center;
    justify-content: space-between;
    position: sticky;
    top: 0;
    z-index: 9999;
    box-shadow: 0 2px 15px rgba(0,0,0,0.08);
    box-sizing: border-box; /* Ensures padding doesn't add to width */
}

/* ===== LOGO ===== */
.logo {
    display: flex;
    align-items: center;
    text-decoration: none;
    flex-shrink: 0;
}

.logo svg {
    max-width: 100%;
    height: auto;
}

/* ===== NAV ===== */
.nav-menu {
    display: flex;
    align-items: center;
    gap: 28px;
}

.nav-menu a {
    text-decoration: none;
    color: #1f2937;
    font-size: 15px;
    font-weight: 600;
    transition: 0.3s;
}

.nav-menu a:hover {
    color: #ff9800;
}

/* ===== RIGHT SECTION ===== */
.header-right {
    display: flex;
    align-items: center;
    gap: 16px;
}

/* ===== SEARCH ===== */
.search-wrapper {
    position: relative;
    width: 100%;
    max-width: 340px; /* Fixed: Prevents overflow on mobile */
}

.search-box {
    width: 100%;
    height: 48px;
    background: #f3f4f6;
    border-radius: 14px;
    display: flex;
    align-items: center;
    overflow: hidden;
    border: 2px solid transparent;
    transition: 0.3s;
}

.search-box:focus-within {
    border-color: #ff9800;
    background: #fff;
}

.search-box input {
    flex: 1;
    height: 100%;
    border: none;
    outline: none;
    background: transparent;
    padding: 0 15px;
    font-size: 14px;
    width: 100%;
}

.clear-btn {
    width: 40px;
    height: 40px;
    border: none;
    background: none;
    font-size: 24px;
    cursor: pointer;
    color: #666;
    display: none;
}

.clear-btn.show {
    display: block;
}

.search-btn {
    width: 50px;
    height: 48px;
    border: none;
    background: linear-gradient(135deg,#ff9800,#ffb300);
    cursor: pointer;
    display: flex;
    align-items: center;
    justify-content: center;
    flex-shrink: 0;
}

/* ===== SUGGESTIONS ===== */
.suggestions {
    position: absolute;
    top: 58px;
    left: 0;
    width: 100%;
    background: #fff;
    border-radius: 14px;
    overflow: hidden;
    box-shadow: 0 10px 30px rgba(0,0,0,0.12);
    display: none;
    z-index: 99999;
}

.suggestions div {
    padding: 14px 16px;
    cursor: pointer;
    transition: 0.3s;
}

.suggestions div:hover {
    background: #fff3e0;
    color: #ff9800;
}

/* ===== PROFILE BUTTON ===== */
.profile-btn {
    width: 48px;
    height: 48px;
    border: none;
    border-radius: 50%;
    background: linear-gradient(135deg,#ff9800,#ffb300);
    color: white;
    font-size: 18px;
    font-weight: 700;
    cursor: pointer;
    display: flex;
    align-items: center;
    justify-content: center;
    flex-shrink: 0;
    box-shadow: 0 6px 18px rgba(255,152,0,0.3);
    transition: 0.3s;
}

.profile-btn:hover {
    transform: scale(1.05);
}

/* ===== SIDEBAR ===== */
.sidebar {
    position: fixed;
    top: 0;
    right: -100%; /* Changed from px to % for reliability */
    width: 340px;
    max-width: 85%; /* Fixed: Won't exceed small screen widths */
    height: 100vh;
    background: #fff;
    z-index: 100000;
    transition: 0.4s ease;
    box-shadow: -5px 0 30px rgba(0,0,0,0.15);
    overflow-y: auto;
}

.sidebar.active {
    right: 0;
}

.sidebar-top {
    background: linear-gradient(135deg,#ff9800,#ffb300);
    padding: 30px 25px;
    color: white;
    position: relative;
}

.close-sidebar {
    position: absolute;
    top: 14px;
    right: 14px;
    width: 38px;
    height: 38px;
    border: none;
    border-radius: 50%;
    background: rgba(255,255,255,0.2);
    color: white;
    font-size: 22px;
    cursor: pointer;
}

.profile-info {
    margin-top: 25px;
    display: flex;
    align-items: center;
    gap: 16px;
}

.profile-circle {
    width: 70px;
    height: 70px;
    border-radius: 50%;
    background: white;
    color: #ff9800;
    font-size: 28px;
    font-weight: 700;
    display: flex;
    align-items: center;
    justify-content: center;
    flex-shrink: 0;
}

.profile-details h3 {
    margin: 0;
    font-size: 20px;
    word-break: break-all;
}

.sidebar-body {
    padding: 24px;
}

.info-box {
    background: #f9fafb;
    padding: 18px;
    border-radius: 14px;
    margin-bottom: 18px;
}

.info-box p {
    margin: 10px 0;
    color: #374151;
    word-break: break-word;
}

.sidebar-btn {
    width: 100%;
    border: none;
    padding: 14px;
    border-radius: 12px;
    margin-top: 14px;
    font-size: 15px;
    font-weight: 600;
    cursor: pointer;
    transition: 0.3s;
}

.booking-btn { background: linear-gradient(135deg,#ff9800,#ffb300); color: white; }
.logout-btn { background: linear-gradient(135deg,#ef4444,#dc2626); color: white; }

.booking-card {
    background: #f3f4f6;
    padding: 14px;
    border-radius: 12px;
    margin-bottom: 12px;
}

/* ===== OVERLAY ===== */
.overlay {
    position: fixed;
    top: 0;
    left: 0;
    width: 100%;
    height: 100%;
    background: rgba(0,0,0,0.45);
    z-index: 99998;
    display: none;
}

.overlay.active {
    display: block;
}

/* ===== MOBILE RESPONSIVENESS ===== */
@media(max-width: 768px) {
    .header {
        padding: 12px 15px;
        flex-direction: column; /* Stack logo and search on small phones if needed */
        align-items: flex-start;
    }

    .nav-menu {
        display: none;
    }

    .header-right {
        width: 100%;
        margin-top: 10px;
        justify-content: space-between;
    }

    .search-wrapper {
        max-width: none;
        flex: 1;
        margin-right: 10px;
    }
}
</style>
</head>

<body>

<header class="header">
    <a href="HomePage.jsp" class="logo">
        <svg width="190" height="55" viewBox="0 0 320 80" xmlns="http://www.w3.org/2000/svg">
            <defs>
                <linearGradient id="goldGrad">
                    <stop offset="0%" stop-color="#ff9800"/>
                    <stop offset="50%" stop-color="#ffc107"/>
                    <stop offset="100%" stop-color="#ffb300"/>
                </linearGradient>
            </defs>
            <rect x="0" y="10" width="70" height="60" rx="16" fill="#111"/>
            <polygon points="28,25 28,55 52,40" fill="url(#goldGrad)"/>
            <text x="90" y="48" font-size="28" font-family="Poppins" font-weight="bold" fill="url(#goldGrad)">BookMyMovie</text>
        </svg>
    </a>

    <div class="nav-menu">
        <a href="HomePage.jsp">Home</a>
        <a href="Movies.jsp">Movies</a>
        <a href="Theater.jsp">Theaters</a>
        <a href="#">Offers</a>
    </div>

    <div class="header-right">
        <div class="search-wrapper">
            <div class="search-box">
                <input type="text" id="searchInput" placeholder="Search movies..." onkeyup="showSuggestions(event)">
                <button class="clear-btn" id="clearBtn" onclick="clearSearch()">×</button>
                <button class="search-btn" onclick="searchMovie()">
                    <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="white" viewBox="0 0 24 24">
                        <path d="M15.5 14h-.79l-.28-.27C15.41 12.59 16 11.11 16 9.5 16 5.91 13.09 3 9.5 3S3 5.91 3 9.5 5.91 16 9.5 16c1.61 0 3.09-.59 4.23-1.57l.27.28v.79l5 5L20.49 19z"/>
                    </svg>
                </button>
            </div>
            <div id="suggestions" class="suggestions"></div>
        </div>

        <button class="profile-btn" onclick="toggleSidebar()">
            <%= user.substring(0,1).toUpperCase() %>
        </button>
    </div>
</header>

<!-- SIDEBAR -->
<div class="sidebar" id="sidebar">
    <div class="sidebar-top">
        <button class="close-sidebar" onclick="toggleSidebar()">×</button>
        <div class="profile-info">
            <div class="profile-circle"><%= user.substring(0,1).toUpperCase() %></div>
            <div class="profile-details">
                <h3><%= user %></h3>
                <p>BookMyMovie User</p>
            </div>
        </div>
    </div>

    <div class="sidebar-body">
        <div class="info-box">
            <p><b>Email:</b> <%= email %></p>
            <p><b>Phone:</b> <%= phone %></p>
        </div>
        <button class="sidebar-btn booking-btn" onclick="loadBookings()">🎟️ My Bookings</button>
        <div id="bookingList"></div>
        <button class="sidebar-btn logout-btn" onclick="logoutUser()">🚪 Logout</button>
    </div>
</div>

<div class="overlay" id="overlay" onclick="toggleSidebar()"></div>

<script>
const movieList = [
    // From Trending / Popular
    "Avengers: Endgame", 
    "Avatar: The Way of Water", 
    "Spider-Man: No Way Home", 
    "Top Gun: Maverick", 
    "Guardians of the Galaxy",
    "Thor: Love and Thunder",
    "Spider-Man: Far From Home",
    "Black Panther",
    "Sonic the Hedgehog 2",
    "Extraction",
    
    // From Popular section (Unique ones)
    "Avengers: Infinity War",
    "Dune",
    "Titanic",
    "Gladiator",
    "Barbie",
    "Bad Boys for Life",
    "Mission: Impossible - Fallout",
    "Iron Man",
    "The Lion King",
    "Shutter Island",
    
    // From Showing Now section
    "Interstellar",
    "Inception",
    "John Wick",
    "The Dark Knight",
    "Money Plane",
    "Shang-Chi",
    "Doctor Strange",
    "Mad Max: Fury Road",
    "Parasite",
    "The Matrix"
];

function toggleSidebar(){
    document.getElementById("sidebar").classList.toggle("active");
    document.getElementById("overlay").classList.toggle("active");
}

function logoutUser(){
    window.location.href="Login.html";
}

function loadBookings(){
    const list = document.getElementById("bookingList");
    list.innerHTML = list.innerHTML === "" ? `
        <div class="booking-card">Avengers: Endgame</div>
        <div class="booking-card">Interstellar</div>
        <div class="booking-card">Spider-Man: No Way Home</div>
    ` : "";
}

function showSuggestions(event){
    let input = document.getElementById("searchInput");
    let value = input.value.toLowerCase();
    let box = document.getElementById("suggestions");
    let clearBtn = document.getElementById("clearBtn");

    clearBtn.classList.toggle("show", value.length > 0);
    box.innerHTML = "";

    if(value === ""){
        box.style.display = "none";
        return;
    }

    let filtered = movieList.filter(movie => movie.toLowerCase().includes(value));

    filtered.forEach(movie => {
        let div = document.createElement("div");
        div.innerText = movie;
        div.onclick = function(){
            input.value = movie;
            box.style.display = "none";
            searchMovie();
        };
        box.appendChild(div);
    });

    box.style.display = filtered.length ? "block" : "none";
    if(event.key === "Enter") searchMovie();
}

function searchMovie(){
    let input = document.getElementById("searchInput").value.toLowerCase();
    let movies = document.querySelectorAll(".movie-card");
    movies.forEach(movie => {
        let text = movie.innerText.toLowerCase();
        movie.style.display = text.includes(input) ? "flex" : "none";
    });
    document.getElementById("suggestions").style.display = "none";
}

function clearSearch(){
    document.getElementById("searchInput").value="";
    document.getElementById("clearBtn").classList.remove("show");
    document.getElementById("suggestions").style.display="none";
    document.querySelectorAll(".movie-card").forEach(m => m.style.display="flex");
}

document.addEventListener("click", function(e){
    let search = document.querySelector(".search-wrapper");
    if(!search.contains(e.target)){
        document.getElementById("suggestions").style.display = "none";
    }
});
</script>

</body>
</html>