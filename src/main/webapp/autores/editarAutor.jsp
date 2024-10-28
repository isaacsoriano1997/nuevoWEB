<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="com.unu.proyectoWebGB.beans.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	String url = "http://localhost:8089/proyectoWebGB/";

	Autor autor;
	HttpSession sesion= request.getSession();
	if (request.getAttribute("autor") == null)
		autor = new Autor();
	else {
		autor = (Autor) request.getAttribute("autor");

		System.out.println(autor.getNombre());
		System.out.println(autor.getNacionalidad());

	}
	%>
	<h3>Editar Autores</h3>
	<form role="form" action="<%=url%>AutoresController" method="POST">
		<input type="hidden" name="op" value="modificar">
		<input type="hidden" name="idAutor" value="<%=autor.getIdAutor()%>">
		Nombre:<input type="text" name="nombreAutor" id="nombreAutor" value="<%=autor.getNombre()%>"><br>
		Nacionalidad <input type="text" name="nacionalidadAutor"
			id="nacionalidadAutor" value="<%=autor.getNacionalidad()%>"><br> 
		<input type="submit"
			value="guardar" name="Guardar"> <a
			href="<%=url%>AutoresController?op=listar">Volver</a>
	</form>
</body>
</html>