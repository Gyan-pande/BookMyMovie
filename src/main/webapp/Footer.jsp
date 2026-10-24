<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!-- ===== FOOTER ===== -->

<style>
/* ===== FOOTER ===== */

.footer{
    margin-top:60px;
    background:#ffffff;
    color:#374151;
    border-top:4px solid #ff9800;
    box-shadow:0 -2px 10px rgba(0,0,0,0.05);
}

/* ===== CONTAINER ===== */

.footer-container{
    max-width:1300px;
    margin:auto;
    padding:55px 40px;

    display:grid;
    grid-template-columns:repeat(auto-fit,minmax(250px,1fr));

    gap:50px;

    align-items:flex-start;
}

/* ===== SECTIONS ===== */

.footer-section{
    display:flex;
    flex-direction:column;
}

.footer-section h3{
    color:#ff9800;
    margin-bottom:20px;
    font-size:22px;
    font-weight:700;
}

.footer-section p{
    line-height:1.9;
    font-size:14px;
    color:#4b5563;
}

/* ===== BRAND ===== */

.footer-brand{
    display:flex;
    align-items:center;
    margin-bottom:20px;
}

/* ===== COMMON LINK STYLE ===== */

.footer-link,
.social-link{
    display:flex;
    align-items:center;

    gap:12px;

    text-decoration:none;

    color:#374151;

    font-size:15px;
    font-weight:500;

    margin-bottom:14px;

    transition:0.3s ease;
}

/* ===== ICONS ===== */

.footer-link svg,
.social-link svg{
    min-width:20px;
    min-height:20px;

    color:#ff9800;

    transition:0.3s;
}

/* ===== HOVER ===== */

.footer-link:hover,
.social-link:hover{
    color:#ff9800;
    transform:translateX(6px);
}

.footer-link:hover svg,
.social-link:hover svg{
    transform:scale(1.15);
}

/* ===== SOCIAL LINKS ===== */

.social-links{
    display:flex;
    flex-direction:column;
    gap:14px;
}

/* ===== BOTTOM ===== */

.footer-bottom{
    text-align:center;

    padding:18px;

    background:#f9fafb;

    border-top:1px solid #e5e7eb;

    color:#6b7280;

    font-size:14px;
}

.footer-bottom b{
    color:#ff9800;
}

/* ===== RESPONSIVE ===== */

@media(max-width:768px){

    .footer-container{
        grid-template-columns:1fr;
        padding:40px 25px;
        gap:35px;
    }

    .footer-section{
        text-align:left;
    }

    .footer-link,
    .social-link{
        font-size:14px;
    }
}

.footer-section a{
    width:fit-content;
}
</style>

<footer class="footer">

	<div class="footer-container">

		<!-- ===== BRAND ===== -->

		<div class="footer-section">

			<div class="footer-brand">

				<!-- LOGO -->

				<svg width="190" height="55" viewBox="0 0 320 80"
					xmlns="http://www.w3.org/2000/svg">

                    <defs>

                        <linearGradient id="footerGold" x1="0%" y1="0%"
						x2="100%">

                            <stop offset="0%" stop-color="#ff9800" />

                            <stop offset="50%" stop-color="#ffc107" />

                            <stop offset="100%" stop-color="#ffb300" />

                        </linearGradient>

                    </defs>

                    <!-- BOX -->

                    <rect x="0" y="10" width="70" height="60" rx="16"
						fill="#0f0f0f" />

                    <!-- HOLES -->

                    <circle cx="8" cy="20" r="2" fill="#555" />
                    <circle cx="8" cy="40" r="2" fill="#555" />
                    <circle cx="8" cy="60" r="2" fill="#555" />

                    <circle cx="62" cy="20" r="2" fill="#555" />
                    <circle cx="62" cy="40" r="2" fill="#555" />
                    <circle cx="62" cy="60" r="2" fill="#555" />

                    <!-- PLAY -->

                    <polygon points="28,25 28,55 52,40"
						fill="url(#footerGold)" />

                    <!-- TEXT -->

                    <text x="90" y="48" font-size="28"
						font-family="Poppins" font-weight="bold" fill="url(#footerGold)">

                        BookMyMovie

                    </text>

                </svg>

			</div>

			<p>Your ultimate movie ticket booking platform. Discover trending
				movies, book tickets instantly, and enjoy a seamless cinema
				experience.</p>

		</div>

		<!-- ===== QUICK LINKS ===== -->

