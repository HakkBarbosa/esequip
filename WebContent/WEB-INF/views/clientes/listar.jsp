<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Lista de Clientes</title>
</head>
<body>
<c:import url="../menu.jsp"></c:import>
	<h1>Lista de Clientes</h1>
	
	<table border="1">
		<tr>
			<th>ID</th>
			<th>Nome</th>
			<th>CPF</th>
			<th>Endereço</th>
			<th>Telefone</th>
		</tr>	
			
		<c:forEach var="cliente" items="${clientes}">
		
		<tr>
			<td>${cliente.id}</td>
			<td>${cliente.nome}</td>
			<td>${cliente.cpf}</td>
			<td>${cliente.endereco}</td>
			<td>${cliente.telefone}</td>
			<td><a href="/esequip/clientes/remover?id=${cliente.id}">Remover</a></td>
			<td><a href="/esequip/clientes/selecionar?id=${cliente.id}">Alterar</a></td>
			<td><a href="/esequip/equipamentos/form?id=${cliente.id}">Cadastrar equipamento</a></td>
			<td><a href="/esequip/equipamentos?id=${cliente.id}">Listar Equipamento</a></td>
		</tr>
		
		</c:forEach>	
	
	</table>

</body>
</html>