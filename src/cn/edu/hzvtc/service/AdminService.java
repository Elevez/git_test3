package cn.edu.hzvtc.service;

import cn.edu.hzvtc.dao.AdminMapper;
import cn.edu.hzvtc.entity.Admin;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class AdminService {
    @Autowired
    private AdminMapper adminMapper;

    public Boolean chkAdmin(Admin admin){
        Boolean result = false;
        List<Admin> admins = adminMapper.chkAdmin(admin);
        if (admins.size() == 1){
            result = true;
        }
        return result;
    }

}
