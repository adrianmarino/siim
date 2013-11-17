package com.ar.bambusolutions.siim_cliente;

import org.apache.http.HttpResponse;
import org.apache.http.client.HttpClient;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.impl.client.DefaultHttpClient;
import org.apache.http.params.BasicHttpParams;
import org.apache.http.params.HttpConnectionParams;
import org.apache.http.params.HttpParams;
import org.apache.http.util.EntityUtils;
import org.json.JSONArray;
import org.json.JSONObject;
import net.photopay.base.BaseCameraActivity;
import net.photopay.base.BaseBarcodeActivity;
import mobi.pdf417.Pdf417MobiSettings;
import mobi.pdf417.activity.ScanActivity;
import android.app.Activity;
import android.app.AlertDialog;
import android.app.ProgressDialog;
import android.content.DialogInterface;
import android.content.Intent;
import android.os.Bundle;
import android.util.Log;
import android.view.View;
import android.widget.AdapterView;
import android.widget.ArrayAdapter;
import android.widget.Button;
import android.widget.EditText;
import android.widget.ListView;
import android.widget.Spinner;
import android.widget.TextView;
import android.widget.ToggleButton;


public class App extends Activity 
{
	
/*Variables Globales*/
	
public static String respuesta="error de conexion"; 
public static String Buffer=""; 
public static String auth_token=""; 
public static String DNI_Paciente="";
     
	
	/*Actividad Principal*/
	 @Override
	 protected void onCreate(Bundle savedInstanceState) 
	 {
	        super.onCreate(savedInstanceState);
	        setContentView(R.layout.activity_app);
	        
	       /*Localizar los controles*/
	   	    TextView txtUsuario = (TextView)findViewById(R.id.text_muestrausuario);
	       
           /*Recuperamos la información pasada en el intent*/
            Bundle bundle = this.getIntent().getExtras();

           /*Construimos el mensaje a mostrar*/
            txtUsuario.setText(bundle.getString("USUARIO"));
            auth_token=bundle.getString("auth_token");
            
            /*Declaracion de Spinner*/
            ArrayAdapter<CharSequence> adaptador = ArrayAdapter.createFromResource(this,R.array.Valores_Historia_Clinica,android.R.layout.simple_spinner_item);
            Spinner cmbOpciones = (Spinner)findViewById(R.id.spinner_Historia);
                        
            adaptador.setDropDownViewResource(android.R.layout.simple_spinner_dropdown_item);
             
            cmbOpciones.setAdapter(adaptador);
            
            /*Funciones del Spinner*/
            cmbOpciones.setOnItemSelectedListener(new AdapterView.OnItemSelectedListener() 
            {
              public void onItemSelected(AdapterView<?> parent,android.view.View v, int position, long id) 
              {
            	//  EditText editHistoria = (EditText)findViewById(R.id.edit_Historia);
            	  ListView lstDatos = (ListView)findViewById(R.id.listView_Historia);
            	             	  
            	  switch(position+1)
            	  {
            	  case 1:/*patient*/
            	  {
            		  try
            		  {
            			  String[] datos = new String[3];
            			  
            			  JSONObject respJSON = new JSONObject(Buffer);
        	       		  String patient = respJSON.getString("patient");
        	       		  JSONObject patientJSON = new JSONObject(patient);
                          
        	       		  datos[0]="Grupo Sanguineo: "+patientJSON.getString("blood_type");
        	       		  datos[1]="Altura: "+patientJSON.getString("height");
        	       		  datos[2]="Peso: "+patientJSON.getString("weight");
        	       		 
        	       		  /*Relleno el ListView*/
        	       		  ArrayAdapter<String> adaptador = new ArrayAdapter<String>(App.this,android.R.layout.simple_list_item_1, datos);
        	       		  lstDatos.setAdapter(adaptador);
            		  }
            		  catch (Exception ex)
            		  {
            			  Log.e("Error en extraccion JSON Patient - SPINNER","Error",ex);
            		  }
            		  
            		  break;
            	  }
            	  case 2:/*allergies*/
            	  {
            		  try
            		  {
            			  JSONObject respJSON = new JSONObject(Buffer);
        	       		  String allergies = respJSON.getString("allergies");
        	       		  JSONArray allergiesJSON = new JSONArray(allergies);
        	       		  
        	       		  String[] datos = new String[allergiesJSON.length()];  
        	       		  
        	       		for(int i=0; i<allergiesJSON.length(); i++)
        	            {
        	                JSONObject obj = allergiesJSON.getJSONObject(i);
        	                if (obj.getString("cause")!="null")
        	                {datos[i] =obj.getString("cause");}
        	                else {datos[i] = " ";};
        	            }
        	       		  
        	       		  
        	       		  /*Relleno el ListView*/
        	       		  ArrayAdapter<String> adaptador = new ArrayAdapter<String>(App.this,android.R.layout.simple_list_item_1, datos);
        	       		  lstDatos.setAdapter(adaptador);
            		  }
            		  catch (Exception ex)
            		  {
            			  Log.e("Error en extraccion JSON Allergies - SPINNER","Error",ex);
            		  }
            		  break;
            	  }
            	  case 3:/*antecedents*/
            	  {
            		  try
            		  {
            			  JSONObject respJSON = new JSONObject(Buffer);
        	       		  String antecedents = respJSON.getString("antecedents");
        	       		  JSONArray antecedentsJSON = new JSONArray(antecedents);
        	       		  
        	       		  String[] datos = new String[antecedentsJSON.length()];  
        	       		  
        	       		for(int i=0; i<antecedentsJSON.length(); i++)
        	            {
        	                JSONObject obj = antecedentsJSON.getJSONObject(i);
        	                if (obj.getString("description")!="null")
        	                {datos[i] =obj.getString("description");}
        	                else {datos[i] = " ";};
        	                 
        	            }
        	       		  
        	       		  
        	       		  /*Relleno el ListView*/
        	       		  ArrayAdapter<String> adaptador = new ArrayAdapter<String>(App.this,android.R.layout.simple_list_item_1, datos);
        	       		  lstDatos.setAdapter(adaptador);
            		  }
            		  catch (Exception ex)
            		  {
            			  Log.e("Error en extraccion JSON Antecedents - SPINNER","Error",ex);
            		  }
            		  break;
            	  }
            	  case 4:/*consultations*/
            	  {
            		  try
            		  {
            			  JSONObject respJSON = new JSONObject(Buffer);
        	       		  String consultations = respJSON.getString("consultations");
        	       		  JSONArray consultationsJSON = new JSONArray(consultations);
        	       		  
        	       		  String[] datos = new String[consultationsJSON.length()];  
        	       		  
        	       		for(int i=0; i<consultationsJSON.length(); i++)
        	            {
        	                JSONObject obj = consultationsJSON.getJSONObject(i);
        	                
        	                if (obj.getString("diagnostic")!="null")
        	                {
        	                 String diagnostic = obj.getString("diagnostic");
        	                 String achievement_date = obj.getString("achievement_date");
        	                 datos[i] = achievement_date+" "+diagnostic;
        	                }
        	            }
        	       		  
        	       		  
        	       		  /*Relleno el ListView*/
        	       		  ArrayAdapter<String> adaptador = new ArrayAdapter<String>(App.this,android.R.layout.simple_list_item_1, datos);
        	       		  lstDatos.setAdapter(adaptador);
            		  }
            		  catch (Exception ex)
            		  {
            			  Log.e("Error en extraccion JSON Consultations - SPINNER","Error",ex);
            		  }
            		  break;
            	  }
            	  case 5:/*diseases*/
            	  {
            		  try
            		  {
            			  JSONObject respJSON = new JSONObject(Buffer);
        	       		  String diseases = respJSON.getString("diseases");
        	       		  JSONArray diseasesJSON = new JSONArray(diseases);
        	       		  
        	       		  String[] datos = new String[diseasesJSON.length()];  
        	       		  
        	       		for(int i=0; i<diseasesJSON.length(); i++)
        	            {
        	                JSONObject obj = diseasesJSON.getJSONObject(i);
        	                
        	                if (obj.getString("name")!="null")
        	                {
        	                 
        	                  String record_date = obj.getString("record_date");
              	              String name = obj.getString("name");
              	              datos[i] = record_date+" "+name; 
        	                }
        	                
        	            }
        	       		  
        	       		  
        	       		  /*Relleno el ListView*/
        	       		  ArrayAdapter<String> adaptador = new ArrayAdapter<String>(App.this,android.R.layout.simple_list_item_1, datos);
        	       		  lstDatos.setAdapter(adaptador);
            		  }
            		  catch (Exception ex)
            		  {
            			  Log.e("Error en extraccion JSON Diseases - SPINNER","Error",ex);
            		  }
            		  break;
            	  }
            	  case 6:/*medications*/
            	  {
            		  try
            		  {
            			  JSONObject respJSON = new JSONObject(Buffer);
        	       		  String medications = respJSON.getString("medications");
        	       		  JSONArray medicationsJSON = new JSONArray(medications);
        	       		  
        	       		  String[] datos = new String[medicationsJSON.length()];  
        	       		  
        	       		for(int i=0; i<medicationsJSON.length(); i++)
        	            {
        	                JSONObject obj = medicationsJSON.getJSONObject(i);
        	                
        	                if (obj.getString("name") != "null")
        	                {
	        	                
        	                	String name = obj.getString("name");
	        	                String dose = " ";
	        	                String amount = " ";
	        	                String route =" ";
	        	                
        	                	if (obj.getString("amount")!="null")
	        	                {
	        	                	amount = obj.getString("amount");
	        	                }
        	                
	        	                if (obj.getString("dose")!="null")
	        	                {
	        	                	dose = obj.getString("dose");
	        	                }
	        	              
	        	                if (obj.getString("route")!="null")
	        	                {
	        	                	amount = obj.getString("route");
	        	                }
        	                
	        	                
	        	                datos[i] = name+" "+dose+" "+amount+" mg "+route;
        	                }
        	            }
        	       		  
        	       		  
        	       		  /*Relleno el ListView*/
        	       		  ArrayAdapter<String> adaptador = new ArrayAdapter<String>(App.this,android.R.layout.simple_list_item_1, datos);
        	       		  lstDatos.setAdapter(adaptador);
            		  }
            		  catch (Exception ex)
            		  {
            			  Log.e("Error en extraccion JSON Medications - SPINNER","Error",ex);
            		  }
            		  break;
            	  }
            	  case 7:/*vaccines*/
            	  {
            		  try
            		  {
            			  JSONObject respJSON = new JSONObject(Buffer);
        	       		  String vaccines = respJSON.getString("vaccines");
        	       		  JSONArray vaccinesJSON = new JSONArray(vaccines);
        	       		  
        	       		  String[] datos = new String[vaccinesJSON.length()];  
        	       		  
        	       		for(int i=0; i<vaccinesJSON.length(); i++)
        	            {
        	                JSONObject obj = vaccinesJSON.getJSONObject(i);
        	                
        	                if (obj.getString("name")!= "null")
        	                {
        	                  String last_application = obj.getString("last_application");
        	                  String name = obj.getString("name");
        	                  datos[i] = last_application+" "+name;
        	                }
        	            }
        	       		  
        	       		  
        	       		  /*Relleno el ListView*/
        	       		  ArrayAdapter<String> adaptador = new ArrayAdapter<String>(App.this,android.R.layout.simple_list_item_1, datos);
        	       		  lstDatos.setAdapter(adaptador);
            		  }
            		  catch (Exception ex)
            		  {
            			  Log.e("Error en extraccion JSON Vaccines - SPINNER","Error",ex);
            		  }
            		  break;
            	  }
            	  case 8:/*medical_exams*/
            	  {
            		  try
            		  {
            			  JSONObject respJSON = new JSONObject(Buffer);
        	       		  String medical_exams = respJSON.getString("medical_exams");
        	       		  JSONArray medical_examsJSON = new JSONArray(medical_exams);
        	       		  
        	       		  String[] datos = new String[medical_examsJSON.length()];  
        	       		  
        	       		for(int i=0; i<medical_examsJSON.length(); i++)
        	            {
        	                JSONObject obj = medical_examsJSON.getJSONObject(i);
        	               if (obj.getString("name")!= "null")
        	               {
        	                String achievement_date = obj.getString("achievement_date");
        	                String name = obj.getString("name");
        	                datos[i] = achievement_date+" "+name;
        	               }
        	            } 
        	       		  
        	       		  /*Relleno el ListView*/
        	       		  ArrayAdapter<String> adaptador = new ArrayAdapter<String>(App.this,android.R.layout.simple_list_item_1, datos);
        	       		  lstDatos.setAdapter(adaptador);
            		  }
            		  catch (Exception ex)
            		  {
            			  Log.e("Error en extraccion JSON Allergies - SPINNER","Error",ex);
            		  }
            		  break;
            	  }
            	  default:break;
            	}
              }
             
              public void onNothingSelected(AdapterView<?> parent) 
              {
            	  ListView lstDatos = (ListView)findViewById(R.id.listView_Historia);
            	  lstDatos.setAdapter(null);
              }
            });
           
            
	 }
	 
