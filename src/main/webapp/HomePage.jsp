<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>BookMyMovie - Home</title>

<style>
    * { margin:0; padding:0; box-sizing:border-box; }
    body { font-family:'Poppins', sans-serif; background:#f4f7fb; color:#1f2937; overflow-x: hidden; }

    /* ===== BANNER CAROUSEL ===== */
.carousel {
    width: 94%;
    max-width: 1300px;
    height: 350px; /* Reduced height for a sleeker horizontal look */
    margin: 25px auto;
    position: relative;
    overflow: hidden;
    border-radius: 20px;
    box-shadow: 0 10px 30px rgba(0,0,0,0.15);
    background: #111; /* Dark background for loading */
}

.slide {
    width: 100%;
    height: 100%;
    /* 'cover' prevents distortion (no stretching) */
    object-fit: cover; 
    /* This ensures we see the top/middle where the actors are */
    object-position: center 20%; 
    display: none;
    animation: fade 0.8s ease-in-out;
}

.slide.active {
    display: block;
}

    @keyframes fade { from { opacity: 0.6; } to { opacity: 1; } }

    /* ===== SCROLL ARROWS ===== */
.arrow {
    position: absolute;
    top: 50%;
    transform: translateY(-50%);
    width: 45px;
    height: 45px;
    background: rgba(255, 255, 255, 0.2);
    backdrop-filter: blur(8px); /* Modern frosted glass effect */
    color: white;
    border: 1px solid rgba(255,255,255,0.3);
    border-radius: 50%;
    font-size: 20px;
    cursor: pointer;
    z-index: 10;
    transition: 0.3s;
    display: flex;
    align-items: center;
    justify-content: center;
}

.arrow:hover {
    background: #ff9800;
    border-color: #ff9800;
    transform: translateY(-50%) scale(1.1);
}

.prev { left: 20px; }
.next { right: 20px; }

/* Subtle overlay to make title text pop if you add it later */
.carousel::after {
    content: "";
    position: absolute;
    bottom: 0;
    left: 0;
    width: 100%;
    height: 40%;
    background: linear-gradient(transparent, rgba(0,0,0,0.5));
    pointer-events: none;
}

    /* ===== MOVIE GRID ===== */
    .section { width: 94%; max-width: 1300px; margin: auto; padding-bottom: 60px; }
    .section-title { margin: 20px 0 30px 0; }
    .section-title h2 { font-size: 32px; font-weight: 700; color: #111827; }

    .movies-grid {
        display: grid;
        grid-template-columns: repeat(5, 1fr); 
        gap: 20px;
    }

    .movie-card {
        background: #fff;
        border-radius: 18px;
        overflow: hidden;
        display: flex;
        flex-direction: column;
        border: 1px solid #e5e7eb;
        transition: 0.3s ease;
        height: 100%;
    }

    .movie-card:hover { transform: translateY(-10px); box-shadow: 0 15px 30px rgba(0,0,0,0.1); }

    .movie-card img { width: 100%; height: 380px; object-fit: cover; }

    .movie-info { padding: 16px; display: flex; flex-direction: column; flex-grow: 1; }
    .movie-info h3 { font-size: 17px; margin-bottom: 12px; min-height: 44px; line-height: 1.3; }

    .meta-row { display: block; font-size: 13px; color: #6b7280; margin-bottom: 6px; }
    .meta-row b { color: #374151; font-weight: 600; }

    .book-btn {
        margin-top: auto;
        background: linear-gradient(135deg, #ff9800, #ffb300);
        color: white;
        border: none;
        padding: 12px;
        border-radius: 10px;
        font-weight: 600;
        cursor: pointer;
    }

    /* RESPONSIVE */
    @media(max-width: 1100px) { .movies-grid { grid-template-columns: repeat(3, 1fr); } }
    @media(max-width: 768px) { 
        .movies-grid { grid-template-columns: repeat(2, 1fr); } 
        .carousel { height: 250px; }
        .movie-card img { height: 300px; }
    }
</style>
</head>
<body>

<jsp:include page="Header.jsp" />

<!-- BANNER WITH ARROWS -->
<div class="carousel">
    <button class="arrow prev" onclick="changeSlide(-1)">&#10094;</button>
    <button class="arrow next" onclick="changeSlide(1)">&#10095;</button>

    <img src="https://image.tmdb.org/t/p/original/rAiYTfKGqDCRIIqo664sY9XZIvQ.jpg" class="slide active">
    <img src="https://image.tmdb.org/t/p/original/8Y43POKjjKDGI9MH89NW0NAzzp8.jpg" class="slide">
    <img src="https://image.tmdb.org/t/p/original/9BBTo63ANSmhC4e6r62OJFuK2GL.jpg" class="slide">
    <img src="https://image.tmdb.org/t/p/original/yDHYTfA3R0jFYba16jBB1ef8oIt.jpg" class="slide">
    <img src="https://image.tmdb.org/t/p/original/3CxUndGhUcZdt1Zggjdb2HkLLQX.jpg" class="slide">
</div>

<div class="section">
    <div class="section-title">
        <h2>Trending Movies</h2>
    </div>

    <div class="movies-grid">
        <!-- 1 -->
        <div class="movie-card">
            <img src="https://image.tmdb.org/t/p/w500/RYMX2wcKCBAr24UyPD7xwmjaTn.jpg">
            <div class="movie-info">
                <h3>Avengers: Endgame</h3>
                <span class="meta-row"><b>Release:</b> 2019</span>
                <span class="meta-row"><b>Type:</b> Action / Sci-Fi</span>
                <button class="book-btn" onclick="bookMovie('Avengers: Endgame')">Book Ticket</button>
            </div>
        </div>

        <!-- 2 -->
        <div class="movie-card">
            <img src="https://image.tmdb.org/t/p/original/t6HIqrRAclMCA60NsSmeqe9RmNV.jpg">
            <div class="movie-info">
                <h3>Avatar: The Way of Water</h3>
                <span class="meta-row"><b>Release:</b> 2022</span>
                <span class="meta-row"><b>Type:</b> Adventure / Sci-Fi</span>
                <button class="book-btn" onclick="bookMovie('Avatar: The Way of Water')">Book Ticket</button>
            </div>
        </div>

        <!-- 3 -->
        <div class="movie-card">
            <img src="https://image.tmdb.org/t/p/original/1g0dhYtq4irTY1GPXvft6k4YLjm.jpg">
            <div class="movie-info">
                <h3>Spider-Man: No Way Home</h3>
                <span class="meta-row"><b>Release:</b> 2021</span>
                <span class="meta-row"><b>Type:</b> Action / Fantasy</span>
                <button class="book-btn" onclick="bookMovie('Spider-Man: No Way Home')">Book Ticket</button>
            </div>
        </div>

        <!-- 4 -->
        <div class="movie-card">
            <img src="https://image.tmdb.org/t/p/original/62HCnUTziyWcpDaBO2i1DX17ljH.jpg">
            <div class="movie-info">
                <h3>Top Gun: Maverick</h3>
                <span class="meta-row"><b>Release:</b> 2022</span>
                <span class="meta-row"><b>Type:</b> Action / Drama</span>
                <button class="book-btn" onclick="bookMovie('Top Gun: Maverick')">Book Ticket</button>
            </div>
        </div>

        <!-- 5 -->
        <div class="movie-card">
            <img src="https://image.tmdb.org/t/p/original/y4MBh0EjBlMuOzv9axM4qJlmhzz.jpg">
            <div class="movie-info">
                <h3>Guardians of the Galaxy</h3>
                <span class="meta-row"><b>Release:</b> 2017</span>
                <span class="meta-row"><b>Type:</b> Adventure / Comedy</span>
                <button class="book-btn" onclick="bookMovie('Guardians of the Galaxy')">Book Ticket</button>
            </div>
        </div>

        <!-- 6 -->
        <div class="movie-card">
            <img src="https://image.tmdb.org/t/p/original/pIkRyD18kl4FhoCNQuWxWu5cBLM.jpg">
            <div class="movie-info">
                <h3>Thor: Love and Thunder</h3>
                <span class="meta-row"><b>Release:</b> 2022</span>
                <span class="meta-row"><b>Type:</b> Action / Fantasy</span>
                <button class="book-btn" onclick="bookMovie('Thor: Love and Thunder')">Book Ticket</button>
            </div>
        </div>

        <!-- 7 -->
        <div class="movie-card">
            <img src="https://image.tmdb.org/t/p/original/4q2NNj4S5dG2RLF9CpXsej7yXl.jpg">
            <div class="movie-info">
                <h3>Spider-Man: Far From Home</h3>
                <span class="meta-row"><b>Release:</b> 2019</span>
                <span class="meta-row"><b>Type:</b> Action / Adventure</span>
                <button class="book-btn" onclick="bookMovie('Spider-Man: Far From Home')">Book Ticket</button>
            </div>
        </div>

        <!-- 8 -->
        <div class="movie-card">
            <img src="https://image.tmdb.org/t/p/original/uxzzxijgPIY7slzFvMotPv8wjKA.jpg">
            <div class="movie-info">
                <h3>Black Panther</h3>
                <span class="meta-row"><b>Release:</b> 2018</span>
                <span class="meta-row"><b>Type:</b> Action / Drama</span>
                <button class="book-btn" onclick="bookMovie('Black Panther')">Book Ticket</button>
            </div>
        </div>

        <!-- 9 -->
        <div class="movie-card">
            <img src="https://image.tmdb.org/t/p/w500/6DrHO1jr3qVrViUO6s6kFiAGM7.jpg">
            <div class="movie-info">
                <h3>Sonic the Hedgehog 2</h3>
                <span class="meta-row"><b>Release:</b> 2022</span>
                <span class="meta-row"><b>Type:</b> Fantasy / Adventure</span>
                <button class="book-btn" onclick="bookMovie('Sonic the Hedgehog 2')">Book Ticket</button>
            </div>
        </div>

        <!-- 10 -->
        <div class="movie-card">
            <img src="https://image.tmdb.org/t/p/w500/wlfDxbGEsW58vGhFljKkcR5IxDj.jpg">
            <div class="movie-info">
                <h3>Extraction</h3>
                <span class="meta-row"><b>Release:</b> 2020</span>
                <span class="meta-row"><b>Type:</b> Action / Thriller</span>
                <button class="book-btn" onclick="bookMovie('Extraction')">Book Ticket</button>
            </div>
        </div>
    </div>
</div>

<jsp:include page="Footer.jsp" />

<script>
    let currentSlide = 0;
    const slides = document.querySelectorAll(".slide");

    function showSlide(index) {
        slides.forEach(s => s.classList.remove("active"));
        if (index >= slides.length) currentSlide = 0;
        else if (index < 0) currentSlide = slides.length - 1;
        else currentSlide = index;
        slides[currentSlide].classList.add("active");
    }

    function changeSlide(n) {
        showSlide(currentSlide + n);
    }

    // Auto-slide every 5 seconds
    setInterval(() => changeSlide(1), 5000);

    function bookMovie(name){
        window.location.href = "Theater.jsp?movie=" + encodeURIComponent(name);
    }
</script>

</body>
</html>