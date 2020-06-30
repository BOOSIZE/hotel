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
            typeinfo.setImg(pathPhoto + "/" + name);   //为保存图片路径
            String result = typeServiceImpl.addType(typeinfo);
            if (result.equals("true")) {
                File fi = new File(path, name);       //将path路径与图片名称联系在一起
                if (!fi.getParentFile().exists()) {    //判断是否存在path路径下的文件夹
                    fi.getParentFile().mkdirs();       //不存在创建path路径下的文件夹
                }
                file.transferTo(fi);                        //上传图片
                return result;
            }
            return result;

        } else {
            return "noImg";
        }


    }


}
