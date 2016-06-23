<%@ page import="Account.com.LoginServlet" %>
<%@ page import="Product.com.Category" %>
<%@ page import="Product.com.CategoryDao" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.List" %>
<%@ page import="Product.com.Product" %>
<%@ page import="Product.com.ProductDao" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title>Add Data</title>
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
                <li class="active"><a href="DEL.jsp">Contact Us</a></li>


                <%
                    String name = LoginServlet.getLoginName(request, response);
                    if(!name.equals("admin"))
                        response.sendRedirect("/index.jsp");
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
                <li><a href="updata.jsp">Edit</a></li>
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
                    <div id="comments">
<div>
    <%
        List<Category> categoryList = new ArrayList<>();
        List<Product> products = new ArrayList<>();
        CategoryDao categoryDao1 = new CategoryDao();
        ProductDao productDao = new ProductDao();

        categoryList = categoryDao1.getAll();
        products = productDao.getAll();
    %>
    <p>Sum of categories: <%=categoryList.size()%> category(s):<c:forEach var="i" items="<%=categoryList%>">&nbsp;&nbsp;&nbsp;${i.catID}(${i.catName})</c:forEach></p>

    <p>Sum of products: <%=products.size()%></p>

                        <form action="/AddServlet" method="post">
                            <h4>Add Category</h4>
                            <div class="one_third first">
                                <label for="sku">SKU</label>
                                <input type="text" name="sku" id="sku" value="" size="22" required="required" pattern="[a-zA-Z0-9]+">
                            </div>
                            <div class="one_third">
                                <label for="manufactor">Products</label>
                                <input type="text" name="manufactor" id="manufactor" value="" size="22" required="required" pattern="[a-zA-Z]+">
                            </div>
                            <div class="one_third first">
                                <input name="addcat" type="submit" value="Add">
                            </div>
                        </form>
</div><br><br><br><br><br><br><br><hr>
<div>
                        <form action="/AddServlet" method="post">
                            <h4>Add Product</h4>
                            <div class="one_third first">
                                <label for="sku">SKU</label>
                                <input type="text" name="sku" id="sku" value="" size="22" required="required" pattern="[a-zA-Z0-9]+">
                            </div>
                            <div class="one_third">
                                <label for="name">Name</label>
                                <input type="text" name="name" id="name" value="" size="22" required="required" pattern="[a-zA-Z0-9 ]+">
                            </div>
                            <div class="one_third">
                                <label for="price">Price</label>
                                <input type="text" name="price" id="price" value="" size="22" required="required" pattern="[0-9]+">
                            </div>
                            <div class="one_third first">
                                <label for="quantity">Quantity</label>
                                <input type="number" name="quantity" id="quantity" value="" size="22" min="1" required="required">
                            </div>
                            <div class="one_third">
                                <label for="url">URL</label>
                                <input type="text" name="url" id="url" value="" size="22" required="required">
                            </div>
                            <div class="one_third">
                                <label for="describe">Products</label>
                                <input type="text" name="describe" id="describe" value="" size="22" required="required">
                            </div>
                            <div class="one_third first">
                                <label for="describe2">Display</label>
                                <input type="text" name="describe2" id="describe2" value="" size="22" required="required">
                            </div>
                            <div class="one_third">
                                <label for="describe3">Storage</label>
                                <input type="text" name="describe3" id="describe3" value="" size="22" required="required">
                            </div>
                            <div class="one_third">
                                <label for="describe4">Operating System</label>
                                <input type="text" name="describe4" id="describe4" value="" size="22" required="required">
                            </div>
                            <div class="one_third first">
                                <label for="describe5">Processor</label>
                                <input type="text" name="describe5" id="describe5" value="" size="22" required="required">
                            </div>
                            <div class="one_third">
                                <label for="describe6">Battery Life</label>
                                <input type="text" name="describe6" id="describe6" value="" size="22" required="required">
                            </div>
                            <div class="one_third">
                                <label for="describe7">Camera and Video</label>
                                <input type="text" name="describe7" id="describe7" value="" size="22" required="required">
                            </div>

                            <div class="one_third first">
                                <input name="addpro" type="submit" value="Add">
                            </div>
                        </form>
</div>
                    </div>
                </ul>
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