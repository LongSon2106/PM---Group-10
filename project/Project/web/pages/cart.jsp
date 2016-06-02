<%@ page import="Account.com.LoginServlet" %>
<%@ page import="Product.com.Category" %>
<%@ page import="Product.com.CategoryDao" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.List" %>
<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Gallery</title>
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
                <a href="view.jsp"><%out.print("Hi, " + name);%></a>
                <li class='active'><a href='logout.jsp'>Log out</a></li>
                <%
                } else {
                %>
                <li class='active'><a href='login.jsp'>Login</a></li>
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
            <h2>Giỏ hàng</h2>
        </div>
        <div id="breadcrumb" class="clear">
            <ul>
                <li><a href="/index.jsp">Home</a></li>
                <li><a href="/pages/gallery.jsp?page=1&action=getall">Gallery</a></li>
                <li><a href="cart.jsp">Cart</a></li>

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
            <figure class="overlay">
                <header class="heading"></header>
                <ul class="nospace clear">
                    <%
                        HttpSession httpSession = request.getSession();
                        if (httpSession.getAttribute("cart") == null) {
                    %>
                    <p>No item in this cart</p>
                    <%
                    } else {
                    %>
                    <c:set var="s" value="${cart.size()}"/>
                    <%
                        if ((Integer) pageContext.getAttribute("s") == 0) {
                            session.removeAttribute("cart");
                    %>
                    <p>No item in this cart</p>
                    <%
                    } else {
                    %>
                    <fmt:setLocale value="vi_VN"/>
                    <p>You have selected <a href=""> ${s}</a> items .</p>
                    <c:forEach var="it" items="${sessionScope.cart}">
                        <c:set var="money" value="${money + it.p.price * it._total}"/>
                        <fieldset>
                            <li class="one_quarter first"><img src="${it.p._url}" alt=""></li>
                            <div id="footer" style="height: 0px">
                                <form class="btmspace-30" method="post"
                                      action="/ShoppingCart?stt=${it.p.stt}&action=delete"
                                      onclick="return confirm('Are u sure?')">

                                    <pre>    <button type="submit" value="submit">X</button></pre>
                                </form>
                            </div>
                            <li class="one_quarter" style="float: right">Price: <fmt:formatNumber value="${it.p.price * it._total}"
                                                                                                  type="currency"/></li>
                            <li class="one_quarter" style="float: right">${it.p.name}</li>
                            <form class="btmspace-30" method="post" action="/ShoppingCart?stt=${it.p.stt}&action=save">

                                <div id="footer" style="height: 0px">
                                    <pre>    <button type="submit" value="submit"
                                                     onclick="return confirm('Are u sure?')">Save
                                    </button></pre>
                                </div>
                                <pre><div style="overflow: hidden"><p style="float: left">    Quantity: <input
                                        type="number" name="quantity" id="quantity" value="${it._total}"
                                        style="width: 40px; float: right" min="0"></p></div></pre>


                            </form>
                        </fieldset>
                        <hr>

                    </c:forEach>
                    <p style="float: right">Sum: <fmt:formatNumber value="${money}" type="currency"/></p>
                    <div id="footer" style="float: right">
                        <form class="btmspace-30" method="post" action="checkout.jsp">
                            <button type="submit" value="submit" style="float: right">Check out</button>
                        </form>
                    </div>
                    <%
                            }
                        }
                    %>


                </ul>
                <figcaption></figcaption>
            </figure>
        </div>
        <!-- ################################################################################################ -->
        <!-- ################################################################################################ -->
        <nav class="pagination">
            <ul>


            </ul>
        </nav>
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

                    <li><a href="gallery.jsp?page=1&action=getall">Manufacturer</a></li>

                    <li><a href="aboutus.jsp">Contact Us</a></li>
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