<%@ page import="Account.com.Account" %>
<%@ page import="Account.com.AccountDao" %>
<%@ page import="Account.com.LoginServlet" %>
<%@ page import="Bill.com.Bill" %>
<%@ page import="Bill.com.BillDao" %>
<%@ page import="Bill.com.DetailBillDao" %>
<%@ page import="Product.com.Category" %>
<%@ page import="Product.com.CategoryDao" %>
<%@ page import="Product.com.Item" %>
<%@ page import="Product.com.ProductDao" %>
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
    <script type="text/javascript">
        function delayer() {
            window.location = "login.jsp"
        }
    </script>
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
            <h1><a href="/index.jsp">Funny Store</a></h1>

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

                <li><a class="drop" href="gallery.jsp?page=1&action=getall">Manufacturer</a>
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
                <li class='active'><a href='/pages/cart.jsp'>Cart (0)</a></li>
                <%
                    }
                %>
            </ul>
        </nav>
        <!-- ################################################################################################ -->
    </header>
</div>
<div class="container">
    <br>
    <!-- Codrops top bar -->

    <%
        if (name == null) {
    %>
    <body onload=" window.setTimeout('delayer()', 3000)"></body>
    <%
        out.print("<font color=red>Please sign up 1st!!! Auto change to Login page after 3s or click <a href='login.jsp'>here.</font>");
    } else {
        ProductDao productDao = new ProductDao();

        Bill bill = new Bill();
        BillDao billdao = new BillDao();

        Account account = new Account();
        account = AccountDao.getName(name);

        HttpSession httpSession = request.getSession();
        List<Item> cart = (List<Item>) session.getAttribute("cart");

        bill.setName(account.getNameuser());
        bill.setAddress(account.getAddress());
        bill.setPhone(account.getPhone());
        bill.setProduct(cart.size());

        boolean rs = billdao.setBill(bill);

        if (rs == true) {
            response.sendRedirect("/pages/success.jsp?action=add");
        } else {
            response.sendRedirect("/pages/success.jsp?action=fail");
        }

        DetailBillDao detailBillDao = new DetailBillDao();
        List<Bill> bills = new ArrayList<Bill>();
        bills = billdao.getAll();
        for (int i = 0; i <= bills.size(); i++) {
            if (i == bills.size()) {
                for (Item item : cart) {
                    detailBillDao.setdetailBill(item.getP().getName(), bills.get(i - 1).getStt(), item.get_total());
                }
            }
        }
    %>
    <c:forEach var="it" items="${sessionScope.cart}">
        <c:set var="s" value="${it.p.stt}"/>
        <c:set var="q" value="${it._total}"/>
        <%
            productDao.isOrder((Integer) pageContext.getAttribute("s"), (Integer) pageContext.getAttribute("q"));
            httpSession.removeAttribute("cart");
            out.print("<font color=red>Check out completed!!!</font>");
        %>
    </c:forEach>
    <%
        }
    %>
</div>
<script src="../layout/scripts/jquery.min.js"></script>
<script src="../layout/scripts/jquery.backtotop.js"></script>
</body>
</html>