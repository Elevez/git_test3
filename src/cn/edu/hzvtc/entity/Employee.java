package cn.edu.hzvtc.entity;

import javax.validation.constraints.Email;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Pattern;

public class Employee {
    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column tbl_employee.id
     *
     * @mbg.generated Thu Jul 01 09:17:31 CST 2021
     */
    private Integer id;

    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column tbl_employee.emp_name
     *
     * @mbg.generated Thu Jul 01 09:17:31 CST 2021
     */
    @Pattern(regexp = "(^[a-zA-Z0-9)]{3,16}$)|(^[\\u2E80-\\u9FFF]{2,5}$)",message = "用户名必须是3-16的字符!")
    private String empName;

    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column tbl_employee.emp_email
     *
     * @mbg.generated Thu Jul 01 09:17:31 CST 2021
     */
    @Email
    private String empEmail;

    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column tbl_employee.emp_gender
     *
     * @mbg.generated Thu Jul 01 09:17:31 CST 2021
     */
    private Boolean empGender;

    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column tbl_employee.dept_id
     *
     * @mbg.generated Thu Jul 01 09:17:31 CST 2021
     */
    private Integer deptId;

    private Department department;  //关联的部门对象

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column tbl_employee.id
     *
     * @return the value of tbl_employee.id
     *
     * @mbg.generated Thu Jul 01 09:17:31 CST 2021
     */
    public Integer getId() {
        return id;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column tbl_employee.id
     *
     * @param id the value for tbl_employee.id
     *
     * @mbg.generated Thu Jul 01 09:17:31 CST 2021
     */
    public void setId(Integer id) {
        this.id = id;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column tbl_employee.emp_name
     *
     * @return the value of tbl_employee.emp_name
     *
     * @mbg.generated Thu Jul 01 09:17:31 CST 2021
     */
    public String getEmpName() {
        return empName;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column tbl_employee.emp_name
     *
     * @param empName the value for tbl_employee.emp_name
     *
     * @mbg.generated Thu Jul 01 09:17:31 CST 2021
     */
    public void setEmpName(String empName) {
        this.empName = empName;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column tbl_employee.emp_email
     *
     * @return the value of tbl_employee.emp_email
     *
     * @mbg.generated Thu Jul 01 09:17:31 CST 2021
     */
    public String getEmpEmail() {
        return empEmail;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column tbl_employee.emp_email
     *
     * @param empEmail the value for tbl_employee.emp_email
     *
     * @mbg.generated Thu Jul 01 09:17:31 CST 2021
     */
    public void setEmpEmail(String empEmail) {
        this.empEmail = empEmail;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column tbl_employee.emp_gender
     *
     * @return the value of tbl_employee.emp_gender
     *
     * @mbg.generated Thu Jul 01 09:17:31 CST 2021
     */
    public Boolean getEmpGender() {
        return empGender;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column tbl_employee.emp_gender
     *
     * @param empGender the value for tbl_employee.emp_gender
     *
     * @mbg.generated Thu Jul 01 09:17:31 CST 2021
     */
    public void setEmpGender(Boolean empGender) {
        this.empGender = empGender;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column tbl_employee.dept_id
     *
     * @return the value of tbl_employee.dept_id
     *
     * @mbg.generated Thu Jul 01 09:17:31 CST 2021
     */
    public Integer getDeptId() {
        return deptId;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column tbl_employee.dept_id
     *
     * @param deptId the value for tbl_employee.dept_id
     *
     * @mbg.generated Thu Jul 01 09:17:31 CST 2021
     */
    public void setDeptId(Integer deptId) {
        this.deptId = deptId;
    }

    public Department getDepartment() {
        return department;
    }

    public void setDepartment(Department department) {
        this.department = department;
    }

    public Employee() {
    }

    public Employee(Integer id, String empName, String empEmail, Boolean empGender, Department department) {
        this.id = id;
        this.empName = empName;
        this.empEmail = empEmail;
        this.empGender = empGender;
        this.department = department;
    }

    @Override
    public String toString() {
        return "Employee{" +
                "id=" + id +
                ", empName='" + empName + '\'' +
                ", empEmail='" + empEmail + '\'' +
                ", empGender=" + empGender +
                ", department=" + department +
                '}';
    }
}