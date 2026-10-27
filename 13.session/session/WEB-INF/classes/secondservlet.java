import javax.servlet.*;
import javax.servlet.http.*;
import java.io.*;
public class secondservlet extends HttpServlet
{
 public void doGet(HttpServletRequest req, HttpServletResponse res) throws IOException,ServletException
    {          res.setContentType("text/html");
               PrintWriter pw = res.getWriter();
               HttpSession hs1 = req.getSession(false);
	pw.println("<font color='red' size=20>");
	pw.println("session id="+hs1.getId());
	pw.println("UserName:"+hs1.getAttribute("user").toString());
	pw.println("Age:"+hs1.getAttribute("age").toString());
	pw.println("</form>");
	pw.close();
}
}
