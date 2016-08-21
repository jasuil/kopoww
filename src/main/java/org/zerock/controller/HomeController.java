package org.zerock.controller;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.zerock.service.BoardService;
import org.zerock.service.BoardService2;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {

  private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
  @Inject
  private BoardService service;
  @Inject
  private BoardService2 service2;
  
  /**
   * Simply selects the home view to render by returning its name.
   */
  @RequestMapping(value = "/", method = RequestMethod.GET)
  public String home(Locale locale, Model model) {  //���� ȭ��
    logger.info("Welcome home! The client locale is {}.", locale);

    Date date = new Date();
    DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);

    String formattedDate = dateFormat.format(date);

    model.addAttribute("serverTime", formattedDate);
    try {
		model.addAttribute("list", service.listAll());
	} catch (Exception e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
    return "index";
  }

  @RequestMapping(value = "/test", method = RequestMethod.GET)
  public void ajaxTest() {

  }
  @RequestMapping(value = "/list", method = RequestMethod.GET)
  public String list(Locale locale, Model model) {
	  try {
			model.addAttribute("list", service2.listAll());
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	  return "list";
  }
  
  @RequestMapping(value = "/gongji2/gongji_list", method = RequestMethod.GET)
  public String gongji2() {
	  return "gongji2/gongji_list";

  }
}
