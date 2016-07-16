package Bill.com;

import javax.servlet.ServletException;
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


public class BillServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        String getstt = req.getParameter("stt");
        String active = req.getParameter("active");
        String inactive = req.getParameter("inactive");
        String delete = req.getParameter("delete");
        String activein = req.getParameter("activein");
        String inactivein = req.getParameter("inactivein");
        String deletein = req.getParameter("deletein");
        Integer stt = Integer.parseInt(getstt);

        if (active != null) {
            BillDao.Active(stt);
            resp.sendRedirect("/pages/bill.jsp");
            return;
        } else if (inactive != null) {
            BillDao.Inactive(stt);
            resp.sendRedirect("/pages/bill.jsp");
            return;
        } else if (delete != null) {
            BillDao.Delete(stt);
            DetailBillDao.Delete(stt);
            resp.sendRedirect("/pages/bill.jsp");
            return;
        } else if (activein != null) {
            BillDao.Active(stt);
            resp.sendRedirect("/pages/bill.jsp?stt="+stt);
            return;
        }else if (inactivein != null) {
            BillDao.Inactive(stt);
            resp.sendRedirect("/pages/bill.jsp?stt="+stt);
            return;
        } else if (deletein != null) {
            BillDao.Delete(stt);
            DetailBillDao.Delete(stt);
            resp.sendRedirect("/pages/bill.jsp");
            return;
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doGet(req, resp);
    }


}
