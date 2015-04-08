<%-- 
    Document   : insertar.jsp
    Created on : 08-abr-2015, 0:05:33
    Author     : jhonf
--%>

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
    <sql:setDataSource var="bdatos" driver="com.mysql.jdbc.Driver" url="jdbc:mysql://localhost:3306/academica" user="root" password="udenar" />
    <c:if test="${param.txt_cod==null}">
        <h1>Agregar un Estudiante</h1>
        <form action="" method="post" name="form1">
        
        	<table border="1">
            	<tr>
                	<td>Codigo:</td>
                    <td><input type="text" name="txt_cod" id="txt_cod" placeholder="Ingresa un codigo"/></td>
                </tr>
                <tr>
                	<td>Nombres:</td>
                    <td><input type="text" name="txt_nom" id="txt_nom" placeholder="Nombres completos"/></td>
                </tr>
                <tr>
                	<td>Apellidos:</td>
                    <td><input type="text" name="txt_ape" id="txt_ape" placeholder="Apellidos"/></td>
                </tr>
                  <tr>
                	<td>Direccion:</td>
                    <td><input type="text" name="txt_dir" id="txt_dir" placeholder="Direccion"/></td>
                </tr>
                <tr>
                	<td>Telefono:</td>
                    <td><input type="text" name="txt_tel" id="txt_tel" placeholder="Telefono"/></td>
                </tr>
                                </tr>
                <tr>
                	<td colspan="2"><input type="submit" name="btn_aceptar" id="btn_aceptar" value="Aceptar"/></td>
                </tr>
            
            </table>
                
        </form>
        </c:if>  
        <c:if test="${param.txt_cod != null}">   
        <sql:update var="result" dataSource="${bdatos}">
        insert into estudiante (id,nombres,apellidos,direccion,telefono) values('${param.txt_cod}','${param.txt_nom}','${param.txt_ape}','${param.txt_dir}','${param.txt_tel}')
        	
        </sql:update>
        
        <c:if test="${result == 1}">
        	<p>Registro insertado satisfactoriamente</p>
            <a href="index.jsp">Volver</a>
            <a href="insertar.jsp">Nuevo registro</a>
        </c:if>   
        </c:if>  
    </body>
</html>
