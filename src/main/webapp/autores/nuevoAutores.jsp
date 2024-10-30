<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.unu.proyectoWebGB.beans.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="assets/css/bootstrap.min.css">
<script src="assets/js/bootstrap.min.js"></script>
<title>Nuevos Autores</title>
</head>
<body>
	<%
	String url = "http://localhost:8089/proyectoWebGB/";

	Autor autor;
	if (request.getAttribute("autor") == null)
		autor = new Autor();
	else {
		autor = (Autor) request.getAttribute("autor");
	}
	%>
	<h3>Nuevos Autores</h3>
	<div class="container">
	<form role="form" action="<%=url%>AutoresController" method="POST">
		<input type="hidden" name="op" value="insertar">
		
			<div class="mb-3">
				<label for="nombre" class="form-label">Nombre del Autor:</label>
				<div class="col-sm-5">
				<input type="text" name="nombreAutor"
					id="nombreAutor" class="form-control"
					placeholder="Ingrese nombre del Autor"> <span
					class="input-group-addon"><span
					class="glyphicon glyphicon-asterisk"></span></span>
					</div>
			</div>
			<div class="mb-3">
				<label for="nacionalidad" class="form-label">Nacionalidad:</label>
				<div class="col-sm-5">
				<input type="text" name="nacionalidadAutor"
					class="form-control" placeholder="Ingrese nacionalidad del Autor"
					id="nacionalidadAutor"> <span class="input-group-addon"><span
					class="glyphicon glyphicon-asterisk"></span></span>
					</div>
			</div>
			<div class="col-sm-5">
		<input type="submit" value="guardar" name="Guardar" class="btn btn-info"> <a
			href="<%=url%>AutoresController?op=listar" class="btn btn-danger">Volver</a>
			</div>
	</form>
	</div>
</body>
</html>