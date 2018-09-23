package cn.bj.china.soft.web;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpServletRequest;

@Controller
@RequestMapping(value = "/ztree")
public class ZtreeController {
    @RequestMapping(value = "/main", method = RequestMethod.GET)
    public String list(HttpServletRequest request , Model model){
        model.addAttribute("pickupAttribute","A");
        return "ztreedemo/ztree";
    }

    @RequestMapping(value = "/query", method = RequestMethod.POST)
    public String querys(HttpServletRequest request , Model model){
        model.addAttribute("pickupAttribute","A");
        return "ztreedemo/querys";
    }
}
