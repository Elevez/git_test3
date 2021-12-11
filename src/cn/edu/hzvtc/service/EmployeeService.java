package cn.edu.hzvtc.service;

import cn.edu.hzvtc.dao.EmployeeMapper;
import cn.edu.hzvtc.entity.Employee;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.validation.constraints.Email;
import java.util.List;

@Service
public class EmployeeService {
    @Autowired
    private EmployeeMapper employeeMapper;

    /**
     * 根据员工id删除员工
     * @param //id
     * @return -1：员工不存在   0：员工存在
     */
//    public Integer delete(Integer id){
//        Integer result = null;
//        if (employeeMapper.selectByPrimaryKey(id) == null){
//            return -1;
//        }else {
//            result = employeeMapper.deleteByPrimaryKey(id);
//        }
//        return result;
//    }

    public Integer delete(List<Integer> ids) throws Exception{
        Integer result = null;

        //判断需要删除的员工是否存在
        List<Employee> delEmps = employeeMapper.selectEmpsByList(ids);

        if (delEmps.size() != ids.size()){
            result = -1;
        }else {
            Integer opResult = employeeMapper.deleteByList(ids);
            if (opResult != ids.size()){
                result = 0;
                throw new RuntimeException("员工信息删除失败");
            }else {
                result = opResult;
            }
        }
//        if (employeeMapper.selectByPrimaryKey(id) == null){
//            return -1;
//        }else {
//            result = employeeMapper.deleteByPrimaryKey(id);
//        }
        return result;
    }

    public void updateEmp(Employee employee){
        employeeMapper.updateByPrimaryKey(employee);
    }


    public List<Employee> getAllWithDept(){
        List<Employee> result = null;

        result = employeeMapper.selectAllWithDept();

        return result;
    }

    public Employee getAllWithDeptByEmpId(Integer id){

        return employeeMapper.selectAllWithDeptByEmpId(id);
    }

    /**
     * 新增员工信息
     * @param employee
     * @return -1：姓名重复  0：新增失败  >0：新增成功
     */
    public Integer add(Employee employee){
        Integer result = null;
        //姓名重复的校验
        if (chkEmpName(employee.getEmpName())){
            result = employeeMapper.insert(employee);
        }else {
            result = -1;
        }

        return result;
    }

    /**
     * 验证姓名是否重复
     * @param empName
     * @return
     */
    public Boolean chkEmpName(String empName){
        Boolean result = false;

        List<Employee> employees = employeeMapper.selectEmpsByName(empName);
        if (employees.size() == 0){
            result = true;
        }
        return result;
    }

}
