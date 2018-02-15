<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Lista</title>
</head>
<body>
	<c:import url="../menu.jsp"></c:import>
	<h1></h1>

	<form action="/esequip/equipamentos/form">
		<input type="hidden" name="id" value="${cliente.id }">
		<button type="submit">Novo Equipamento</button>
	</form> 

	<br> ID do cliente: ${cliente.id}
	<br> Nome do cliente: ${cliente.nome}

	<table border="1" >
		<tr>
			<th>ID</th>
			<th>Nome</th>
			<th>Marca</th>
			<th>Modelo</th>
			<th>Numero de Serie</th>
			<th>Acessorios</th>
		</tr>

		<c:forEach var="equipamento" items="${equipamentos}">

			<tr>
				<td>${equipamento.id}</td>
				<td>${equipamento.nome}</td>
				<td>${equipamento.marca}</td>
				<td>${equipamento.modelo}</td>
				<td>${equipamento.numeroSerie}</td>
				<td>${equipamento.acessorios}</td>

				<td><a href="/esequip/equipamentos/remover?id=${equipamento.id}">Remover</a></td>
				<td><a href="/esequip/equipamentos/selecionar?id=${equipamento.id}">Alterar</a></td>
				<td><a href="/esequip/ordens/form?id=${equipamento.id}">Ordem de Serviço</a></td>
			</tr>
		</c:forEach>

	</table>



</body>
</html>