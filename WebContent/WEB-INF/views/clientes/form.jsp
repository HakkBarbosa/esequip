<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<style>
input[type=text], select {
    width: 30%;
    padding: 5px 5px;
    margin: 8px 0;
    display: inline-block;
    border: 1px solid #ccc;
    border-radius: 4px;
    box-sizing: border-box;
    border: 2px solid orange;
}
input[type=submit] {
    width: 30%;
    background-color: red;
    color: red;
    padding: 5px 5px;
    margin: 8px 0;
    border: none;
    border-radius: 4px;
    cursor: pointer;
}
input[type=submit]:hover {
    background-color: #45a049;
}
div {
    border-radius: 1px;
    background-color: #ffffff;
    padding: 1px;
 
}
</style>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<c:import url="../menu.jsp"></c:import>
<h2>Adicionando Cliente</h2>
<form action="/esequip/clientes" method="post">
	
	<div>
		<label>Nome:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </label>
		<input type="text" name="nome" />
	</div>
	<div>
		<label>CPF:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;  </label>
		<input type="text" name="cpf">
	</div>
	<div>
		<label>Endere�o:&nbsp; </label>
		<input type="text" name="endereco">
	</div>
	<div>
		<label>Telefone:&nbsp;&nbsp;</label>
		<input type="text" name="telefone">
	</div>
	<div>
		<button type="submit">Adicionar</button>
	</div>
</form>
</body>
</html>