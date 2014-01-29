package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class Controller
 */
@WebServlet("/Controller")
public class Controller extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	Map<String, String> actionMap = new HashMap<String, String>();
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Controller() {
    	// Build a Map of action parameters to pages
		actionMap.put("image", "/image.jsp");
		actionMap.put("rate", "/image.jsp");
		actionMap.put("home", "/home.jsp");
    }

	/**
	 * @see Servlet#init(ServletConfig)
	 */
	public void init(ServletConfig config) throws ServletException {
		// TODO Auto-generated method stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doForward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doForward(request, response);
	}

	private void doForward(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		PrintWriter writer = response.getWriter();
		
		//get the action parameter
		String action = request.getParameter("action");
		
		System.out.println(action);
		System.out.println(actionMap);
		
		//if action parameter is null, or the map doesn't contain a parameter
		//set the action to the home page
		if (action == null || !actionMap.containsKey(action)) {
			System.out.println("null");
			action = "home";
		}
		
		// forward to home page
		//request.getRequestDispatcher("/home.jsp").forward(request, response);
		// forward to requested page
		System.out.println(actionMap.get(action));
		request.getRequestDispatcher(actionMap.get(action)).forward(request, response);
		
	}

}
