package cn.bj.china.soft.web;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpServletRequest;

@Controller
@RequestMapping(value = "/pcpostwaybill")
public class PcPostWaybillController {

    @RequestMapping(value = "/main", method = RequestMethod.GET)
  public String list(HttpServletRequest request , Model model){
    model.addAttribute("pickupAttribute","A");
    return "pcpostwaybill/main";
  }

}
