<%@ page import="Account.com.LoginServlet" %>
<%@ page import="Product.com.Category" %>
<%@ page import="Product.com.CategoryDao" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.util.List" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
    <script type="text/javascript">
        function delayer() {
            window.location = "/index.jsp"
        }
    </script>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="Login and Registration Form with HTML5 and CSS3"/>
    <meta name="keywords" content="html5, css3, form, switch, animation, :target, pseudo-class"/>
    <meta name="author" content="Codrops"/>
    <link rel="shortcut icon" href="../favicon.ico">
    <link rel="stylesheet" type="text/css" href="../css/demo.css"/>
    <link rel="stylesheet" type="text/css" href="../css/style.css"/>
    <link rel="stylesheet" type="text/css" href="../css/animate-custom.css"/>
</head>
<body onload=" window.setTimeout('delayer()', 300000)">
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
                <%
                    String name = LoginServlet.getLoginName(request, response);
                    if (name != null) {
                %>
                <a href="/pages/view.jsp"><%out.print("Hi, " + name);%></a>
                <li class='active'><a href='/pages/logout.jsp'>Log out</a></li>
                <%
                } else {
                %>
                <li class='active'><a href='/pages/login.jsp'>Login</a></li>
                <%
                    }
                    if (name != null && name.equals("admin")) {
                    } else {
                %>
                <c:set var="cart" value="${cart.size()}"/>
                <li class='active'><a href='/pages/cart.jsp'>Cart (${cart})</a></li>
                <%
                    }
                %>
            </ul>
        </nav>
        <!-- ################################################################################################ -->
    </header>
</div>
<div class="container">
    <!-- Codrops top bar -->
    <%
        HttpSession httpSession = request.getSession();
        if (httpSession.getAttribute("loginCount") == null) {
            response.sendRedirect("/pages/login.jsp");
        } else {
            if (httpSession.getAttribute("lasAccessedTime") == null) {
                long lasAccessedTime = session.getLastAccessedTime();
                httpSession.setAttribute("lasAccessedTime", lasAccessedTime);
                out.print("<font color=red>BLOCKED Login. Try again after 5 minutes.</font>");
            } else {
                long last = (Long) httpSession.getAttribute("lasAccessedTime");
                Date date = new Date();
                long currTime = date.getTime();
                long remainTime = currTime - last;

                if (remainTime >= 300000) {
                    session.invalidate();
                }
                out.print("<font color=red>BLOCKED Login. Try again after 5 minutes.</font>");
            }
        }
    %>
</div>
<script src="../layout/scripts/jquery.min.js"></script>
<script src="../layout/scripts/jquery.backtotop.js"></script>
</body>
</html>