package org.zerock.service;

import java.util.List;

import org.zerock.domain.BoardVO;

public interface BoardService {

  public void regist(BoardVO board) throws Exception;

  public BoardVO read(Integer id) throws Exception;

  public void modify(BoardVO board) throws Exception;

  public void remove(Integer id) throws Exception;

  public List<BoardVO> listAll() throws Exception;
/*
  public List<BoardVO> listCriteria(Criteria cri) throws Exception;

  public int listCountCriteria(Criteria cri) throws Exception;

  public List<BoardVO> listSearchCriteria(SearchCriteria cri) 
      throws Exception;

  public int listSearchCount(SearchCriteria cri) throws Exception;
*/
}
