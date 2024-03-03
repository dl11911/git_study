package com.person;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/person")
 class PersonServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
  
      
    


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//데이터
		String name = request.getParameter("name");
		String gender = request.getParameter("gender");
		String color = request.getParameter("color");
		String[] hobby = request.getParameterValues("hobby");
		String[] subject = request.getParameterValues("subject");
	
		//응답
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();
		out.println("<html>");
		out.println("<body>");
		out.println("<head>");
		out.println("<style>");
		out.println("ul{color:" + color + ";}");
		out.println("</style>");
		out.println("</head>");
		out.println("<ul>");
		out.println("<li>이름 : " + name + "</li><br/>");
		if(gender.equals("0"))
			out.println("<li>성별 : 남자</li><br/>");
		else if(gender.equals("1"))
				out.println("<li>성별 : 여자</li><br/>");	
			
		out.println("<li>색깔 : " + color + "</li><br/>");
		
		if(hobby ==null)
			out.println("<li>취미 : 선택하신 취미가 없습니다.</li><br/>");
		else
			for(int i=0; i<hobby.length; i++) {
				out.println(hobby[i]);
			}
		out.print("</li><br/>");
		
		if(hobby.length ==0)
			out.println("<li>과목 : ");
			for(String data : subject) {
				out.println(data);
			}
		out.print("</li><br/>");
		
		out.println("</ul>");
		out.println("</body>");
		out.println("</html>");
		
	}

}
