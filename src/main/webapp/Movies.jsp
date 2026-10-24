<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>BookMyMovie - Movies</title>

<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet">

<style>
/* ===== GLOBAL ===== */
*{
    margin:0;
    padding:0;
    box-sizing:border-box;
}

body{
    font-family:'Poppins',sans-serif;
    background:#f4f7fb;
    color:#111827;
}

.page-wrapper{
    width:100%;
    min-height:100vh;
}

/* ===== SECTION ===== */
.section{
    width:94%;
    max-width:1300px;
    margin:auto;
    padding:40px 0;
}

.section h2{
    font-size:32px;
    font-weight:700;
    margin-bottom:30px;
    color:#111827;
}

/* ===== MOVIE GRID (FIXED 5 COLUMNS) ===== */
.movies{
    display:grid;
    grid-template-columns: repeat(5, 1fr); /* 5 per row just like homepage */
    gap:20px;
}

/* ===== STRETCHED CARD DESIGN ===== */
.movie-card{
    background:#ffffff;
    border-radius:18px;
    overflow:hidden;
    border:1px solid #e5e7eb;
    transition: 0.3s ease;
    display:flex;
    flex-direction:column;
    height: 100%;
}

.movie-card:hover{
    transform:translateY(-10px);
    box-shadow: 0 15px 30px rgba(0,0,0,0.1);
}

.movie-card img{
    width:100%;
    height:380px; /* Stretched height like homepage */
    object-fit:cover;
}

.movie-info{
    padding:16px;
    display:flex;
    flex-direction:column;
    flex-grow:1;
}

.movie-info h3{
    font-size:17px;
    font-weight:700;
    margin-bottom:12px;
    line-height:1.3;
    min-height:44px; /* Keeps layout consistent */
    display: -webkit-box;
    -webkit-line-clamp: 2;
    -webkit-box-orient: vertical;
    overflow: hidden;
}

/* Meta Data Rows Stacked */
.meta-row {
    display: block;
    font-size: 13px;
    color: #6b7280;
    margin-bottom: 6px;
}

.meta-row b {
    color: #374151;
    font-weight: 600;
}

