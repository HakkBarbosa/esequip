<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Lista de Clientes</title>
<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<style>
table {
    border-collapse: collapse;
    width:95%;
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
</head>
<body>
<c:import url="../menu.jsp"></c:import>
	<h1>Lista de Clientes</h1>
	
	<table border="1"  align="center">
		<tr>
			<th>ID</th>
			<th>Nome</th>
			<th>CPF</th>
			<th>Endereço</th>
			<th>Telefone</th>
			<th>Remover</th>
			<th>Alterar</th>
			<th>Cadastrar Equipamento</th>
			<th>Listar Equipamento</th>
		</tr>	
			
		<c:forEach var="cliente" items="${clientes}">
		
		<tr>
			<td>${cliente.id}</td>
			<td>${cliente.nome}</td>
			<td>${cliente.cpf}</td>
			<td>${cliente.endereco}</td>
			<td>${cliente.telefone}</td>
			<td><center><a href="/esequip/clientes/remover?id=${cliente.id}"><i class="glyphicon glyphicon-remove" style="font-size:15px;color:black;"></i></a></center></td>
			<td><center><a href="/esequip/clientes/selecionar?id=${cliente.id}"><i class="glyphicon glyphicon-user" style="font-size:15px;color:black;"></i></a></center></td>
			<td><center><a href="/esequip/equipamentos/form?id=${cliente.id}"><i class="material-icons" style="font-size:17px;color:black;">computer</i></a></center></td>
			<td><center><a href="/esequip/equipamentos?id=${cliente.id}"><i class="glyphicon glyphicon-cloud"style="font-size:15px;color:black;"></i></a></center></td>
		</tr>
		
		</c:forEach>	
	
	</table>

</body>
</html>