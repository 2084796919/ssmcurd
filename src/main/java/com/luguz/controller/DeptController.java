package com.luguz.controller;

import com.luguz.bean.Dept;
import com.luguz.bean.Msg;
import com.luguz.service.DeptService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

/**
 * @author Guz
 * @create 2021-08--23 21:13
 */
@Controller
public class DeptController {
    @Autowired
    private DeptService deptService;

    @RequestMapping("/depts")
    @ResponseBody
    public Msg getDepts(){
        List<Dept> depts = deptService.getDepts();
        return Msg.success().add("depts", depts);
    }

}
