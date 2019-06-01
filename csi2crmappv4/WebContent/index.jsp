<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
<title>Mi Primer Formulario</title>
<style type="text/css">
	form{
		width: 40%;
		margin-top: 20%;
		margin-bottom: 20%;
		margin-left: 30%;
		margin-right: 25%;		
	}
	input, button{
		margin-top: 2%;
	}
</style>
<script type="text/javascript">
function compruebayenvia() {
	datos=document.iniciosesion;
	if (datos.usuario.value == '' ||
			datos.pass.value == '')
		alert ('¡Tiene que rellenar todos los campos!');
	else datos.submit();
}
function compruebanums(campo, evento) {
	var keycode;
	if (window.event) keycode = window.event.keyCode;
	else if (evento) keycode = evento.which;
	else return true;
	if (keycode < 48 || keycode > 57) //Rango ASCII de números
	{
		if (keycode != 8 && keycode != 27 && keycode != 0 ) { //Caracteres especiales permitidos
			alert('Sólo puede introducir números ');
			return false;
		}
		else return true;
	}
	else return true;
}
function compruebaalfan(campo, evento) {
	var keycode;
	if (window.event) {keycode = window.event.keyCode;}
	else if (evento) {keycode = evento.which;}
	else {
		return true;
		}
	if (( keycode < 48 || keycode > 57 ) && ( keycode < 64 || keycode > 90 ) && ( keycode < 97 || keycode > 122 )) //Rango ASCII de números y letras
	{
		if (keycode != 8 && keycode != 27 && keycode != 0 ) { //Caracteres especiales permitidos
			alert('Sólo puede introducir letras y números ');
			return false;
		}
		else {return true;}
	}
	else {
		return true;
		}
}
</script>
</head>
<body class="text-center">
    <form class="form-signin" action="bienvenido.jsp" method="post" name="iniciosesion">
  <h1 class="h3 mb-3 font-weight-normal">Inicio Sesion</h1>
  <label for="inputEmail" class="sr-only">Usuario</label>
  <input type="text" name="usuario" onkeypress="return compruebaalfan(this,event);" maxlength="10" value="" id="inputEmail" class="form-control" placeholder="Usuario" required>
  <label for="inputPassword" class="sr-only">Password</label>
  <input type="password" name="pass" onkeypress="return compruebaalfan(this,event);" maxlength="8" value="" id="inputPassword" class="form-control" placeholder="Contraseña" required>
  <button class="btn btn-lg btn-primary btn-block" type="submit" name="send" value="Enviar" onclick="compruebayenvia();">Enviar</button>
</form>
</body>
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
</html>