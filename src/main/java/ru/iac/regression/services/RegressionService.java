package ru.iac.regression.services;

import java.util.Arrays;
import java.util.List;
import java.util.stream.Collectors;

import org.rosuda.REngine.REXPList;
import org.rosuda.REngine.REXPMismatchException;
import org.rosuda.REngine.REngineException;
import org.rosuda.REngine.RList;
import org.rosuda.REngine.Rserve.RConnection;
import org.rosuda.REngine.Rserve.RserveException;

/**
 * Created by Bulich Artem
 */

public class RegressionService {
    public List<Double> calculateRegression(double[] regressor, double[] regressant, double[] scenario) {
        RConnection connection = null;
        try {
            connection = new RConnection();
            connection.assign("x", regressor);
            connection.assign("y", regressant);
            connection.assign("z", scenario);
            connection.eval("model <- lm(y ~ x)");
            connection.eval("new.df <- data.frame(x=z)");
            double[] result = connection.eval("as.vector(predict(model,new.df))").asDoubles();
            return Arrays.stream(result).boxed()
                    .collect(Collectors.toList());
        } catch (RserveException e) {
            e.printStackTrace();
        } catch (REngineException e) {
            e.printStackTrace();
        } catch (REXPMismatchException e) {
            e.printStackTrace();
        }
        return null;
    }
}
