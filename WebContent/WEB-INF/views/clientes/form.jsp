<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<c:import url="../menu.jsp"></c:import>
<h2>Adicionando Cliente</h2>
<form action="/esequip/clientes" method="post">
	
	<div>
		<label>Nome: </label>
		<input type="text" name="nome" />
	</div>
	<div>
		<label>CPF: </label>
		<input type="text" name="cpf">
	</div>
	<div>
		<label>Endereço: </label>
		<input type="text" name="endereco">
	</div>
	<div>
		<label>Telefone: </label>
		<input type="text" name="telefone">
	</div>
	<div>
		<button type="submit">Adicionar</button>
	</div>
</form>
</body>
</html>