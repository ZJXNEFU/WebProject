package web.servlet;

import java.io.IOException;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import service.ScoreQueryService;

/**
 * Servlet implementation class ScoreQueryServlet
 */
@WebServlet("/scoreQuery")
public class ScoreQueryServlet extends HttpServlet {
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
		String s1 = request.getParameter("s1");
		String s2 = request.getParameter("s2");
		String s3 = request.getParameter("s3");
		
		StringBuilder sb = new StringBuilder();
		sb.append(s1).append(s2).append(s3);
		ScoreQueryService sqs = new ScoreQueryService();
		ResultSet result = sqs.scoreQuery(sb.toString());
		request.setAttribute("result", result);
		request.setAttribute("s1", s1);
		request.setAttribute("s2", s2);
		request.setAttribute("s3", s3);
		request.setAttribute("curPage", request.getParameter("page"));
		request.getRequestDispatcher("/display.jsp").forward(request, response);
	}

}
