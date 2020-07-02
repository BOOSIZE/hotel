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

    @ResponseBody
    @RequestMapping("/addType")
    public String addType(MultipartFile file, Typeinfo typeinfo, HttpServletRequest request) throws Exception {
        String path = request.getSession().getServletContext().getRealPath("/image");
        String pathPhoto = "/image";
        if (!file.isEmpty()) {
            String name = file.getOriginalFilename();//获取接受到的图片名称
            File fi = new File(path, name);       //将path路径与图片名称联系在一起
            int i = 1;
            while (fi.exists()) {
                name = i + name;
                fi = new File(path, name);
                i++;
            }
            file.transferTo(fi);                        //上传图片
            typeinfo.setImg(pathPhoto + "/" + name);
            String result = typeServiceImpl.addType(typeinfo);
            return result;

        } else {
            return "noImg";
        }
    }
    
    @ResponseBody
    @RequestMapping("/updateType")
    public String updateType(MultipartFile file, Typeinfo typeinfo, HttpServletRequest request) throws Exception {
       Typeinfo typeinfo1  = typeServiceImpl.getTypeinfo(typeinfo.getTname());
        if (typeinfo1 == null || typeinfo.getTid().equals(typeinfo1.getTid())) {
            String path = request.getSession().getServletContext().getRealPath("/image");
            String pathPhoto = "/image";
            if (!file.isEmpty()) {
                String name = file.getOriginalFilename();//获取接受到的图片名称
                File fi = new File(path, name);       //将path路径与图片名称联系在一起
                int i = 1;
                while (fi.exists()) {
                    name = i + name;
                    fi = new File(path, name);
                    i++;
                }
                file.transferTo(fi);                        //上传图片
                typeinfo.setImg(pathPhoto + "/" + name);
                String result = typeServiceImpl.updateType(typeinfo);
                return result;

            } else {
                return "noImg";
            }
        }else {
            return "have";
        }

    }
}
