package cn.edu.hzvtc.entity;

import cn.edu.hzvtc.entity.Employee;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.springframework.web.servlet.view.document.AbstractXlsxView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.OutputStream;
import java.util.List;
import java.util.Map;

public class ViewExcel extends AbstractXlsxView {
    @Override
    protected void buildExcelDocument(Map<String, Object> model, Workbook workbook, HttpServletRequest request, HttpServletResponse response) throws Exception {
        String fileName = "员工信息表.xlsx";
        response.setCharacterEncoding("UTF-8");
        response.setContentType("application/ms-excel");// 文件下载
        response.setHeader("Content-Disposition", "inline; filename=" + new String(fileName.getBytes(), "iso8859-1"));
        OutputStream outputStream = response.getOutputStream();
        Sheet sheet = workbook.createSheet("员工信息表");
        Row row = sheet.createRow(0);
        //设置标头
        String[] headers = new String[] { "序号","编号", "姓名","Email","性别","部门"};
        for (int i = 0; i < headers.length; i++) {
            row.createCell(i).setCellValue(headers[i]);
        }
        List<Employee> list = (List<Employee>) model.get("employeeList");
        String gender;
        for (int i = 0; i < list.size(); i++) {
            Employee user = list.get(i);
            row = sheet.createRow(i + 1);
            row.createCell(0).setCellValue(i + 1);
            row.createCell(1).setCellValue(user.getId());
            row.createCell(2).setCellValue(user.getEmpName());
            row.createCell(3).setCellValue(user.getEmpEmail());
            if (user.getEmpGender()) gender = "男";
            else gender= "女";
            row.createCell(4).setCellValue(gender);
            row.createCell(5).setCellValue(user.getDepartment().getDeptName());
        }
        workbook.write(outputStream);
        outputStream.flush();
        outputStream.close();
    }
}