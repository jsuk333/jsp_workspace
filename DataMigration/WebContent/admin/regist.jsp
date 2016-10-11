<%@page import="com.sds.post.dao.PostDAO"%>
<%@page import="com.sds.post.domain.Post"%>
<%@page import="org.apache.poi.xssf.usermodel.XSSFCell"%>
<%@page import="org.apache.poi.xssf.usermodel.XSSFRow"%>
<%@page import="org.apache.poi.xssf.usermodel.XSSFSheet"%>
<%@page import="org.apache.poi.xssf.usermodel.XSSFWorkbook"%>
<%@page import="org.apache.poi.hssf.usermodel.HSSFSheet"%>
<%@page import="org.apache.poi.poifs.filesystem.POIFSFileSystem"%>
<%@page import="org.apache.poi.hssf.usermodel.HSSFWorkbook"%>
<%@page import="org.apache.commons.fileupload.FileItemFactory"%>
<%@page import="org.apache.commons.fileupload.FileItem"%>
<%@page import="java.util.List"%>
<%@page import="org.apache.commons.fileupload.UploadContext"%>
<%@page import="org.apache.commons.fileupload.servlet.ServletFileUpload"%>
<%@page import="java.io.File"%>
<%@page import="org.apache.commons.fileupload.disk.DiskFileItemFactory"%>
<%@page import="javafx.application.Application"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%! 
	PostDAO dao=new PostDAO();
%>
<% 
	//넘겨 받은 엑셀파일을 해석한후 , 
	Post dto=null;
	int total=0;
	File destFile=null;
	request.setCharacterEncoding("utf-8");
	String temp=application.getRealPath("/temp");
	String dest=application.getRealPath("/data");
	DiskFileItemFactory factory=new DiskFileItemFactory();
	factory.setSizeThreshold(1024*1024);
	factory.setRepository(new File(temp));
	ServletFileUpload upload=new ServletFileUpload(factory);
	if(upload.isMultipartContent(request)){//클라이언트가 multipart/form-data일 경우
		
		List<FileItem> list=upload.parseRequest(request);//업로드 수행!
		
		for(int i=0;i<list.size();i++){
			FileItem item=list.get(i);
			if(item.isFormField()){//text 파라미터라면
				String param=item.getFieldName();
				String value=item.getString("utf-8");
				
				
			}else{////파일 파라미터라면
				item.write(destFile=new File(dest+"/"+item.getName()));
				item.delete();
				
				
				XSSFWorkbook book=new XSSFWorkbook(destFile);		
				XSSFSheet sheet=book.getSheetAt(0);
				int rowCount=sheet.getPhysicalNumberOfRows();
				out.print("<table width=\"100px\" border=\"1px\">");
				for(int j=0;j<rowCount;j++){//각 row 를 접근하자
					XSSFRow xssfRow=sheet.getRow(j);
					out.print("<tr>");
					int cols=xssfRow.getPhysicalNumberOfCells();
					
					if(j>0){
						dto=new Post();
						for(int k=0;k<cols;k++){
							XSSFCell cell=xssfRow.getCell(k);
							
							if(cell!=null){
								if(cell.getCellType()==XSSFCell.CELL_TYPE_NUMERIC){
									out.print("<td>"+cell.getRawValue()+"</td>");
									dto.setSeq(Integer.parseInt(cell.getRawValue()));
								}else{
									out.print("<td>"+cell.getStringCellValue()+"</td>"); 
									switch(k){
									case 0: dto.setZipcode(cell.getStringCellValue());  break;
									case 1: dto.setSido(cell.getStringCellValue());  break;
									case 2: dto.setGugun(cell.getStringCellValue());  break;
									case 3: dto.setDong(cell.getStringCellValue()); break;
									case 4: dto.setBunji(cell.getStringCellValue()); break;
									}
								}
							}else{
								out.print("<td>null</td>");
							}
						}
						out.print("</tr>");
						int result=dao.insert(dto);
						total+=result;
					}
				}
				out.print("</table>");
				out.print(total);
			}
		}
	}else{
		out.print("html코드도 모르냐??");
	}
	
	

%>