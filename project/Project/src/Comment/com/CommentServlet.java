package Comment.com;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class CommentServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");

        String Stt = req.getParameter("stt");
        String username = req.getParameter("name");
        String email = req.getParameter("email");
        String comment = req.getParameter("comment");
        Integer stt = Integer.parseInt(Stt);

        Comment comments = new Comment();
        comments.setStt(stt);
        comments.setUsername(username);
        comments.setEmail(email);
        comments.setComment(comment);

        CommentDao commentDao = new CommentDao();
        commentDao.setContent(comments);
        resp.sendRedirect("/pages/product.jsp?stt=" + stt);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doGet(req, resp);
    }
}
