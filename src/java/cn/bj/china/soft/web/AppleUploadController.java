package cn.bj.china.soft.web;


import api.common.Wrapper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.io.*;
import java.util.ArrayList;

import java.util.List;


@RequestMapping(value = "/apple")
@Controller
public class AppleUploadController {

    /* 文件上传入口：uploadview */
    @RequestMapping(value = "/uploadview")
    //  @RequiresPermissions(value = "jdpt-mds-version:list")
    public String uploadview(final Model model) {
        model.addAttribute("res","");
        model.addAttribute("msg","");
        return "/apple/uploadverw";
    }
    @RequestMapping(value = "/save", method = RequestMethod.POST)
    //  @RequiresPermissions(value = "jdpt-mds-version:list")
    public String webSave(HttpServletRequest request, Model model , @RequestParam(value = "file") final CommonsMultipartFile file){
        Wrapper<Object, Object> wrapper = new Wrapper<Object, Object>();
        //  logger.debug("开始进入收寄保存服务=============================");
        System.out.println("开始进入收寄保存服务=============================");
        if(! file.getOriginalFilename().toUpperCase().endsWith(".TXT")){
            //返回文件格式错误
            System.out.println("文件格式错误！");
            model.addAttribute("res","2");
            model.addAttribute("msg","文件格式错误");
            return "/apple/uploadverw";
        }
        try {
            System.out.println(" filePath:"+ file.getOriginalFilename());
            //读文件返回每一条的集合
            List<String> list= readFileByLines(file);

        } catch (Exception e) {
            e.printStackTrace();
            model.addAttribute("res","2");
            model.addAttribute("msg","读文件报错："+e.getMessage());
            return "/apple/uploadverw";
        }
        //处理数据

        //调收寄服务
        System.out.println("保存成功！");
        model.addAttribute("res","1");
        model.addAttribute("msg","文件保存成功10条！文件保存失败20条！");
        return  "/apple/uploadverw";
    }
    /**
     * 以行为单位读取文件，常用于读面向行的格式化文件
     */
    public static List<String> readFileByLines(CommonsMultipartFile file) {
        BufferedReader reader = null;
        List<String> list = new ArrayList<>();
        if(file.isEmpty()){
            return list;
        }
        try {
            System.out.println("以行为单位读取文件内容，一次读一整行：");
            reader  =  new BufferedReader(new InputStreamReader(file.getInputStream(),"UTF-8"));
            String tempString = null;
            int line = 1;
            int count =1;
            // 一次读入一行，直到读入null为文件结束
            while ((tempString = reader.readLine()) != null) {
                // 显示行号
                System.out.println();
                list.add(tempString);
                System.out.println("line " + line + ": " + tempString);
                System.out.println("line .trim" + line + ": " + tempString.trim());
                String [] str = tempString.split("\\|");
                print(str);
                line++;
                count++;
                if(count>10){
                    break;
                }

            }
            reader.close();
        } catch( FileNotFoundException e){
            e.printStackTrace();
        } catch (IOException e ) {
            e.printStackTrace();
        } finally {
            if (reader != null) {
                try {
                    reader.close();
                } catch (IOException e1) {
                }
            }

        }
        return list;
    }

    public static void print(String []str){
        //  System.out.println(str.toString());
        /*for (String s : str){
            System.out.print(s+" \t");
        }*/
        for(int i=0;i<str.length;i++){
            System.out.print("第"+i+""+str[i]+" \t");
        }
    }

}
