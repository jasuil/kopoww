package org.zerock.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.zerock.domain.BoardVO2;



import org.zerock.persistence.BoardDAO2;

@Service
public class BoardServiceImpl2 implements BoardService2 {

  @Inject
  private BoardDAO2 dao;

  @Override
  public void regist(BoardVO2 board) throws Exception {

    dao.create(board);
  }

  @Override
  public BoardVO2 read(int id) throws Exception {
    return dao.read(id);
  }
  
  public BoardVO2 readRoot() throws Exception{
	  return dao.readRoot();
  }

  @Override
  public void modify(BoardVO2 board) throws Exception {
    dao.update(board);
  }

  @Override
  public void remove(int id) throws Exception {
    dao.delete(id);
  }

  @Override
  public List<BoardVO2> listAll() throws Exception {
    return dao.listAll();
  }
/*
  @Override
  public List<BoardVO2> listCriteria(Criteria cri) throws Exception {

    return dao.listCriteria(cri);
  }

  @Override
  public int listCountCriteria(Criteria cri) throws Exception {

    return dao.countPaging(cri);
  }

  @Override
  public List<BoardVO2> listSearchCriteria(SearchCriteria cri) throws Exception {

    return dao.listSearch(cri);
  }

  @Override
  public int listSearchCount(SearchCriteria cri) throws Exception {

    return dao.listSearchCount(cri);
  }
*/
}
