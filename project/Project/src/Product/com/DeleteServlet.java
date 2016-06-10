package Product.com;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;


public class DeleteServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String catname = req.getParameter("catname");
        String stt = req.getParameter("stt");
        CategoryDao categoryDao = new CategoryDao();
        ProductDao productDao = new ProductDao();
        String delcate = req.getParameter("deletecate");
        String delpro = req.getParameter("deletepro");
        String delproin = req.getParameter("deleteproin");
        String activecate = req.getParameter("activecate");
        String inactivecate = req.getParameter("inactivecate");
        String activepro = req.getParameter("activepro");
        String inactivepro = req.getParameter("inactivepro");
        String activeproin = req.getParameter("activeproin");
        String inactiveproin = req.getParameter("inactiveproin");


        if (delcate != null) {
            categoryDao.Delete(catname);
            resp.sendRedirect("/pages/downdata.jsp");
        }
        else if (delpro != null) {
            productDao.Delete(stt);
            resp.sendRedirect("/pages/downdata.jsp");
        }
        else if(delproin != null){
            productDao.Delete(stt);
            resp.sendRedirect("/pages/downdata.jsp");
        }
        else if(activecate != null){
            categoryDao.Active(catname);
            resp.sendRedirect("/pages/downdata.jsp");
        }
        else if(inactivecate != null){
            categoryDao.Inactive(catname);
            resp.sendRedirect("/pages/downdata.jsp");
        }
        else if(activepro != null){
            productDao.Active(stt);
            resp.sendRedirect("/pages/downdata.jsp");
        }
        else if(inactivepro != null){
            productDao.Inactive(stt);
            resp.sendRedirect("/pages/downdata.jsp");
        }
        else if(activeproin != null){
            productDao.Active(stt);
            resp.sendRedirect("/pages/downdata.jsp?stt=" + stt);
        }
        else if (inactiveproin != null){
            productDao.Inactive(stt);
            resp.sendRedirect("/pages/downdata.jsp?stt=" + stt);
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doGet(req, resp);
    }
}
