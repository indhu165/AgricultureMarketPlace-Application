<html>
<head>
<title>Register Page</title>

<style>
body{
    margin:0;
    font-family:Arial;
    background:linear-gradient(135deg,#e0f7fa,#fff3e0);
}

.box{
    width:450px;
    margin:30px auto;
    background:white;
    padding:25px;
    border-radius:15px;
    box-shadow:0 8px 20px rgba(0,0,0,0.2);
}

h2{
    text-align:center;
    color:#2c3e50;
}

input, select, textarea{
    width:100%;
    padding:10px;
    margin:6px 0;
    border-radius:8px;
    border:1px solid #ccc;
}

input[type=submit]{
    background:green;
    color:white;
    border:none;
    cursor:pointer;
    font-size:16px;
}

input[type=submit]:hover{
    background:darkgreen;
}
</style>
</head>

<body>

<div class="box">

<h2>NEW USER REGISTRATION</h2>

<form action="registerprocess.jsp" method="post">

<select name="role" required>
    <option value="">Select Role</option>
    <option value="Farmer">Farmer</option>
    <option value="Customer">Customer</option>
</select>

<input type="text" name="username" placeholder="Enter Name" required>

<input type="password" name="password" placeholder="Enter Password" required>

<input type="text" name="email" placeholder="Enter Email" required>

<input type="text" name="phone" placeholder="Enter Phone" required>

<input type="date" name="dob" required>

<select name="gender" required>
    <option value="">Gender</option>
    <option>Male</option>
    <option>Female</option>
</select>

<textarea name="address" placeholder="Address (only for customer)"></textarea>

<input type="submit" value="REGISTER">

</form>

</div>

</body>
</html>