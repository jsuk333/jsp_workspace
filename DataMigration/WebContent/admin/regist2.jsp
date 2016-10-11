<%@page import="com.sds.post.dao.PostDAO"%>
<%@page import="com.sds.post.domain.Post"%>
<%@page import="org.apache.poi.xssf.usermodel.XSSFCell"%>
<%@page import="org.apache.poi.xssf.usermodel.XSSFRow"%>
<%@page import="org.apache.poi.xssf.usermodel.XSSFSheet"%>
<%@page import="org.apache.poi.xssf.usermodel.XSSFWorkbook"%>
<%@page import="org.apache.commons.fileupload.FileItem"%>
<%@page import="java.util.List"%>
<%@page import="java.io.File"%>
<%@page import="org.apache.commons.fileupload.disk.DiskFileItemFactory"%>
<%@page import="org.apache.commons.fileupload.servlet.ServletFileUpload"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>   
<%!PostDAO dao = new PostDAO(); %>    
<%
	// request(HttpServletRequest), response, out, 
	// application(웹어플리케이션의 전역적 정보)
	String temp=application.getRealPath("/temp");
	String data=application.getRealPath("/data/");
	File destFile=null;
	
	out.print(temp);
	
	//넘겨받은 엑셀파일을 해석 한 후,  db에 insert 시키자!!
	
	//업로드 전에 설정과 관련된 객체
	DiskFileItemFactory factory=new DiskFileItemFactory();
	factory.setSizeThreshold(1*1024*1024);
	factory.setRepository(new File(temp));
	
	//업로드를 담당하는 객체
	ServletFileUpload upload=new ServletFileUpload(factory);
	
	//클라이언트가 multipart/form-data로 전송한 경우에만..
	if(upload.isMultipartContent(request)){
		List<FileItem> list=upload.parseRequest(request); //업로드 수행!
		
		for(int i=0;i<list.size();i++){
			FileItem item=list.get(i);
			
			if(item.isFormField()){//  text 파라미터라면..
				
			}else{ //파일 파라미터라면...
				item.write(destFile=new File(data+item.getName()));
				item.delete();
				
				//업로드된 엑셀을 해석한 후 
				//out.print(); html 테이블 형태로 출력!! 
				XSSFWorkbook book=new XSSFWorkbook(destFile);
				
				XSSFSheet sheet =book.getSheetAt(0);
				
				int rows=sheet.getPhysicalNumberOfRows();
				out.print("총 레코드 갯수는 "+rows+"<br>");
				
				//각 row 를 접근해보자!!
				for(int a=0; a<rows; a++){
					XSSFRow row=sheet.getRow(a);
					
					Post dto = new Post();
					
					int cols=row.getPhysicalNumberOfCells();
					//각  row에 구성된 컬럼을 접근하기!!
					
					/*
					k=0 : zipcode
					k=1 : sido
					k=2 : gugun
					k=3 : dong
					k=4 : bunji
					k=5: seq
					*/
					XSSFCell zip_cell=row.getCell(0);
					XSSFCell sido_cell=row.getCell(1);
					XSSFCell gugun_cell=row.getCell(2);
					XSSFCell dong_cell=row.getCell(3);
					XSSFCell bunji_cell=row.getCell(4);
					XSSFCell seq_cell=row.getCell(5);
					
					dto.setZipcode(zip_cell.getStringCellValue());
					dto.setSido(sido_cell.getStringCellValue());
					dto.setGugun(gugun_cell.getStringCellValue());
					dto.setDong(dong_cell.getStringCellValue());
					dto.setBunji(bunji_cell.getStringCellValue());
					dto.setSeq(Integer.parseInt(seq_cell.getRawValue()));
					
					//insert 
					int result=dao.insert(dto);
					
					if(result!=0){
						out.print("마이그레이션 완료!!");
					}else{
						out.print("마이그레이션 실패!!");
					}
				}
			 }
		}
	}else{
		out.print("html 코드도 모르냐!!!");
	}
	
%>    







