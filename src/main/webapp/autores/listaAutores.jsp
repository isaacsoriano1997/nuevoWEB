<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.unu.proyectoWebGB.beans.Autor"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="assets/css/bootstrap.min.css">
<script src="assets/js/bootstrap.min.js"></script>
<script>
       function eliminar(id) {
		if (confirm("Desea eliminar el registro?")==true) {
			location.href ="AutoresController?op=eliminar&idautor="+id;
		}else{
			
		}
	}
</script>
<title>Probando0 listado</title>
</head>
<body>
    <%
    String url = "http://localhost:8089/proyectoWebGB/";
    %>
	<h1 align="center">Lista de Elementos</h1>
	
	<div class="container">
	
	<a type=button href="<%=url%>AutoresController?op=nuevo" class="btn btn-secondary"> Nuevo Autor</a>
	<table id="tablalista" border="1" class="table">
		<thead>
			<tr class="table-primary">
				<th>Codigo Autor</th>
				<th>Nombre</th>
				<th>Nacionalidad</th>
				<th>Operacion</th>
			</tr>
		</thead>
		<tbody>
			<%
			List<Autor> listaAutores = (List<Autor>) request.getAttribute("listaAutores");
			if (listaAutores != null) {
				for (Autor autor : listaAutores) {
			%>
			<tr class="table-success">
				<td><%=autor.getIdAutor() %></td>
				<td><%=autor.getNombre() %></td>
				<td><%=autor.getNacionalidad() %></td>
				<td>
				<a href="<%=url%>AutoresController?op=obtener&id=<%=autor.getIdAutor()%>" class="btn btn-info">Modificar</a>
				<!-- <a href="<%=url%>AutoresController?op=eliminar&idautor=<%=autor.getIdAutor()%>" class="btn btn-danger">Eliminar</a> -->
				<a href="javascript:eliminar('<%=autor.getIdAutor()%>')" class="btn btn-danger">Eliminar</a>
				</td>
			</tr>

			<%
			    }
			}else {
			%>
			
			<tr class="table-danger">
				<td>No hay datos</td>
				<td>No hay datos</td>
				<td>No hay datos</td>
			</tr>
			
			<%
			}
			%>
		</tbody>
	</table>
	</div>
</body>
</html>