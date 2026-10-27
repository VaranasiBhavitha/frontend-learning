import javax.servlet.*;
import javax.servlet.http.*;
import java.io.*;
public class cs2 extends HttpServlet
{
 public void doGet(HttpServletRequest req, HttpServletResponse res) throws IOException,ServletException
    {
        res.setContentType("text/html");
        PrintWriter pw = res.getWriter();
	Cookie c[]=req.getCookies();        
 	pw.println("<font color='red' size=20>");
	for(int i=0;i<c.length;i++)
	pw.println(c[i].getName()+" "+c[i].getValue());
	pw.println("</form>");
	pw.close();
}
}