/* ===== BUTTON ===== */
.book-btn{
    width:100%;
    padding:12px;
    border:none;
    border-radius:10px;
    background: linear-gradient(135deg,#ff9800,#ffb300);
    color:white;
    font-size:14px;
    font-weight:600;
    cursor:pointer;
    margin-top:auto; /* Pushes to bottom */
    transition:0.2s;
}

.book-btn:hover{
    filter: brightness(1.1);
}

/* ===== RESPONSIVE ===== */
@media(max-width:1100px){
    .movies{ grid-template-columns: repeat(3, 1fr); }
}

@media(max-width:768px){
    .section h2{ font-size:26px; }
    .movies{ grid-template-columns: repeat(2, 1fr); }
    .movie-card img{ height:300px; }
}
</style>
</head>

<body>

<div class="page-wrapper">

    <jsp:include page="Header.jsp"/>

    <!-- ===== POPULAR MOVIES ===== -->
    <div class="section">
        <h2>Popular Movies</h2>
        <div class="movies">

            <div class="movie-card">
                <img src="https://image.tmdb.org/t/p/original/7WsyChQLEftFiDOVTGkv3hFpyyt.jpg">
                <div class="movie-info">
                    <h3>Avengers Infinity War</h3>
                    <span class="meta-row"><b>Release:</b> 2021</span>
                    <span class="meta-row"><b>Type:</b> Sci-Fi</span>
                    <button class="book-btn" onclick="bookMovie('Avengers Infinity War')">Book Ticket</button>
                </div>
            </div>

            <div class="movie-card">
                <img src="https://image.tmdb.org/t/p/original/d5NXSklXo0qyIYkgV94XAgMIckC.jpg">
                <div class="movie-info">
                    <h3>Dune</h3>
                    <span class="meta-row"><b>Release:</b> 2010</span>
                    <span class="meta-row"><b>Type:</b> Sci-Fi Thriller</span>
                    <button class="book-btn" onclick="bookMovie('Dune')">Book Ticket</button>
                </div>
            </div>

            <div class="movie-card">
                <img src="https://image.tmdb.org/t/p/original/9xjZS2rlVxm8SFx8kPC3aIGCOYQ.jpg">
                <div class="movie-info">
                    <h3>Titanic</h3>
                    <span class="meta-row"><b>Release:</b> 1997</span>
                    <span class="meta-row"><b>Type:</b> Epic Romance</span>
                    <button class="book-btn" onclick="bookMovie('Titanic')">Book Ticket</button>
                </div>
            </div>

            <div class="movie-card">
                <img src="https://image.tmdb.org/t/p/original/ty8TGRuvJLPUmAR1H1nRIsgwvim.jpg">
                <div class="movie-info">
                    <h3>Gladiator</h3>
                    <span class="meta-row"><b>Release:</b> 2000</span>
                    <span class="meta-row"><b>Type:</b> Action Drama</span>
                    <button class="book-btn" onclick="bookMovie('Gladiator')">Book Ticket</button>
                </div>
            </div>

            <div class="movie-card">
                <img src="https://image.tmdb.org/t/p/original/iuFNMS8U5cb6xfzi51Dbkovj7vM.jpg">
                <div class="movie-info">
                    <h3>Barbie</h3>
                    <span class="meta-row"><b>Release:</b> 2023</span>
                    <span class="meta-row"><b>Type:</b> Comedy Fantasy</span>
                    <button class="book-btn" onclick="bookMovie('Barbie')">Book Ticket</button>
                </div>
            </div>

            <div class="movie-card">
                <img src="https://image.tmdb.org/t/p/original/y95lQLnuNKdPAzw9F9Ab8kJ80c3.jpg">
                <div class="movie-info">
                    <h3>Bad Boys for Life</h3>
                    <span class="meta-row"><b>Release:</b> 2020</span>
                    <span class="meta-row"><b>Type:</b> Action</span>
                    <button class="book-btn" onclick="bookMovie('Bad Boys for Life')">Book Ticket</button>
                </div>
            </div>

            <div class="movie-card">
                <img src="https://image.tmdb.org/t/p/original/iKPsC9EFUafRP9SrUznI61getVP.jpg">
                <div class="movie-info">
                    <h3>Mission Impossible Fallout</h3>
                    <span class="meta-row"><b>Release:</b> 2018</span>
                    <span class="meta-row"><b>Type:</b> Action Thriller</span>
                    <button class="book-btn" onclick="bookMovie('Mission Impossible Fallout')">Book Ticket</button>
                </div>
            </div>

            <div class="movie-card">
                <img src="https://image.tmdb.org/t/p/original/78lPtwv72eTNqFW9COBYI0dWDJa.jpg">
                <div class="movie-info">
                    <h3>Iron Man</h3>
                    <span class="meta-row"><b>Release:</b> 2015</span>
                    <span class="meta-row"><b>Type:</b> Sci-Fi</span>
                    <button class="book-btn" onclick="bookMovie('Iron Man')">Book Ticket</button>
                </div>
            </div>

            <div class="movie-card">
                <img src="https://image.tmdb.org/t/p/original/sKCr78MXSLixwmZ8DyJLrpMsd15.jpg">
                <div class="movie-info">
                    <h3>The Lion King</h3>
                    <span class="meta-row"><b>Release:</b> 2019</span>
                    <span class="meta-row"><b>Type:</b> Cartoon</span>
                    <button class="book-btn" onclick="bookMovie('The Lion King')">Book Ticket</button>
                </div>
            </div>

            <div class="movie-card">
                <img src="https://image.tmdb.org/t/p/original/kve20tXwUZpu4GUX8l6X7Z4jmL6.jpg">
                <div class="movie-info">
                    <h3>Shutter Island</h3>
                    <span class="meta-row"><b>Release:</b> 2010</span>
                    <span class="meta-row"><b>Type:</b> Thriller</span>
                    <button class="book-btn" onclick="bookMovie('Shutter Island')">Book Ticket</button>
                </div>
            </div>
        </div>
    </div>

    <!-- ===== TRENDING MOVIES ===== -->
    <div class="section">
        <h2>Trending Movies</h2>
        <div class="movies">
            <div class="movie-card">
                <img src="https://image.tmdb.org/t/p/w500/RYMX2wcKCBAr24UyPD7xwmjaTn.jpg">
                <div class="movie-info">
                    <h3>Avengers Endgame</h3>
                    <span class="meta-row"><b>Release:</b> 2019</span>
                    <span class="meta-row"><b>Type:</b> Action</span>
                    <button class="book-btn" onclick="bookMovie('Avengers Endgame')">Book Ticket</button>
                </div>
            </div>

            <div class="movie-card">
                <img src="https://image.tmdb.org/t/p/original/t6HIqrRAclMCA60NsSmeqe9RmNV.jpg">
                <div class="movie-info">
                    <h3>Avatar The Way of Water</h3>
                    <span class="meta-row"><b>Release:</b> 2022</span>
                    <span class="meta-row"><b>Type:</b> Action Sci-Fi</span>
                    <button class="book-btn" onclick="bookMovie('Avatar The Way of Water')">Book Ticket</button>
                </div>
            </div>

            <div class="movie-card">
                <img src="https://image.tmdb.org/t/p/original/1g0dhYtq4irTY1GPXvft6k4YLjm.jpg">
                <div class="movie-info">
                    <h3>Spider-Man No Way Home</h3>
                    <span class="meta-row"><b>Release:</b> 2021</span>
                    <span class="meta-row"><b>Type:</b> Action</span>
                    <button class="book-btn" onclick="bookMovie('Spider-Man No Way Home')">Book Ticket</button>
                </div>
            </div>

            <div class="movie-card">
                <img src="https://image.tmdb.org/t/p/original/62HCnUTziyWcpDaBO2i1DX17ljH.jpg">
                <div class="movie-info">
                    <h3>Top Gun Maverick</h3>
                    <span class="meta-row"><b>Release:</b> 2022</span>
                    <span class="meta-row"><b>Type:</b> Action</span>
                    <button class="book-btn" onclick="bookMovie('Top Gun Maverick')">Book Ticket</button>
                </div>
            </div>

            <div class="movie-card">
                <img src="https://image.tmdb.org/t/p/original/y4MBh0EjBlMuOzv9axM4qJlmhzz.jpg">
                <div class="movie-info">
                    <h3>Guardians of the Galaxy</h3>
                    <span class="meta-row"><b>Release:</b> 2017</span>
                    <span class="meta-row"><b>Type:</b> Thriller</span>
                    <button class="book-btn" onclick="bookMovie('Guardians of the Galaxy')">Book Ticket</button>
                </div>
            </div>

            <div class="movie-card">
                <img src="https://image.tmdb.org/t/p/original/pIkRyD18kl4FhoCNQuWxWu5cBLM.jpg">
                <div class="movie-info">
                    <h3>Thor Love and Thunder</h3>
                    <span class="meta-row"><b>Release:</b> 2022</span>
                    <span class="meta-row"><b>Type:</b> Action</span>
                    <button class="book-btn" onclick="bookMovie('Thor Love and Thunder')">Book Ticket</button>
                </div>
            </div>

            <div class="movie-card">
                <img src="https://image.tmdb.org/t/p/original/4q2NNj4S5dG2RLF9CpXsej7yXl.jpg">
                <div class="movie-info">
                    <h3>Spider-Man Far From Home</h3>
                    <span class="meta-row"><b>Release:</b> 2022</span>
                    <span class="meta-row"><b>Type:</b> Action Adventure</span>
                    <button class="book-btn" onclick="bookMovie('Spider-Man Far From Home')">Book Ticket</button>
                </div>
            </div>

            <div class="movie-card">
                <img src="https://image.tmdb.org/t/p/original/uxzzxijgPIY7slzFvMotPv8wjKA.jpg">
                <div class="movie-info">
                    <h3>Black Panther</h3>
                    <span class="meta-row"><b>Release:</b> 2018</span>
                    <span class="meta-row"><b>Type:</b> Action</span>
                    <button class="book-btn" onclick="bookMovie('Black Panther')">Book Ticket</button>
                </div>
            </div>

            <div class="movie-card">
                <img src="https://image.tmdb.org/t/p/w500/6DrHO1jr3qVrViUO6s6kFiAGM7.jpg">
                <div class="movie-info">
                    <h3>Sonic the Hedgehog 2</h3>
                    <span class="meta-row"><b>Release:</b> 2022</span>
                    <span class="meta-row"><b>Type:</b> Fantasy</span>
                    <button class="book-btn" onclick="bookMovie('Sonic the Hedgehog 2')">Book Ticket</button>
                </div>
            </div>

            <div class="movie-card">
                <img src="https://image.tmdb.org/t/p/w500/wlfDxbGEsW58vGhFljKkcR5IxDj.jpg">
                <div class="movie-info">
                    <h3>Extraction</h3>
                    <span class="meta-row"><b>Release:</b> 2020</span>
                    <span class="meta-row"><b>Type:</b> Action Thriller</span>
                    <button class="book-btn" onclick="bookMovie('Extraction')">Book Ticket</button>
                </div>
            </div>
        </div>
    </div>

    <!-- ===== SHOWING NOW MOVIES ===== -->
    <div class="section">
        <h2>Showing Now</h2>
        <div class="movies">
            <div class="movie-card">
                <img src="https://image.tmdb.org/t/p/original/nCbkOyOMTEwlEV0LtCOvCnwEONA.jpg">
                <div class="movie-info">
                    <h3>Interstellar</h3>
                    <span class="meta-row"><b>Release:</b> 2014</span>
                    <span class="meta-row"><b>Type:</b> Sci-Fi</span>
                    <button class="book-btn" onclick="bookMovie('Interstellar')">Book Ticket</button>
                </div>
            </div>

            <div class="movie-card">
                <img src="https://image.tmdb.org/t/p/w500/edv5CZvWj09upOsy2Y6IwDhK8bt.jpg">
                <div class="movie-info">
                    <h3>Inception</h3>
                    <span class="meta-row"><b>Release:</b> 2010</span>
                    <span class="meta-row"><b>Type:</b> Sci-Fi Thriller</span>
                    <button class="book-btn" onclick="bookMovie('Inception')">Book Ticket</button>
                </div>
            </div>

            <div class="movie-card">
                <img src="https://image.tmdb.org/t/p/original/fZPSd91yGE9fCcCe6OoQr6E3Bev.jpg">
                <div class="movie-info">
                    <h3>John Wick</h3>
                    <span class="meta-row"><b>Release:</b> 2014</span>
                    <span class="meta-row"><b>Type:</b> Action</span>
                    <button class="book-btn" onclick="bookMovie('John Wick')">Book Ticket</button>
                </div>
            </div>

            <div class="movie-card">
                <img src="https://image.tmdb.org/t/p/original/1hRoyzDtpgMU7Dz4JF22RANzQO7.jpg">
                <div class="movie-info">
                    <h3>The Dark Knight</h3>
                    <span class="meta-row"><b>Release:</b> 2008</span>
                    <span class="meta-row"><b>Type:</b> Action Crime</span>
                    <button class="book-btn" onclick="bookMovie('The Dark Knight')">Book Ticket</button>
                </div>
            </div>

            <div class="movie-card">
                <img src="https://image.tmdb.org/t/p/w500/6CoRTJTmijhBLJTUNoVSUNxZMEI.jpg">
                <div class="movie-info">
                    <h3>Money Plane</h3>
                    <span class="meta-row"><b>Release:</b> 2023</span>
                    <span class="meta-row"><b>Type:</b> Action Thriller</span>
                    <button class="book-btn" onclick="bookMovie('Money Plane')">Book Ticket</button>
                </div>
            </div>

            <div class="movie-card">
                <img src="https://image.tmdb.org/t/p/w500/1BIoJGKbXjdFDAqUEiA2VHqkK1Z.jpg">
                <div class="movie-info">
                    <h3>Shang-Chi</h3>
                    <span class="meta-row"><b>Release:</b> 2021</span>
                    <span class="meta-row"><b>Type:</b> Action Thriller</span>
                    <button class="book-btn" onclick="bookMovie('Shang-Chi')">Book Ticket</button>
                </div>
            </div>

            <div class="movie-card">
                <img src="https://image.tmdb.org/t/p/w500/9Gtg2DzBhmYamXBS1hKAhiwbBKS.jpg">
                <div class="movie-info">
                    <h3>Doctor Strange</h3>
                    <span class="meta-row"><b>Release:</b> 2016</span>
                    <span class="meta-row"><b>Type:</b> Fantasy</span>
                    <button class="book-btn" onclick="bookMovie('Doctor Strange')">Book Ticket</button>
                </div>
            </div>

            <div class="movie-card">
                <img src="https://image.tmdb.org/t/p/original/8tZYtuWezp8JbcsvHYO0O46tFbo.jpg">
                <div class="movie-info">
                    <h3>Mad Max Fury Road</h3>
                    <span class="meta-row"><b>Release:</b> 2015</span>
                    <span class="meta-row"><b>Type:</b> Action</span>
                    <button class="book-btn" onclick="bookMovie('Mad Max Fury Road')">Book Ticket</button>
                </div>
            </div>

            <div class="movie-card">
                <img src="https://image.tmdb.org/t/p/w500/7IiTTgloJzvGI1TAYymCfbfl3vT.jpg">
                <div class="movie-info">
                    <h3>Parasite</h3>
                    <span class="meta-row"><b>Release:</b> 2019</span>
                    <span class="meta-row"><b>Type:</b> Thriller</span>
                    <button class="book-btn" onclick="bookMovie('Parasite')">Book Ticket</button>
                </div>
            </div>

            <div class="movie-card">
                <img src="https://image.tmdb.org/t/p/original/f89U3ADr1oiB1s9GkdPOEpXUk5H.jpg">
                <div class="movie-info">
                    <h3>The Matrix</h3>
                    <span class="meta-row"><b>Release:</b> 1999</span>
                    <span class="meta-row"><b>Type:</b> Sci-Fi Action</span>
                    <button class="book-btn" onclick="bookMovie('The Matrix')">Book Ticket</button>
                </div>
            </div>
        </div>
    </div>

    <jsp:include page="Footer.jsp"/>
</div>

<script>
function bookMovie(movieName){
    window.location.href = "Booking.jsp?movie=" + encodeURIComponent(movieName);
}
</script>

</body>
</html>