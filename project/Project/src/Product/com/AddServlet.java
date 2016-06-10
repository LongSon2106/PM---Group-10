package Product.com;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * Created by KUBO0212 on 11/29/2015.
 */
public class AddServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String addcat = req.getParameter("addcat");
        String addpro = req.getParameter("addpro");
        String sku = req.getParameter("sku");
        String manufactor = req.getParameter("manufactor");
        String name = req.getParameter("name");
        String Price = req.getParameter("price");
        String Quantity = req.getParameter("quantity");
        String url = req.getParameter("url");
        String describe = req.getParameter("describe");
        String describe2 = req.getParameter("describe2");
        String describe3 = req.getParameter("describe3");
        String describe4 = req.getParameter("describe4");
        String describe5 = req.getParameter("describe5");
        String describe6 = req.getParameter("describe6");
        String describe7 = req.getParameter("describe7");



        CategoryDao categoryDao = new CategoryDao();
        Category category = new Category();
        ProductDao productDao = new ProductDao();
        Product product = new Product();

        if(addcat != null){
            category.setCatID(sku);
            category.setCatName(manufactor);
            if(categoryDao.setCategory(category) == true){
                resp.sendRedirect("/pages/success.jsp?action=addcate");
            }else{
                resp.sendRedirect("/pages/success.jsp?action=addcatefail");
            }

        }

        if(addpro != null){
            double price = Double.parseDouble(Price);
            int quantity = Integer.parseInt(Quantity);
            product.setID(sku);
            product.setName(name);
            product.setPrice(price);
            product.setQuantity(quantity);
            product.set_url(url);
            product.set_comment(describe);
            product.set_comment2(describe2);
            product.set_comment3(describe3);
            product.set_comment4(describe4);
            product.set_comment5(describe5);
            product.set_comment6(describe6);
            product.set_comment7(describe7);
            if(productDao.setProduct(product) == true){
                resp.sendRedirect("/pages/success.jsp?action=addpro");
            }else{
                resp.sendRedirect("/pages/success.jsp?action=addprofail");
            }

        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doGet(req, resp);
    }
}
