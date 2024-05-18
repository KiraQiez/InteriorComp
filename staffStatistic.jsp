<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Staff Statistic</title>
    <link rel="stylesheet" href="style.css">
    <style>
        /* BASE STYLES */
        :root {
            --clr-dark: #8b97b4;
            --clr-light: #f1f5f9;
            --clr-accent: #e11d48;
            --clr-line: #004cff;
        }

        .container {
            width: 80%;
            height: 600px;
            margin: 0 auto;
            /* border: 10px solid var(--clr-dark); */
            flex-direction: column;
            justify-content: space-evenly;
            align-content: center;
        }

        .item {
            width: 150px;
            height: 150px;
            background-color: #ffffff;
            padding: 1em;
            font-weight: 700;
            border-radius: 10px;
            justify-content: center;
        }

        /* END OF BASE STYLES */

        .container {
            display: flex;
            flex-wrap: wrap;
            gap: 1em;
        }

        .container table {
            height: 80%;
            width: 90%;
        }

        .item-1 {
            width: 90%;
        }

        .item-1 svg {
            height: 70px;
            float: left;
        }


        .item-2 {
            width: 100%;
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
        <table border="2">
            <tr>
                <td colspan="2">
                    <div class="item item-1">
                        <h2>Active Room</h2>
                        <svg xmlns="http://www.w3.org/2000/svg" width="82" height="136" viewBox="0 0 82 136"
                            fill="none">
                            <path
                                d="M0.864793 0.746414L0 1.61121L0.0576542 59.3794C0.115307 113.688 0.17296 117.205 0.634183 118.07C0.922447 118.531 1.26836 119.05 1.38367 119.108C1.9602 119.454 59.959 136 60.6508 136C61.6309 136 63.2452 134.905 63.7064 134.04C63.937 133.521 64.0523 131.445 64.0523 126.891V120.491L72.412 120.434C78.8114 120.376 80.8293 120.261 81.1175 119.973C81.4058 119.684 81.4635 108.961 81.4635 62.4926C81.4635 11.5851 81.4058 5.35864 81.0599 4.95507C80.714 4.60915 76.7359 4.32089 58.1141 3.22549C45.7187 2.53365 28.8841 1.55355 20.6974 1.09233C12.5107 0.631108 4.90049 0.169885 3.74743 0.0545797C1.78724 -0.060726 1.72959 -0.0607261 0.864793 0.746414ZM35.2259 17.0045L58.4023 23.9229V76.041V128.159L57.7681 128.044C57.4222 127.986 45.6034 124.527 31.5361 120.318L5.93824 112.708V60.4748V8.24128L8.99384 9.16373C10.7234 9.6826 22.4846 13.1994 35.2259 17.0045Z"
                                fill="black" />
                            <path
                                d="M48.6011 61.8007C48.2552 61.916 47.7363 62.3772 47.3904 62.8385C46.8139 63.5879 46.7562 63.7609 46.8715 71.9476L46.9292 80.3073L47.7363 80.9991C49.12 82.2098 51.2532 81.7486 52.0603 80.1343C52.4062 79.3848 52.4639 77.8859 52.4639 71.544C52.4639 64.4527 52.4639 63.8762 51.8873 63.0114C51.0802 61.6854 49.9271 61.2242 48.6011 61.8007Z"
                                fill="black" />
                        </svg>
                        <h1>32</h1>
                    </div>
                </td>

                <td colspan="3">
                    <div class="item item-2">
                        <h3>Active Room</h3>
                    </div>
                </td>
            </tr>

            <tr>
                <td>
                    <div class="item item-3">
                        <h3>Total Room</h3>
                        <h1>32</h1>
                    </div>
                </td>
                <td>
                    <div class="item item-4">
                        <h3>Empty Room</h3>
                        <h1>32</h1>
                    </div>
                </td>
                <td>
                    <div class="item item-5">
                        <h3>Unpaid Amount</h3>
                        <h1>32</h1>
                    </div>
                </td>
                <td>
                    <div class="item item-6">
                        <h3>Total Income</h3>
                        <h1>32</h1>
                    </div>
                </td>
                <td>
                    <div class="item item-7">
                        <h3>Pending Report</h3>
                        <h1>32</h1>
                    </div>
                </td>
            </tr>
        </table>
    </div>
</body>

</html>