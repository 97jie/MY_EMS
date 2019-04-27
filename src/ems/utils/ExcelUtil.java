package ems.utils;

import java.io.InputStream;
import java.util.ArrayList;
import java.util.List;

import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.Workbook;

public class ExcelUtil {

	private final static String excel2003L = ".xls";
	private final static String excel2007U = ".xlsx";
	
	public static List<List<Object>> getExcelList(InputStream is, String fileName) throws Exception{
		Workbook workbook=null;
		List<List<Object>> list = new ArrayList<List<Object>>();

        String suffix = fileName.substring(fileName.lastIndexOf("."));

        if(suffix.equals(excel2003L)){
            workbook = new HSSFWorkbook(is);
        }else if(suffix.equals(excel2007U)){
            //workbook = new XSSFWorkbook(is);
        }

		return null;
		
	}
}
