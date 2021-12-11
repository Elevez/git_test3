package cn.edu.hzvtc.test;

import cn.edu.hzvtc.dao.AdminMapper;
import cn.edu.hzvtc.dao.DepartmentMapper;
import cn.edu.hzvtc.dao.EmployeeMapper;
import cn.edu.hzvtc.entity.Admin;
import cn.edu.hzvtc.entity.Department;
import cn.edu.hzvtc.entity.Employee;
import cn.edu.hzvtc.service.DepartmentService;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"classpath:applicationContext.xml"})
public class MapperTest {
    @Autowired
    private DepartmentMapper departmentMapper;

    @Autowired
    private EmployeeMapper employeeMapper;

    @Autowired
    private AdminMapper adminMapper;

    @Autowired
    private DepartmentService departmentService;

    @Test
    public void testInsertDeptTx(){
        Department department = new Department();
        department.setDeptName("测试部");
        departmentService.add(department);
    }

    @Test
    public void testInsertDept(){
        Department department = new Department();
        department.setDeptName("研发部");
        departmentMapper.insert(department);
    }

    @Test
    public void testInsertEmp(){
        int[] did = new int[]{1,2,3,4};
        for (int i = 1 ; i <= 98 ; i++){
            Employee employee = new Employee();
            employee.setEmpName("tom" + i);
            employee.setEmpEmail("tom"+i+"@qq.com");
            employee.setEmpGender(true);
            employee.setDeptId(i%4+1);
            employeeMapper.insert(employee);
        }
    }

    @Test
    public void testChkAdmin(){
        Admin admin = new Admin();

        admin.setAdName("admin");
        admin.setAdPassword("123456");
        adminMapper.chkAdmin(admin);
    }
}
