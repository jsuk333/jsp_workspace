<%@ page contentType="text/html;charset=utf-8"%>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.PreparedStatement"%>
<%!
	String url="jdbc:oracle:thin:@localhost:1521:XE";
	String user="java0919";
	String pwd="java0919";
	Connection con;
	PreparedStatement pstmt;

%>
<%
//클라이언트가ㅏ 전송한 데이터를 바당서
//오라클에 insert 시켜보자!!
	request.setCharacterEncoding("utf-8");//파라미터에 대한 언어 인코딩 지정
	String id=request.getParameter("id");
	String password=request.getParameter("password");
	String name=request.getParameter("name");

	out.print("넘겨받은 id는"+id);
	out.print("넘겨받은 password는"+password);
	out.print("넘겨받은 name는"+name);

	String sql="insert into member(number_id,id,password,name)";
	sql+=" values(seq_member.nextval,?,?,?)";
	out.print(sql);

	//드라이버 로드
		Class.forName("oracle.jdbc.driver.OracleDriver");
	//접속
		con=DriverManager.getConnection(url,user,pwd);
		if(con!=null){
			out.print("접속 성공");
		}
	//쿼리 수행
		pstmt=con.prepareStatement(sql);
		pstmt.setString(1,id);
		pstmt.setString(2,password);
		pstmt.setString(3,name);
		int result=pstmt.executeUpdate();
		out.print(result);

	// 닫기
		if(pstmt!=null){
			pstmt.close();
		}
		if(con!=null){
			con.close();
		}

%>