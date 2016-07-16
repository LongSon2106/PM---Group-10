<%@ page import="Account.com.Account" %>
<%@ page import="Account.com.AccountDao" %>
<%@ page import="Product.com.Category" %>
<%@ page import="Product.com.CategoryDao" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.List" %>
<%@ page import="Product.com.ProductDao" %>
<%@ page import="Product.com.Product" %>
<%@ page import="Bill.com.Bill" %>
<%@ page import="Bill.com.BillDao" %>
<%@ page import="Bill.com.BillDao" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    AccountDao accountDao = new AccountDao();
    int countA = 0, countI = 0;
    List<Account> accounts = new ArrayList<>();
    accounts = accountDao.getAll();

    CategoryDao categoryDao = new CategoryDao();
    List<Category> categories = new ArrayList<Category>();
    List<Category> categoryList = new ArrayList<>();
    categories = categoryDao.getAll();
    categoryList = categoryDao.getAll();

    ProductDao productDao = new ProductDao();
    List<Product> products = new ArrayList<>();
    products = productDao.getAll();

    BillDao billDao = new BillDao();
    int countF = 0, countN = 0;
    List<Bill> bills = new ArrayList<Bill>();
    bills = billDao.getAll();

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
<c:forEach var="i" items="<%=bills%>" begin="0">
    <c:if test="${i.status == 1}">
        <%
            countF++;
        %>
    </c:if>
    <c:if test="${i.status == 0}">
        <%
            countN++;
        %>
    </c:if>
</c:forEach>

<p style="color: red">Member</p>
<p>Sum of Members: <%=accounts.size()%> people</p>

<p>Official Members: <%=countA%> people</p>

<p>Non-Official Members: <%=countI%> people</p>
<br>


<p style="color: red">Catagories and Products:</p>
<p>Sum of Catagories: <%=categories.size()%></p>

<p>Sum of Products <%=products.size()%></p>
<br>


<p style="color: red">Bill:</p>
<p>Sum of bills: <%=bills.size()%> bill(s).</p>

<p>Delivered Bills: <%=countF%> bill(s).</p>

<p>Non-Delivered Bills: <%=countN%> bill(s).</p>
<br>


<p style="color: red">Detail categories:</p>
<p>Sum of categories: <%=categoryList.size()%> category(s):<c:forEach var="i" items="<%=categoryList%>">&nbsp;&nbsp;&nbsp;${i.catID}(${i.catName})</c:forEach></p>

<p>Sum of products: <%=products.size()%></p>