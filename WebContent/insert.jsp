<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import="com.demo.service.*, com.demo.model.*"%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<jsp:useBean id="service" class="com.demo.service.ProductService"></jsp:useBean>
	<%
		String name = request.getParameter("name");
		Double price =Double.parseDouble(request.getParameter("price"));
		String seller = request.getParameter("seller");
		int num = service.insert(name, price, seller);
		response.sendRedirect("index.jsp");
	%>
</body>
</html>