package cn.bj.china.soft.web;

import api.version.domian.dto.MobileDevVersionInfo;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import javax.servlet.http.HttpServletRequest;

@RequestMapping(value = "/winver")
@Controller
public class MobileDevWinVerController {

    @RequestMapping(value = "/vesionView")
    public String  winverView(){
        return"ztreedemo/querymain";
    }
    @RequestMapping(value = "/ztree")
    public String list(HttpServletRequest request , Model model){
        model.addAttribute("pickupAttribute","A");
        return "ztreedemo/ztree";
    }
    @RequestMapping(value = "/querys")
    public String querys(HttpServletRequest request , Model model){
        model.addAttribute("pickupAttribute","A");
        return "ztreedemo/querys";
    }
    @RequestMapping(value = "/uploadview")
    public String uploadview(){
        return "version/versionup";

    }
    @RequestMapping(value = "/apk/upload")
    public String upload( MobileDevVersionInfo info, Model model,
                  @RequestParam(value = "file") CommonsMultipartFile file,
                          @RequestParam(value = "uploadType") String uploadType,
                          @RequestParam(value = "filePath") String filepath){
    return "";
    }
}