	 /*Muestro lo que devuelve la Camara*/
	 @Override
     protected void onActivityResult(int requestCode, int resultCode, Intent data)  
	 {

		   //TextView txtPaciente = (TextView)findViewById(R.id.text_Nombre);
	       //TextView txtFecha = (TextView)findViewById(R.id.text_Fecha);
	       ListView lstDatos = (ListView)findViewById(R.id.listView_Historia);
     	   lstDatos.setAdapter(null);
     	   
			if(requestCode == 1337)
				{

				if (resultCode == BaseBarcodeActivity.RESULT_OK)
					{
					/* Muestro DNI leido*/
					
					/*Declaracion de objeto de la camara*/
					String barcodeData = data.getStringExtra(BaseBarcodeActivity.EXTRAS_RESULT);
			       
					/*Construimos el mensaje a mostrar*/
			        String[] separacion = barcodeData.split("@");
			        DNI_Paciente=separacion[1].trim();
			        //txtPaciente.setText(separacion[4].trim()+","+separacion[5].trim());
			        //txtFecha.setText(separacion[7].trim());
			        try {
				    	 BuscarPaciente(DNI_Paciente,auth_token);
				    	 } 
				     catch (Exception ex) 
				        {
						Log.e("Error en comunicacion - Busqueda Camara","Error", ex);
					    }
		            }
				else if(resultCode == BaseBarcodeActivity.RESULT_CANCELED)
					{
					Log.e("No se pueden mostrar datos - DNI Camara","Error!");
					}
				}

		}
	 
