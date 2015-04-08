<%-- 
    Document   : actualizar.jsp
    Created on : 08-abr-2015, 1:53:51
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
    <c:if test="${param.modifica ==null}">
    
        <h1>Actualizar Informacion estudiante</h1>
        <sql:query var="result" dataSource="${bdatos}">    
        select  * from estudiante where id=? <sql:param value='${param.id}'/>
    </sql:query>
    <c:forEach var="row" items="${result.rows}">
        <form action="" method="post" name="form1">
        
        	<table border="1">
            	<tr>
                	<td>Codigo:</td>
                    <td><input type="text" name="txt_cod" id="txt_cod" value="${row.id}"/></td>
                </tr>
                <tr>
                	<td>Nombres:</td>
                    <td><input type="text" name="txt_nom" id="txt_nom" value="${row.nombres}"/></td>
                </tr>
                <tr>
                	<td>Apellidos:</td>
                    <td><input type="text" name="txt_ape" id="txt_ape" value="${row.apellidos}"/></td>
                </tr>
                  <tr>
                	<td>Direccion:</td>
                    <td><input type="text" name="txt_dir" id="txt_dir" value="${row.direccion}" /></td>
                </tr>
                <tr>
                	<td>Telefono:</td>
                    <td><input type="text" name="txt_tel" id="txt_tel" value="${row.telefono}"/></td>
                </tr>
                                
                <tr>
                	<td colspan="2"><input type="submit" value="Aceptar"/><input type="hidden" name="modifica" value="SI"/> </td>
                </tr>
            
            </table>
                </c:forEach>
        </form>
        </c:if>
        <c:if test="${param.txt_cod != null}">
        <sql:update var="result" dataSource="${bdatos}">    
        UPDATE estudiante set 
        nombres='${param.txt_nom}',
        apellidos='${param.txt_ape}',
        direccion='${param.txt_dir}',
        telefono='${param.txt_tel}' 
        where id=${param.txt_cod}
        
    	</sql:update>
        <c:if test="${result == 1}">
        	<p>Registro actualizado satisfactoriamente</p>
            <a href="index.jsp">Volver</a>
           
        </c:if>
        </c:if>
    </body>
</html>
