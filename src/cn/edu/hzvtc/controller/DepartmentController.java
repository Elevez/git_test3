package cn.edu.hzvtc.controller;

import cn.edu.hzvtc.dao.DepartmentMapper;
import cn.edu.hzvtc.entity.Department;
import cn.edu.hzvtc.entity.ReturnMsg;
import cn.edu.hzvtc.service.DepartmentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
public class DepartmentController {

    @Autowired
    private DepartmentService departmentService;

    @RequestMapping("/addDept")
    public String addDept(){
        Department department = new Department();
        department.setDeptName("宣传部");
        departmentService.add(department);
        return "success";
    }


    @RequestMapping("/input")
    public String input(){
        return "input";
    }

    @RequestMapping("/depts")
    @ResponseBody
    public ReturnMsg getDepts(){
        List<Department> departments = departmentService.getAll();
        return ReturnMsg.success().add("departments",departments);
    }


}
