<%@ page import="Account.com.Account" %>
<%@ page import="Account.com.AccountDao" %>
<%@ page import="Account.com.LoginServlet" %>
<%@ page import="Product.com.Category" %>
<%@ page import="Product.com.CategoryDao" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title>Manage Membes</title>
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

                <li><a class="drop" href="/pages/gallery.jsp?page=1&action=getall">Products</a>
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
                    AccountDao accountDao = new AccountDao();
                    String detailname = request.getParameter("user");
                    Account detailaccount = accountDao.getName(detailname);
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
<div class="wrapper row2 bgded" style="background-image:url('../images/demo/backgrounds/5.png');">
    <div id="pageintro">
        <!-- ################################################################################################ -->
        <div class="title">
            <h2>Account</h2>
        </div>
        <div id="breadcrumb" class="clear">
            <ul>
                <li><a href="/index.jsp">Home</a></li>
                <li><a href="view.jsp">Manage</a></li>
                <%
                    if (detailname == null) {
                %>
                <li><a href="user.jsp">Members</a></li>
                <%
                } else {


                %>
                <li><a href="user.jsp">Members</a></li>
                <li><a href="user.jsp?user=<%=detailname%>"><%=detailname%>
                </a></li>
                <%
                    }
                %>
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

            </nav>
            <figure class="overlay">
                <header class="heading"></header>
                <ul class="nospace clear">
                    <%
                        int countA = 0, countI = 0;
                        List<Account> accounts = new ArrayList<>();
                        accounts = accountDao.getAll();

                    %>
                    <c:forEach var="i" items="<%=accounts%>" begin="0">
                        <c:if test="${i.status == 1}">
                            <%
                                countA++;
                            %>
                        </c:if>
                        <c:if test="${i.status == 0}">
                            <%
                                countI++;
                            %>
                        </c:if>
                    </c:forEach>
                    <%
                        if (detailname == null) {
                    %>
                    <p>Sum of Members: <%=accounts.size()%> people</p>

                    <p>Official Members: <%=countA%> people</p>

                    <p>Non-Official Members: <%=countI%> people</p>
                    <pre><h4>Username                                                 Registed Date                                           Status</h4></pre>
                    <c:forEach var="i" items="<%=accounts%>" begin="0">
                        <div id="comments">
                            <form action="/UpdateServlet" method="post">
                                <div class="one_third first">
                                    <input type="text" name="name" id="name" value="${i.username}" size="22"
                                           onClick="window.location.href='user.jsp?user=${i.username}'"
                                           readonly="readonly">
                                </div>
                                <div class="one_third">

                                    <input type="text" name="email" id="email" value="${i.dateRes}" size="22"
                                           disabled="">
                                </div>
                                <div class="one_third">
                                    <c:if test="${i.status == 0}">
                                        <input name='active' type='submit' value='Active' STYLE="color: red">
                                        <input name='delete' type='submit' value='Delete'
                                               onclick="return confirm('Are u sure?')">
                                    </c:if>
                                    <c:if test="${i.status == 1}">
                                        <input name='inactive' type='submit' value='Inactive'>
                                        <input name='delete' type='submit' value='Delete'
                                               onclick="return confirm('Are u sure?')">
                                    </c:if>
                                </div>
                            </form>
                        </div>
                    </c:forEach>
                    <%
                    } else {
                    %>
                    <div id="comments">
                        <form action="/UpdateServlet" method="post">
                            <div class="one_third first">
                                <label for="name">Username</label>
                                <input type="text" name="name" id="name" value="<%=detailaccount.getUsername()%>"
                                       size="22" readonly>
                            </div>
                            <div class="one_third">
                                <label for="password">Password</label>
                                <input type="text" name="password" id="password"
                                       value="<%=detailaccount.getPassword()%>" size="22" readonly>
                            </div>
                            <div class="one_third">
                                <label for="email">Email</label>
                                <input type="text" name="email" id="email" value="<%=detailaccount.getEmail()%>"
                                       size="22" readonly>
                            </div>
                            <div class="one_third first">
                                <label for="nameuser">Name user</label>
                                <input type="text" name="nameuser" id="nameuser"
                                       value="<%=detailaccount.getNameuser()%>" size="22" readonly>
                            </div>
                            <div class="one_third">
                                <label for="address">Address</label>
                                <input type="text" name="address" id="address" value="<%=detailaccount.getAddress()%>"
                                       size="22" readonly>
                            </div>
                            <div class="one_third">
                                <label for="phone">Phone</label>
                                <input type="text" name="phone" id="phone" value="<%=detailaccount.getPhone()%>"
                                       size="22" readonly>
                            </div>
                            <div class="one_third first">
                                <label for="date">Registed Date</label>
                                <input type="text" name="date" id="date" value="<%=detailaccount.getDateRes()%>"
                                       size="22" readonly>
                            </div>
                            <div class="one_third">
                                <label for="datelast">Last Login</label>
                                <input type="text" name="datelast" id="datelast"
                                       value="<%=detailaccount.getDateLast()%>" size="22" readonly>
                            </div>
                            <div class="one_third first">
                                <c:if test="<%=detailaccount.getStatus().equals(0)%>">
                                    <input name='activein' type='submit' value='Active' STYLE="color: red">
                                    <input name='deletein' type='submit' value='Delete'
                                           onclick="return confirm('Are u sure?')">
                                </c:if>
                                <c:if test="<%=detailaccount.getStatus().equals(1)%>">
                                    <input name='inactivein' type='submit' value='Inactive'>
                                    <input name='deletein' type='submit' value='Delete'
                                           onclick="return confirm('Are u sure?')">
                                </c:if>
                            </div>
                        </form>
                    </div>


                </ul>
                <p><a class="btn" href="user.jsp" onclick="window.location.href='/user.jsp'">Back</a></p>
                <%
                    }
                %>
                <figcaption></figcaption>
            </figure>
        </div>
        <!-- ################################################################################################ -->
        <!-- ################################################################################################ -->
        <nav class="pagination">

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
        <p class="fl_left">Designed By:   <a href="#">Trần Long Sơn</a>   ---   <a href="#5">Nguyễn Nguyên Thiên</a>   ---   <a href="#">Trần Đoàn Hải Phong</a>   ---   13BIT1</a>
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