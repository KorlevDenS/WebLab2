<jsp:useBean id="storage" scope="session" class="com.example.weblab2s.bean.ComponentStorage"/>
<%@ page import="java.text.DecimalFormat" %>
<%@ page import="java.text.NumberFormat" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>Result</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/request_style.css">
</head>
<body>
<div id="result">
<table class="result-table">
    <%

        if (storage != null) {
            out.println("<tr>");
            out.println("<td>Время</td>");
            out.println("<td>X</td>");
            out.println("<td>Y</td>");
            out.println("<td>R</td>");
            out.println("<td>Попадание</td>");
            out.println("<td>Время обработки</td>");
            out.println("</tr>");
            out.println("<tr>");
            for (int i = 0; i < storage.getStorage().size(); i++) {
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
        } else {
            out.println("Запрос некорректен!!!");
        }
    %>
</table><br>
<a href="${pageContext.request.contextPath}/index.jsp">Вернуться к графику</a>
</div>
</body>
</html>