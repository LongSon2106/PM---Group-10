package Bill.com;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

@MultipartConfig(maxFileSize = 3145728)
public class UploadServlet extends HttpServlet{

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        InputStream inputStream = null;

        String idBill = req.getParameter("idBill");
        String stt = req.getParameter("stt");
        Part filePart = req.getPart("photo");
        if (filePart != null) {
            System.out.println(filePart.getName());
            System.out.println(filePart.getSize());
            System.out.println(filePart.getContentType());

            inputStream = filePart.getInputStream();
        }

        String database = "mobile";
        String connectionURL = "jdbc:mysql://localhost:3306/" + database + "?characterEncoding=utf8";
        String dbUser = "root";
        String dbPassword = "";
        Connection conn = null;

        try {
            conn = DriverManager.getConnection(connectionURL, dbUser, dbPassword);

            PreparedStatement pstmt = conn.prepareStatement("UPDATE detailbill SET URL = ? WHERE idBill = ?");
            pstmt.setString(2, idBill);
            if (inputStream != null) {
                pstmt.setBlob(1, inputStream);
            }

            pstmt.executeUpdate();

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
        DisplayImg.main(idBill);
        resp.sendRedirect("/pages/bill.jsp?stt="+stt);
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req, resp);
    }

}
