package org.zerock.controller;


import java.sql.Connection;
import java.sql.DriverManager;

import org.junit.Test;



public class qq {

  
  @Test
  public void cc() throws ClassNotFoundException{
	  Class.forName("net.sf.log4jdbc.sql.jdbcapi.DriverSpy");
	  try(Connection con=DriverManager.getConnection("jdbc:log4jdbc:mysql://192.168.56.1:33060/koposw22","root","1212"))
	  { 
		  System.out.println("dd");
	  }catch(Exception e){
		e.printStackTrace();
	  }
  }



}
