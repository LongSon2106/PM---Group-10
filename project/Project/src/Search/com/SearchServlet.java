package Search.com;


import Product.com.Product;
import Product.com.ProductDao;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;


public class SearchServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String keyword = req.getParameter("name");
        String fullKeyword = "%" + keyword + "%";

        ProductDao productDao = new ProductDao();
        HttpSession session = req.getSession();
        List<Product> list = productDao.getProduct(fullKeyword);
        session.setAttribute("list", list);
        List<String> size = (List<String>)session.getAttribute("list");
        if(size.size() == 0){
            resp.sendRedirect("/pages/search.jsp");
        }
        else{
            resp.sendRedirect("/pages/search.jsp?page=1");
        }

    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doGet(req, resp);
    }
}
