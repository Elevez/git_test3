package cn.edu.hzvtc.entity;

public class Department {
    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column tbl_department.id
     *
     * @mbg.generated Thu Jul 01 09:17:31 CST 2021
     */
    private Integer id;

    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column tbl_department.dept_name
     *
     * @mbg.generated Thu Jul 01 09:17:31 CST 2021
     */
    private String deptName;

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column tbl_department.id
     *
     * @return the value of tbl_department.id
     *
     * @mbg.generated Thu Jul 01 09:17:31 CST 2021
     */
    public Integer getId() {
        return id;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column tbl_department.id
     *
     * @param id the value for tbl_department.id
     *
     * @mbg.generated Thu Jul 01 09:17:31 CST 2021
     */
    public void setId(Integer id) {
        this.id = id;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column tbl_department.dept_name
     *
     * @return the value of tbl_department.dept_name
     *
     * @mbg.generated Thu Jul 01 09:17:31 CST 2021
     */
    public String getDeptName() {
        return deptName;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column tbl_department.dept_name
     *
     * @param deptName the value for tbl_department.dept_name
     *
     * @mbg.generated Thu Jul 01 09:17:31 CST 2021
     */
    public void setDeptName(String deptName) {
        this.deptName = deptName;
    }

    public Department() {
    }

    public Department(Integer id) {
        this.id = id;
    }

    @Override
    public String toString() {
        return "Department{" +
                "id=" + id +
                ", deptName='" + deptName + '\'' +
                '}';
    }
}