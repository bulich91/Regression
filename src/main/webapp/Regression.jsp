<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c"
           uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<table>
    <c:forEach var="res" items="${result}">
        <tr>
            <input name="textfield" type="text" value="<c:out value="${res}"/>" disabled>
        </tr>
    </c:forEach>
</table>