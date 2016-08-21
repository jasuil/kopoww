package org.zerock.controller;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.zerock.domain.BoardVO;

import org.zerock.service.BoardService;

@Controller
@RequestMapping("/board/*")
public class BoardController {

  private static final Logger logger = LoggerFactory.getLogger(BoardController.class);

  @Inject
  private BoardService service;
  
//  @RequestMapping(value = "/json", method = RequestMethod.GET)
//  @ResponseBody
//  public ResponseEntity<BoardVO> json(Model model) throws Exception {
//	  BoardVO boardVO = new BoardVO();
//	  boardVO.setTitle("새로운 글을 넣습니다. ");
//	  boardVO.setContent("새로운 글을 넣습니다. ");
//	  boardVO.setWriter("user00");
//	  boardVO.setViewcnt(2);
//	  boardVO.setLikecnt(7);
//	  return new ResponseEntity<> (boardVO, HttpStatus.OK);
//  }
  
//  @RequestMapping(value = "/xml", method = RequestMethod.GET)
//  @ResponseBody
//  public ResponseEntity<BoardVOXML> xml(Model model) throws Exception {
//	  BoardVOXML board = new BoardVOXML();
//	  board.setTitle("새로운 글을 넣습니다. ");
//	  board.setContent("새로운 글을 넣습니다. ");
//	  board.setWriter("user00");
//	  board.setViewcnt(2);
//	  board.setLikecnt(7);
//	  return new ResponseEntity<> (board, HttpStatus.OK);
//  }

  @RequestMapping(value = "/register", method = RequestMethod.GET)
  public void registerGET(BoardVO board, Model model) throws Exception {

    logger.info("register get ...........");
  }

//   @RequestMapping(value = "/register", method = RequestMethod.POST)
//   public String registPOST(BoardVO board, Model model) throws Exception {
//  
//   logger.info("regist post ...........");
//   logger.info(board.toString());
//  
//   service.regist(board);
//  
//   model.addAttribute("result", "success");
//  
//   //return "/board/success";
//   return "redirect:/board/listAll";
//   }

  @RequestMapping(value = "/register", method = RequestMethod.POST)
  public String registPOST(BoardVO board, RedirectAttributes rttr) 
		  throws Exception {

    logger.info("regist post ...........");
    logger.info(board.toString());

    service.regist(board);
    
    Thread.sleep(5000);

    rttr.addFlashAttribute("msg", "success");
    return "redirect:/board/listAll";
  }

  @RequestMapping(value = "/listAll", method = RequestMethod.GET)
  public void listAll(Model model) throws Exception {

    logger.info("show all list......................");
    model.addAttribute("list", service.listAll());
  }

  @RequestMapping(value = "/read", method = RequestMethod.GET)
  public void read(@RequestParam("id") int id, Model model) throws Exception {

    model.addAttribute(service.read(1));
  }

  @RequestMapping(value = "/remove", method = RequestMethod.POST)
  public String remove(@RequestParam("id") int id, RedirectAttributes rttr) throws Exception {

    service.remove(id);

    rttr.addFlashAttribute("msg", "SUCCESS");

    return "redirect:/board/listAll";
  }

  @RequestMapping(value = "/modify", method = RequestMethod.GET)
  public void modifyGET(int id, Model model) throws Exception {

    model.addAttribute(service.read(id));
  }

  @RequestMapping(value = "/modify", method = RequestMethod.POST)
  public String modifyPOST(BoardVO board, RedirectAttributes rttr) throws Exception {

    logger.info("mod post............");

    service.modify(board);
    rttr.addFlashAttribute("msg", "SUCCESS");

    return "redirect:/board/listAll";
  }

//  @RequestMapping(value = "/listCri", method = RequestMethod.GET)
//  public void listAll(Criteria cri, Model model) throws Exception {
//
//    logger.info("show list Page with Criteria......................");
//
//    model.addAttribute("list", service.listCriteria(cri));
//  }

//  @RequestMapping(value = "/listPage", method = RequestMethod.GET)
//  public void listPage(@ModelAttribute("cri") Criteria cri, Model model) throws Exception {
//
//    logger.info(cri.toString());
//
//    model.addAttribute("list", service.listCriteria(cri));
//    PageMaker pageMaker = new PageMaker();
//    pageMaker.setCri(cri);
//    // pageMaker.setTotalCount(131);
//
//    pageMaker.setTotalCount(service.listCountCriteria(cri));
//
//    model.addAttribute("pageMaker", pageMaker);
//  }

//  @RequestMapping(value = "/readPage", method = RequestMethod.GET)
//  public void read(@RequestParam("id") int id, @ModelAttribute("cri") Criteria cri, Model model) throws Exception {
//
//    model.addAttribute(service.read(id));
//  }
//
//  @RequestMapping(value = "/removePage", method = RequestMethod.POST)
//  public String remove(@RequestParam("id") int id, Criteria cri, RedirectAttributes rttr) throws Exception {
//
//    service.remove(id);
//
//    rttr.addAttribute("page", cri.getPage());
//    rttr.addAttribute("perPageNum", cri.getPerPageNum());
//    rttr.addFlashAttribute("msg", "SUCCESS");
//
//    return "redirect:/board/listPage";
//  }
//
//  @RequestMapping(value = "/modifyPage", method = RequestMethod.GET)
//  public void modifyPagingGET(@RequestParam("id") int id, @ModelAttribute("cri") Criteria cri, Model model)
//      throws Exception {
//
//    model.addAttribute(service.read(id));
//  }

}
