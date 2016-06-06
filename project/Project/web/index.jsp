<%@ page import="Account.com.LoginServlet" %>
<%@ page import="Product.com.Category" %>
<%@ page import="Product.com.CategoryDao" %>
<%@ page import="Product.com.Product" %>
<%@ page import="Product.com.ProductDao" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
    <title>Home</title>
    <meta charset="utf-8">
    <link href="../layout/styles/layout.css" rel="stylesheet" type="text/css" media="all">
</head>
<body id="top">
<!-- ################################################################################################ -->
<!-- ################################################################################################ -->
<!-- ################################################################################################ -->
<div class="wrapper row0 fixed">
    <header id="header" class="clear">
        <!-- ################################################################################################ -->
        <div id="logo" class="fl_left">
            <h1><a href="index.jsp">Solo Store</a></h1>

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
                <li class="active"><a href="index.jsp">Home</a></li>

                <li><a class="drop" href="pages/gallery.jsp?page=1&action=getall">Products</a>
                    <ul>
                        <%
                            CategoryDao categoryDao = new CategoryDao();
                            List<Category> categories = new ArrayList<Category>();
                            categories = categoryDao.getAll();
                        %>
                        <c:forEach var="i" items="<%=categories%>" begin="0">
                            <c:if test="${i._status == 1}">
                            <li><a href="pages/gallery.jsp?page=1&action=getcate&namepage=${i.catName}">${i.catName}</a>
                            </li>
                            </c:if>
                        </c:forEach>
                    </ul>
                </li>
                <li class="active"><a href="pages/aboutus.jsp">Contact Us</a></li>


                <%
                    String name = LoginServlet.getLoginName(request, response);
                    if (name != null) {
                %>
                <a href="pages/view.jsp"><%out.print("Hi, " + name);%></a>
                <li class='active'><a href='pages/logout.jsp'>Log out</a></li>
                <%
                } else {
                %>
                <li class='active'><a href='pages/login.jsp'>Login</a></li>
                <%
                    }
                    if (name != null && name.equals("admin")) {
                    } else {
                %>
                <c:set var="cart" value="${cart.size()}"/>
                <li class='active'><a href='pages/cart.jsp'>Cart (${cart})</a></li>
                <%
                    }
                %>
            </ul>
        </nav>
        <!-- ################################################################################################ -->
    </header>
</div>
<!-- ################################################################################################ -->
<!-- ################################################################################################ -->
<!-- ################################################################################################ -->
<div class="wrapper row2 bgded" style="background-image:url('../images/demo/backgrounds/2.png');">
    <div id="pageintro">
        <!-- ################################################################################################ -->
        <div class="title">
            <h2>SOLO STORE</h2>
        </div>
        <div id="breadcrumb" class="clear">
            <ul>
                <li><a href="index.jsp">Home</a></li>

            </ul>

        </div>
        <!-- ################################################################################################ -->
    </div>
