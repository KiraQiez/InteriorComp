<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" src="home.css">
    <style>
        body {
            background: url(rsc/background.png);
            background-size: cover;
        }

        .logo {
            width: 98px;
            height: 70px;
            position: absolute;
            top: 10px;
            left: 10px;
        }

        .form {
            width: 700px;
            height: 500px;
            flex-shrink: 0;
            border-radius: 20px;
            background: #1D222D;
            margin-top: 170px;
            margin-left: 170px;
        }

        .form h1 {
            color: #ffffff;
            font-family: 'Inter Black';
            text-align: center;
            padding-top: 30px;
            border-bottom: 3px solid #ffffff;
            width: fit-content;
            margin: 0 auto;
        }

        .input-box {

            padding: 20px;
            margin: 30px 0;
            height: 50px;
            display: flex;
            justify-content: center;
            align-items: center;

        }

        .input-box input {
            width: 70%;
            height: 100%;
            background-color: #606060;
            color: #ffffff;
            font-size: 18px;
            font-family: 'Inter SemiBold';
            border-radius: 10px;
            padding: 20px;
        }

        .input-box input::placeholder {
            color: #ffffff;

        }

        .signup {
            width: 400px;
            height: 500px;
            flex-shrink: 0;
            border-radius: 20px;
            background: #1D222D;
            float: right;
            margin-right: 100px;
        }

        .signup h1 {
            color: #ffffff;
            font-family: 'Inter Black';
            text-align: center;
            margin-top: 140px;

        }

        .signup p {
            color: #FFF;
            font-family: Inter;
            font-size: 18px;
            font-style: normal;
            font-weight: 800;
            line-height: normal;
            text-align: center;
        }

        .btn-signin {
            margin: 30px 0px 0px 300px;
            padding: 10px 20px 10px 20px;
            font-size: 20px;
            border-radius: 10px;
            background-color: #fdae30;
            font-weight: bold;
            font-family: 'Inter';
        }

        .btn-signup {
            margin: 30px 0px 0px 150px;
            padding: 10px 20px 10px 20px;
            font-size: 20px;
            border-radius: 10px;
            background-color: #fdae30;
            font-weight: bold;
            font-family: 'Inter';
            text-decoration: none;
        }

        .btn-signup:hover,
        .btn-signin:hover {
            color: #FFFFFF;
            background-color: #000000;
            transition: all 0.3s ease 0s;
        }
    </style>
</head>

<body>

    <div class="signup">
        <h1>Hello Friend!</h1>
        <p>Did you have an account yet?</br>No register a new account now</p>

        <button class="btn-signup">SIGN UP</button>
    </div>

    <div class="form">
        <h1>Log In</h1>
        <div class="input-box">
            <input type="text" id="username" name="username" placeholder="Username" />
        </div>

        <div class="input-box">
            <input type="password" id="pass" name="password" minlength="8" required placeholder="Password" />
        </div>

        <div>
            <button class="btn-signin" type="submit">SIGN IN</button>
        </div>
    </div>


</body>

</html>