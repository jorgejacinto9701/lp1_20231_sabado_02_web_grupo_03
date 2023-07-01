package controlador;

import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.poi.ss.usermodel.FillPatternType;
import org.apache.poi.ss.usermodel.HorizontalAlignment;
import org.apache.poi.ss.usermodel.IndexedColors;
import org.apache.poi.ss.usermodel.VerticalAlignment;
import org.apache.poi.ss.util.CellRangeAddress;
import org.apache.poi.xssf.usermodel.XSSFCell;
import org.apache.poi.xssf.usermodel.XSSFCellStyle;
import org.apache.poi.xssf.usermodel.XSSFFont;
import org.apache.poi.xssf.usermodel.XSSFRow;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;

@WebServlet("/generaExcel")
public class ServletExcel extends HttpServlet{
	
	private static final long serialVersionUID = 1L;

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	
		String[] columnText_sheet_1 = { "ID Editorial", "Estado"  };
		int[] columnWith_sheet_1 = { 4000, 4000 };
		
		InputStream inputStream = null;
		try {
			SimpleDateFormat sdf = new SimpleDateFormat("dd_MM_yyyy_HH_mm_ss");
			Date d = new Date();

			String fileName = "Reporte_Editorial_" + sdf.format(d) + ".xlsx";
		
		
			String titulo_1 = "Reporte Editorial";
			String titulo_Sheet_1 = "Total Encuestas";
			
			try (XSSFWorkbook excel = new XSSFWorkbook()) {
				XSSFFont fuente = excel.createFont();
				fuente.setFontHeightInPoints((short) 10);
				fuente.setFontName("Arial");
				fuente.setBold(true);
				fuente.setColor(IndexedColors.WHITE.getIndex());

				XSSFCellStyle estiloPorcentaje = excel.createCellStyle();
				estiloPorcentaje.setDataFormat(excel.createDataFormat().getFormat("0%"));

				
				XSSFCellStyle estiloCeldaIzquierda = excel.createCellStyle();
				estiloCeldaIzquierda.setWrapText(true);
				estiloCeldaIzquierda.setAlignment(HorizontalAlignment.LEFT);
				estiloCeldaIzquierda.setVerticalAlignment(VerticalAlignment.CENTER);
				estiloCeldaIzquierda.setFont(fuente);
				estiloCeldaIzquierda.setFillForegroundColor(IndexedColors.DARK_BLUE.getIndex());
				estiloCeldaIzquierda.setFillPattern(FillPatternType.SOLID_FOREGROUND);

				XSSFCellStyle estiloCeldaCentrado = excel.createCellStyle();
				estiloCeldaCentrado.setWrapText(true);
				estiloCeldaCentrado.setAlignment(HorizontalAlignment.CENTER);
				estiloCeldaCentrado.setVerticalAlignment(VerticalAlignment.CENTER);
				estiloCeldaCentrado.setFont(fuente);
				estiloCeldaCentrado.setFillForegroundColor(IndexedColors.DARK_BLUE.getIndex());
				estiloCeldaCentrado.setFillPattern(FillPatternType.SOLID_FOREGROUND);

				{
					//SHEET 1
					XSSFSheet hoja = excel.createSheet(titulo_Sheet_1);
					hoja.addMergedRegion(new CellRangeAddress(0, 0, 0, columnWith_sheet_1.length-1));

					for (int i = 0; i < columnWith_sheet_1.length; i++) {
						hoja.setColumnWidth(i, columnWith_sheet_1[i]);
					}
					
					// FILA 0: Se crea las cabecera
					XSSFRow fila1 = hoja.createRow(0);
					XSSFCell celAuxs = fila1.createCell(0);
					celAuxs.setCellStyle(estiloCeldaIzquierda);
					celAuxs.setCellValue(titulo_1);

					// FILA 2: Se crea la filaen blanco
					XSSFRow fila2 = hoja.createRow(1);
					XSSFCell celAuxs2 = fila2.createCell(0);
					celAuxs2.setCellValue("");

					// FILA 2: Se crea las columnas
					XSSFRow fila3 = hoja.createRow(2);

					for (int i = 0; i < columnText_sheet_1.length; i++) {
						XSSFCell celda1 = fila3.createCell(i);
						celda1.setCellStyle(estiloCeldaCentrado);
						celda1.setCellValue(columnText_sheet_1[i]);
					}

					// FILA 3...n: Se crea las filas
					XSSFCellStyle celdaCentrar = excel.createCellStyle();
					celdaCentrar.setAlignment(HorizontalAlignment.CENTER);
					celdaCentrar.setVerticalAlignment(VerticalAlignment.CENTER);

					XSSFRow filaX = null;
					for (int i = 0; i < 5; i++) {
						filaX = hoja.createRow(i + 3);
						filaX.createCell(0).setCellValue(i);
						filaX.createCell(1).setCellValue("EJECUTADO");
					}

				}
				

				

				ByteArrayOutputStream boas = new ByteArrayOutputStream();
				excel.write(boas);
				
				inputStream = new ByteArrayInputStream(boas.toByteArray());
			}

			int fileSize = inputStream.available();
			
			resp.setContentType("application/vnd.ms-excel");
	        resp.setHeader("Content-disposition", "attachment; filename=" + fileName);
	        resp.setHeader("Set-Cookie", "fileDownload=true; path=/");
			resp.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
			resp.setHeader("contentLength", String.valueOf(fileSize));
			
			
			byte[] buffer = new byte[1048];
	        
			OutputStream out = resp.getOutputStream();
			  
            int numBytesRead;
            while ((numBytesRead = inputStream.read(buffer)) > 0) {
                out.write(buffer, 0, numBytesRead);
            }
            
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (inputStream != null)
					inputStream.close();
			} catch (IOException e) {}
		}

	}

}
