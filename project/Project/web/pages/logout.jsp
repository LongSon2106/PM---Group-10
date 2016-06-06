<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title></title>
</head>
<body>
<%
    Cookie cookie = new Cookie("currentAccount", "");
    cookie.setMaxAge(0);
    cookie.setPath("/");
    response.addCookie(cookie);

    response.sendRedirect("/index.jsp");
%>
</body>
</html>
