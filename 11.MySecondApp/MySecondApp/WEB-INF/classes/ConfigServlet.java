import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class ConfigServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    private String dbUrl;
    private String dbUser;
    private String dbPassword;

    @Override
    public void init(ServletConfig config) throws ServletException {
        super.init(config);

        // Read init parameters from web.xml
        dbUrl = config.getInitParameter("dbUrl");
        dbUser = config.getInitParameter("dbUser");
        dbPassword = config.getInitParameter("dbPassword");
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        response.setContentType("text/html");
        PrintWriter out = response.getWriter();

        out.println("<html><body>");
        out.println("<h2>Database Configuration from web.xml</h2>");
        out.println("<p><b>DB URL:</b> " + dbUrl + "</p>");
        out.println("<p><b>DB User:</b> " + dbUser + "</p>");
        out.println("<p><b>DB Password:</b> " + dbPassword + "</p>");
        out.println("</body></html>");

        out.close();
    }
}
