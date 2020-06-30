package com.example.hotel.controller;

import com.example.hotel.entity.Typeinfo;
import com.example.hotel.service.TypeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.ResourceUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

@Controller
@RequestMapping("/type/")
public class TypeController {

    @Autowired
    private TypeService typeServiceImpl;

    @RequestMapping("typeOpe")
    @ResponseBody
    public String typeOpe(String tname, Integer page, Integer limit, HttpServletRequest request) {

        return typeServiceImpl.typeOpe(tname, page, limit, request);
    }

    @RequestMapping("tname")
    @ResponseBody
    public String tname() {

        return typeServiceImpl.tname();
    }


//    @RequestMapping("addType")
//    @ResponseBody
//    public String addType(Typeinfo typeinfo) {
//        return typeServiceImpl.addType(typeinfo);
//    }

    @RequestMapping("addType")
    @ResponseBody
    public String addImg(Typeinfo typeinfo, @RequestParam(required=false)MultipartFile file, HttpServletRequest servletRequest) throws IOException {
        String img = "";
        //如果文件内容不为空，则写入上传路径

        String path = servletRequest.getServletContext().getRealPath("/image");
//        //上传文件名
//        String filename = typeinfo.getFile().getName();
//        System.out.println(filename);
//        File filepath = new File(path, filename);
//        //判断路径是否存在，没有就创建一个
//        if (!filepath.getParentFile().exists()) {
//            filepath.getParentFile().mkdirs();
//        }
//        //将上传文件保存到一个目标文档中
//        File file1 = new File(path + File.separator + filename);
//
//        img = "/image/" + filename;


//        File f = new File(ResourceUtils.getURL("classpath:").getPath());
//        File dir = new File(f.getAbsolutePath() + "/doc/");
//        if (!dir.exists())
//        {
//            dir.mkdir();
//        }
        String name = file.getOriginalFilename();
        File newFile = new File(path+ "/" + name);
        img = "/image/" + name;

        System.out.println(img);
        System.out.println(typeinfo.getImg());
        System.out.println(typeinfo.getTname());
        System.out.println(typeinfo.getAmt());
        System.out.println(typeinfo.getTcount());
        System.out.println(typeinfo.getTpeople());
        return null;

    }
}
