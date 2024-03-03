package com.param;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/ParamServlet")
public class ParamServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
 

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		//데이터
		String name = request.getParameter("name");
		int age = Integer.parseInt(request.getParameter("age"));
		
		//응답
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();
		out.println("<html>");
		out.println("<head>");
		out.println("<style>");
		out.println("#textSpan {font-size:15pt; font-weight:bold; color:red;}");
		out.println("</style>");
		out.println("</head>");
		out.println("<body>");
		out.println("나이 이름은 " + name + "이고 나이는" + age + "살 입니다.<br/>");
		if(age >=20)
			out.println("그래서 <font sieze='5' color='red'><strong>성인</strong></font>입니다. ;");
		else
			out.println("그래서 <span id='textSpan'>청소년</span>입니다.");
		out.println("</body>");
		out.println("</html>");
			
	
		
	}

}
