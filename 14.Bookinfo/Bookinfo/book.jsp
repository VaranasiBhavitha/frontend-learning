<%@ page import="java.sql.*" %>

<html>

<head>
    <title>Book Information</title>
</head>

<body>

<h2 align="center">BOOK INFORMATION</h2>

<table border="1" width="100%" cellpadding="10">

<tr>
    <th>S.No</th>
    <th>Book Title</th>
    <th>Author Name</th>
    <th>Publisher Name</th>
    <th>Price</th>
</tr>

<%
    // Database details
    String driver = "com.mysql.cj.jdbc.Driver";
    String url = "jdbc:mysql://localhost:3306/bookstore";
    String username = "root";
    String password = "root";

    Connection con = null;
    Statement stmt = null;
    ResultSet rs = null;

    try {

        // Step 1: Register the Driver
        Class.forName(driver);

        // Step 2: Establish Connection
        con = DriverManager.getConnection(
                url,
                username,
                password
        );

        // Step 3: Create Statement
        stmt = con.createStatement();

        // Step 4: Execute SQL Query
        String query = "SELECT * FROM book1";

        rs = stmt.executeQuery(query);

        // Serial Number
        int sno = 1;

        // Step 5: Retrieve and Display Records
        while (rs.next()) {

            String title = rs.getString("book_name");
            String author = rs.getString("author");
            String publisher = rs.getString("publication");
            double price = rs.getDouble("price");
%>

<tr>

    <td align="center">
        <%= sno %>
    </td>

    <td>
        <%= title %>
    </td>

    <td>
        <%= author %>
    </td>

 

    <td>
        <%= publisher %>
    </td>

   

    <td>
        ₹<%= price %>
    </td>

</tr>

<%
            sno++;
        }

    }
    catch (Exception e) {

        out.println("<tr>");
        out.println("<td colspan='7'>");
        out.println("Error: " + e.getMessage());
        out.println("</td>");
        out.println("</tr>");

    }
    finally {

        try {

            if (rs != null)
                rs.close();

            if (stmt != null)
                stmt.close();

            if (con != null)
                con.close();

        }
        catch (Exception e) {
            out.println(e);
        }
    }
%>

</table>

</body>

</html>