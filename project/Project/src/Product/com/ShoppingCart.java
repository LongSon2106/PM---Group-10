package Product.com;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;


public class ShoppingCart extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");
        ProductDao productDao = new ProductDao();
        HttpSession session = req.getSession();
        if (action.equals("addcart")) {

            if (session.getAttribute("cart") == null) {
                List<Item> cart = new ArrayList<Item>();
                cart.add(new Item(productDao.getByID(Integer.parseInt(req.getParameter("stt"))), 1));
                session.setAttribute("cart", cart);
                System.out.print(session.getAttribute("cart"));
            } else {
                List<Item> cart = (List<Item>) session.getAttribute("cart");
                int index = isExisting(Integer.parseInt(req.getParameter("stt")), cart);
                if (index == -1) {
                    cart.add(new Item(productDao.getByID(Integer.parseInt(req.getParameter("stt"))), 1));
                } else {
                    int total = cart.get(index).get_total() + 1;
                    cart.get(index).set_total(total);
                }
                session.setAttribute("cart", cart);
            }

            resp.sendRedirect("/pages/cart.jsp");

        } else if (action.equals("delete")) {
            List<Item> cart = (List<Item>) session.getAttribute("cart");
            int index = isExisting(Integer.parseInt(req.getParameter("stt")), cart);
            cart.remove(index);
            session.setAttribute("cart", cart);
            resp.sendRedirect("/pages/cart.jsp");
        } else if (action.equals("save")) {
            List<Item> cart = (List<Item>) session.getAttribute("cart");
            int index = isExisting(Integer.parseInt(req.getParameter("stt")), cart);
            Product product = new Product();
            product = productDao.getByID(Integer.parseInt(req.getParameter("stt")));
            int quantity = product.getQuantity();
            if(quantity < Integer.parseInt(req.getParameter("quantity"))){
                resp.sendRedirect("/pages/cart.jsp");
            }
            else {
                cart.get(index).set_total(Integer.parseInt(req.getParameter("quantity")));
                session.setAttribute("cart", cart);
                resp.sendRedirect("/pages/cart.jsp");
            }
        }
    }

    private int isExisting(int stt, List<Item> cart) {
        for (int i = 0; i < cart.size(); i++) {
            if (cart.get(i).getP().getStt() == stt) {
                return i;
            }
        }
        return -1;
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doGet(req, resp);

    }
}
