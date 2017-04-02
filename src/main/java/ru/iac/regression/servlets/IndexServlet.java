package ru.iac.regression.servlets;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * @author Bulich Artem
 */
@WebServlet(
        urlPatterns = "/"
)
public class IndexServlet extends HttpServlet {

    @Override
    public void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, java.io.IOException {
        request.setCharacterEncoding("UTF-8");
        request.getRequestDispatcher("/index.jsp").include(request, response);
    }
}
