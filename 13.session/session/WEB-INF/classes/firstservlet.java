import javax.servlet.*;
import javax.servlet.http.*;
import java.io.*;
public class firstservlet extends HttpServlet
{
 public void doGet(HttpServletRequest req, HttpServletResponse res) throws IOException, ServletException
    {       	 res.setContentType("text/html");
        	PrintWriter pw = res.getWriter();
                HttpSession hs = req.getSession(true);
	String uname=req.getParameter("t1");
	String uage=req.getParameter("t2");
	hs.setAttribute("user",uname);
	hs.setAttribute("age",uage);
	pw.println("<font color='blue' size=20>");
	pw.println("session id="+hs.getId());
	pw.println("<form action=\"./ss\">");
	pw.println("<input type=submit value='Next'>");
	pw.println("</form>");
	pw.close();
   }
}
