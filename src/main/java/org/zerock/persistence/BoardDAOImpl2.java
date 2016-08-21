package org.zerock.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;
import org.zerock.domain.BoardVO2;

@Repository
public class BoardDAOImpl2 implements BoardDAO2 {

  @Inject
  private SqlSession session;

  private static String namespace = "org.zerock.mappe.BoardMapper2";

  @Override
  public void create(BoardVO2 board) throws Exception {

    session.insert(namespace + ".create", board);
  }

  @Override
  public BoardVO2 read(int id) throws Exception {
	 
    return session.selectOne(namespace + ".read", id);
  }

  @Override
  public BoardVO2 readRoot() throws Exception{
	  return session.selectOne(namespace + ".readRoot");
  }
  
  @Override
  public void update(BoardVO2 vo) throws Exception {
    session.update(namespace + ".update", vo);
  }

  @Override
  public void delete(int id) throws Exception {
    session.delete(namespace + ".delete", id);
  }

  @Override
  public List<BoardVO2> listAll() throws Exception {
    return session.selectList(namespace + ".listAll");
  }

  @Override
  public List<BoardVO2> listPage(int page) throws Exception {

    if (page <= 0) {
      page = 1;
    }

    page = (page - 1) * 10;

    return session.selectList(namespace + ".listPage", page);
  }
 /*
  @Override
  public List<BoardVO2> listCriteria(Criteria cri) throws Exception {

    return session.selectList(namespace + ".listCriteria", cri);
  }

  @Override
  public int countPaging(Criteria cri) throws Exception {

    return session.selectOne(namespace + ".countPaging", cri);
  }

  @Override
  public List<BoardVO2> listSearch(SearchCriteria cri) throws Exception {

    return session.selectList(namespace + ".listSearch", cri);
  }

  @Override
  public int listSearchCount(SearchCriteria cri) throws Exception {

    return session.selectOne(namespace + ".listSearchCount", cri);
  }

*/
}
