package org.zerock.service;

import java.util.List;

import org.zerock.domain.BoardVO2;

public interface BoardService2 {

  public void regist(BoardVO2 board) throws Exception;

  public BoardVO2 read(int id) throws Exception;

  public BoardVO2 readRoot() throws Exception;
  
  public void modify(BoardVO2 board) throws Exception;

  public void remove(int id) throws Exception;

  public List<BoardVO2> listAll() throws Exception;
/*
  public List<BoardVO2> listCriteria(Criteria cri) throws Exception;

  public int listCountCriteria(Criteria cri) throws Exception;

  public List<BoardVO2> listSearchCriteria(SearchCriteria cri) 
      throws Exception;

  public int listSearchCount(SearchCriteria cri) throws Exception;
*/
}
