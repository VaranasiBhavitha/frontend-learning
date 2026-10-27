import javax.servlet.*;
import javax.servlet.http.*;
import java.io.*;
public class cs1 extends HttpServlet
{
 public void doGet(HttpServletRequest req, HttpServletResponse res) throws IOException, ServletException
    {
        res.setContentType("text/html");
        PrintWriter pw = res.getWriter();
 	String name=req.getParameter("t1");
	String pwd=req.getParameter("t2");
Cookie c1=new Cookie("user",name);
Cookie c2=new Cookie("pwd",pwd);
	res.addCookie(c1);
	res.addCookie(c2);
	pw.println("<font color='blue' size=20>");
	pw.println("<form action=\"./cs2\">");
	pw.println("<input type=submit value='Next'>");
	pw.println("</form>");
	pw.close();
}
}
