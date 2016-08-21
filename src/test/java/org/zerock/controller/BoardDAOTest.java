package org.zerock.controller;


import java.sql.Connection;
import java.sql.DriverManager;
import java.util.List;

import org.junit.Ignore;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;
import org.zerock.domain.BoardVO;
import org.zerock.domain.BoardVO2;
import org.zerock.persistence.BoardDAO;
import org.zerock.persistence.BoardDAO2;




@RunWith(SpringJUnit4ClassRunner.class)
@WebAppConfiguration
@ContextConfiguration(locations = { "file:src/main/webapp/WEB-INF/spring/**/*.xml" })
public class BoardDAOTest {

	 @Autowired
	  private BoardDAO dao;
	 @Autowired
	  private BoardDAO2 dao2;
	 
	  private static Logger logger = LoggerFactory.getLogger(BoardDAOTest.class);

	  
  @Ignore 
  @Test
  public void cc() throws Exception{
	  Class.forName("com.mysql.jdbc.Driver");
	  try(Connection con=DriverManager.getConnection("jdbc:mysql://192.168.56.1:33060/koposw22","root","1212"))
	  { 
		  System.out.println( con);
	  }catch(Exception e){
		e.printStackTrace();
	  }
  }
  //@Ignore
  @Test
  public void c()  {

  BoardVO board = new BoardVO();
  board.setTitle("성일이가 짱 ");
  board.setId(5);
  board.setContent("go");
  
 try{ 	
	 System.out.printf("소녀시대");
	 dao.create(board);

	 

 }catch(Exception e){
	 System.out.printf("--%s-- ", e);
 	}
  }
  
  
// @Ignore
 @Test
 public void read()  {
 try {
	
	BoardVO board = dao.read(2);
	System.out.printf("--%s--",board.getContent());
	
} catch (Exception e) {
	// TODO Auto-generated catch block
	e.printStackTrace();
}
 
  }
 
 @Ignore
 @Test
 public void testListAll() throws Exception {

   logger.info(dao.listAll().toString());

 }

 @Ignore
 @Test
 public void testListPage() throws Exception {

   int page = 1;

   List<BoardVO> list = dao.listPage(page);

   for (BoardVO boardVO : list) {
     logger.info(boardVO.getId() + ":" + boardVO.getTitle());
   }
 }


}


