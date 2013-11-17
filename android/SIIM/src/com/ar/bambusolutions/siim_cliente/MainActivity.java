package com.ar.bambusolutions.siim_cliente;

import org.apache.http.HttpResponse;
import org.apache.http.client.HttpClient;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.impl.client.DefaultHttpClient;
import org.apache.http.params.BasicHttpParams;
import org.apache.http.params.HttpConnectionParams;
import org.apache.http.params.HttpParams;
import org.apache.http.util.EntityUtils;
import org.json.JSONObject;
import android.os.Bundle;
import android.app.Activity;
import android.app.AlertDialog;
import android.app.ProgressDialog;
import android.content.DialogInterface;
import android.content.Intent;
import android.util.Log;
import android.view.Menu;
import android.view.View;
import android.widget.EditText;


public class MainActivity extends Activity 
{
/*Variables Globales*/
public static String respuesta ="error de conexion";
public static String auth_token ="ninguno";


    /*Actividad Principal*/
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
     }


    @Override
    public boolean onCreateOptionsMenu(Menu menu) 
    {
        /* Inflate the menu; this adds items to the action bar if it is present.*/
        getMenuInflater().inflate(R.menu.main, menu);
        return true;
    }

    /*Boton de conexion al Webservices*/
    public void Conectar(View view) 
    {
      	/*Creamos el Intent*/
    	EditText txtUsuario = (EditText)findViewById(R.id.edit_Usuario);
    	EditText txtPassword = (EditText)findViewById(R.id.edit_Password);
    	    	
    	autenticacion(txtUsuario.getText().toString(),txtPassword.getText().toString());
    	
    }    

    /*Realizo la autenticacion*/
    public void autenticacion(final String usuario, final String password)
    {

      /*Ejecuto un thread adicional para realizar la conexion al servidor*/
         	
    	final ProgressDialog dialog = ProgressDialog.show(MainActivity.this, "","Conectando al Servidor...", true);
    	
    	Thread Conexion = new Thread() 
    	 {
    	   public void run() 
    	   {
    		      
    	    	
    		      /*Seteado de Parametros HTTP*/
    		   	  HttpParams my_httpParams = new BasicHttpParams();
    		   	  HttpConnectionParams.setConnectionTimeout(my_httpParams,15000);
    		   	  HttpConnectionParams.setSoTimeout(my_httpParams,15000);
    		   	  /*Armado de URL*/
    	    	  HttpClient httpClient = new DefaultHttpClient(my_httpParams);
    	    	  HttpPost mensaje = new HttpPost("http://siim.bambusolutions.com.ar/login.json?user[login]="+usuario+"&user[password]="+password);
    	    	  mensaje.setHeader("content-type", "application/json");
    	    	       	    	        
                 try
       	            {
              	   	  //mensaje.wait(30000);//Timeout
                	 
                	  HttpResponse resp = httpClient.execute(mensaje);
 	                  String respStr = EntityUtils.toString(resp.getEntity());
 	                  
 	                  JSONObject respJSON = new JSONObject(respStr);
 	
 	                  respuesta = respJSON.getString("response");
 	                  auth_token = respJSON.getString("auth_token");
 	    	        }
             	  	            
                 catch(Exception ex)
                 {
                 Log.e("Problemas con la conexion al WebServices - Conexion","Error", ex);
                 respuesta="error de conexion";
		     	 }
	            		   
	    	  /*Aqui va lo que quiero que se refleje en el UIThread*/ 
                runOnUiThread(new Runnable() 
	     	     {
	     	      public void run() 
	        	   {
	     	    	  
	     	    	  EditText txtUsuario = (EditText)findViewById(R.id.edit_Usuario);
	     	    	 
	     	    	  /*Aviso de error de Usuario y/o Contraseña*/
		     	    	 AlertDialog.Builder dialog1 = new AlertDialog.Builder(MainActivity.this);
		     	    	 
		     	    	 dialog1.setMessage("Usuario o Contraseña incorrectos");
		     	    	 dialog1.setTitle("SIIM");
		     	    	 dialog1.setPositiveButton("OK", new DialogInterface.OnClickListener() {
		     	    	 
		     	    	  @Override
		     	    	  public void onClick(DialogInterface dialog, int which) 
		     	    	  {
		     	    	     dialog.cancel();
		     	    	  }
		     	    	 });
	        	   
		     	     // respuesta = "ok";
	     	    	  if(respuesta.compareTo("ok")==0)
				        {
				          Intent i = new Intent(MainActivity.this, App.class );
				          
				          /*Creamos la información a pasar entre actividades*/
				          Bundle b = new Bundle();
				          b.putString("USUARIO", txtUsuario.getText().toString());
				          b.putString("auth_token", auth_token);
					      
				          /*Cancelo el ProgressDialog*/  
				          dialog.dismiss();
				          
				          /*Añadimos la información al intent*/
				          i.putExtras(b);
				          startActivity(i);   
				        }
	     	    	  
	     	    	  // respuesta = error
	     	    	  else
	     	    	  {
				    		Log.e("Error en la autenticacion","Informacion");
				    		auth_token ="ninguno";
				    		/*Cancelo el ProgressDialog*/  
					        dialog.dismiss();
					        dialog1.show();
				    	}
	     	    	  
	     	    	}
	     	      });
    	   }};
          /*Lanzo el Thread*/       
    	  Conexion.start();
    }
}
