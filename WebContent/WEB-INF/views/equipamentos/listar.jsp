<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<style>
	table {
    border-collapse: collapse;
    width: 95%;
}

th, td {
    text-align: left;
    padding: 8px;
}

tr:nth-child(even){background-color: #f2f2f2}

th {
    background-color: orange;
    color: white;
}
</style>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
</head>
<body>
<c:import url="../menu.jsp"></c:import>
	<h1>Listagem de Equipamentos</h1>
	
	<form action="/esequip/equipamentos/form">
		<input type="hidden" name="id" value="${cliente.id}">
		<button type="submit">Novo Equipamento</button>
	</form>
	
	
	<br> ID do cliente: ${cliente.id}
	<br> Nome do cliente: ${cliente.nome}
	
	<table border="1">
		<tr>
			<th>ID:</th>
			<th>Nome:</th>
			<th>Marca:</th>
			<th>Modelo:</th>
			<th>Número de Série:</th>
			<th>Acessórios:</th>
			<th>Remover:</th>
			<th>Adicionar:</th>
			<th>Adicionar Ordem de Serviço:</th>
		</tr>	
	
	<c:forEach var="e" items="${equipamentos}">
	
		<tr>
			<td>${e.id}</td>
			<td>${e.nome}</td>
			<td>${e.marca}</td>
			<td>${e.modelo}</td>
			<td>${e.numeroSerie}</td>
			<td>${e.acessorios}</td>
			
			
			<td><center><a href="/esequip/equipamentos/remover?id=${e.id}"><i class="glyphicon glyphicon-remove" style="font-size:15px;color:black;"></i></a></center></td>
			<!--  <td><a href="/esequip/equipamentos/remover?id=${e.id}"><i class="glyphicon glyphicon-remove" style="font-size:15px;color:black;"></i></a></center></td></a></td>
			--> <!--  <td><a href="/esequip/equipamentos/selecionar?id=${e.id}">Alterar</a></td>
			--> <td><center><a href="/esequip/equipamentos/form?id=${e.id}"><i class="material-icons" style="font-size:17px;color:black;">computer</i></a></center></td>
			
			<td><center><a href="/esequip/ordens/form?id=${cliente.id}"><i class="material-icons" style="font-size:17px;color:black;">computer</i></a></center></td>
			
			<!--  <td><a href="/esequip/ordens/form?id=${cliente.id}">Ordem de Serviço</a></td> -->
		</tr>
	
	</c:forEach>
	
	
	</table>
</body>
</html>