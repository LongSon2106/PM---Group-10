package Account.com;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;


public class RegisterServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");

        String username = req.getParameter("usernamesignup");
        String email = req.getParameter("emailsignup");
        String password = req.getParameter("passwordsignup");
        String repassword = req.getParameter("passwordsignup_confirm");
        String address = req.getParameter("address");
        String name = req.getParameter("nameuser");
        String phone = req.getParameter("phone");
        Account account = new Account();
        account.setEmail(email);
        account.setPassword(password);
        account.setRepassword(repassword);
        account.setUsername(username);
        account.setAddress(address);
        account.setNameuser(name);
        account.setPhone(phone);
        AccountDao accountDao = new AccountDao();

        boolean rs = accountDao.setRegister(account);


        if (rs == true) {
            resp.sendRedirect("/pages/success.jsp?action=add");
        } else {
            resp.sendRedirect("/pages/success.jsp?action=fail");
        }

    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doGet(req, resp);
    }
}
