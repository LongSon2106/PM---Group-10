<%@ page import="Account.com.Account" %>
<%@ page import="Account.com.AccountDao" %>
<%@ page import="Account.com.LoginServlet" %>
<%@ page import="Product.com.Category" %>
<%@ page import="Product.com.CategoryDao" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.List" %>
<%@ page import="Product.com.ProductDao" %>
<%@ page import="Product.com.Product" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
  <title>Delete Data</title>
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
          if(!name.equals("admin"))
            response.sendRedirect("/index.jsp");
          ProductDao productDao = new ProductDao();
          String stt = request.getParameter("stt");
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
          if (stt == null) {
        %>
        <li><a href="downdata.jsp">Edit</a></li>
        <%
        } else {


        %>
        <li><a href="downdata.jsp">Edit</a></li>
        <li><a href="downdata.jsp?stt=<%=stt%>"><%=stt%>
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
            List<Product> products = new ArrayList<>();
            products = productDao.getAll();

          %>
          <c:forEach var="i" items="<%=products%>">
            <c:if test="${i._status == 1}">
              <%
                countA++;
              %>
            </c:if>
            <c:if test="${i._status == 0}">
              <%
                countI++;
              %>
            </c:if>
          </c:forEach>
          <%
            if (stt == null) {
          %>
          <p>Sum of Catagories: <%=categories.size()%></p>

          <p>Sum of Products <%=products.size()%></p>
          <div>
          <h3>Category</h3>
          <pre><h4>Username                                                 SKU                                                              Status</h4></pre>
          <c:forEach var="i" items="<%=categories%>">
            <div id="comments">
              <form action="/DeleteServlet" method="post">
                <div class="one_third first">
                  <input type="text" name="catname" id="catname" value="${i.catName}" size="22"
                         readonly="readonly">
                </div>
                <div class="one_third">

                  <input type="text" name="catid" id="catid" value="${i.catID}" size="22"
                         disabled="">
                </div>
                <div class="one_third">
                  <c:if test="${i._status == 0}">
                    <input name='activecate' type='submit' value='Active' STYLE="color: red">
                    <input name='deletecate' type='submit' value='Delete'
                           onclick="return confirm('Are u sure?')">
                  </c:if>
                  <c:if test="${i._status == 1}">
                    <input name='inactivecate' type='submit' value='Inactive'>
                    <input name='deletecate' type='submit' value='Delete'
                           onclick="return confirm('Are u sure?')">
                  </c:if>
                </div>
              </form>
            </div>
          </c:forEach>
          </div>
          <h3 class="one_third first" style="height: 65px; padding-top: 20px">Product</h3>
          <h4 class="one_third first" style="height: 45px">Username</h4>
          <h4 class="one_third">Registed Date</h4>
          <h4 class="one_third">Status</h4>
          <c:forEach var="i" items="<%=products%>">
            <div id="comments">
              <form action="/DeleteServlet" method="post">
                <div class="one_third first">
                  <input type="text" name="name" id="name" value="${i.name}" size="22"
                         onClick="window.location.href='downdata.jsp?stt=${i.stt}'"
                         readonly="readonly">
                  <input type="hidden" name="stt" id="stt" value="${i.stt}" size="22">
                </div>
                <div class="one_third">

                  <input type="text" name="email" id="email" value="${i.date}" size="22"
                         disabled="">
                </div>
                <div class="one_third">
                  <c:if test="${i._status == 0}">
                    <input name='activepro' type='submit' value='Active' STYLE="color: red">
                    <input name='deletepro' type='submit' value='Delete'
                           onclick="return confirm('Are you sure?')">
                  </c:if>
                  <c:if test="${i._status == 1}">
                    <input name='inactivepro' type='submit' value='Inactive'>
                    <input name='deletepro' type='submit' value='Delete'
                           onclick="return confirm('Are u sure?')">
                  </c:if>
                </div>
              </form>
            </div>
          </c:forEach>
          <%
          } else {
            int detailstt = Integer.parseInt(stt);
            Product detailproduct = productDao.getByID(detailstt);
          %>
          <div id="comments">
            <form action="/DeleteServlet" method="post">
              <div class="one_third first">
                <label for="name">Name</label>
                <input type="text" name="name" id="name" value="<%=detailproduct.getName()%>"
                       size="22" readonly>
                <input type="hidden" name="stt" id="stt" value="<%=detailproduct.getStt()%>" size="22">
              </div>
              <div class="one_third">
                <label for="sku">SKU</label>
                <input type="text" name="sku" id="sku"
                       value="<%=detailproduct.getID()%>" size="22" readonly>
              </div>
              <div class="one_third">
                <label for="price">Price</label>
                <input type="text" name="price" id="price" value="<%=detailproduct.getPrice()%>"
                       size="22" readonly>
              </div>
              <div class="one_third first">
                <label for="stt">STT</label>
                <input type="text" name="stt" id="stt"
                       value="<%=detailproduct.getStt()%>" size="22" readonly>
              </div>
              <div class="one_third">
                <label for="quantity">Quantity</label>
                <input type="number" name="quantity" id="quantity" value="<%=detailproduct.getQuantity()%>"
                       size="22" readonly>
              </div>
              <div class="one_third">
                <label for="date">Date</label>
                <input type="date" name="date" id="date" value="<%=detailproduct.getDate()%>"
                       size="22" readonly>
              </div>
              <div class="one_third first">
                <label for="view">View</label>
                <input type="text" name="view" id="view" value="<%=detailproduct.getView()%>"
                       size="22" readonly>
              </div>
              <div class="one_third">
                <label for="url">URL</label>
                <input type="text" name="url" id="url"
                       value="<%=detailproduct.get_url()%>" size="22" readonly>
              </div>
              <div class="one_third first">
                <c:if test="<%=detailproduct.get_status().equals(0)%>">
                  <input name='activeproin' type='submit' value='Active' STYLE="color: red">
                  <input name='deleteproin' type='submit' value='Delete'
                         onclick="return confirm('Are u sure?')">
                </c:if>
                <c:if test="<%=detailproduct.get_status().equals(1)%>">
                  <input name='inactiveproin' type='submit' value='Inactive'>
                  <input name='deleteproin' type='submit' value='Delete'
                         onclick="return confirm('Are u sure?')">
                </c:if>
              </div>
            </form>
          </div>


        </ul>
        <p><a class="btn" href="user.jsp" onclick="history.back()">Trờ về.</a></p>
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