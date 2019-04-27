package ems.entity;

import java.net.URLEncoder;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.poi.ss.usermodel.CellStyle;
import org.apache.poi.ss.usermodel.Font;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.springframework.web.servlet.view.document.AbstractXlsView;

public class ExcelView extends AbstractXlsView {

	@Override
	protected void buildExcelDocument(Map<String, Object> map, Workbook workbook, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		
		String excelName = map.get("name").toString() + ".xls";
		 String Agent = request.getHeader("User-Agent");
	        if (null !=Agent){
	             Agent = Agent.toLowerCase();
	             //针对火狐乱码的处理
	             if (Agent.indexOf("firebox") !=-1){
	                 response.setHeader("content-disposition", String.format("attachment;filename*=utf-8'zh_cn'%s", URLEncoder.encode(excelName, "utf-8")));
	             } else {
	                 response.setHeader("content-disposition", "attachment;filename=" + new String(excelName.getBytes("UTF-8"), "iso-8859-1"));
	             }
	        }
		response.setContentType("application/ms-excel; charset=UTF-8"); 
		response.setCharacterEncoding("UTF-8");
		
		List<StudentScore> studentScores=(List<StudentScore>) map.get("studentScores");
		Sheet sheet = workbook.createSheet("学生作业成绩明细");
		sheet.setDefaultColumnWidth(30); 
		CellStyle style = workbook.createCellStyle(); 
		Font font = workbook.createFont(); 
		font.setFontName("Arial"); 
		font.setBold(true); 
		style.setFont(font);
		Row header = sheet.createRow(0);
		header.createCell(0).setCellValue("学号");
		header.getCell(0).setCellStyle(style);
		header.createCell(1).setCellValue("姓名");
		header.getCell(1).setCellStyle(style);
		header.createCell(2).setCellValue("提交次数");
		header.getCell(2).setCellStyle(style);
		header.createCell(3).setCellValue("最高分");
		header.getCell(3).setCellStyle(style);
		header.createCell(4).setCellValue("最低分");
		header.getCell(4).setCellStyle(style);
		header.createCell(5).setCellValue("总评分");
		header.getCell(5).setCellStyle(style);
		int rowCount = 1;
		for(StudentScore score:studentScores) {
			 Row scorerRow = sheet.createRow(rowCount++);
			 scorerRow.createCell(0).setCellValue(score.getS_no());
			 scorerRow.createCell(1).setCellValue(score.getS_name());
			 scorerRow.createCell(2).setCellValue(score.getCommit_num());
			 scorerRow.createCell(3).setCellValue(score.getMax_score());
			 scorerRow.createCell(4).setCellValue(score.getMin_score());
			 scorerRow.createCell(5).setCellValue(score.getS_score());
		}
	}	
}
