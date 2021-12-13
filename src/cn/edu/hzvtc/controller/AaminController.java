package cn.edu.hzvtc.controller;

import cn.edu.hzvtc.entity.Admin;
import cn.edu.hzvtc.entity.Employee;
import cn.edu.hzvtc.entity.ReturnMsg;
import cn.edu.hzvtc.service.AdminService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
public class AaminController {
    @Autowired
    private AdminService adminService;

    @RequestMapping("/toLogin")
    public String toLogin(){
        return "login";
    }

    @RequestMapping("/toLogin_git_test")
    public String toLogin(){
        return "login";
    }

    @RequestMapping("/home")
    public String toHome(){
        return "home";
    }

    @RequestMapping(value = "/login", method = RequestMethod.POST)
    @ResponseBody
    public ReturnMsg updateEmp(@Valid Admin admin, BindingResult result){
        if (result.hasErrors()){
            Map<String,Object> map = new HashMap<String,Object>();
            List<FieldError> errors = result.getFieldErrors();
            for(FieldError error:errors){
                map.put(error.getField(),error.getDefaultMessage());
            }
            return ReturnMsg.fail().add("fieldErrors",map);
        }else{
            if(adminService.chkAdmin(admin)){
                return ReturnMsg.success();
            }else{
                return ReturnMsg.fail();
            }
        }
    }

}