</div>
<!-- ################################################################################################ -->
<!-- ################################################################################################ -->
<!-- ################################################################################################ -->
<div class="wrapper row3">
    <main class="container clear">

        <!-- container body -->
        <!-- ################################################################################################ -->

        <div id="gallery">
            <nav class="pagination">
                <%
                    ProductDao productDao = new ProductDao();
                    List<Product> products1 = new ArrayList<Product>();
                    List<Product> products2 = new ArrayList<Product>();
                    List<Product> products3 = new ArrayList<Product>();
                    products1 = productDao.getNewestPaging();
                    products2 = productDao.getMostBuy();
                    products3 = productDao.getMostView();
                    int count = 0;
                %>
                <figure class="overlay">
                    <header class="heading"></header>
                    <fmt:setLocale value="vi_VN"/>
                    <ul class="nospace clear">
                        <div class="btmspace-30" style="alignment: right">
                            <h1 style="float: left"><a href="pages/gallery.jsp?page=1&action=getnew">Newest Product</a></h1>
                        </div>
                        <li class="one_quarter first" style="width: 33%">
                            <c:forEach var="i" items="<%=products1%>">
                            <%
                                count++;
                                if (count == 1) {
                            %>
                            <a href="pages/product.jsp?stt=${i.stt}"><img src="${i._url}">

                                <p>${i.name}</p>

                                </a></li>
                        <%
                        } else if (count == 4 || count == 7) {
                        %>
                        <li class="one_quarter first" style="width: 33%"><a href="pages/product.jsp?stt=${i.stt}"><img
                                src="${i._url}">

                            <p>${i.name}</p>

                            </a></li>
                        <%
                        } else {
                        %>
                        <li class="one_quarter second" style="width: 33%"><a href="pages/product.jsp?stt=${i.stt}"><img
                                src="${i._url}">

                            <p>${i.name}</p>

                            </a></li>
                        <%
                            }
                        %>
                        </c:forEach>
                        <%
                            count = 0;
                        %>

                        <!--####################################################################### -->
















                        <!--####################################################################### -->

                        <div id="footer" style="alignment: right">
                            <h1 style="float: left"><a href="pages/gallery.jsp?page=1&action=getbuy">Most-Buy Product</a></h1>
                        </div>
                        <li class="one_quarter first" style="width: 33%">
                            <c:forEach var="i" items="<%=products2%>">
                            <%
                                count++;
                                if (count == 1) {
                            %>
                            <a href="pages/product.jsp?stt=${i.stt}"><img src="${i._url}">

                                <p>${i.name}</p>

                               </a></li>
                        <%
                        } else if (count == 4 || count == 7) {
                        %>
                        <li class="one_quarter first" style="width: 33%"><a href="pages/product.jsp?stt=${i.stt}"><img
                                src="${i._url}">

                            <p>${i.name}</p>

                            </a></li>
                        <%
                        } else {
                        %>
                        <li class="one_quarter second" style="width: 33%"><a href="pages/product.jsp?stt=${i.stt}"><img
                                src="${i._url}">

                            <p>${i.name}</p>

                            </a></li>
                        <%
                            }
                        %>
                        </c:forEach>
                        <%
                            count = 0;
                        %>
                        <div id="footer" style="alignment: right">
                            <h1 style="float: left"><a href="pages/gallery.jsp?page=1&action=getview">Most-View Product</a></h1>
                        </div>
                        <li class="one_quarter first" style="width: 33%">
                            <c:forEach var="i" items="<%=products3%>">
                            <%
                                count++;
                                if (count == 1) {
                            %>
                            <a href="pages/product.jsp?stt=${i.stt}"><img src="${i._url}">

                                <p>${i.name}</p>

                                </a></li>
                        <%
                        } else if (count == 4 || count == 7) {
                        %>
                        <li class="one_quarter first" style="width: 33%"><a href="pages/product.jsp?stt=${i.stt}"><img
                                src="${i._url}">

                            <p>${i.name}</p>

                            </a></li>
                        <%
                        } else {
                        %>
                        <li class="one_quarter second" style="width: 33%"><a href="pages/product.jsp?stt=${i.stt}"><img
                                src="${i._url}">

                            <p>${i.name}</p>

                            </a></li>
                        <%
                            }
                        %>
                        </c:forEach>
                    </ul>
                    <figcaption></figcaption>
                </figure>
            </nav>
        </div>
        <!-- ################################################################################################ -->
        <!-- ################################################################################################ -->


        <!-- ################################################################################################ -->
        <!-- / container body -->
        <div class="clear"></div>
    </main>
</div>
<!-- ################################################################################################ -->
<!-- ################################################################################################ -->
<!-- ################################################################################################ -->
<div class="wrapper row4">
    <figure class="clients">
        <!-- ################################################################################################ -->
        <ul class="clear">
            <li><a href="http://www.apple.com/iphone-se/"><img src="/images/demo/logos/1.jpg" alt=""></a></li>
            <li><a href="http://www.htc.com/vn/"><img src="/images/demo/logos/2.jpg" alt=""></a></li>
            <li><a href="http://www.sony.com.vn/"><img src="/images/demo/logos/3.jpg" alt=""></a></li>
            <li><a href="http://www.nokia.com/vi_vn"><img src="/images/demo/logos/4.jpg" alt=""></a></li>
            <li><a href="http://www.samsung.com/vn/home/"><img src="/images/demo/logos/5.jpg" alt=""></a></li>
        </ul>
        <!-- ################################################################################################ -->
    </figure>
