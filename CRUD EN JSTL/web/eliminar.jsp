<%-- 
    Document   : eliminar.jsp
    Created on : 08-abr-2015, 1:47:17
    Author     : jhonf
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="x"uri="http://java.sun.com/jsp/jstl/xml" %>
<%@ taglib prefix="fmt"uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sql"uri="http://java.sun.com/jsp/jstl/sql" %>
<sql:setDataSource var="bdatos" driver="com.mysql.jdbc.Driver" url="jdbc:mysql://localhost:3306/academica" user="root" password="udenar" />

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <c:if test="${param.id != null}">
        <sql:update var="result" dataSource="${bdatos}">
        Delete from estudiante where id=${param.id}
        	
        </sql:update>
        
        <c:if test="${result == 1}">
        	<p>Registro eliminado satisfactoriamente</p>
            <a href="index.jsp">Volver</a>
            <a href="insertar.jsp">Nuevo registro</a>
        </c:if>   
        
        </c:if>
    </body>
</html>
