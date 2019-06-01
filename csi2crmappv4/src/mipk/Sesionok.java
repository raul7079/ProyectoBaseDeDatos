package mipk;

public class Sesionok {

	public static boolean iniciada=false;
	
	public static void iniciar() {
		iniciada=true;
	}
	
	public static void cerrar() {
		iniciada=false;
	}
	
}