</div>
<!-- ################################################################################################ -->
<!-- ################################################################################################ -->
<!-- ################################################################################################ -->
<div class="wrapper row5">
    <footer id="footer" class="clear">
        <!-- ################################################################################################ -->
        <div class="shout">
            <!-- ################################################################################################ -->

            <!-- ################################################################################################ -->
        </div>
        <!-- ################################################################################################ -->
        <div class="group">
            <div class="one_quarter first">
                <h6 class="title">Adress</h6>
                <address class="btmspace-15">
                    Solo Store<br>
                    227 Nguyễn Văn Cừ Q.5<br>
                    Tp.HCM<br>
                </address>
                <ul class="nospace">
                    <li class="btmspace-10"><span class="fa fa-phone"></span> +84 (090) 919 9xx</li>
                    <li><span class="fa fa-envelope-o"></span> 1359009@itec.hcmus.edu.vn</li>
                </ul>
            </div>
            <div class="one_quarter">
                <h6 class="title">Quick Links</h6>
                <ul class="nospace linklist">
                    <li><a href="/index.jsp">Home Page</a></li>

                    <li><a href="pages/gallery.jsp?page=1&action=getall">Products</a></li>

                    <li><a href="pages/aboutus.jsp">Contact Us</a></li>
                </ul>
            </div>
            <div class="one_quarter">
                <h6 class="title">From The Blog</h6>
                <article>
                    <h2 class="nospace"><a href="#"></a></h2>
                    <p></p>
                </article>
            </div>
            <div class="one_quarter">
                <h6 class="title">Keep In Touch</h6>

                <ul class="faico clear">
                    <li><a class="faicon-facebook" href="https://www.facebook.com/"><i class="fa fa-facebook"></i></a>
                    </li>
                    <li><a class="faicon-twitter" href="https://twitter.com/"><i class="fa fa-twitter"></i></a></li>
                    <li><a class="faicon-linkedin" href="https://www.linkedin.com/"><i class="fa fa-linkedin"></i></a>
                    </li>
                    <li><a class="faicon-google-plus" href="https://plus.google.com/"><i class="fa fa-google-plus"></i></a>
                    </li>
                    <li><a class="faicon-instagram" href="https://instagram.com/accounts/login/"><i
                            class="fa fa-instagram"></i></a></li>
                    <li><a class="faicon-tumblr" href="https://www.tumblr.com/"><i class="fa fa-tumblr"></i></a></li>
                </ul>
            </div>
        </div>
        <!-- ################################################################################################ -->
    </footer>
</div>
<!-- ################################################################################################ -->
<!-- ################################################################################################ -->
<!-- ################################################################################################ -->
<div class="wrapper row6">
    <div id="copyright" class="clear">
        <!-- ################################################################################################ -->
        <p class="fl_left">Designed By:   <a href="https://www.facebook.com/nguyen.hoa.9619/about">Nguyễn Vũ Hòa</a>   ---   <a href="https://www.facebook.com/minhquanle95">Lê Minh Quân</a>   ---   <a href="https://www.facebook.com/son.long.5">Trần Long Sơn</a>   ---   <a href="https://www.facebook.com/khaitran296">Trần Quang Khải</a>   ---   13BIT1</a>
        </p>

        <!-- ################################################################################################ -->
    </div>
</div>
<!-- ################################################################################################ -->
<!-- ################################################################################################ -->
<!-- ################################################################################################ -->
<a id="backtotop" href="#top"><i class="fa fa-chevron-up"></i></a>
<script src="/layout/scripts/jquery.min.js"></script>
<script src="/layout/scripts/jquery.backtotop.js"></script>
</body>
</html>