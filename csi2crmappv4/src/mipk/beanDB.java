package mipk;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.ResultSetMetaData;

public class beanDB {
	   // Variables del bean
	   private Connection cn;   //La conexion a la base de datos

	   //----- Metodo que realiza la conexion a la BD
		public void conectarBD() throws SQLException
		{
	        try{
	        	Class.forName("com.mysql.jdbc.Driver").newInstance();
	            cn=DriverManager.getConnection("jdbc:mysql://rcerero.es/hospital","raul","raulangeles1997");
	        }catch (SQLException e){
	            System.out.println("Excepcion, en metodo ConectarBD(apertura DSN): " + e.getMessage());
	        }
		catch(Exception e){}
		}

	    //----- Método que realiza la desconexión de la BD
	    public void desconectarBD()
	    {
	        try{
	         	cn.close();
	        }catch (NullPointerException e){
	        	System.out.println("Excepcion, en metodo DesconectarBD: " + e.getMessage());
	        }
	    	catch (SQLException e){
	    		System.out.println("Excepcion, en metodo DesconectarBD: " + e.getMessage());
	    	}
	    }

	    //----- Mï¿½todo que realiza la consulta sobre la BD
	    public  String[] resConsultaSelect(String selec, int numcol) throws SQLException
	   {
	    Statement stmt=null;
	    ResultSet rs=null;
	    String[] result=null;

	    conectarBD();
	    //System.out.println("CAMBIAR USO DE resConsultaSelect \r\n"+selec);
	    try{
	        //Este statement lo creamos así­ porque necesitamos que el result sea scrollable
	          stmt=cn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_READ_ONLY);
	          rs=stmt.executeQuery(selec);
	          boolean hayFilas=rs.last(); //Movemos a la ultima fila para comprobar si hay filas, 
	          
	          if (hayFilas)
	          {
	              int nFilas = rs.getRow();//y despues saber el numero de filas
	              result=new String[nFilas*numcol];
	              rs.beforeFirst();
	              int i=0;
	              while (rs.next())
	              {
	                  int j = 1;
	                  while (j<=numcol)
	                  {
	                      result[i]=rs.getString(j);
	                      j++;
	                      i++;
	                  }
	              }
	          }
	          else    //No hay filas
	          {
	               result= null;
	          }

	    }catch(SQLException e){
	          System.out.println("Excepcion, en acceso a BD: " + e.getMessage());
	          System.out.println("La consulta ejecutada fue: " + selec);
	    }
	    catch (Exception e)
	    {
	    	System.out.println(e.getMessage());
	    }
	    desconectarBD();
	    return result;
	   }

	    public  String[][] resConsultaSelectA3(String selec) throws SQLException
		   {
		    Statement stmt=null;
		    ResultSet rs=null;
		    String[][] result=null;

		    conectarBD();
		    try{
		        //Este statement lo creamos así­ porque necesitamos que el result sea scrollable
		          stmt=cn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_READ_ONLY);
		          rs=stmt.executeQuery(selec);
		          boolean hayFilas=rs.last(); //Movemos a la ultima fila para comprobar si hay filas, 
	              //result=new String[rs.getRow()][];
		          if (hayFilas) 
		          {
		        	  ResultSetMetaData rsmd = rs.getMetaData();
		        	  int numberOfColumns = rsmd.getColumnCount();
		        	  int numberOfRows = rs.getRow();
		        	  result=new String[numberOfRows][numberOfColumns];
		        	  rs.beforeFirst();
		        	  int i=0;
		        	  while (rs.next())
		        	  {
		        		  int j = 0;
		        		  while (j<numberOfColumns)
		        		  {
		        			  try {
		        				  if (!rs.getString(j+1).equals("null")) result[i][j]=rs.getString(j+1);
		        				  else result[i][j]="";
		        			  }
		        			  catch (Exception e2) {
		        				  result[i][j]="";
		        			  }
		        			  j++;
		        		  }
	        			  i++;
		        	  }
		          }
		          
		    }catch(SQLException e){
		          System.out.println("Excepcion, en acceso a BD: " + e.getMessage());
		          System.out.println("La consulta ejecutada fue: " + selec);
		    }
		    catch (NullPointerException e) {
		    	System.out.println(e.getMessage());
		    }
		    catch (Exception e)
		    {
		    	System.out.println(e.getMessage());
		    }
		    desconectarBD();
		    return result;
		   }
		
	    public  String[][] SelectA3SinConectar(String selec) throws SQLException
		   {
		    Statement stmt=null;
		    ResultSet rs=null;
		    String[][] result=null;

		    try{
		        //Este statement lo creamos así­ porque necesitamos que el result sea scrollable
		          stmt=cn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_READ_ONLY);
		          rs=stmt.executeQuery(selec);
		          boolean hayFilas=rs.last(); //Movemos a la ultima fila para comprobar si hay filas, 
	              //result=new String[rs.getRow()][];
		          if (hayFilas) 
		          {
		        	  ResultSetMetaData rsmd = rs.getMetaData();
		        	  int numberOfColumns = rsmd.getColumnCount();
		        	  int numberOfRows = rs.getRow();
		        	  result=new String[numberOfRows][numberOfColumns];
		        	  rs.beforeFirst();
		        	  int i=0;
		        	  while (rs.next())
		        	  {
		        		  int j = 0;
		        		  while (j<numberOfColumns)
		        		  {
		        			  try {
		        				  if (!rs.getString(j+1).equals("null")) result[i][j]=rs.getString(j+1);
		        				  else result[i][j]="";
		        			  }
		        			  catch (Exception e2) {
		        				  result[i][j]="";
		        			  }
		        			  j++;
		        		  }
	        			  i++;
		        	  }
		          }
		          
		    }catch(SQLException e){
		          System.out.println("Excepcion, en acceso a BD: " + e.getMessage());
		          System.out.println("La consulta ejecutada fue: " + selec);
		    }
		    catch (NullPointerException e) {
		    	System.out.println(e.getMessage());
		    }
		    catch (Exception e)
		    {
		    	System.out.println(e.getMessage());
		    }
		    return result;
		   }

	    //----- Mï¿½todo que realiza modificaciones sobre la BD
		public  void update(String updateStatement)
		{
			Statement stmt=null;
			try {
				conectarBD();
			} catch (SQLException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
			try
			{
				stmt=cn.createStatement();
				stmt.executeUpdate(updateStatement);
			}
			catch(SQLException e)
			{
		          System.out.println("Excepcion, en acceso a BD: " + e.getMessage());
		          System.out.println("La consulta ejecutada fue: " + updateStatement);
			}
			desconectarBD();
		}

	    //----- Mï¿½todo que realiza inserciones en la BD
		public  void insert(String insertStatement)
		{
			Statement stmt=null;
			try {
				conectarBD();
			} catch (SQLException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
			try
			{
	      		stmt=cn.createStatement();
				stmt.execute(insertStatement);
			}
			catch(SQLException e)
			{
		          System.out.println("Excepcion, en acceso a BD: " + e.getMessage());
		          System.out.println("La consulta ejecutada fue: " + insertStatement);
			}
			desconectarBD();
		}

		//-- Se diferencia del anterior en que no hace la conexiï¿½n ni la desconexiï¿½n --
		public  void insertSinConexiones(String insertStatement)
		{
			Statement stmt=null;
			try
			{
	      		stmt=cn.createStatement();
				stmt.execute(insertStatement);
			}
			catch(SQLException e)
			{
		          System.out.println("Excepcion, en acceso a BD: " + e.getMessage());
		          System.out.println("La consulta ejecutada fue: " + insertStatement);
			}
		}

	    //----- Mï¿½todo que borra registros de la BD
		public  void delete(String deleteStatement)
		{
			Statement stmt=null;
			try {
				conectarBD();
			} catch (SQLException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
			try
			{
	      		stmt=cn.createStatement();
				stmt.execute(deleteStatement);
			}
			catch(SQLException e)
			{
		          System.out.println("Excepcion, en acceso a BD: " + e.getMessage());
		          System.out.println("La consulta ejecutada fue: " + deleteStatement);
			}
			desconectarBD();
		}
	
	
		public static String[] arraypks(String tabla) {
			beanDB ddbb=new beanDB();
			String[][] resultConsultaA3=null;
			String strSqlConsulta="select * from "+tabla;
			try {
				resultConsultaA3=ddbb.resConsultaSelectA3(strSqlConsulta);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			String[] resultado=null;
			if (resultConsultaA3!=null) {
				resultado=new String[resultConsultaA3.length];
				for (int i=0;i<resultConsultaA3.length;i++)
					resultado[i]=resultConsultaA3[i][0];
			}
			return resultado;
		}

}
