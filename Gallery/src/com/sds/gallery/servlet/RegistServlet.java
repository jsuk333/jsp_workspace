/*jsp�ѵ� ���ε� ó���� �Ҽ��� ������, ���� �����ϱ� ����
 * �������� ���� �Ѵ�.
 * */
package com.sds.gallery.servlet;

import java.awt.Graphics2D;
import java.awt.Image;
import java.awt.image.BufferedImage;
import java.awt.image.RenderedImage;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.imageio.ImageIO;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileItemFactory;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import com.sds.gallery.domain.Gallery;
import com.sds.gallery.domain.dao.GalleryDAO;

public class RegistServlet extends HttpServlet{
	String temp="C:/jsp_workspace/Gallery/WebContent/temp";
	String dest="C:/jsp_workspace/Gallery/WebContent/data";
	String thumb="C:/jsp_workspace/Gallery/WebContent/thumb";
	GalleryDAO dao=new GalleryDAO();
	//Ŭ���̾�Ʈ�� post������� �����ϸ� ���� �޼��忡 ���ؼ� ȣ��ȴ�.
	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		res.setContentType("text/html");
		res.setCharacterEncoding("utf-8");//���� ���
		req.setCharacterEncoding("utf-8");//��� ���ڵ�
		PrintWriter out=res.getWriter();
		out.print("���ε� �ҷ���??");
		//apace fileupload�� �̿��� ���ε� ����
		DiskFileItemFactory factory=new DiskFileItemFactory();
		factory.setSizeThreshold(1024*1024*3);//1mb������ ������ �޸𸮻󿡼� ó���Ѵ�.
		factory.setRepository(new File(temp));
		ServletFileUpload upload=new ServletFileUpload(factory);
		try {
			//���� �������̶� ���ε�� �Ķ���͵��� ����Ų��
			//�츮�� ��� �� 4���� ���´�.
			List<FileItem> list=upload.parseRequest(req);
			Gallery dto=new Gallery();
			for(int i=0;i<list.size();i++){
				FileItem item=list.get(i);
				
				if(item.isFormField()){//true�� �ؽ�Ʈ
					//out.print(item.getFieldName()+"��"+item.getString("utf-8")+"<br>");
					String param=item.getFieldName();
					String value=item.getString("utf-8");
					switch(param){
					case "writer": dto.setWriter(value); break;
					case "title": dto.setTitle(value);break;
					case "content": dto.setContent(value);break;
					}
				}else{//���� ���ε�
					try {
						item.write(new File(dest,item.getName()));
						item.delete();//temp directory ���� ����
						//���� �̹����� ���ϴ� �̹��� ũ��� ��ҽ�Ű��
						//����� ũ�⿡ �°�
						int width=40;
						int height=30;
						BufferedImage thumb_image=new BufferedImage(width, height,BufferedImage.TYPE_INT_RGB);
						Graphics2D g=(Graphics2D) thumb_image.getGraphics();
						BufferedImage original_image=ImageIO.read(new File(dest,item.getName()));
						g.drawImage(original_image, 0, 0, width, height, null);
						//�޸𸮻󿡼� �׷��� ���� �̹����� ��������
						String mineType=item.getName().substring(item.getName().lastIndexOf('.')+1,item.getName().length());
						ImageIO.write((RenderedImage)thumb_image, mineType, new File(thumb+"/"+item.getName()));
						
						dto.setImg(item.getName());
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
				out.print("location.href='/board/list.jsp';");
			}else{
				out.print("alert('��� ����');");
				out.print("history.back();");
			}
			out.print("</script>");
			
		} catch (FileUploadException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
	}

}
