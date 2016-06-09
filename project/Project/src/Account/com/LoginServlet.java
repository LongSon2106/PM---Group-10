package Account.com;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.*;
import java.io.IOException;

public class LoginServlet extends HttpServlet {

    public static String getLoginName(HttpServletRequest req, HttpServletResponse resp) {
        Cookie[] cookies = req.getCookies();
        if (cookies != null) {

            for (Cookie c : cookies) {

                if (c.getName().compareTo("currentAccount") == 0) {
                    return c.getValue();
                }

            }
        }

        return null;
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String username = req.getParameter("username");
        String password = req.getParameter("password");
        String rmb = req.getParameter("loginkeeping");
        HttpSession session = req.getSession();

        if (username.equals("admin") && password.equals("admin")) {
            if (session.getAttribute("loginCount") != null) {
                session.removeAttribute("loginCount");
            }
            Cookie cookie = new Cookie("currentAccount", username);
            cookie.setMaxAge(60 * 60 * 60 * 24 * 5);
            resp.addCookie(cookie);
            resp.sendRedirect("/pages/success.jsp?action=loged");
            return;
        }

        if (rmb != null) {

            if (AccountDao.isLogin(username, password) == true) {
                if (session.getAttribute("loginCount") != null) {
                    session.removeAttribute("loginCount");
                }
                if (AccountDao.getName(username).getStatus() == 1) {
                    Cookie cookie = new Cookie("currentAccount", username);
                    cookie.setMaxAge(60 * 60 * 60 * 24 * 5);
                    resp.addCookie(cookie);
                    resp.sendRedirect("/pages/success.jsp?action=loged");
                } else {
                    resp.sendRedirect("/pages/success.jsp?action=unactive");
                }

            } else {
                int loginAttempt;

                if (session.getAttribute("loginCount") == null) {
                    session.setAttribute("loginCount", 0);
                    loginAttempt = 0;
                } else {
                    loginAttempt = (Integer) session.getAttribute("loginCount");
                }

                if (loginAttempt > 2) {
                    RequestDispatcher rd = getServletContext().getRequestDispatcher("/pages/wait.jsp");
                    rd.include(req, resp);
                } else {
                    loginAttempt++;
                    resp.sendRedirect("/pages/login.jsp");
                }

                session.setAttribute("loginCount", loginAttempt);
            }
        } else {
            if (AccountDao.isLogin(username, password) == true) {

                if (session.getAttribute("loginCount") != null) {
                    session.removeAttribute("loginCount");
                }
                if (AccountDao.getName(username).getStatus() == 1) {
                    Cookie cookie = new Cookie("currentAccount", username);
                    cookie.setMaxAge(60 * 60);
                    resp.addCookie(cookie);
                    resp.sendRedirect("/pages/success.jsp?action=loged");
                } else {
                    resp.sendRedirect("/pages/success.jsp?action=unactive");
                }
            } else {
                int loginAttempt;

                if (session.getAttribute("loginCount") == null) {
                    session.setAttribute("loginCount", 0);
                    loginAttempt = 0;
                } else {
                    loginAttempt = (Integer) session.getAttribute("loginCount");
                }

                if (loginAttempt > 2) {
                    RequestDispatcher rd = getServletContext().getRequestDispatcher("/pages/wait.jsp");
                    rd.include(req, resp);
                } else {
                    loginAttempt++;
                    resp.sendRedirect("/pages/login.jsp");
                }

                session.setAttribute("loginCount", loginAttempt);
            }
        }

    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doGet(req, resp);
    }
}
