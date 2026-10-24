<%@ page import="java.sql.*" %>

<html>

<head>
    <title>Book Catalogue</title>
</head>

<body>

<h2 align="center">BOOK CATALOGUE</h2>

<table border="1" width="100%" cellpadding="10">

<tr>
    <th>Image</th>
    <th>Category</th>
    <th>Book Name</th>
    <th>Author</th>
    <th>Publication</th>
    <th>Price</th>
    <th>Quantity</th>
    <th>Amount</th>
    <th>Action</th>
</tr>

<%
    // Database details
    String driver = "com.mysql.cj.jdbc.Driver";
    String url = "jdbc:mysql://localhost:3306/bookstore";
    String username = "root";
    String password = "";

    Connection con = null;
    Statement stmt = null;
    ResultSet rs = null;

    try {

        // Step 1: Register the Driver
        Class.forName(driver);

        // Step 2: Establish Connection
        con = DriverManager.getConnection(
                url, username, password);

        // Step 3: Create Statement
        stmt = con.createStatement();

        // Step 4: Execute Query
        String query = "SELECT * FROM book";

        rs = stmt.executeQuery(query);

        // Display database records
        while (rs.next()) {

            int id = rs.getInt("id");
            String category = rs.getString("category");
            String bookName = rs.getString("book_name");
            String author = rs.getString("author");
            String publication = rs.getString("publication");
            double price = rs.getDouble("price");
            int quantity = rs.getInt("quantity");
            double amount = rs.getDouble("amount");

            String image = "";

            if (category.equalsIgnoreCase("C")) {
                image = "c.jpeg";
            }
            else if (category.equalsIgnoreCase("CSS")) {
                image = "cpp.jpg";
            }
            else if (category.equalsIgnoreCase("Java")) {
                image = "java.jpg";
            }
            else if (category.equalsIgnoreCase("HTML")) {
                image = "html.jpeg";
            }
%>

<tr>

    <td align="center">
        <img src="<%= image %>" width="100" height="100">
    </td>

    <td>
        <%= category %>
    </td>

    <td>
        <%= bookName %>
    </td>

    <td>
        <%= author %>
    </td>

    <td>
        <%= publication %>
    </td>

    <td>
        $<%= price %>
    </td>

    <td>
        <%= quantity %>
    </td>

    <td>
        $<%= amount %>
    </td>

    <td>
        <input type="button" value="ADD TO CART">
    </td>

</tr>

<%
        }

    }
    catch (Exception e) {
        out.println("<tr>");
        out.println("<td colspan='9'>");
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
