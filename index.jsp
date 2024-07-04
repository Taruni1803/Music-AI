<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Music Academy Website</title>
    <link rel="stylesheet" href="style.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css"/>
    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/typed.js/2.0.11/typed.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/waypoints/4.0.1/jquery.waypoints.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/owl.carousel.min.js"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/assets/owl.carousel.min.css"/>
    <style>
        body {
            font-family: 'Roboto', sans-serif;
            text-align: center;
            padding: 20px;
        }
        h1{
            color:white;
        }

        #progress-container {
            width: 80%;
            margin: 50px auto;
            background-color:rgb(225, 235, 239);
            border: 1px solid #ddd;
            border-radius: 5px;
            padding: 10px;
        }

        #progress-bar {
            width: 0;
            height: 30px;
            background-color: #4caf50;
            border-radius: 5px;
            transition: width 0.5s ease-in-out;
        }

        .level {
            display: inline-block;
            margin: 0 10px;
            padding: 10px;
            background-color: #3498db;
            color: #fff;
            border-radius: 5px;
            cursor: pointer;
        }

        .locked {
            background-color: #ddd;
            color: #555;
            cursor: not-allowed;
        }
        
    </style>
</head>
<body>
    <div class="scroll-up-btn">
        <i class="fas fa-angle-up"></i>
    </div>
    <nav class="navbar">
        <div class="max-width">
            <div class="logo"><a href="#">Music<span>Academy.</span></a></div>
            <ul class="menu">
                <li><a href="#home" class="menu-btn">Home</a></li>
                <li><a href="#about" class="menu-btn">About</a></li>
                <li><a href="#schedules" class="menu-btn">Schedules</a></li>
                <li><a href="#progress" class="menu-btn">Progress</a></li>
                <li><a href="#event" class="menu-btn">Events</a></li>
                <li><a href="#contact" class="menu-btn">Contact</a></li>
            </ul>
            <div class="menu-btn">
                <i class="fas fa-bars"></i>
            </div>
        </div>
    </nav>

    <!-- home section start -->
    <section class="home" id="home">
        <div class="max-width">
            <div class="home-content">
                <div class="text-1">WELCOME TO</div>
                <div class="text-2">MUSIC ACADEMY</div>
                <div class="text-3"><span class="typing"></span></div>
                <a href="login_mcad.html">Login</a>
            </div>
        </div>
    </section>

    <!-- about section start -->
    <section class="about" id="about">
        <div class="max-width">
            <h2 class="title">About our Music Academy</h2>
            <div class="about-content">
                <div class="column left">
                    <img src="aboutma.jpeg" alt="">
                </div>
                <div class="column right">
                    <div class="text"><span class="typing-2"></span></div>
                    <p>
                        Welcome to our music academy, where passion meets melody! Established with the aim of nurturing musical talent, our academy provides a supportive environment for individuals of all ages and skill levels.
                      </p>
                      <p>
                        At our academy, we believe that music is a universal language that transcends boundaries. Whether you're a beginner or an experienced musician, our dedicated instructors are here to guide you on your musical journey.
                      </p>
                    <a href="#">Explore more</a>
                </div>
            </div>
        </div>
    </section>

    <!-- services section start -->
    <section class="Schedules" id="schedules">
        <div class="max-width">
            <h2 class="title">Schedule</h2>
            
            <div class="serv-content">
                <div class="card">
                    <div class="box">
                        <i class="fas fa-music"></i>
                        <div class="text">Friday</div>
                        <p>Evening<br>5 - 8 PM(IST)</p><br>
                    </div>
                </div>
                <div class="card">
                    <div class="box">
                        <i class="fas fa-calendar-alt"></i>
                        <div class="text">Saturday</div>
                        <p>Evening<br>6 - 7 PM(IST)</p><br>
                    </div>
                </div>
                <div class="card">
                    <div class="box">
                        <i class="fas fa-sun"></i>
                        <div class="text">Sunday</div>
                        <p>Morning<br>6 - 8 AM(IST)</p>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- skills section start -->
    <section class="Progress" id="progress">
        <div class="max-width">
            <h2 class="title">Your Progress</h2>
            <div class="skills-content">
                <div class="column left">
                    <h1>Your Progress</h1>

    <div id="progress-container">
        <div id="progress-bar"></div>
    </div>

    <div class="levels">
        <div class="level" onclick="unlockLevel(1)">Level 1</div>
        <div class="level locked">Level 2</div>
        <div class="level locked">Level 3</div>
    </div>
    <script>
        // Function to extract progress level from URL parameters
        function getParameterByName(name, url) {
            if (!url) url = window.location.href;
            name = name.replace(/[\[\]]/g, "\\$&");
            var regex = new RegExp("[?&]" + name + "(=([^&#]*)|&|#|$)"),
                results = regex.exec(url);
            if (!results) return null;
            if (!results[2]) return '';
            return decodeURIComponent(results[2].replace(/\+/g, " "));
        }

        // Function to unlock levels based on progress level
        function unlockLevel(levelNumber) {
            var progressLevel = getParameterByName('progressLevel');
            if (progressLevel >= levelNumber) {
                var progress = levelNumber * 33.33;
                document.getElementById('progress-bar').style.width = progress + '%';

                var levels = document.querySelectorAll('.level');
                for (var i = 0; i < levels.length; i++) {
                    if (i < levelNumber) {
                        levels[i].classList.remove('locked');
                        levels[i].removeAttribute('onclick');
                    } else {
                        levels[i].classList.add('locked');
                        levels[i].setAttribute('onclick', 'alert("Complete previous levels first.")');
                    }
                }
            } else {
                alert("Complete previous levels first.");
            }
        }

        // Call the function on page load
        document.addEventListener('DOMContentLoaded', function () {
            var progressLevel = getParameterByName('progressLevel');
            if (progressLevel) {
                // Unlock levels based on the progress level
                unlockLevel(progressLevel);
            }
        });
    </script>

    <!-- teams section start -->
    <section class="event" id="event">
        <div class="max-width">
            <h2 class="title">Events</h2>
            <div class="carousel owl-carousel">
                <div class="card">
                    <div class="box">
                        <img src="images/profile-1.jpeg" alt="">
                        <div class="text">Sur tal</div>
                       
                    </div>
                </div>
                <div class="card">
                    <div class="box">
                        <img src="profile2.jpeg" alt="">
                        <div class="text">Sangeeth ka swar</div>
                        
                    </div>
                </div>
                <div class="card">
                    <div class="box">
                        <img src="profile3.jpeg" alt="">
                        <div class="text">Rock band</div>
                        
                    </div>
                </div>
                <div class="card">
                    <div class="box">
                        <img src="profile4.jpeg" alt="">
                        <div class="text">Fusion band</div>
                        
                    </div>
                </div>
                <div class="card">
                    <div class="box">
                        <img src="profile5.jpeg" alt="">
                        <div class="text">Vocal troop</div>
                        
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- contact section start -->
    <section class="contact" id="contact">
        <div class="max-width">
            <h2 class="title">Contact Us</h2>
            <div class="contact-content">
                <div class="column left">
                    <div class="text"></div>
                    <p>You can reach us at any time.</p>
                    <div class="icons">
                        <div class="row">
                            <i class="fas fa-user"></i>
                            <div class="info">
                                <div class="head">Name</div>
                                <div class="sub-title">David Copperfield</div>
                            </div>
                        </div>
                        <div class="row">
                            <i class="fas fa-map-marker-alt"></i>
                            <div class="info">
                                <div class="head">Address</div>
                                <div class="sub-title">Jubliee Hills, Telangana</div>
                            </div>
                        </div>
                        <div class="row">
                            <i class="fas fa-envelope"></i>
                            <div class="info">
                                <div class="head">Email</div>
                                <div class="sub-title">abc@gmail.com</div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="column right">
                    <div class="text">Message Us</div>
                    <form action="#">
                        <div class="fields">
                            <div class="field name">
                                <input type="text" placeholder="Name" required>
                            </div>
                            <div class="field email">
                                <input type="email" placeholder="Email" required>
                            </div>
                        </div>
                        <div class="field">
                            <input type="text" placeholder="Subject" required>
                        </div>
                        <div class="field textarea">
                            <textarea cols="30" rows="10" placeholder="Message.." required></textarea>
                        </div>
                        <div class="button-area">
                            <button type="submit">Send message</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </section>

    <!-- footer section start -->
    <footer>
        <span>Created By Taruni</a> | <span class="far fa-copyright"></span> 2024 All rights reserved.</span>
    </footer>

    <script src="script.js"></script>
</body>
</html>
