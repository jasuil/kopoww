package org.zerock.persistence;

import java.util.List;

import org.zerock.domain.BoardVO2;


public interface BoardDAO2 {

  public void create(BoardVO2 vo) throws Exception;

  public BoardVO2 read(int id) throws Exception;

  public BoardVO2 readRoot() throws Exception;
  
  public void update(BoardVO2 vo) throws Exception;

  public void delete(int id) throws Exception;

  public List<BoardVO2> listAll() throws Exception;

  public List<BoardVO2> listPage(int page) throws Exception;
/*
  public List<BoardVO2> listCriteria(Criteria cri) throws Exception;

  public int countPaging(Criteria cri) throws Exception;
  
  //use for dynamic sql
  
  public List<BoardVO2> listSearch(SearchCriteria cri)throws Exception;
  
  public int listSearchCount(SearchCriteria cri)throws Exception;
*/
}
