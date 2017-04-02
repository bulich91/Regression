<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<html>
<head>
    <title>Regression</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-alpha.6/css/bootstrap.min.css"
          integrity="sha384-rwoIResjU2yc3z8GV/NPeZWAv56rSmLldC3R/AZzGRnGxQQKnKkoFVhFQhNUwEyJ" crossorigin="anonymous">
    <script
            src="https://code.jquery.com/jquery-3.2.1.min.js"
            integrity="sha256-hwg4gsxgFZhOsEEamdOYGBf13FyQuiTwlAQgxVSNgt4="
            crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/tether/1.4.0/js/tether.min.js"
            integrity="sha384-DztdAPBWPRXSA/3eYEEUWrWCy7G5KFbe8fFjk5JAIxUYHKkDx6Qin1DkWx51bBrb"
            crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-alpha.6/js/bootstrap.min.js"
            integrity="sha384-vBWWzlZJ8ea9aCX4pEW3rVHjgjt7zpkNpZk+02D9phzyeVkE+jo0ieGizqPLForn"
            crossorigin="anonymous"></script>
</head>
<body>
<nav class="navbar navbar-light bg-faded">
    <a class="navbar-brand" href="${pageContext.request.contextPath}">
        Regression
    </a>
</nav>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <title>Table</title>
    <style type="text/css">
        TABLE {
            width: 50%;
            border-collapse: collapse;
        }

        TD, TH {
            padding: 3px; /* Поля вокруг содержимого таблицы */
            border: 1px solid black; /* Параметры рамки */
        }

        TH {
            background: #b0e0e6; /* Цвет фона */
        }
    </style>
</head>
<body>
<table>
    <tr>
        <th>&nbsp;</th>
        <th>value 1</th>
        <th>value 2</th>
        <th>value 3</th>
        <th>value 4</th>
        <th>value 5</th>
    </tr>
    <tr>
        <th>Regressor</th>
        <td><input type="number" id="box1"></td>
        <td><input type="number" id="box2"></td>
        <td><input type="number" id="box3"></td>
        <td><input type="number" id="box4"></td>
        <td><input type="number" id="box5"></td>
    </tr>
    <tr>
        <th>Redressant</th>
        <td><input type="number" id="box6"></td>
        <td><input type="number" id="box7"></td>
        <td><input type="number" id="box8"></td>
        <td><input type="number" id="box9"></td>
        <td><input type="number" id="box10"></td>
    </tr>
    <tr>
        <th>Scenario</th>
        <td><input type="number" id="box11"></td>
        <td><input type="number" id="box12"></td>
        <td><input type="number" id="box13"></td>
        <td><input type="number" id="box14"></td>
        <td><input type="number" id="box15"></td>
    </tr>
</table>
<html>
<head>
    <meta charset="utf-8">
    <title>Кнопка</title>
</head>

<div>Click on this button "Click"</div>

<div id="result"></div>
<head>
    <script type="text/javascript">
        function tableParcer() {
            for (i = 1; i < 16; i++ ){
                if (document.getElementById('box' + i).value == '') {
                    var flag = true;
                    var index = i;
                    break;
                }
                else {
                    flag = false;
                }
            }
            if (flag){
                alert("Emty value! Row: " + parseInt(index/5+1)
                    + ", position: "+ ((index % 5 == 0)?5:index))
            }
            else {
                for (i = 1; i < 16; i++ ){
                    if (i < 6) {
                        if(i == 1){
                            var resultRowRegressor = document.getElementById('box' + i).value;
                        }
                        else {
                            resultRowRegressor = resultRowRegressor + "," + document
                                    .getElementById('box' + i).value;
                        }
                    }
                    else if (i < 11) {
                        if(i == 6){
                            var resultRowRegressant = document.getElementById('box' + i).value;
                        }
                        else {
                            resultRowRegressant = resultRowRegressant+ "," + document
                                    .getElementById('box'+i).value;
                        }
                    }
                    else {
                        if (i == 11) {
                            var resultRowScenario = document.getElementById('box' + i).value;
                        }
                        else{
                            resultRowScenario = resultRowScenario + "," + document
                                    .getElementById('box'+i).value;
                        }
                    }
                }

                $.ajax({
                    type: 'POST',
                    url: window.location + '/regression',
                    data: {regressor: resultRowRegressor, regressant: resultRowRegressant, scenario: resultRowScenario},
                    success: function(result) {
                        $('#result').html(result);
                    }
                });
            }
        }
    </script>
</head>
<input type="button" onclick="tableParcer()" value="Show"/>
</html>
</body>
</html>
</body>
</html>