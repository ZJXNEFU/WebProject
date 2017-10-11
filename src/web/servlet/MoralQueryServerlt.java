package web.servlet;

import java.io.IOException;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import service.MoralQueryService;

/**
 * Servlet implementation class MoralQueryServerlt
 */
@WebServlet("/moralquery")
public class MoralQueryServerlt extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String s1 = request.getParameter("year");
		String s2 = request.getParameter("month");
	
		
		StringBuilder sb = new StringBuilder();
		sb.append(s1).append(s2);
		MoralQueryService sqs = new MoralQueryService();
		ResultSet result = sqs.moralQuery(sb.toString());
		request.setAttribute("result2", result);
		request.setAttribute("year", s1);
		request.setAttribute("month", s2);
		request.setAttribute("curPage", request.getParameter("page"));
		request.getRequestDispatcher("/moraldisplay.jsp").forward(request, response);
	}

}
