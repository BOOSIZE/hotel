package com.example.hotel.controller;

import com.example.hotel.entity.Typeinfo;
import com.example.hotel.service.TypeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
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


    @RequestMapping("addType")
    @ResponseBody
    public String addType(Typeinfo typeinfo) {
        return typeServiceImpl.addType(typeinfo);
    }

    @RequestMapping("addImg")
    @ResponseBody
    public Map<String, Object> addImg(HttpServletRequest servletRequest, @RequestParam("file") MultipartFile file) throws IOException {
        // 1st projectPath==E:\Hunger\workspace\twpre
        String projectPath = System.getProperty("user.dir");

        //如果文件内容不为空，则写入上传路径
        if (!file.isEmpty()) {
            //上传文件路径
//            String path = projectPath + "/src/main/resources/static/images";
            String path=servletRequest.getServletContext().getRealPath("/images");
            System.out.println("文件名称"+file.getOriginalFilename());
            //上传文件名
            String filename = file.getOriginalFilename();
            File filepath = new File(path, filename);


            //判断路径是否存在，没有就创建一个
            if (!filepath.getParentFile().exists()) {
                filepath.getParentFile().mkdirs();
            }

            //将上传文件保存到一个目标文档中
            File file1 = new File(path + File.separator + filename);
            file.transferTo(file1);
            Map<String, Object> res = new HashMap<>();
            //返回的是一个url对象
            res.put("url", "/images/"+filename);
            return res;

        }
        return null;

    }
}
