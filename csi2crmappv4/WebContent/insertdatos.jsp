<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="mipk.beanDB"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insertar Datos</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
<style type="text/css">
	a{
		display: inline;
	}
	div{
		margin-left: 5%;
		margin-top: 1%;
	}
	h1{
		text-align: center;		
	}
	form{
		margin-left: 5%;
		margin-top: 2%;
	}

</style>
<script type="text/javascript">
	function compruebayenvia() {
        datos = document.formulario;
        if (datos.nombre.value == '' ||
            datos.apellidos.value == '')
            alert('¡Tiene que rellenar todos los campos!');
        else datos.submit();
    }

	var cont = 0;
	var id = 1117;
	//Funcion para incrementar el id de los nuevos medicos cada vez que se hace click en el boton
	function incrementar() {
	    id = cont + 1;
	    document.getElementById("id").innerHTML = id;
	}

</script>
</head>
<body>
<h1><%=session.getAttribute("usuario") %>: Aqui puede insertar un nuevo medico</h1>
<hr/>
<div>
<a class="btn btn-primary" type="button" href="bienvenido.jsp">Página principal</a>
<a class="btn btn-danger" type="button" href="cerrarsesion.jsp">Salir</a>
</div>

<form action="insertdatos.jsp" method="post" name="formulario">
	<h4>Introduzca los datos: </h4>
		<div class="form-group">
			<input style="visibility: hidden;" type="text" class="form-control" id="id" name="id" disabled>
			<label for="nombre">Nombre</label> 
			<input style="width:400px" type="text" class="form-control" id="nombre" name="nombre" placeholder="Introduzca el nombre" >
		</div>
		<div class="form-group">
			<label for="apellidos">Apellido</label> 
			<input style="width:400px" type="text" class="form-control" id="apellidos" name="apellidos" placeholder ="Introduzca el apellido" >
		</div>
		<input id="incremento" class="btn btn-primary" type="button" name="send" value="Insertar" onclick="compruebayenvia();incrementar();"/>
</form>
<br>
<%
beanDB basededatos = new beanDB();
String nombre = request.getParameter("nombre");
String apellidos = request.getParameter("apellidos");
String id = request.getParameter("id");
if(nombre != null && apellidos != null){	
	String queryInsert = "insert into medicos values(" + id + ", '" + nombre + "', '" + apellidos + "')";
	basededatos.insert(queryInsert);
}
String query="select * from medicos";
String [][] tablares = basededatos.resConsultaSelectA3(query);
%>
<table class="table">
<%
	%>
	  <thead class="thead-dark">
		<tr>
	 		<th scope="col">idMedico</th>
			<th scope="col">Nombre</th>
	 		<th scope="col">Apellidos</th>
		</tr>
	</thead>
	<%
	for(int i = 0; i < tablares.length; i++) {
		%>
		<tr>
	 		<td> <%= tablares[i][0] %> </td>
	 		<td> <%= tablares[i][1] %> </td>
	 		<td> <%= tablares[i][2] %> </td>
	 	</tr> <% 	 
	}
%>
</table>
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
</body>
</html>