<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="mipk.beanDB"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Modificar Datos</title>
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
		margin-bottom: 2%;
	}

</style>
<script type="text/javascript">
	function compruebayenvia() {
        datos = document.formulario;
        if (datos.id.value == '' ||
            datos.selectCampo.value == '' ||
            datos.valor.value == '')
            alert('¡Tiene que rellenar todos los campos!');
        else datos.submit();
    }
</script>
</head>
<body>
<h1><%=session.getAttribute("usuario") %>: Aqui puede modificar los medico</h1>
<hr/>
<div>
<a class="btn btn-primary" type="button" href="bienvenido.jsp">Página principal</a>
<a class="btn btn-danger" type="button" href="cerrarsesion.jsp">Salir</a>
</div>

<form action="updatedatos.jsp" method="post" name="formulario">
		<div class="form-group">
			<label for="id">ID Medico</label> 
			<input style="width:300px" type="text" class="form-control" id="id" name="id" placeholder="Introduzca el id del medico" >
		</div>
		<div class="form-group">
		<label for="campo">Seleccione el campo que desea modificar</label> 
			<select id="campo" name="selectCampo">
				<option value="nombre" selected>Nombre</option>
				<option value="apellidos">Apellidos</option>
			</select>
		</div>
		<div class="form-group">
			<label for="valor">Nuevo valor</label> 
			<input style="width:300px" type="text" class="form-control" id="valor" name="valor" placeholder="Introduzca el valor nuevo">
		</div>
		<input class="btn btn-primary" type="button" name="send" value="Actualizar" onclick="compruebayenvia();"/>
	</form>

<%
beanDB basededatos = new beanDB();			
String idMod = request.getParameter("id");
String campo = request.getParameter("selectCampo");
String valor = request.getParameter("valor");
if(valor != null && idMod != null && valor != null){
	 String queryUpdate = "update medicos set " + campo + "='" + valor + "' where idMedico=" + idMod;
	 basededatos.update(queryUpdate);
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

