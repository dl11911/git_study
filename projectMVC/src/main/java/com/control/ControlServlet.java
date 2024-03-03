package com.control;

import java.io.FileInputStream;
import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.Properties;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebInitParam;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(
		urlPatterns = {"*.do"},
		initParams = {
				@WebInitParam(name="propertyConfig", value="command.properties")
		}
	)
public class ControlServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private Map<String, Object> map = new HashMap<String, Object>();
	
	@Override
	public void init(ServletConfig config) throws ServletException {
		String propertyConfig = config.getInitParameter("propertyConfig");
		System.out.println("propertyConfig = " + propertyConfig);
		
		//만약에 web.xml에 등록하면 아래의 3줄이 필요없다 ---------
		String realFolder = config.getServletContext().getRealPath("/WEB-INF");
		String realPath = realFolder + "/" + propertyConfig;
		System.out.println("realPath = " + realPath);
		//-----------------------------------------------
		
		FileInputStream fin = null;
		Properties properties = new Properties();
		
		try {
			//만약에 web.xml로 설정하면 fin = new FileInputStream(propertyConfig);
			fin = new FileInputStream(realPath);
	                  
	         properties.load(fin);
	         System.out.println("properties = "+properties);
	         
	      } catch (IOException e) {
	         e.printStackTrace();
	      }finally{
	         try {
	            fin.close();
	         } catch (IOException e) {
	            e.printStackTrace();
	         }
	      }
	      System.out.println();
	      
	      Iterator<Object> it = properties.keySet().iterator();
	      while(it.hasNext()) {
	         String key = (String)it.next();
	         System.out.println("key = "+key);
	         
	         String className = properties.getProperty(key);
	         System.out.println("className = "+className);
	         
	         try {
	            Class<?> classType = Class.forName(className);
	            Object ob = classType.getConstructor().newInstance();
	            
	            System.out.println("ob = "+ob);
	            
	            map.put(key, ob);
	            
	         } catch (ClassNotFoundException e) {
	            e.printStackTrace();
	         } catch (InstantiationException e) {
	            e.printStackTrace();
	         } catch (IllegalAccessException e) {
	            e.printStackTrace();
	         } catch (IllegalArgumentException e) {
	            e.printStackTrace();
	         } catch (InvocationTargetException e) {
				e.printStackTrace();
	         } catch (NoSuchMethodException e) {
				e.printStackTrace();
	         } catch (SecurityException e) {
				e.printStackTrace();
	         }
	         
	         System.out.println();
	      }//while
		
	}//init
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		execute(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		execute(request, response);
	}
	
	protected void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("------------------");
		
		//한글 처리
		if(request.getMethod().equals("POST")) {
			request.setCharacterEncoding("UTF-8");
		}//if
		
		//요청이 들어왔을 때 - http://localhost:8080/memberMVC/member/writeForm.do
		String category = request.getServletPath(); // URL에서 프로젝트명 뒤에 있는 것 => /member/writeForm.do
		System.out.println("category = " + category);
		
		CommandProcess com = (CommandProcess) map.get(category); //부모 = 자식
		
		String view = null;
		try {
			view = com.requestPro(request, response); //자바 파일 호출
		} catch (Throwable e) {
			e.printStackTrace();
		}
		
		//forward
		RequestDispatcher dispatcher = request.getRequestDispatcher(view); //상대번지
		dispatcher.forward(request, response); //제어권 넘기기
	}

	
}













