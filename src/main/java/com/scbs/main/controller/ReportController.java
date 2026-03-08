package com.scbs.main.controller;

import java.util.List;

import org.apache.poi.ss.usermodel.*;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import com.scbs.main.model.Cultivator;
import com.scbs.main.service.CultivatorService;

import jakarta.servlet.ServletOutputStream;
import jakarta.servlet.http.HttpServletResponse;

@Controller
public class ReportController {

	@Autowired
	private CultivatorService cultivatorService;
	@GetMapping("/report/cultivator/excel")
	public void exportCultivatorExcel(HttpServletResponse response) throws Exception {

	    response.setContentType("application/octet-stream");

	    String headerKey = "Content-Disposition";
	    String headerValue = "attachment; filename=cultivator-report.xlsx";

	    response.setHeader(headerKey, headerValue);

	    List<Cultivator> list = cultivatorService.getAllCultivator();

	    Workbook workbook = new XSSFWorkbook();
	    Sheet sheet = workbook.createSheet("Cultivators");

	    Row header = sheet.createRow(0);

	    header.createCell(0).setCellValue("ID");
	    header.createCell(1).setCellValue("Name");
	    header.createCell(2).setCellValue("Type");
	    header.createCell(3).setCellValue("Account No");
	    header.createCell(4).setCellValue("Bank");
	    header.createCell(5).setCellValue("Mobile");

	    int rowCount = 1;

	    for(Cultivator c : list){

	        Row row = sheet.createRow(rowCount++);

	        row.createCell(0).setCellValue(c.getCultivatorId());
	        row.createCell(1).setCellValue(c.getCultivatorName());
	        row.createCell(2).setCellValue(c.getCultivatorType());
	        row.createCell(3).setCellValue(c.getAccountNo());
	        row.createCell(4).setCellValue(c.getBankName());
	        row.createCell(5).setCellValue(c.getCultivatorMobileNo());

	    }

	    ServletOutputStream outputStream = response.getOutputStream();

	    workbook.write(outputStream);

	    workbook.close();

	    outputStream.close();
	}
}
