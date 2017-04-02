package ru.iac.regression.servlets;

import java.util.Arrays;

/**
 * Created by Bulich Artem on 01.04.2017.
 */

import ru.iac.regression.services.RegressionService;

import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.util.*;

@WebServlet(urlPatterns = "/regression")

public class RegressionServlet extends HttpServlet {
    private RegressionService regressionService;

    public void Init(){

    }

    @Override
    public void doPost(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, java.io.IOException {

        regressionService = new RegressionService();

        double[] regressorList = converInputString(request.getParameter("regressor"));
        double[] regressantList = converInputString(request.getParameter("regressant"));
        double[] scenarioList = converInputString(request.getParameter("scenario"));

        List<Double> result = regressionService.calculateRegression(regressorList, regressantList, scenarioList);
        request.setAttribute("result", result);
        request.setCharacterEncoding("UTF-8");
        request.getRequestDispatcher("/Regression.jsp").include(request, response);
    }

    private double[] converInputString(String str) {
        String[] result = str.split(",");
        double[] array = new double[result.length];
        for (int i = 0; i < array.length; i++){
            array[i] = Double.parseDouble(result[i]);;
        }
        return array;
    }
}
