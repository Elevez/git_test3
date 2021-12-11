package cn.edu.hzvtc.controller;

import cn.edu.hzvtc.entity.Department;
import cn.edu.hzvtc.entity.Employee;
import cn.edu.hzvtc.entity.ReturnMsg;
import cn.edu.hzvtc.entity.ViewExcel;
import cn.edu.hzvtc.service.EmployeeService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.validation.Valid;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
public class EmployeeController {
    @Autowired
    private EmployeeService employeeService;

    @RequestMapping(value = "/emp/{id}",method = RequestMethod.PUT)
    @ResponseBody
    public ReturnMsg updateEmp(@Valid Employee employee,BindingResult result){
        if (result.hasErrors()){
            Map<String,Object> map = new HashMap<String,Object>();
            List<FieldError> errors = result.getFieldErrors();
            for(FieldError error:errors){
                map.put(error.getField(),error.getDefaultMessage());
            }
            return ReturnMsg.fail().add("fieldErrors",map);
        }else{
            employeeService.updateEmp(employee);
            return ReturnMsg.success();
        }
    }

    @RequestMapping("/edit")
    public String edit(@RequestParam("id") Integer id,Map<String,Object> map){
        map.put("id",id);
        return "edit";
    }

    @RequestMapping(value = "/emp/{id}",method = RequestMethod.GET)
    @ResponseBody
    public ReturnMsg getEmp(@PathVariable("id") Integer id){
        Employee employee =employeeService.getAllWithDeptByEmpId(id);
        return ReturnMsg.success().add("emp",employee);
    }

    @RequestMapping("/list")
    public String list(@RequestParam(value = "pn",required = false,defaultValue = "1") Integer pn ,Map<String,Object> map){
        map.put("pn",pn);
        return "list";
    }

    @RequestMapping(value = "/emp/{ids}",method = RequestMethod.DELETE)
    @ResponseBody
    public ReturnMsg delEmp(@PathVariable("ids") List<Integer> ids){
        try {
            if (ids == null){
                return ReturnMsg.fail().add("errMsg","没有传递需要删除的员工信息！");
            }else {
                if (ids.size() == 0){
                    return ReturnMsg.fail().add("errMsg","没有传递需要删除的员工信息！");
                }

                Integer result = employeeService.delete(ids);
                if (result == -1){
                    ReturnMsg returnMsg = new ReturnMsg();
                    returnMsg.setCode(201);
                    returnMsg.setMsg("需要删除的员工不存在");
                    return returnMsg;
                }else if (result == 0){
                    return ReturnMsg.fail();
                }else {
                    return ReturnMsg.success();
                }
            }
        }catch (Exception ex){
            return ReturnMsg.except().add("exception",ex);
        }
    }

    @RequestMapping(value = "/edit/{id}")
    public String edit(@PathVariable("id") String id,Map<String,Object> map){
        if (id.contains("-")){
            String[] s = id.split("-");
            map.put("id",s[0]);
            map.put("pn",s[1]);
        }
        return "edit";
    }

    @RequestMapping("/emps")
    @ResponseBody
    public ReturnMsg getEmps(@RequestParam(value = "pn",defaultValue = "1") Integer pn){
        try{
            //引入PageHelper
            PageHelper.startPage(pn,10);
            //紧跟着startPage方法之后的第一个select操作会分页
            List<Employee> employees = employeeService.getAllWithDept();
            //使用PageInfo对象对查询结果进行封装
            PageInfo pageInfo = new PageInfo(employees,5);

            return ReturnMsg.success().add("pageInfo",pageInfo);
        }catch (Exception ex){
            return ReturnMsg.except().add("exception",ex);
        }
    }


    @RequestMapping(value = "/emp",method = RequestMethod.POST)
    @ResponseBody
    public ReturnMsg saveEmp(@Valid Employee employee, BindingResult bindingResult){
        //
        Map<String,Object> map = new HashMap<>();
        if (bindingResult.hasErrors()){
            for (FieldError fieldError: bindingResult.getFieldErrors()){
                map.put(fieldError.getField(),fieldError.getDefaultMessage());
            }
            return ReturnMsg.fail().add("fieldErrors",map);
        }else {
            if (employeeService.add(employee)>0){
                return ReturnMsg.success();
            }else {
                return ReturnMsg.fail();
            }
        }
    }

    @RequestMapping("/chkEmpName")
    @ResponseBody
    public ReturnMsg chkEmpName(@RequestParam("empName") String empName){
        if (employeeService.chkEmpName(empName)){
            return ReturnMsg.success();
        }else {
            return ReturnMsg.fail();
        }
    }



    @RequestMapping("/excel")
    public ModelAndView empExcel(ModelMap map){
        map.put("employeeList",employeeService.getAllWithDept());
        return new ModelAndView(new ViewExcel(),map);
    }



}
