<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page import="mipk.*"%>
<html>
<head>
<% 
//aquí pongo todo el código java que quiera que mi servidor ejecute.
String usuario=request.getParameter("usuario");
String pass=request.getParameter("pass");

if (usuario == null) usuario="";
if (pass == null) pass="";

boolean ok=false;
try {
	String aux=session.getAttribute("usuario").toString();
	ok=true;
} catch (Exception e) {
	ok=false;
}
if (!ok)
	if (usuario.equals("admin") && pass.equals("1357")) {
		//usuario correcto - Tengo que crearle un handler de sesion
		session.setAttribute("usuario",usuario);
		ok=true;
	}

%><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Bienvenido</title>
<style type="text/css">
	body{
		margin: 0;
		padding: 0;
	}
	h1{
		text-align: center;		
	}
	h2{
		margin-left: 5%;
	}
	a{
		display: inline;
	}
	div{
		margin-left: 5%;
	}
	header{
		margin-top: 3%;
	}
	#centrar{
		text-align: center;
		margin-bottom: 5%;
	}
	form{
		margin-left: 5%;
		margin-top: 2%;
		margin-bottom: 2%;
	}
</style>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
</head>
<body>
<% if (ok) { %>
<header>
<h1>Bienvenido <%=session.getAttribute("usuario") %></h1>
</header>
<h2>Sesión iniciada</h2>
<hr/>
<div>
<a class="btn btn-primary" type="button" href="insertdatos.jsp">Insertar Datos</a>
<a class="btn btn-primary" type="button" href="updatedatos.jsp">Modificar Datos</a>
<a class="btn btn-primary" type="button" href="deletedatos.jsp">Borrar Datos</a>
<a class="btn btn-danger" type="button" href="cerrarsesion.jsp">Salir</a>
</div>
<form action="./verdatos.jsp" method="post">
Seleccione un nombre para ver sus visitas medicas: 
<select name="nombre">
  <%
  //Recorremos una tabla donde estan los datos de la query para sacar todos los datos de los pacientes
				beanDB basededatos1 = new beanDB();
				String querySelect = "select idPaciente, nombre, apellidos from pacientes";
				String[][] tablares = basededatos1.resConsultaSelectA3(querySelect);
				for (int i = 0; i < tablares.length; i++) {
					//El value le pasamos el id del paciente
			%>
			<option value="<%=tablares[i][0]%>"><%=tablares[i][1] + " " + tablares[i][2]%>
				<%
					}
				%>
</select>
<input class="btn btn-success" type="submit" name="send" value="Enviar">
</form>
<%

String query="select idPaciente, nombre, apellidos, fechaNacimiento from pacientes";
beanDB basededatos = new beanDB();
String [][] tablares1 = basededatos.resConsultaSelectA3(query);

%>
<table class="table">
<%
	%>
	  <thead class="thead-dark">
		<tr>
	 		<th scope="col">idPaciente</th>
			<th scope="col">Nombre</th>
	 		<th scope="col">Apellido</th>
	 		<th scope="col">Fecha Nacimiento</th>
		</tr>
	</thead>
	<%
	for(int i = 0; i < tablares1.length; i++) {
		%>
		<tr>
	 		<td> <%= tablares1[i][0] %> </td>
	 		<td> <%= tablares1[i][1] %> </td>
	 		<td> <%= tablares1[i][2] %> </td>
	 		<td> <%= tablares1[i][3] %> </td>
	 	</tr> <% 	 
	}

%>
</table>


<% } else { 
	//AHORA PONGO EL HTML DE SESION INCORRECTA %>
<header><h1>Usuario y/o contraseña incorrectos.</h1></header>
<h2 id="centrar">Por favor, inténtelo de nuevo.</h2>
<div><a class="btn btn-danger" type="button" href="index.jsp">Volver</a></div>
<% } %>
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
</body>
</html>