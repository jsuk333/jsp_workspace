/*jsp롤도 업로드 처리를 할수는 있으나, 좀더 공부하기 위해
 * 오랜만에 서블릿 한다.
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
	//클라이언트가 post방식으로 전송하면 서비스 메서드에 의해서 호출된다.
	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		res.setContentType("text/html");
		res.setCharacterEncoding("utf-8");//문서 출력
		req.setCharacterEncoding("utf-8");//출력 인코딩
		PrintWriter out=res.getWriter();
		out.print("업로드 할려구??");
		//apace fileupload를 이용한 업로드 시작
		DiskFileItemFactory factory=new DiskFileItemFactory();
		factory.setSizeThreshold(1024*1024*3);//1mb이하의 파일은 메모리상에서 처리한다.
		factory.setRepository(new File(temp));
		ServletFileUpload upload=new ServletFileUpload(factory);
		try {
			//파일 아이템이란 업로드된 파라미터들을 가리킨다
			//우리의 경우 총 4개가 나온다.
			List<FileItem> list=upload.parseRequest(req);
			Gallery dto=new Gallery();
			for(int i=0;i<list.size();i++){
				FileItem item=list.get(i);
				
				if(item.isFormField()){//true면 텍스트
					//out.print(item.getFieldName()+"은"+item.getString("utf-8")+"<br>");
					String param=item.getFieldName();
					String value=item.getString("utf-8");
					switch(param){
					case "writer": dto.setWriter(value); break;
					case "title": dto.setTitle(value);break;
					case "content": dto.setContent(value);break;
					}
				}else{//파일 업로드
					try {
						item.write(new File(dest,item.getName()));
						item.delete();//temp directory 내용 삭제
						//원본 이미지를 원하는 이미지 크기로 축소시키자
						//썸네일 크기에 맞게
						int width=40;
						int height=30;
						BufferedImage thumb_image=new BufferedImage(width, height,BufferedImage.TYPE_INT_RGB);
						Graphics2D g=(Graphics2D) thumb_image.getGraphics();
						BufferedImage original_image=ImageIO.read(new File(dest,item.getName()));
						g.drawImage(original_image, 0, 0, width, height, null);
						//메모리상에서 그려진 버퍼 이미지를 저장하자
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
				out.print("alert('등록 성공');");
				out.print("location.href='/board/list.jsp';");
			}else{
				out.print("alert('등록 실패');");
				out.print("history.back();");
			}
			out.print("</script>");
			
		} catch (FileUploadException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
	}

}
