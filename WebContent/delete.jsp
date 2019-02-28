<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="com.demo.service.*, com.demo.model.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd"><%@ page import="com.demo.service.*, com.demo.model.*"%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<jsp:useBean id="service" class="com.demo.service.ProductService"></jsp:useBean>

<% 
	//String id = request.getParameter("id");
		int id = Integer.parseInt(request.getParameter("id"));
		System.out.println(id);
		int delete = service.delete(id);
		response.sendRedirect("index.jsp");
%>

</body>
</html>