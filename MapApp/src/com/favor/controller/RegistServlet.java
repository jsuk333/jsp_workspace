package com.favor.controller;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletConfig;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileItemFactory;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.apache.coyote.http11.filters.SavedRequestInputFilter;

import com.favor.domain.Favor;
import com.favor.model.dao.FavorDAO;

import oracle.net.aso.p;


public class RegistServlet extends HttpServlet {
	ServletFileUpload upload;
	FileItemFactory factory;
	int tempSize=1024*1024;
	String tempPath;
	String realPath;
	File savaFile;
	FavorDAO dao;
	//application���尴ü�� servletContext�̴�.
	public RegistServlet() {
		dao=new FavorDAO();
	}
	//������ �¾�� �� �޸𸮿� �ö�ö� �¾�� ���� ����
	public void init(ServletConfig config) throws ServletException {
		//
		//dd�� �ڿ��� ����ϴ� ����� ��õ�ȴ�.
		
		ServletContext context=config.getServletContext();
		tempPath=context.getRealPath(config.getInitParameter("tempDir"));
		realPath=context.getRealPath(config.getInitParameter("realDir"));
		factory= new DiskFileItemFactory(tempSize,new File(tempPath));
		upload=new ServletFileUpload(factory);
	}
	
	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		res.setContentType("text/html");
		res.setCharacterEncoding("utf-8");
		PrintWriter out=res.getWriter();
		//���ε� �ǽ�
		try {
			List<FileItem> params=upload.parseRequest(req);
			Favor dto=new Favor();
			for(int i=0;i<params.size();i++){
				FileItem item=params.get(i);
				if(item.isFormField()){//�ؽ�Ʈ���
					if(item.getFieldName().equals("lat")){
						dto.setLat(Double.parseDouble(item.getString()));
					}else if(item.getFieldName().equals("lng")){
						dto.setLng(Double.parseDouble(item.getString()));
					}else if(item.getFieldName().equals("name")){
						dto.setName(item.getString());
					}else if(item.getFieldName().equals("content")){
						dto.setContent(item.getString());
					}else if(item.getFieldName().equals("score")){
						dto.setScore((Double.parseDouble(item.getString())));
					}
				}else{//���̳ʸ� �����̸�
					try {
						item.write(savaFile=new File(realPath+"/"+item.getName()));
						item.delete();
						dto.setImg(savaFile.getName());
						System.out.println(dto.getImg());
					} catch (Exception e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
				}
			}
			int result=dao.insert(dto);
			out.print("<script>");
			if(result!=0){
				out.print("alert('��� ����');");
				out.print("location.href=\"/client\"");
			}else{
				out.print("alert('��� ����');");
				out.print("history.back");
			}
			out.print("</script>");
			
		} catch (FileUploadException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	//�ݳ��� �ڿ��� �ִٸ� ó��
	private void destory() {

	}
}