<div class="footer-section">

    <h3>Quick Links</h3>

    <a href="HomePage.jsp"
       class="footer-link">

        <svg xmlns="http://www.w3.org/2000/svg"
             width="18"
             height="18"
             viewBox="0 0 24 24"
             fill="currentColor">

            <path d="M10 20v-6h4v6h5v-8h3L12 3 2 12h3v8z"/>

        </svg>

        Home

    </a>

    <a href="Movies.jsp"
       class="footer-link">

        <svg xmlns="http://www.w3.org/2000/svg"
             width="18"
             height="18"
             viewBox="0 0 24 24"
             fill="currentColor">

            <path d="M18 4l2 4h-3l-2-4h3zM9 4l2 4H8L6 4h3zm-7
            0h3l2 4H4L2 4zm18 6v10H4V10h16zm-9 2v6l5-3-5-3z"/>

        </svg>

        Movies

    </a>

    <a href="Theater.jsp"
       class="footer-link">

        <svg xmlns="http://www.w3.org/2000/svg"
             width="18"
             height="18"
             viewBox="0 0 24 24"
             fill="currentColor">

            <path d="M2 5v14h20V5H2zm18 12H4V7h16v10zM6
            9h2v2H6V9zm0 4h2v2H6v-2zm10-4h2v2h-2V9zm0
            4h2v2h-2v-2z"/>

        </svg>

        Theaters

    </a>

    <a href="#"
       class="footer-link">

        <svg xmlns="http://www.w3.org/2000/svg"
             width="18"
             height="18"
             viewBox="0 0 24 24"
             fill="currentColor">

            <path d="M21 7l-9-4-9 4v6c0 5.55 3.84
            10.74 9 12 5.16-1.26 9-6.45 9-12V7z"/>

        </svg>

        Offers

    </a>

</div>

<!-- ===== CONTACT ===== -->

<div class="footer-section">

    <h3>Contact</h3>

    <a href="mailto:dnyaneshwarpande60@gmail.com"
       class="footer-link">

        <svg xmlns="http://www.w3.org/2000/svg"
             width="18"
             height="18"
             viewBox="0 0 24 24"
             fill="currentColor">

            <path d="M20 4H4a2 2 0 0 0-2 2v12a2 2 0 0
            0 2 2h16a2 2 0 0 0 2-2V6a2 2 0 0
            0-2-2zm0 4-8 5-8-5V6l8 5 8-5v2z"/>

        </svg>

        dnyaneshwarpande60@gmail.com

    </a>

    <a href="tel:+919075500301"
       class="footer-link">

        <svg xmlns="http://www.w3.org/2000/svg"
             width="18"
             height="18"
             viewBox="0 0 24 24"
             fill="currentColor">

            <path d="M6.62 10.79a15.053 15.053 0 0
            0 6.59 6.59l2.2-2.2a1 1 0 0 1 1-.24
            c1.12.37 2.33.57 3.59.57a1 1 0 0
            1 1 1V20a1 1 0 0 1-1 1C10.07 21
            3 13.93 3 5a1 1 0 0 1 1-1h3.5a1
            1 0 0 1 1 1c0 1.26.2 2.47.57
            3.59a1 1 0 0 1-.25 1l-2.2 2.2z"/>

        </svg>

        +91 9075500301

    </a>

    <div class="footer-link">

        <svg xmlns="http://www.w3.org/2000/svg"
             width="18"
             height="18"
             viewBox="0 0 24 24"
             fill="currentColor">

            <path d="M12 2C8.13 2 5 5.13 5 9c0
            5.25 7 13 7 13s7-7.75 7-13c0-3.87-3.13-7-7-7zm0
            9.5A2.5 2.5 0 1 1 12 6a2.5 2.5 0 0 1 0 5.5z"/>

        </svg>

        Maharashtra, India

    </div>