	 /* Manejo rotacion pantalla*/
	 @Override
	 protected void onSaveInstanceState(Bundle outState)
	 {
	     super.onSaveInstanceState(outState);
	     TextView txtUsuario = (TextView)findViewById(R.id.text_muestrausuario);
	     TextView txtPaciente = (TextView)findViewById(R.id.text_Nombre);
	     TextView txtFecha = (TextView)findViewById(R.id.text_Fecha);
	       
	     outState.putString("USUARIO",txtUsuario.getText().toString());
	     outState.putString("NOMBRE",txtPaciente.getText().toString());
	     outState.putString("FECHA",txtFecha.getText().toString());
	 }
	 @Override
	 protected void onRestoreInstanceState(Bundle savedInstanceState)
	 {
	     super.onRestoreInstanceState(savedInstanceState);
	     TextView txtUsuario = (TextView)findViewById(R.id.text_muestrausuario);
	     TextView txtPaciente = (TextView)findViewById(R.id.text_Nombre);
	     TextView txtFecha = (TextView)findViewById(R.id.text_Fecha);

	     txtUsuario.setText(savedInstanceState.getString("USUARIO"));
	     txtPaciente.setText(savedInstanceState.getString("NOMBRE"));
	     txtFecha.setText(savedInstanceState.getString("FECHA"));
	 }
	 
