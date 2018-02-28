package com.kopoctc.mysql1;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController{
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Model model) throws ClassNotFoundException,SQLException  {
		Class.forName("com.mysql.jdbc.Driver");  //드라이버 호출
		Connection conn = DriverManager.getConnection("jdbc:mysql://192.168.23.103:3306/kopoctc?useSSL=false","root","12345678");
		//?useSSL=false 를 데이터베이스 이름 뒤에 쓰면 에러메시지 안뜸
		Statement stmt = conn.createStatement();  //스테이트먼트 객체 생성
		ResultSet rs = stmt.executeQuery("select * from mybatis_member");  //리저트셋에 쿼리 결과 저장
		
		int a = 1;	//줄번호를 위한 변수
		while(rs.next()) {	//table에서 1row씩 호출
			model.addAttribute("id"+a,rs.getString(1));
			model.addAttribute("pw"+a,rs.getString(2));
			model.addAttribute("name"+a,rs.getString(3));
			model.addAttribute("email"+a,rs.getString(4));
			model.addAttribute("telnum"+a,rs.getString(5));
			if(a==3) break;
			a++;
		}
		
		rs.close();  //종료해주지않으면 메모리 먹고서 안놓아줌
		stmt.close();
		conn.close();		
		
		return "home";	//jsp 파일 호출(view)
	}
}
