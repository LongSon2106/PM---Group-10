<%@ page import="Account.com.AccountDao" %>
<%@ page import="Account.com.LoginServlet" %>
<%@ page import="Comment.com.Comment" %>
<%@ page import="Comment.com.CommentDao" %>
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
    <title>Product</title>
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
                <li><a href="/index.jsp">Home</a></li>

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
                <a href="view.jsp"><%out.print("Hi, " + name);%></a>
                <li class='active'><a href='logout.jsp'>Log out</a></li>
                <%
                } else {
                %>
                <li class='active'><a href='login.jsp'>Login</a></li>
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
<div class="wrapper row2 bgded" style="background-image:url('../images/demo/backgrounds/6.png');">
    <div id="pageintro">
        <!-- ################################################################################################ -->
        <div class="title">
            <h2>Product</h2>
        </div>
        <div id="breadcrumb" class="clear">
            <ul>
                <li><a href="/index.jsp">Home</a></li>
                <li><a href="/pages/gallery.jsp?page=1&action=getall">Gallery</a></li>
                <li><a href="/pages/gallery.jsp?page=1&action=getall">Product</a></li>
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


                <ul class="nospace clear">
                    <%
                        ProductDao productDao = new ProductDao();
                        Product product = productDao.getByID(Integer.parseInt(request.getParameter("stt")));
                        productDao.isView(Integer.parseInt(request.getParameter("stt")));
                    %>
                    <fmt:setLocale value="vi_VN"/>

                    <li class="one_quarter first"><img src="<%=product.get_url()%>" alt=""></li>
                    <center><li class="one_quarter first" id="footer" style="float: left; width: 221px;padding-bottom: 0px;margin-bottom: 0px;"><h3><%=product.getName()%></h3></li></center>
                    <c:if test="<%=product.get_status().equals(1)%>">
                        <c:choose>
                            <c:when test="<%=product.getQuantity() == 0%>">
                                <center><li class="one_quarter first" id="footer" style="float: left; width: 221px">
                                    <form class="btmspace-30" method="post"
                                          action="/ShoppingCart?stt=<%=product.getStt()%>&action=addcart">
                                        <button type="submit" value="submit" disabled="disabled">Out of stack</button>
                                    </form>
                                </li></center>
                            </c:when>
                            <c:when test="<%=product.getQuantity() > 0%>">
                                <center><li class="one_quarter first" id="footer" style="float: left; width: 221px">
                                    <form class="btmspace-30" method="post"
                                          action="/ShoppingCart?stt=<%=product.getStt()%>&action=addcart">
                                        <button type="submit" value="submit">Add to cart</button>
                                    </form>
                                </li></center>
                            </c:when>
                            <c:otherwise>

                            </c:otherwise>
                        </c:choose>
                    </c:if>
                    <c:if test="<%=product.get_status().equals(0)%>">
                        <li class="one_quarter first" id="footer" style="float: left; width: 221px">
                            <form class="btmspace-30" method="post"
                                  action="/ShoppingCart?stt=<%=product.getStt()%>&action=addcart">
                                <button type="submit" value="submit" hidden="hidden">Add to cart</button>
                            </form>
                        </li>
                    </c:if>
                    <li class="one_quarter" style="width: 700px; float: inherit">
                        <header class="heading">PRODUCT INFORMATION</header>
                        <table style="width:100%" border="1">

                            <tr>
                                <td style="width: 30%" ><b>Products</b></td>
                                <td style="width: 70%"><%=product.get_comment()%></td>

                            </tr>
                            <tr>
                                <td style="width: 30%" ><b>Display</b></td>
                                <td style="width: 70%"><%=product.get_comment2()%></td>

                            </tr>
                            <tr>
                                <td style="width: 30%" ><b>Storage</b></td>
                                <td style="width: 70%"><%=product.get_comment3()%></td>

                            </tr>
                            <tr>
                                <td style="width: 30%" ><b>Operating System</b></td>
                                <td style="width: 70%"><%=product.get_comment4()%></td>
                            </tr>
                            <tr>
                                <td style="width: 30%" ><b>Processor</b></td>
                                <td style="width: 70%"><%=product.get_comment5()%></td>
                            </tr>
                            <tr>
                                <td style="width: 30%" ><b>Battery Life</b></td>
                                <td style="width: 70%"><%=product.get_comment6()%></td>
                            </tr>
                            <tr>
                                <td style="width: 30%" ><b>Camera and Video</b></td>
                                <td style="width: 70%"><%=product.get_comment7()%></td>
                            </tr>

                            <tr>
                                <td style="width: 30%" ><b>Views</b></td>
                                <td style="width: 70%"><%=product.getView()%> times</td>
                            </tr>
                            <tr>
                                <td style="width: 30%" ><b>Price</b></td>
                                <td style="width: 70%"><fmt:formatNumber value="<%=product.getPrice()%>" type="currency"/></td>
                            </tr>
                            <c:if test="<%=product.get_status().equals(1)%>">
                                <c:choose>
                                    <c:when test="<%=product.getQuantity() == 0%>">
                                        <tr>
                                            <td style="width: 30%" ><b>Status</b></td>
                                            <td style="width: 70%">Being updated</td>
                                        </tr>
                                    </c:when>
                                    <c:when test="<%=product.getQuantity() > 0%>">
                                        <tr>
                                            <td style="width: 30%" ><b>Status</b></td>
                                            <td style="width: 70%">Available</td>
                                        </tr>
                                    </c:when>
                                    <c:otherwise>

                                    </c:otherwise>
                                </c:choose>
                            </c:if>
                            <c:if test="<%=product.get_status().equals(0)%>">
                                <tr>
                                    <td style="width: 30%" ><b>Status</b></td>
                                    <td style="width: 70%">Not Available</td>
                                </tr>
                            </c:if>
                        </table>
                    </li>
                </ul>
            </figure>
        </div>
        <!-- ################################################################################################ -->
        <!-- ################################################################################################ -->
        <nav class="pagination">

        </nav>
        <!-- ################################################################################################ -->
        <!-- / container body -->












        <div id="comments">
            <br/>

            <%
                String stt = request.getParameter("stt");
                CommentDao commentDao = new CommentDao();
                List<Comment> comments = new ArrayList<>();
                comments = commentDao.getAllById(stt);
            %>
            <c:if test="<%=comments.size() > 0%>">
                <h2>Comment</h2>
            </c:if>
            <ul>
                <c:forEach var="i" items="<%=comments%>">
                    <li>
                        <article>
                            <header>
                                <figure class="avatar"><img src="/images/demo/avatar.png" alt="">

                                </figure>
                                <address>
                                    By <a>${i.username}</a> - <a>${i.email}</a>
                                </address>
                                <time>${i.date}</time>
                            </header>
                            <div class="comcont">
                                <p>${i.comment}</p>
                            </div>
                        </article>
                    </li>
                </c:forEach>

            </ul>
            <div>
                <h1 style="float: left">Other Products</h1>

                <%
                    ProductDao productDao1 = new ProductDao();
                    List<Product> products1 = new ArrayList<Product>();
                    products1 = productDao1.getAllA01();
                    int count = 0;
                %>
                <li class="one_quarter first" style="width: 32%">
                    <c:forEach var="i" items="<%=products1%>">
                    <%
                        count++;
                        if (count == 1) {
                    %>
                    <a href="product.jsp?stt=${i.stt}"><img src="${i._url}" width="20px" height="20px">

                        <p>${i.name}</p>

                        </a></li>
                <%
                } else if (count == 4 || count == 7) {
                %>
                <li class="one_quarter first" style="width: 32%"><a href="product.jsp?stt=${i.stt}"><img
                        src="${i._url}" width="20px" height="20px">

                    <p>${i.name}</p>

                    </a></li>
                <%
                } else {
                %>
                <li class="one_quarter second" style="width: 32%"><a href="product.jsp?stt=${i.stt}"><img
                        src="${i._url}" width="20px" height="20px">

                    <p>${i.name}</p>

                    </a></li>
                <%
                    }
                %>
                </c:forEach>
            </div>









































            <div  style="alignment: left">
                <h1 style="float: left">Write A Comment</h1>
            </div>


            <%
                if (name == null) {
            %>
            <form action="/CommentServlet" method="post">
                <div class="one_third first">
                    <label for="name">Name <span>*</span></label>
                    <input type="text" name="name" id="name" value="" size="22">
                </div>
                <div class="one_third">
                    <label for="email">Mail <span>*</span></label>
                    <input type="email" name="email" id="email" value="" size="22">
                </div>

                <div class="block clear">
                    <label for="comment">Your Comment <span>*</span></label>
                    <textarea name="comment" id="comment" cols="25" rows="10" required="required"></textarea>
                </div>
                <div>
                    <input name="submit" type="submit" value="Submit Form">
                    &nbsp;
                    <input name="reset" type="reset" value="Reset Form">
                </div>
            </form>
            <%
            } else {
            %>
            <form action="/CommentServlet?stt=<%=product.getStt()%>" method="post">
                <div class="one_third first">
                    <label for="name">Name <span>*</span></label>
                    <input type="text" name="name" id="name" value="<%=AccountDao.getName(name).getNameuser()%>"
                           size="22">
                </div>
                <div class="one_third">
                    <label for="email">Mail <span>*</span></label>
                    <input type="email" name="email" id="email" value="<%=AccountDao.getName(name).getEmail()%>"
                           size="22">
                </div>

                <div class="block clear">
                    <label for="comment">Your Comment <span>*</span></label>
                    <textarea name="comment" id="comment" cols="25" rows="10" required="required"></textarea>
                </div>
                <div>
                    <input name="submit" type="submit" value="Submit Form">
                    &nbsp;
                    <input name="reset" type="reset" value="Reset Form">
                </div>
            </form>
            <%
                }
            %>
        </div>
        <div class="clear"></div>
    </main>
</div>
<!-- ################################################################################################ -->
<!-- ################################################################################################ -->
<!-- ################################################################################################ -->
<div class="wrapper">
    <figure class="latest overlay">
        <!-- ################################################################################################ -->

        <!-- ################################################################################################ -->
    </figure>
</div>
<div class="wrapper row4">
    <figure class="clients">
        <!-- ################################################################################################ -->
        <ul class="clear">
            <li><a href="gallery.jsp?page=1&action=getcate&namepage=Iphone"><img src="/images/demo/logos/1.jpg" alt=""></a></li>
            <li><a href="gallery.jsp?page=1&action=getcate&namepage=Ipad"><img src="/images/demo/logos/2.jpg" alt=""></a></li>
            <li><a href="gallery.jsp?page=1&action=getcate&namepage=Watch"><img src="/images/demo/logos/3.jpg" alt=""></a></li>
            <li><a href="gallery.jsp?page=1&action=getcate&namepage=Mac"><img src="/images/demo/logos/4.jpg" alt=""></a></li>
            <li><a href="gallery.jsp?page=1&action=getcate&namepage=TV"><img src="/images/demo/logos/5.jpg" alt=""></a></li>
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