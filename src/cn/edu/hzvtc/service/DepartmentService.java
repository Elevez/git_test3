package cn.edu.hzvtc.service;

import cn.edu.hzvtc.dao.DepartmentMapper;
import cn.edu.hzvtc.entity.Department;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
public class DepartmentService {
    @Autowired
    private DepartmentMapper departmentMapper;

//    @Transactional
    public void add(Department department){
        departmentMapper.insert(department);
//        int i = 1/0;
    }

    public List<Department> getAll(){
        List<Department> result = null;

        result = departmentMapper.selectAll();

        return result;
    }

}
