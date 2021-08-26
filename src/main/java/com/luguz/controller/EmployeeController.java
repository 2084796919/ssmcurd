package com.luguz.controller;

import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.luguz.bean.Dept;
import com.luguz.bean.Employee;
import com.luguz.bean.Msg;
import com.luguz.service.EmployeeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @author Guz
 * @create 2021-08--22 18:08
 */
@Controller
public class EmployeeController {

    @Autowired
    private EmployeeService employeeService;

//    @RequestMapping("/emps")
//    public String getEmps(@RequestParam(value = "pn",defaultValue="1")Integer pn, Model model){

//        每页显示的大小
//        Page<Object> objects = PageHelper.startPage(pn, 5);
//        List<Employee> employees = employeeService.getAll();
//        连续显示的页数
//        PageInfo<Employee> employeePageInfo = new PageInfo<>(employees,5);
//        model.addAttribute("pageInfo", employeePageInfo);
//        return "list";
//    }

//    ajax形式分页 ResponseBody 数据转为json返回 需要导入 jackson的包
    @RequestMapping("/emps")
    @ResponseBody
    public Msg getEmps(@RequestParam(value = "pn",defaultValue="1")Integer pn){

//        每页显示的大小
        PageHelper.startPage(pn, 5);
        List<Employee> employees = employeeService.getAll();
//        连续显示的页数
        PageInfo employeePageInfo = new PageInfo(employees,5);

        return Msg.success().add("pageInfo", employeePageInfo);
    }

//    员工保存  post方法 @Valid 掉用jsr303检测
    @RequestMapping(value = "/emp",method = RequestMethod.POST)
    @ResponseBody
    public Msg getDepts(@Valid Employee employee, BindingResult result){
//      使用 jsr303 校验 先引入
        Map<String, Object> map = new HashMap<>();
        if (result.hasErrors()){
            List<FieldError> fieldErrors = result.getFieldErrors();
            for (FieldError fieldError : fieldErrors){
                map.put(fieldError.getField(),fieldError.getDefaultMessage() );
            }
            return Msg.error().add("error", map);
        }else {

            employeeService.saveEmp(employee);
            return Msg.success();
        }
    }

//    用户名检查是否可用
    @ResponseBody
    @RequestMapping(value = "/checkUserName")
    public Msg chechUserName(String empName){
        String regx = "(^[a-zA-Z0-9]{6,16}$)|(^[\u2E80-\u9FFF]{2,5})";
        if(!empName.matches(regx)){
            return Msg.error().add("va_msg", "用户名必须是6-16位英文或者2-5位中文");
        }
        boolean b = employeeService.checkUserName(empName);
        if (b)
            return Msg.success().add("va_msg", "用户名可用");
        else
            return Msg.error().add("va_msg", "用户名不可用");
    }

//  获取员工信息
    @ResponseBody
    @RequestMapping(value = "/getEmp/{id}",method = RequestMethod.GET)
    public Msg  getEmp(@PathVariable("id")Integer id){
        Employee emp = employeeService.getEmp(id);
        return Msg.success().add("emp",emp);
    }

//    保存更新
    @ResponseBody
    @RequestMapping(value = "/emp/{empId}",method = RequestMethod.PUT)
    public Msg saveEmp(Employee employee){
        System.out.println(employee);
        employeeService.updateEmp(employee);
        return Msg.success();
    }

//    删除用户  单个 1 多个 1-2-3
    @ResponseBody
    @RequestMapping(value = "/emp/{ids}")
    public Msg deleEmpById(@PathVariable("ids") String ids){
        if (ids.contains("-")){
            List<Integer> empIdList = new ArrayList<>();
            String[] empIds = ids.split("-");
            for (String string : empIds){
                empIdList.add(Integer.parseInt(string));
            }
            employeeService.deleIds(empIdList);
            return Msg.success();
        }else {
            employeeService.deleEmp(Integer.valueOf(ids));
            return Msg.success();
        }
    }
}
