<% // Get the session object HttpSession session1=request.getSession(false); if (session1==null ||
    session1.getAttribute("username")==null) { // No session or user not logged in, redirect to login page
    response.sendRedirect("login.jsp"); return; } // Get username from the session String username=(String)
    session.getAttribute("username"); %>


    <!DOCTYPE html>
    <html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Choose Room</title>
        <link rel="stylesheet" href="style.css">
        <style>
            /*ROOM*/

            body {
                background-image: none;
                background-color: #1D222D;
            }

            .title-ot {
                color: #FCBB6D;
                text-shadow: 0px 10px 4px #00000040;
                font-size: 50px;
                font-style: normal;
                font-weight: 800;
                line-height: normal;
                text-align: center;
            }

            .container {
                display: flex;
                height: 500px;
                gap: 48px;
                flex-grow: 1;
                justify-content: center;
                align-items: center;
            }


            .selector_room {
                width: 336px;
                height: 400px;
                background-color: #ffffff;
                border-radius: 20px;
            }

            .container img {
                width: 336px;
                height: 200px;
            }

            .container h3 {

                text-align: center;
            }

            .container p {
                text-align: center;
            }

            .btn_container {
                display: flex;
                justify-content: center;
                align-items: center;
                margin-top: 40px;
            }

            .btn_book {
                width: 150px;
                height: 50px;
                flex-shrink: 0;
                border-radius: 10px;
                background: #FCBB6D;
                font-size: 24px;
                color: #000000;
                transition: all 0.3s ease 0s;
            }

            .btn_book:hover,
            .btn_book:active {
                background: rgb(248, 202, 127);
                transition: all 0.3s ease 0s;
            }

            .pricing {
                color: #a0a0a0;
            }
        </style>

        <script>
            function setRoomType(roomType) {
                document.getElementById('roomType').value = roomType;
            }
        </script>
    </head>

    <body>

        <nav class="navbar">
            <div class="site-logo">
                <img src="resource/logo.svg">
                <h1>INTERIOR</h1>
            </div>

            <div class="nav-links">
                <ul>
                    <li><a href="home.jsp">Home</a></li>
                    <li><a class="active" href="#">Room</a></li>
                    <li><a href="report.jsp">Report</a></li>
                    <li><a href="profile.jsp">Profile</a></li>
                </ul>
            </div>
        </nav>

        <p class="title-ot">ROOM BOOKING</p>
        <form action="studentRoomBooking.jsp">
            <div class="container">
                <div class="selector_room">
                    <input type="hidden" id="roomType" name="roomType">
                    <img src="resource\4.png">
                    <h3>Normal Room</h3>
                    <br>
                    <p>Simple and minimalistic room</p>
                    <p class="pricing">From RM200/month</p>
                    <div class="btn_container">
                        <button type="submit" class="btn_book" onclick="setRoomType('Normal')">BOOK</button>
                    </div>

                </div>

                <div class="selector_room">
                    <img src="resource\3.png">
                    <h3>Deluxe Room</h3>
                    <br>
                    <p>Simple and minimalistic room</p>
                    <p class="pricing">From RM300/month</p>
                    <div class="btn_container">
                        <button type="submit" class="btn_book" onclick="setRoomType('Deluxe')">BOOK</button>
                    </div>
                </div>

                <div class="selector_room">
                    <img src="resource\2.png">
                    <h3>Luxury Room</h3>
                    <br>
                    <p>Simple and minimalistic room</p>
                    <p class="pricing">From RM500/month</p>
                    <div class="btn_container">
                        <button type="submit" class="btn_book" onclick="setRoomType('Luxury')">BOOK</button>
                    </div>
                </div>
            </div>
        </form>
    </body>

    </html>