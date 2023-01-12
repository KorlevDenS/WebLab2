<jsp:useBean id="storage" scope="session" class="com.example.weblab2s.bean.ComponentStorage"/>
<%@ page import="com.example.weblab2s.servlet.Point" %>
<%@ page import="java.util.Objects" %>
<%@ page import="java.text.NumberFormat" %>
<%@ page import="java.text.DecimalFormat" %>
<%@ page import="com.example.weblab2s.bean.Component" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html lang="ru">
<head>
    <meta charset="UTF-8">
    <title>WebLab2</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/lab2_style.css">
    <link rel="shortcut icon" href="${pageContext.request.contextPath}/img/icon.png" type="image/png">
</head>
<body>
<div id="header">
    <h1 class="header__title">Королев Денис Владимирович, P32141, Вариант 14453</h1>
    <div id = "logo">
        <img src="${pageContext.request.contextPath}/img/itmo.png" alt="">
    </div>
</div>
<div id="site_view">
    <div id = "sidebar">
        <div id = "duck">
            <img style="top: 110px;" src="${pageContext.request.contextPath}/img/left_duck.png" alt="">
            <img style="top: 210px;" src="${pageContext.request.contextPath}/img/right_duck.png" alt="">
            <img style="top: 310px;" src="${pageContext.request.contextPath}/img/left_duck.png" alt="">
            <img style="top: 410px;" src="${pageContext.request.contextPath}/img/right_duck.png" alt="">
            <img style="top: 510px;" src="${pageContext.request.contextPath}/img/left_duck.png" alt="">
            <img style="top: 610px;" src="${pageContext.request.contextPath}/img/right_duck.png" alt="">
            <img style="top: 710px;" src="${pageContext.request.contextPath}/img/left_duck.png" alt="">
            <img style="top: 810px;" src="${pageContext.request.contextPath}/img/right_duck.png" alt="">
            <img style="top: 910px;" src="${pageContext.request.contextPath}/img/left_duck.png" alt="">
            <img style="top: 1010px;" src="${pageContext.request.contextPath}/img/right_duck.png" alt="">
            <img style="top: 1110px;" src="${pageContext.request.contextPath}/img/left_duck.png" alt="">
            <img style="top: 1210px;" src="${pageContext.request.contextPath}/img/right_duck.png" alt="">
            <img style="top: 1310px;" src="${pageContext.request.contextPath}/img/left_duck.png" alt="">
            <img style="top: 1410px;" src="${pageContext.request.contextPath}/img/right_duck.png" alt="">
        </div>
    </div>
    <div id = "container">
        <div id = "chart_bar">
            <svg viewBox="0 0 600 600" id="svg" width=100% height=98% onclick="svgClick(event, '${pageContext.request.contextPath}')">
                <path d="M 300 300
                            L 100 300
                            L 100 400
                            L 300 400
                            L 300 500
                            L 400 300
                            L 500 300
                            A 200 200 0 0 0 300 100"
                      fill="rgb(238, 130, 238)"></path>
                <line x1="300" y1="4" x2="300" y2="600" style="stroke: black; stroke-width: 3"></line>
                <text x="315" y="14">y</text>
                <line x1="0" y1="300" x2="597" y2="300" style="stroke: black; stroke-width: 3"></line>
                <text x="586" y="287">x</text>
                <line x1="100" y1="295" x2="100" y2="305" style="stroke: black; stroke-width: 3"></line>
                <text y="290" x="90">-R</text>
                <line x1="200" y1="295" x2="200" y2="305" style="stroke: black; stroke-width: 3"></line>
                <text y="290" x="188">-R/2</text>
                <line x1="400" y1="295" x2="400" y2="305" style="stroke: black; stroke-width: 3"></line>
                <text y="290" x="388">R/2</text>
                <line x1="500" y1="295" x2="500" y2="305" style="stroke: black; stroke-width: 3"></line>
                <text y="290" x="492">R</text>
                <line y1="100" x1="295" y2="100" x2="305" style="stroke: black; stroke-width: 3"></line>
                <text y="107" x="310">R</text>
                <line y1="200" x1="295" y2="200" x2="305" style="stroke: black; stroke-width: 3"></line>
                <text y="207" x="310">R/2</text>
                <line y1="400" x1="295" y2="400" x2="305" style="stroke: black; stroke-width: 3"></line>
                <text y="407" x="310">-R/2</text>
                <line y1="500" x1="295" y2="500" x2="305" style="stroke: black; stroke-width: 3"></line>
                <text y="507" x="310">-R</text>
                <polygon points="300,0 290,20 300,14 310,20"></polygon>
                <polygon points="600,300 580,290 586,300 580,310 "></polygon>
                <%

                    //List<Point> pnts = comp.getStorage().stream().map(Component::getPoint).collect(Collectors.toList());

                    if (storage != null) {
                        for (Component i : storage.getStorage()) {
                            if (i.getPoint() == null) break;
                            if (!Objects.equals(i.getPoint().getResult(), "Данные некорректны") && !Objects.equals(i.getPoint().getResult(),
                                    "Какие-то параметры не заданы")) {
                                NumberFormat nf = new DecimalFormat("#.########");
                                double x = (((i.getPoint().getX() / i.getPoint().getR()) / 3) + 0.5) * 600;
                                double y = (((i.getPoint().getY() / i.getPoint().getR()) / -3) + 0.5) * 600;
                                String pointFill;
                                if (i.getPoint().getResult().startsWith("Точка попала")) {
                                    pointFill = Point.colorMap.get(i.getPoint().getR());
                                } else {
                                    pointFill = Point.colorAMap.get(i.getPoint().getR());
                                }
                                out.println("<circle cx='" + nf.format(x).replace(',', '.') +
                                        "' cy='" + nf.format(y).replace(',', '.') + "' r='7' fill='" + pointFill + "'/>");
                            }
                        }
                    }
                %>
            </svg>
        </div>

        <div id="forms">
            <form method="post" action="${pageContext.request.contextPath}/ControllerServlet"
                  onsubmit="return isCorrect()">
                <div class="data">
                    X:
                    <button type="button" id="btn-3" onclick="chooseX(this)" value="-3">-3</button>
                    <button type="button" id="btn-2" onclick="chooseX(this)" value="-2">-2</button>
                    <button type="button" id="btn-1" onclick="chooseX(this)" value="-1">-1</button>
                    <button type="button" id="btn0" onclick="chooseX(this)" value="0">0</button>
                    <button type="button" id="btn1" onclick="chooseX(this)" value="1">1</button>
                    <button type="button" id="btn2" onclick="chooseX(this)" value="2">2</button>
                    <button type="button" id="btn3" onclick="chooseX(this)" value="3">3</button>
                    <button type="button" id="btn4" onclick="chooseX(this)" value="4">4</button>
                    <button type="button" id="btn5" onclick="chooseX(this)" value="5">5</button>
                    <input type="hidden" name="x" id="chosen-buttonX">
                    <br>
                    Y:
                    <label><input type="text" placeholder="число от -3 до 5" maxlength="12" oninput="validateY()" required id="y" name="y" ></label>
                    <span id="y-warning" style="display: none"></span>
                    <br>
                    R:
                    <button type="button" id="btn6" onclick="chooseR(this)" value="1">1</button>
                    <button type="button" id="btn7" onclick="chooseR(this)" value="1.5">1,5</button>
                    <button type="button" id="btn8" onclick="chooseR(this)" value="2">2</button>
                    <button type="button" id="btn9" onclick="chooseR(this)" value="2.5">2,5</button>
                    <button type="button" id="btn10" onclick="chooseR(this)" value="3">3</button>
                    <input type="hidden" name="r" id="chosen-buttonR">
                    <br>
                </div>
                <input size="123" type="submit" id="submit">
            </form>
            <br>

            <span id="select-warning" style="display: none"></span>
        </div>
        <div class="results">
            <table class="result-table">
                <tr>
                <td>Время</td>
                <td>X</td>
                <td>Y</td>
                <td>R</td>
                <td>Попадание</td>
                <td>Время<br> обработки<br> запроса</td>
                </tr>
                <% if (storage != null) {
                    for (int i = storage.getStorage().size() - 1; i > 0; i--) {
                        out.println("<tr>");
                        double x = storage.getStorage().get(i).getPoint().getX();
                        double y = storage.getStorage().get(i).getPoint().getY();
                        double r = storage.getStorage().get(i).getPoint().getR();
                        NumberFormat nf = new DecimalFormat("#.########");
                        out.println("<td><b>" + storage.getStorage().get(i).getPoint().getCurrentTime() + "</b></td>");
                        out.println("<td>" + nf.format(x).replace(",", ".") + "</td>");
                        out.println("<td>" + nf.format(y).replace(",", ".") + "</td>");
                        out.println("<td>" + nf.format(r).replace(",", ".") + "</td>");
                        out.println("<td>" + storage.getStorage().get(i).getPoint().getResult() + "</td>");
                        out.println("<td><b>" + nf.format(storage.getStorage().get(i).getPoint().getExecutingTime()).replace(",", ".") + "</b></td>");
                        out.println("</tr>");
                    }
                }
                %>
            </table>
        </div>
    </div>
</div>
<script src="${pageContext.request.contextPath}/js/validation.js"></script>
</body>
</html>