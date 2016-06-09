package Account.com;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;


public class UpdateServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");

        String username = req.getParameter("username");
        String password = req.getParameter("password");
        String oldpassword = req.getParameter("oldpassword");
        String address = req.getParameter("address");
        String phone = req.getParameter("phone");
        String renew = req.getParameter("renew");
        String name = req.getParameter("name");
        String active = req.getParameter("active");
        String inactive = req.getParameter("inactive");
        String delete = req.getParameter("delete");
        String activein = req.getParameter("activein");
        String inactivein = req.getParameter("inactivein");
        String deletein = req.getParameter("deletein");
        String update = req.getParameter("update");
        String cmt = req.getParameter("submit");

        if (active != null) {
            AccountDao.Active(name);
            resp.sendRedirect("/pages/user.jsp");
        } else if (inactive != null) {
            AccountDao.Inactive(name);
            resp.sendRedirect("/pages/user.jsp");
        } else if (delete != null) {
            AccountDao.Delete(name);
            resp.sendRedirect("/pages/user.jsp");
        } else if (activein != null) {
            AccountDao.Active(name);
            resp.sendRedirect("/pages/user.jsp?user=" + name);
        } else if (inactivein != null) {
            AccountDao.Inactive(name);
            resp.sendRedirect("/pages/user.jsp?user=" + name);
        } else if (deletein != null) {
            AccountDao.Delete(name);
            resp.sendRedirect("/pages/user.jsp");
        } else if (cmt != null) {

        } else if (update != null) {
            if (renew.equals("") && password.equals("")) {
                if (AccountDao.Update(oldpassword, username, address, phone) == 1) {
                    resp.sendRedirect("/pages/success.jsp?action=updated");
                } else {
                    resp.sendRedirect("/pages/success.jsp?action=unupdate");
                }
            } else if (renew.equals(password)) {
                if (AccountDao.UpdateNewPass(oldpassword, password, username, address, phone) == 1) {
                    resp.sendRedirect("/pages/success.jsp?action=updated");
                } else {
                    resp.sendRedirect("/pages/success.jsp?action=unupdate");
                }
            } else {
                resp.sendRedirect("/pages/success.jsp?action=wrongpass");
            }
        }

    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doGet(req, resp);
    }
}
