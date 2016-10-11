<%@ page contentType="text/html;charset=utf-8"%>
<%!
	//처리 성공 메세지를 출력하는 메서드
	public String showMsgURL(String msg, String url){
		StringBuffer sb = new StringBuffer();
		sb.append("<script>");
		sb.append("alert('"+msg+"');");
		sb.append("location.href='"+url+"';");
		sb.append("</script>");
		return sb.toString();
	}
	
	//처리 실패 메세지를 출력하는 메서드
	public String showMsgBack(String msg){
		StringBuffer sb = new StringBuffer();
		sb.append("<script>");
		sb.append("alert('"+msg+"');");
		sb.append("history.back();");
		sb.append("</script>");
		return sb.toString();
	}
%>




