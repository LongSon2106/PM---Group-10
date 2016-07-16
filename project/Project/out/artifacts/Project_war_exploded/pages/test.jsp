<%@ page import="java.sql.*"%>
<%@ page import="java.io.*"%>

<%       Blob image = null;
  Connection conn = null;
  byte[] imgData = null ;
  Statement stmt = null;
  ResultSet rs = null;

  try {
    Class.forName("com.mysql.jdbc.Driver");
    conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/mobile?characterEncoding=utf8, root, ");
    stmt = conn.createStatement();
    rs = stmt.executeQuery("SELECT URL from detailbill WHERE idBill = 2");
    if (rs.next()) {
      image = rs.getBlob(1);
      imgData = image.getBytes(1,(int)image.length());
    } else {
      out.println("Display Blob Example");
      out.println("image not found for given id>");
      return;
    }

    // display the image
    response.setContentType("image/gif");
    OutputStream o = response.getOutputStream();
    o.write(imgData);
    o.flush();
    o.close();
  } catch (SQLException ex) {
    ex.printStackTrace();
  } finally {
    if (conn != null) {
      try {
        conn.close();
      } catch (SQLException ex) {
        ex.printStackTrace();
      }
    }
  }
%>
  