	 /*Lectura de DNI por Camara*/
	 public void LeerDNI(View view)
	 {
		 
		try
		{
		 //Creo el Intent para el escaneo
		 Intent i = new Intent(this, ScanActivity.class);
		/*Inicializo el objeto de la camara*/
		 Pdf417MobiSettings sett = new Pdf417MobiSettings();
		 sett.setPdf417Enabled(true);
		 sett.setDontShowDialog(true);
		 sett.setRemoveOverlayEnabled(true);
		
		 /*Cargo Licencia gratuita*/ 
		 i.putExtra(BaseCameraActivity.EXTRAS_LICENSE_KEY, "4b2b088801ead5183cef6d5038b45003494ce5ca36a1e19fd145557926109e0865a1e794438f6c12a0");
		 i.putExtra(BaseBarcodeActivity.EXTRAS_SETTINGS,sett);
		 

         //Lanzo la actividad de escaneo
		 startActivityForResult(i,1337);
		}
		catch (Exception ex)
		{
		  Log.e("No se puede inicializar Camara - Lectura Camara ","Error!", ex);	
		}
	 }    
	 
	 /*Boton de Habilitacion de Ingreso Manual*/
	 public void IngresoManualDNI(View view)
	 {
		 
		 TextView txtIDNI = (TextView)findViewById(R.id.text_IDNI);
	     EditText editIDNI = (EditText)findViewById(R.id.edit_IDNI);
	     Button btnIDNI = (Button)findViewById(R.id.button_IDNI);
	     ToggleButton btnIngresoManual = (ToggleButton) findViewById(R.id.toggle_IDNI);
	     ListView lstDatos = (ListView)findViewById(R.id.listView_Historia);
   	     lstDatos.setAdapter(null);
   	     
		 if (btnIngresoManual.isChecked())
		 {
		  txtIDNI.setVisibility(0); /* 0 = visible, 4 = invisible, 8 = gone*/
		  editIDNI.setVisibility(0);
		  btnIDNI.setVisibility(0);
		 }
		 else
		 {
		   txtIDNI.setVisibility(4); 
		   editIDNI.setVisibility(4);
		   btnIDNI.setVisibility(4);
		 }
	 }
	 
