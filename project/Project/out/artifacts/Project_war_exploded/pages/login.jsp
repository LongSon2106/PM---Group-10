<%@ page import="Product.com.Category" %>
<%@ page import="Product.com.CategoryDao" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<!--[if lt IE 7 ]> <html lang="en" class="no-js ie6 lt8"> <![endif]-->
<!--[if IE 7 ]> <html lang="en" class="no-js ie7 lt8"> <![endif]-->
<!--[if IE 8 ]> <html lang="en" class="no-js ie8 lt8"> <![endif]-->
<!--[if IE 9 ]> <html lang="en" class="no-js ie9"> <![endif]-->
<!--[if (gt IE 9)|!(IE)]><!-->
<html lang="en" class="no-js"> <!--<![endif]-->
<head>
    <link rel="stylesheet" type="text/css" href="../layout/styles/layout.css">
    <meta charset="UTF-8"/>
    <!-- <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">  -->
    <title>Login and Registration </title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="Login and Registration Form with HTML5 and CSS3"/>
    <meta name="keywords" content="html5, css3, form, switch, animation, :target, pseudo-class"/>
    <meta name="author" content="Codrops"/>
    <link rel="shortcut icon" href="../favicon.ico">
    <link rel="stylesheet" type="text/css" href="../css/demo.css"/>
    <link rel="stylesheet" type="text/css" href="../css/style.css"/>
    <link rel="stylesheet" type="text/css" href="../css/animate-custom.css"/>
</head>
<body>
<div class="wrapper row0 fixed">
    <header id="header" class="clear">
        <!-- ################################################################################################ -->
        <div id="logo" class="fl_left">
            <h1><a href="/index.jsp">Solo Store</a></h1>

            <form class="btmspace-30" method="post" action="/SearchServlet" id="footer"
                  style="width: 323px; padding-bottom: 37px">

                <input class="btmspace-15" type="search" value="" placeholder="Name product" required="required"
                       name="name" style="width: 323px; float: left;">
                <button type="submit" value="submit" hidden="hidden">Search</button>

            </form>
        </div>
        <!-- ################################################################################################ -->
        <nav id="mainav" class="fl_right">
            <ul class="clear">
                <li class="active"><a href="/index.jsp">Home</a></li>

                <li><a class="drop" href="gallery.jsp?page=1&action=getall">Products</a>
                    <ul>
                        <%
                            CategoryDao categoryDao = new CategoryDao();
                            List<Category> categories = new ArrayList<Category>();
                            categories = categoryDao.getAll();
                        %>
                        <c:forEach var="i" items="<%=categories%>" begin="0">
                            <c:if test="${i._status == 1}">
                                <li><a href="gallery.jsp?page=1&action=getcate&namepage=${i.catName}">${i.catName}</a>
                                </li>
                            </c:if>
                        </c:forEach>
                    </ul>
                </li>
                <li class="active"><a href="aboutus.jsp">Contact Us</a></li>
                <c:set var="cart" value="${cart.size()}"/>
                <li class='active'><a href='/pages/cart.jsp'>Cart (${cart})</a></li>

            </ul>
        </nav>
        <!-- ################################################################################################ -->
    </header>
</div>
<div class="container">
    <!-- Codrops top bar -->

    <%
        HttpSession httpSession = request.getSession();
        if (httpSession.getAttribute("loginCount") != null) {
            int loginCount = (Integer) httpSession.getAttribute("loginCount");
            if (loginCount > 2) {
                response.sendRedirect("/pages/wait.jsp");
            } else {
                out.println("<font color=red>Either user name or password is wrong. (" + loginCount + " times) </font>");
            }
        }
    %>
    <section>
        <div id="container_demo">
            <!-- hidden anchor to stop jump http://www.css3create.com/Astuce-Empecher-le-scroll-avec-l-utilisation-de-target#wrap4  -->

            <br>
            <a class="hiddenanchor" id="toregister"></a>
            <a class="hiddenanchor" id="tologin"></a>

            <div id="wrapper">
                <div id="login" class="animate form">
                    <form action="/LoginServlet" autocomplete="on"
                          method="post">
                        <h1>Log in</h1>

                        <p>
                            <label for="username" class="uname" data-icon="u"> Your username </label>
                            <input id="username" name="username" required="required" type="text"
                                   placeholder="myusername" autofocus="autofocus" pattern="[A-Za-z0-9]+"
                                   title="No special character!"/>
                        </p>

                        <p>
                            <label for="password" class="youpasswd" data-icon="p"> Your password </label>
                            <input id="password" name="password" required="required" type="password"
                                   placeholder="eg. X8df!90EO"/>
                        </p>

                        <p class="keeplogin">
                            <input type="checkbox" name="loginkeeping" id="loginkeeping" value="loginkeeping"
                                   checked="checked"/>
                            <label for="loginkeeping">Keep me logged in</label>
                        </p>

                        <p class="login button">
                            <input type="submit" value="Login"/>
                        </p>

                        <p class="change_link">
                            Not a member yet ?
                            <a href="#toregister" class="to_register">Join us</a>
                        </p>
                    </form>
                </div>

                <div id="register" class="animate form">
                    <form action="/RegisterServlet" autocomplete="on" method="post">
                        <h1> Sign up </h1>

                        <p>
                            <label for="username" class="nameu" data-icon="u">Your name</label>
                            <input id="nameuser" name="nameuser" required="required" type="text"
                                   placeholder="mysuperusername" pattern="[a-zA-Z ]+" title="No special character"/>
                        </p>

                        <p>
                            <label for="address" class="add" data-icon="u">Your address</label>
                            <input id="address" name="address" required="required" type="text"
                                   placeholder="28 street, district, city" pattern="[a-zA-Z0-9 ]+"
                                   title="No special character"/>
                        </p>

                        <p>
                            <label for="phone" class="phone" data-icon="u">Your phone</label>
                            <input id="phone" name="phone" required="required" type="tel" placeholder="0909092975"
                                   pattern="[0-9]{7,10}" title="Just number-phone and min is 7 numbers"/>
                        </p>

                        <p>
                            <label for="usernamesignup" class="uname" data-icon="u">Your username</label>
                            <input id="usernamesignup" name="usernamesignup" required="required" type="text"
                                   placeholder="mysuperusername690" pattern="[a-zA-Z0-9]+"
                                   title="No special character"/>
                        </p>

                        <p>
                            <label for="emailsignup" class="youmail" data-icon="e"> Your email</label>
                            <input id="emailsignup" name="emailsignup" required="required" type="email"
                                   placeholder="mysupermail@mail.com"/>
                        </p>

                        <p>
                            <label for="passwordsignup" class="youpasswd" data-icon="p">Your password </label>
                            <input id="passwordsignup" name="passwordsignup" required="required" type="password"
                                   placeholder="eg. X8df!90EO"/>
                        </p>

                        <p>
                            <label for="passwordsignup_confirm" class="youpasswd" data-icon="p">Please confirm your
                                password </label>
                            <input id="passwordsignup_confirm" name="passwordsignup_confirm" required="required"
                                   type="password" placeholder="eg. X8df!90EO"/>
                        </p>

                        <p class="signin button">
                            <input type="submit" value="Sign up"/>
                        </p>

                        <p class="change_link">
                            Already a member ?
                            <a href="#tologin" class="to_register"> Go and log in </a>
                        </p>
                    </form>
                </div>

            </div>
        </div>
    </section>
</div>
<script src="../layout/scripts/jquery.min.js"></script>
<script src="../layout/scripts/jquery.backtotop.js"></script>
</body>
</html>