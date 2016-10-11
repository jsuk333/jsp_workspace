<%@ page contentType="text/html;charset=utf-8"%>
<%@ page import="com.test.Dog"%>
<%@ page import="java.sql.DriverManager"%>
<%@ page import="java.sql.Connection"%>
<%@ page import="java.sql.PreparedStatement"%>
<%@ page import="java.sql.ResultSet"%>
<%!
	String driver="oracle.jdbc.driver.OracleDriver";
	String url="jdbc:oracle:thin:@localhost:1521:XE";
	String user="java0919";
	String password="java0919";
	String sql="select * from test";
	Connection con;
	PreparedStatement pstmt;
	ResultSet rs;
	
%>
<%
	//로직을 작성하는 영역 스크립틀릿 영역

	//드라이버 로드
	Class.forName(driver);
	out.print("드라이버 로드성공!!");
	//강아지 객체 생성 후 사용
	Dog dog=new Dog();
	String sound=dog.bark();
	out.print(sound);
	//접속
	con=DriverManager.getConnection(url,user,password);
	if(con!=null){
		out.print("접속 성공");
		pstmt=con.prepareStatement(sql);
		rs=pstmt.executeQuery();
		while(rs.next()){
			String name=rs.getString("name");
			int age=rs.getInt("age");
			out.print(name+age);
		}
	}else{
		out.print("접속 실패");
	}

%>
<%
	if(rs!=null){
		rs.close();
	}
	if(pstmt!=null){
		pstmt.close();
	}
	if(con!=null){
		con.close();
	}
%>