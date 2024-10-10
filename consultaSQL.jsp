<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
 <title> Lista de usuarios </title>
</head>
<body>
<% 
Connection conexion=DriverManager.getConnection("jdbc:mysql://localhost:3306/neptuno","ifcd0210","123456");
out.println("Conexión realizada con éxito a: "+conexion.getCatalog());
Statement orden=conexion.createStatement();

ResultSet resultado=orden.executeQuery("SELECT nombredecategoria, descripcion FROM categorias");

%>

<table border="1">
 <tr> <td> nombre </td> <td> descripcion </td> </tr>
<%
while(resultado.next()){ %>
    <tr>   
        <td><%out.println(resultado.getInt("nombredecategoria"));%></td>
        <td><%out.println(resultado.getString("descripcion"));%></td>
    </tr>
<%
}

resultado.close();
orden.close();
conexion.close();
%>
</table>
</body>
</html>