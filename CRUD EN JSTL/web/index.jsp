<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="x"uri="http://java.sun.com/jsp/jstl/xml" %>
<%@ taglib prefix="fmt"uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sql"uri="http://java.sun.com/jsp/jstl/sql" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Hello World!</h1>
    <sql:setDataSource var="bdatos" driver="com.mysql.jdbc.Driver" url="jdbc:mysql://localhost:3306/academica" user="root" password="udenar" />
    <sql:query var="result" dataSource="${bdatos}">    
        select  * from estudiante 
    </sql:query>
    <table border=1>
    <c:forEach var="row" items="${result.rows}">
    <tr>
    <td><c:out value="${row.id}"/></td>
    <td><c:out value="${row.nombres}"/></td>
    <td><c:out value="${row.apellidos}"/></td>
    <td><c:out value="${row.direccion}"/></td>
    <td><c:out value="${row.telefono}"/></td>
    
     </tr>
    </c:forEach>
    </table>
    <a href="insertar.jsp">Registrar nuevo Alumno</a>


        
    </body>
</html>
