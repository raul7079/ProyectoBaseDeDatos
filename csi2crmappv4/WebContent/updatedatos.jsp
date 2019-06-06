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
	function Comprobar() {
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
Seleccione un nombre para modificar: 
<select name="update">
  <%
  //Recorremos una tabla donde estan los datos de la query para sacar todos los datos de los pacientes
				beanDB basededatos1 = new beanDB();
				String query = "select idMedico, nombre, apellidos from medicos";
				String[][] tablares = basededatos1.resConsultaSelectA3(query);
				for (int i = 0; i < tablares.length; i++) {
					//El value le pasamos el id del paciente
			%>
			<option value="<%=tablares[i][0]%>"><%=tablares[i][1] + " " + tablares[i][2]%>
				<%
					}
				%>
</select>
		<label for="campo">Seleccione el campo que desea modificar</label> 
			<select id="campo" name="selectCampo">
				<option value="nombre" selected>Nombre</option>
				<option value="apellidos">Apellidos</option>
			</select>
		</div>
		<div>
			<label for="valor">Nuevo valor</label> 
			<input style="width:300px" type="text" id="valor" name="valor" placeholder="valor nuevo">
		</div>
		<input class="btn btn-success" type="button" name="send" value="Enviar" onclick="Comprobar();"/>
	</form>

<%
beanDB basededatos = new beanDB();
String idMedico = request.getParameter("update");
String campo = request.getParameter("selectCampo");
String valor = request.getParameter("valor");
if(idMedico != null && valor != null){
	 String queryUpdate = "update medicos set " + campo + "='" + valor + "' where idMedico=" + idMedico;
	 basededatos.update(queryUpdate);
}
String query1="select * from medicos";
String [][] tablares2 = basededatos.resConsultaSelectA3(query1);
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
	for(int i = 0; i < tablares2.length; i++) {
		%>
		<tr>
	 		<td> <%= tablares2[i][0] %> </td>
	 		<td> <%= tablares2[i][1] %> </td>
	 		<td> <%= tablares2[i][2] %> </td>
	 	</tr> <% 	 
	}
%>
</table>
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
</body>
</html>