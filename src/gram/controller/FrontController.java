package gram.controller;

import java.io.IOException;
import java.util.HashMap;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/tru")
public class FrontController extends HttpServlet 
{
	HashMap<String, Action> map;						// Map인터페이스의 한종류로써 Key와 Value 값으로 데이터를 저장하는 형태
														// 키의 이름에 맞는 값들을 액션을 통해 바로 실행시키는 초기화부분

	public void init(ServletConfig config) throws ServletException 
	{
		map = (HashMap<String, Action>)config.getServletContext().getAttribute("map");
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		this.doPost(request, response);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		//post방식인 경우 한글 인코딩 처리.
		request.setCharacterEncoding("UTF-8");
		String key = request.getParameter("command");					//command 값을 받으면      // requestScope.list를 위해서 값을 list로 넣으면 나오는 값을 사용
		map.get(key).execute(request, response);						// map에서 키값을 받아온다. map은 프로펄티 그리고 execute 가 호출됨
	}

}
