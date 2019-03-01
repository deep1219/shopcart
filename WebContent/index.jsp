<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.ArrayList" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
  <link href = "https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" rel= "stylesheet" />
  <script src = ""https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js ></script>
  <title>Insert title here</title>
</head>
<body>
<a href="insert.html"><img src="Images/add.png" alt ="add"></a>

<%
	com.demo.service.ProductService service = new com.demo.service.ProductService();
	ArrayList<com.demo.model.Product> list =  service.viewAll();
	if(list != null && list.size()>0)
	{

%>

<table class = "table table-striped table-hover">
	<tr class="success">
			<th>ID</th>
			<th>Name</th>
			<th>Price</th>
			<th>Seller</th>
			<th>Delete</th>
			
	</tr>
<%
	for(com.demo.model.Product p :list){
%>
<tr class = "info">
	<td><%= p.getId() %></td>
	<td><%= p.getName() %></td>
	<td><%= p.getPrice() %></td>
	<td><%= p.getSeller() %></td>
	<td><a href=<%="delete.jsp?id=" + p.getId()%>><img src= "Images/delete.png" alt="delete" /></a></td>
	<td><a href= "update.jsp"><img src ="Images/edit.png" alt="edit" /></a></td>
</tr>
<%
	}
	}
	else
		out.println("No Products");
%>

</table>

</body>
</html>