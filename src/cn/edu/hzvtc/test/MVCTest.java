package cn.edu.hzvtc.test;

import com.github.pagehelper.PageInfo;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mock.web.MockHttpServletRequest;
import org.springframework.mock.web.MockHttpServletResponse;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.MockMvcBuilder;
import org.springframework.test.web.servlet.MvcResult;
import org.springframework.test.web.servlet.request.MockMvcRequestBuilders;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.context.WebApplicationContext;

@RunWith(SpringJUnit4ClassRunner.class)
@WebAppConfiguration
@ContextConfiguration(locations = {"classpath:applicationContext.xml","file:./web/WEB-INF/dispatcherServlet-servlet.xml"})
public class MVCTest {
    @Autowired
    private WebApplicationContext context;
    private MockMvc mockMvc;

    @Before
    public void init(){
        mockMvc = MockMvcBuilders.webAppContextSetup(context).build();
    }

    @Test
    public void testAddDept() throws Exception{
        mockMvc.perform(MockMvcRequestBuilders.get("/addDept")).andReturn();
    }

    @Test
    public void testListEmps() throws Exception{
        MvcResult mvcResult = mockMvc.perform(MockMvcRequestBuilders.get("/list").param("pn","1")).andReturn();
        MockHttpServletRequest request = mvcResult.getRequest();
        PageInfo pageInfo = (PageInfo) request.getAttribute("pageInfo");

        System.out.println(pageInfo.getPageNum());
        System.out.println(pageInfo.getPages());
        System.out.println(pageInfo.getTotal());
        System.out.println(pageInfo.getList());
    }

    @Test
    public void testGetEemps() throws Exception{
        MvcResult mvcResult = mockMvc.perform(MockMvcRequestBuilders.get("/emps").param("pn","1")).andReturn();

        MockHttpServletResponse response = mvcResult.getResponse();

        response.setCharacterEncoding("utf-8");

        System.out.println(response.getContentAsString());

    }

    @Test
    public void testDelEemps() throws Exception{
        MvcResult mvcResult = mockMvc.perform(MockMvcRequestBuilders.delete("/emp/198-197-196")).andReturn();

        MockHttpServletResponse response = mvcResult.getResponse();

        response.setCharacterEncoding("utf-8");

        System.out.println(response.getContentAsString());

    }

    @Test
    public void testSaveEmp() throws Exception{
        MvcResult mvcResult = mockMvc.perform(MockMvcRequestBuilders.post("/emp").param("empName","rose")).andReturn();

        MockHttpServletResponse response = mvcResult.getResponse();

        response.setCharacterEncoding("utf-8");

        System.out.println(response.getContentAsString());

    }

    @Test
    public void testChkEmpName() throws Exception{
        MvcResult mvcResult = mockMvc.perform(MockMvcRequestBuilders.get("/chkEmpName").param("empName","rose")).andReturn();

        MockHttpServletResponse response = mvcResult.getResponse();

        response.setCharacterEncoding("utf-8");

        System.out.println(response.getContentAsString());

    }
    @Test
    public void testUpdateEmp() throws Exception{
        MvcResult mvcResult = mockMvc.perform(MockMvcRequestBuilders.put("/emp/198").param("empName","rose")).andReturn();

        MockHttpServletResponse response = mvcResult.getResponse();

        response.setCharacterEncoding("utf-8");

        System.out.println(response.getContentAsString());

    }

    @Test
    public void testChkAdmin() throws Exception{
        MvcResult mvcResult = mockMvc.perform(MockMvcRequestBuilders.post("/login").param("adName","admin")).andReturn();

        MockHttpServletResponse response = mvcResult.getResponse();

        response.setCharacterEncoding("utf-8");

        System.out.println(response.getContentAsString());

    }
}
