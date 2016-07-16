<%@ page import="Account.com.LoginServlet" %>
<%@ page import="Product.com.Category" %>
<%@ page import="Product.com.CategoryDao" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.List" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>About Us</title>
    <meta charset="utf-8">

    <link href="/layout/styles/layout.css" rel="stylesheet" type="text/css" media="all">
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
                    HttpSession httpSession = request.getSession();
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
<!-- ################################################################################################ -->
<!-- ################################################################################################ -->
<!-- ################################################################################################ -->
<div class="wrapper row0 bgded" style="background-image:url('/images/demo/backgrounds/7.jpg')">
    <div class="shout">
        <!-- ################################################################################################ -->

        <!-- ################################################################################################ -->
    </div>
</div>
<!-- ################################################################################################ -->
<!-- ################################################################################################ -->
<!-- ################################################################################################ -->

<!-- ################################################################################################ -->
<!-- ################################################################################################ -->
<!-- ################################################################################################ -->

<!-- ################################################################################################ -->
<!-- ################################################################################################ -->
<!-- ################################################################################################ -->
<div class="wrapper row3">
    <section class="container clear">
        <!-- container body -->
        <!-- ################################################################################################ -->
        <div class="group">


            <div class="one_half first">
                <article class="testimonial clear" style="height: 180px;">
                    <div class="one_third first"><img class="borderedbox inspace-5 circle"
                                                      src="/images/demo/testimonial/4.png" alt=""></div>
                    <div class="two_third">
                        <h3 class="nospace"><a href="#">Leader</a></h3>
                        <em><a href="https://www.facebook.com/son.long.5">Trần Long Sơn - 13BIT</em>

                        <p>ID: 1359037</p>

                        <p class="nospace"><span class="fa fa-phone"></span> 0909-190-9xx</p>
                    </div>
                </article>
            </div>
            <div class="one_half">
                <article class="testimonial clear">
                    <div class="one_third first"><img class="borderedbox inspace-5 circle"
                                                      src="/images/demo/testimonial/1.jpg" alt=""></div>
                    <div class="two_third">
                        <h3 class="nospace"><a href="#">Tester</a></h3>
                        <em><a href="https://www.facebook.com/LeviathanForteKage?fref=ts">Nguyễn Nguyên Thiên - 13BIT</em>

                        <p>ID: 1359038</p>

                        <p class="nospace"><span class="fa fa-phone"></span> 093-7151-1xx</p>
                    </div>
                </article>
            </div>
            <div class="one_half first">
                <article class="testimonial clear">
                    <div class="one_third first"><img class="borderedbox inspace-5 circle"
                                                      src="/images/demo/testimonial/2.jpg" alt=""></div>
                    <div class="two_third">
                        <h3 class="nospace"><a href="#">Database Designer</a></h3>
                        <em><a href="https://www.facebook.com/carl.jonhson.3705?fref=ts">Trần Đoàn Hải Phong - 13BIT</em>

                        <p>ID: 1159032</p>

                        <p class="nospace"><span class="fa fa-phone"></span> 093-233-24xx</p>
                    </div>
                </article>
            </div>
            <div class="one_half">
                <article class="testimonial clear">
                    <div class="one_third first"><img class="borderedbox inspace-5 circle"
                                                      src="/images/demo/testimonial/3.jpg" alt=""></div>
                    <div class="two_third">
                        <h3 class="nospace"><a href="#">Others</a></h3>
                        <em><a href="#"></em>

                        <p>ID: </p>

                        <p class="nospace"><span class="fa fa-phone"></span> 206-709-3100</p>
                    </div>
                </article>
            </div>
        </div>
        <!-- ################################################################################################ -->
        <!-- / container body -->
        <div class="clear"></div>
    </section>
</div>
<!-- ################################################################################################ -->
<!-- ################################################################################################ -->
<!-- ################################################################################################ -->
<!-- ########################################################################################### -->
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
                    <li class="btmspace-10"><span class="fa fa-phone"></span> +84 (093) 233 2xx</li>
                    <li><span class="fa fa-envelope-o"></span> 1359037@itec.hcmus.edu.vn</li>
                </ul>
            </div>
            <div class="one_quarter">
                <h6 class="title">Quick Links</h6>
                <ul class="nospace linklist">
                    <li><a href="/index.jsp">Home Page</a></li>

                    <li><a href="gallery.jsp?page=1&action=getall">Products</a></li>

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