</div>

		<!-- ===== SOCIAL ===== -->

		<!-- SOCIAL -->

<div class="footer-section">

    <h3>Follow Us</h3>

    <!-- FACEBOOK -->

    <a href="#"
       class="social-link">

        <svg xmlns="http://www.w3.org/2000/svg"
             width="18"
             height="18"
             viewBox="0 0 24 24"
             fill="currentColor">

            <path d="M22 12a10 10 0 1 0-11.56 9.88v-6.99H7.9V12h2.54V9.8
            c0-2.5 1.49-3.89 3.77-3.89 1.09 0 2.23.19 2.23.19v2.46h-1.26
            c-1.24 0-1.63.77-1.63 1.56V12h2.78l-.44 2.89h-2.34v6.99A10
            10 0 0 0 22 12"/>

        </svg>

        Facebook

    </a>

    <!-- INSTAGRAM -->

    <a href="#"
       class="social-link">

        <svg xmlns="http://www.w3.org/2000/svg"
             width="18"
             height="18"
             viewBox="0 0 24 24"
             fill="currentColor">

            <path d="M7.75 2C4.57 2 2 4.57 2 7.75v8.5C2 19.43 4.57 22
            7.75 22h8.5C19.43 22 22 19.43 22 16.25v-8.5C22 4.57
            19.43 2 16.25 2h-8.5zm0 2h8.5A3.75 3.75 0 0 1 20
            7.75v8.5A3.75 3.75 0 0 1 16.25 20h-8.5A3.75 3.75 0 0 1 4
            16.25v-8.5A3.75 3.75 0 0 1 7.75 4zm8.75 1a1.25 1.25 0 1 0
            0 2.5 1.25 1.25 0 0 0 0-2.5zM12 7a5 5 0 1 0 0 10 5 5 0 0 0
            0-10zm0 2a3 3 0 1 1 0 6 3 3 0 0 1 0-6z"/>

        </svg>

        Instagram

    </a>

    <!-- TWITTER X -->

    <a href="#"
       class="social-link">

        <svg xmlns="http://www.w3.org/2000/svg"
             width="18"
             height="18"
             viewBox="0 0 24 24"
             fill="currentColor">

            <path d="M18.901 1.153h3.68l-8.04 9.19L24 22.847h-7.406
            l-5.8-7.584-6.639 7.584H.474l8.6-9.83L0
            1.153h7.594l5.243 6.932 6.064-6.932zm-1.293
            19.487h2.039L6.486 3.24H4.298z"/>

        </svg>

        Twitter X

    </a>

    <!-- YOUTUBE -->

    <a href="#"
       class="social-link">

        <svg xmlns="http://www.w3.org/2000/svg"
             width="18"
             height="18"
             viewBox="0 0 24 24"
             fill="currentColor">

            <path d="M23.5 6.2a3 3 0 0 0-2.1-2.1C19.5
            3.5 12 3.5 12 3.5s-7.5 0-9.4.6A3 3 0 0
            0 .5 6.2 31.6 31.6 0 0 0 0 12a31.6 31.6
            0 0 0 .5 5.8 3 3 0 0 0 2.1 2.1c1.9.6
            9.4.6 9.4.6s7.5 0 9.4-.6a3 3 0 0
            0 2.1-2.1A31.6 31.6 0 0 0 24 12a31.6
            31.6 0 0 0-.5-5.8zM9.75 15.5v-7l6
            3.5-6 3.5z"/>

        </svg>

        YouTube

    </a>

</div>

	</div>

	<!-- ===== BOTTOM ===== -->

	<div class="footer-bottom">

		© 2026 BookMyMovie | Designed & Developed by <b>Gyan Pande</b>

	</div>

</footer>