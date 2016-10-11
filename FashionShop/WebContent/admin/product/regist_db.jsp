<%@page import="com.fashion.common.file.FileManager"%>
<%@page import="com.fashion.product.jdbc.dao.ProductDAO"%>
<%@page import="com.fashion.product.domain.Product"%>
<%@page import="org.apache.commons.fileupload.FileItem"%>
<%@ page import="java.util.List"%>
<%@ page import="java.io.File"%>
<%@ page import="org.apache.commons.fileupload.disk.DiskFileItemFactory"%>
<%@ page import="org.apache.commons.fileupload.servlet.ServletFileUpload"%>
<%@ page contentType="text/html;charset=utf-8"%>
<%@ include file="/inc/message.jsp" %>    
<%!
	DiskFileItemFactory factory=new DiskFileItemFactory();
	ServletFileUpload upload=new ServletFileUpload(factory);
	File saveFile;	
	ProductDAO dao = new ProductDAO();
%>    
<%
	request.setCharacterEncoding("utf-8");

	String tempPath=application.getRealPath("/temp");
	String realPath=application.getRealPath("/product/");
	
	out.print(realPath);
	
	factory.setSizeThreshold(1*1024*1024);
	factory.setRepository(new File(tempPath));
	
	//파라미터 넘겨받아 업로드 및 db 에 넣자!!!
	List<FileItem> list=upload.parseRequest(request); //분석 시작!!!
	
	Product dto = new Product();
	
	for(int i=0;i<list.size();i++){
		FileItem item=list.get(i);
		
		if(item.isFormField()){//text 기반 파라미터..
			if(item.getFieldName().equals("sub_id")){
				dto.setSub_id(Integer.parseInt(item.getString()));
			}else if(item.getFieldName().equals("product_name")){
				dto.setProduct_name(item.getString("utf-8"));
			}else if(item.getFieldName().equals("gender")){
				dto.setGender(item.getString("utf-8"));
			}else if(item.getFieldName().equals("brand")){
				dto.setBrand(item.getString("utf-8"));
			}else if(item.getFieldName().equals("nation")){
				dto.setNation(item.getString("utf-8"));
			}else if(item.getFieldName().equals("price")){
				dto.setPrice(Integer.parseInt(item.getString()));
			}else if(item.getFieldName().equals("discount")){
				dto.setDiscount(Integer.parseInt(item.getString()));
			}else if(item.getFieldName().equals("point")){
				dto.setPoint(Integer.parseInt(item.getString()));
			}else if(item.getFieldName().equals("memo")){
				dto.setMemo(item.getString("utf-8"));
			}else if(item.getFieldName().equals("psize")){
				dto.setPsize(item.getString("utf-8"));
			}else if(item.getFieldName().equals("color")){
				dto.setColor(item.getString());
			}else if(item.getFieldName().equals("stock")){
				dto.setStock(Integer.parseInt(item.getString()));
			}else if(item.getFieldName().equals("detail")){
				dto.setDetail(item.getString("utf-8"));
			}
		}else{//바이너리 파일 기반 파라미터...
			dto.setImg(item.getName());
			
			System.out.println(dto.getImg());
			
			item.write(saveFile=new File(realPath+item.getName()));
			item.delete();
		}	
	}
	//db에 넣자!
	int result=dao.insert(dto);
	
	//방금 insert된 레코드의 primary key 값을 이용하여 파일명 변경하자!!!
	//왜 해야하나?? 중복X, 유효하지 않은 파일명 방지...
	// 53.jpg	
	String ext=FileManager.getExt(saveFile.getName());
	saveFile.renameTo(new File(realPath+result+"."+ext));
	
	if(result!=0){
		out.print(showMsgURL("등록완료", "/admin/product/regist.jsp"));
	}else{
		out.print(showMsgBack("등록실패"));
	}
%>