	 /*Boton de Busqueda Manual*/ 
	 public void BuscarDNI(View view) 
	 {
		   
		 TextView txtIDNI = (TextView)findViewById(R.id.text_IDNI);
	     EditText editIDNI = (EditText)findViewById(R.id.edit_IDNI);
	     Button btnIDNI = (Button)findViewById(R.id.button_IDNI);
	     ToggleButton btnIngresoManual = (ToggleButton) findViewById(R.id.toggle_IDNI);
	     
	     try {
	    	 BuscarPaciente(editIDNI.getText().toString(),auth_token);
	    	 } 
	     catch (Exception ex) 
	        {
			Log.e("Error en comunicacion - Busqueda Manual","Error", ex);
		    }
         
	     /*Limpio Variables*/     
	     txtIDNI.setVisibility(4); 
		 editIDNI.setVisibility(4);
		 editIDNI.setText("");
		 btnIDNI.setVisibility(4);
		 btnIngresoManual.setChecked(false);
	 }

	 /*Busco los datos del WebServices*/
	 public void BuscarPaciente(final String DNI_Paciente, final String auth_token) 
	 {

      /*Ejecuto un thread adicional para realizar la conexion al servidor*/
		 final ProgressDialog dialogo = ProgressDialog.show(App.this, "","Consultando DNI al Servidor...", true);
	    	
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
		    	  HttpGet mensaje = new HttpGet("http://siim.bambusolutions.com.ar/medical_histories/search_by_dni.json?query="+DNI_Paciente+"&auth_token="+auth_token);
		    	  mensaje.setHeader("content-type", "application/json");
		    	       	    	        
	             try
	   	            {
	            	   HttpResponse resp = httpClient.execute(mensaje);
		               String respStr = EntityUtils.toString(resp.getEntity());
		                  
		               Buffer = respStr;
		               
		               JSONObject respJSON = new JSONObject(Buffer);
				       respuesta = respJSON.getString("response");
			                 
		    	     }
	         	  	            
	             catch(Exception ex)
	             {
	             Log.e("Problemas con la conexion al WebServices - Conexion","Error", ex);
	             respuesta="error de conexion";
		     	 Buffer="";	
	             }
	            		   
	    	  /*Aqui va lo que quiero que se refleje en el UIThread*/ 
	            runOnUiThread(new Runnable() 
	     	     {
	     	      public void run() 
	        	   {
	     	    	/*Aviso de no encontrada la Historia Clinica*/
	     	    	 AlertDialog.Builder dialog1 = new AlertDialog.Builder(App.this);
	     	    	 
	     	    	 dialog1.setMessage("No existe la Historia Clinica para dicho Paciente");
	     	    	 dialog1.setTitle("Historia Clinica");
	     	    	 dialog1.setPositiveButton("OK", new DialogInterface.OnClickListener() 
	     	    	 {
	     	    	  @Override
	     	    	  public void onClick(DialogInterface dialog, int which) 
	     	    	  {
	     	    	     dialog.cancel();
	     	    	  }
	     	    	 });
	     	    	
	     	    	 /*Aviso de Error en la Conexion*/
	     	    	 AlertDialog.Builder dialog2 = new AlertDialog.Builder(App.this);
	     	    	 
	     	    	 dialog2.setMessage("Falla en la Conexion, verificar la misma.");
	     	    	 dialog2.setTitle("Historia Clinica");
	     	    	 dialog2.setPositiveButton("OK", new DialogInterface.OnClickListener() 
	     	    	 {
	     	    	  @Override
	     	    	  public void onClick(DialogInterface dialog, int which) 
	     	    	  {
	     	    	     dialog.cancel();
	     	    	  }
	     	    	 });
	     	    	 
	     	    	 /* Empiezo la busqueda */
	     	    	 TextView txtPaciente = (TextView)findViewById(R.id.text_Nombre);
	     		     TextView txtFecha = (TextView)findViewById(R.id.text_Fecha);
	     		    
	     		    try
	     		    {
	     		     /*Extraigo solo la info que tiene el vector patient*/
	     		    
	     		     JSONObject respJSON = new JSONObject(Buffer);
			        
	     			 if(respuesta.compareTo("found")==0)
	     			 {
	     			  String paciente = respJSON.getString("patient");     
	     			  /*Extraigo los datos que preciso del vector patient*/
	     			  JSONObject datoJSON = new JSONObject(paciente);
	     			  txtPaciente.setText(datoJSON.getString("lastname")+","+datoJSON.getString("firstname"));
	     			  txtFecha.setText(datoJSON.getString("birthdate"));
			          /*Cancelo el ProgressDialog*/
	     			  dialogo.dismiss();
	     			 }
	     			if(respuesta.compareTo("not found")==0)
	     			{
	     			 dialogo.dismiss();
	     			 txtPaciente.setText("-");
	     			 txtFecha.setText("-");
	     			 dialog1.show();
	     			}	
	     			if(respuesta.compareTo("error de conexion")==0)
	     			 {
	     			  dialogo.dismiss();
	     			  txtPaciente.setText("-");
	     			  txtFecha.setText("-");
	     			  dialog2.show();
	     			 }
	     			}
	     		    catch (Exception ex)
	     		    {
	     		    	Log.e("Error en extraccion JSON - Thread","Error",ex);
	     		    	if(respuesta.compareTo("error de conexion")==0)
		     			 {
		     			  dialogo.dismiss();
		     			  txtPaciente.setText("-");
		     			  txtFecha.setText("-");
		     			  dialog2.show();
		     			 }
	     		    }
	     	       }
	     	      });
		   }};
	      /*Lanzo el Thread*/       
		  Conexion.start();
	   }

	
}


