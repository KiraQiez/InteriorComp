<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Room Management</title>
    <link rel="stylesheet" href="style.css">
    <style>
        /* BASE STYLES */
        @import url('https://fonts.googleapis.com/css2?family=Inter:wght@100..900&display=swap');
        /* END OF BASE STYLES */
        /* START NEW CSS FROM HERE */

        .container {
            display: flex;
            justify-content: center;
            align-items: center;
            flex-direction: column;
            gap: 2em;
        }

        .container h1 {
            color: #ffffff;
            font-family: 'Inter Black';
        }

        .scrollable-table {
            height: 500px;
            overflow-y: auto;
            width: 1000px;
            scroll-snap-type: y mandatory;
        }

        .scrollable-table>.table {
            width: 100%;
        }

        .table {
            border-collapse: separate;
            border-spacing: 0 10px;
            font-size: 14px;
            width: 900px;
            background-color: #ffffff;
            text-align: center;
            font-size: 20px;
        }

        .table th {
            color: #000000;
            background-color: #ffffff;
            position: sticky;
            top: 0px;
            font-family: 'Inter Black';
        }

        .table th,
        .table td {
            font-weight: normal;
            padding: 8px 8px;
        }

        .table tr {
            scroll-snap-align: start;
        }

        .active {
            text-align: center;
            font-family: Calibri;
            border-radius: 10px;
            align-content: center;
            background-color: #fffd88;
            color: #ffb30c;
            padding: 5px;
        }
    </style>
</head>

<body>
    <header>
        <nav class="navbar">
            <div class="site-logo">
                <svg class="logo" xmlns="http://www.w3.org/2000/svg" width="98" height="85" viewBox="0 0 98 85"
                    fill="none">
                    <path
                        d="M61.3353 7.62261L56.6131 2.59874C55.264 1.1635 53.0767 1.1635 51.7276 2.59874L2.44269 55.0316C1.09362 56.4669 1.09362 58.7939 2.44269 60.2291L7.16494 65.253C8.51402 66.6882 10.7013 66.6882 12.0504 65.253L61.3353 12.8201C62.6844 11.3849 62.6844 9.05786 61.3353 7.62261Z"
                        fill="#FCDE57" />
                    <path
                        d="M60.297 30.0619L55.4946 35.171C54.1869 36.5622 54.1869 38.8177 55.4946 40.2089L85.9131 72.5703C87.2207 73.9614 89.3408 73.9614 90.6485 72.5703L95.4508 67.4611C96.7585 66.07 96.7585 63.8145 95.4508 62.4233L65.0323 30.0619C63.7247 28.6707 61.6046 28.6707 60.297 30.0619Z"
                        fill="#FCDE57" />
                    <path
                        d="M70.1254 71.2642C70.799 71.9853 71.1771 72.9605 71.1771 73.9771C71.1771 74.9936 70.799 75.9688 70.1254 76.6899L65.4356 81.6792C64.7579 82.3958 63.8412 82.798 62.8857 82.798C61.9302 82.798 61.0135 82.3958 60.3357 81.6792L48.1516 68.7169C47.4739 68.0003 46.5572 67.5981 45.6017 67.5981C44.6462 67.5981 43.7295 68.0003 43.0518 68.7169L29.246 83.4045C28.5683 84.1211 27.6516 84.5233 26.6961 84.5233C25.7406 84.5233 24.8239 84.1211 24.1461 83.4045L19.7911 78.7713C19.1171 78.0514 18.739 77.0763 18.74 76.0601C18.741 75.0439 19.1209 74.0697 19.7963 73.3512L43.4361 48.2958C44.1152 47.5799 45.0325 47.1783 45.9886 47.1783C46.9446 47.1783 47.862 47.5799 48.5411 48.2958L70.1254 71.2642Z"
                        fill="#FCDE57" />
                </svg>
                <h1>INTERIOR</h1>
            </div>

            <ul class="nav_links">
                <li><a class="active" href="login.jsp">Home</a></li>
                <li><a href="login.jsp">Room</a></li>
                <li><a href="login.jsp">Report</a></li>
                <li><a href="login.jsp">Profile</a></li>
            </ul>
        </nav>
    </header>
    <div class="container">
        <div>
            <h1>Booking Management</h1>
        </div>

        <div class="scrollable-table">
            <table class="table">
                <thead>
                    <tr>
                        <th>No</th>
                        <th>Book ID</th>
                        <th>UserID</th>
                        <th>Room No</th>
                        <th>Room Capacity</th>
                        <th>Room Price</th>
                        <th>Status</th>
                        <th>Action</th>
                    </tr>
                </thead>

                <tbody>
                    <tr>
                        <td>1</td>
                        <td>A020</td>
                        <td>LUXURY</td>
                        <td>1</td>
                        <td>800</td>
                        <td>VACANT</td>
                        <td>
                            <a class="active" href="#">Active</a>
                        </td>
                    </tr>


                    </tr>
                </tbody>
            </table>
        </div>
    </div>

</body>

</html>