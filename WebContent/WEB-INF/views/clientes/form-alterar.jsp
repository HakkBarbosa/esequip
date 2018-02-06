<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Alterar Cliente</title>
</head>
<body>
<c:import url="../menu.jsp"></c:import>
<h1>Alterar Cliente</h1>
<form action="/esequip/clientes/alterar" method="post">
	
	<div>
		<label>ID: </label>
		<input type="text" name="id" value="${cliente.id}" readonly="readonly" />
	</div>
	
	<div>
		<label>Nome: </label>
		<input type="text" name="nome" value="${cliente.nome}" />
	</div>
	
	<div>
		<label>CPF: </label>
		<input type="text" name="cpf" value="${cliente.cpf}" />
	</div>

	<div>
		<label>Endereço: </label>
		<input type="text" name="endereco" value="${cliente.endereco}" />
	</div>
	
	<div>
		<label>Telefone: </label>
		<input type="text" name="telefone" value="${cliente.telefone}" />
	</div>
	
	<div>
		<button type="submit">Alterar</button>
	</div>
</form>
</body>
</html>