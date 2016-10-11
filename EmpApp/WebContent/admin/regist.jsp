<%@page import="org.apache.commons.fileupload.FileItem"%>
<%@page import="java.util.List"%>
<%@page import="org.apache.commons.fileupload.UploadContext"%>
<%@page import="org.apache.commons.fileupload.servlet.ServletFileUpload"%>
<%@page import="java.io.File"%>
<%@page import="org.apache.commons.fileupload.disk.DiskFileItemFactory"%>
<%@page import="javafx.application.Application"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%! %>
<% 
	//넘겨 받은 엑셀파일을 해석한후 , 
	File destFile=null;
	request.setCharacterEncoding("utf-8");
	String temp=application.getRealPath("/temp");
	String dest=application.getRealPath("/data/");
	out.print(temp);
	DiskFileItemFactory factory=new DiskFileItemFactory();
	factory.setSizeThreshold(1024*1024);
	factory.setRepository(new File(temp));
	ServletFileUpload upload=new ServletFileUpload();
	if(upload.isMultipartContent(request)){//클라이언트가 multipart/form-data일 경우
		
		List<FileItem> list=upload.parseRequest(request);//업로드 수행!
		for(int i=0;i<list.size();i++){
			FileItem item=list.get(i);
			if(item.isFormField()){//text 파라미터라면
				String param=item.getFieldName();
				String value=item.getString("utf-8");
				
			}else{////파일 파라미터라면
				item.write(destFile=new File(dest+item.getName()));
				item.delete();
				
			}
		}
	}else{
		out.print("html코드도 모르냐??");
	}
	
	

%>