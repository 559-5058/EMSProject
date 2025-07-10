<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Employee Management System</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: Arial, sans-serif;
        }

        body {
            background-image:url('https://www.placements.codegnan.com/images/banner-girl.webp');
            background-size: cover;
            background-position: center;
            background-repeat: no-repeat;
            min-height: 100vh;
            padding-top: 150px;
            transition: background-image 0.5s ease;
        }

        .welcome-bar {
            position: fixed;
            top: 0;
            width: 100%;
            text-align: center;
            padding: 15px 0;
            font-size: 24px;
            font-weight: bold;
            color: whitesmoke;
            z-index: 1000;
        }
        .welcome-bar:hover{
            text-decoration: none;
            color: beige;
        }

        nav {
            position: fixed;
            top: 55px;
            width: 100%;
            display: flex;
            justify-content: center;
            gap: 30px;
            padding: 15px 0;
            z-index: 999;
            background-color: transparent;
        }

        nav a {
            color: white;
            text-decoration: none;
            font-weight: bold;
            font-size: 18px;
            cursor: pointer;
        }

        nav a:hover {
            text-decoration: underline;
            color: bisque;
        }

        .container,
        .section-content,
        .home-content {
            max-width: 500px;
            margin: 30px auto;
            background: rgba(255, 255, 255, 0.6);
            padding: 30px;
            border-radius: 25px;
            border: 2px solid #444;
            display: none;
            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.2);
        }
        .home-content:hover{
            text-decoration: none;
            color: black;
        }


        form {
            display: flex;
            flex-direction: column;
        }

        label {
            margin-top: 12px;
            font-weight: bold;
        }

        input,
        select,
        textarea {
            padding: 10px;
            margin-top: 5px;
            border: 1px solid #aaa;
            border-radius: 5px;
        }

        .gender {
            display: flex;
            justify-content: space-around;
            margin-top: 5px;
        }

        .gender label {
            font-weight: normal;
        }

        button {
            margin-top: 20px;
            padding: 12px;
            background-color: lightblue;
            color: white;
            border: none;
            border-radius: 25px;
            font-size: 16px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        button:hover {
            background-color: #005f9e;
        }

        .home-content {
            text-align: center;
            font-size: 24px;
            font-weight: bold;
            color: darkslategray;
        }
    </style>
</head>

<body>
    <div class="welcome-bar" >
        <h3>WELCOME TO EMPLOYEE MANAGEMENT SYSTEM</h3>
    </div>

    <nav>
        <a href="index.jsp">Home</a>
        <a href="register.jsp">Registration</a>
        <a href="login.jsp">Login</a>
        <a href="aboutus.jsp">About Us</a>
        <a href="contactus.jsp">Contact Us</a>
    </nav>

    <div id="home" class="container">
		<form action = 'emplogin'>
            <h1 style="text-align: center;">Login Page</h1>
            <% if(request.getAttribute("status") != null){ %>
            		<h1 style="text-align: center;"><%=request.getAttribute("status")%> </h1>
            <%} %>
            <label for="loginEmail">Email</label>
            <input type="text" name="email" required />

            <label for="loginPassword">Password</label>
            <input type="password" name="password" required />

            <button type="submit">Login</button>
        </form>
    </div>
    <div id="registration" class="container">
        
    </div>
    <div id="login" class="container">
        
    </div>

    <div id="admin" class="section-content">
        <h2>Admin Panel</h2>
        <p>Welcome, Administrator! Here you can manage employee records, approvals, and system settings.</p>
    </div>

    <div id="about" class="section-content">
        <h2>About Us</h2>
        <p>We are a leading HR and employee management solution provider. Our mission is to simplify workforce
            management using modern technologies.</p>
    </div>

    <div id="contact" class="section-content">
        <h2>Contact Us</h2>
        <p>Email: lavanya@codegnan.com<br>Phone: +91 9381283761<br>Address:Kadapa <br>Andhrapradesh, India</p>
    </div>

    

</body>

</html>