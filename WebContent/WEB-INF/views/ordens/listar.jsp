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
<title>Lista de Ordens de Serviço</title>
</head>
<body>
<c:import url="../menu.jsp"></c:import>
	<h1>Listagem de Ordens</h1>
	
	
	<table border="1"; align="center">
		<tr>
			<th>Nome Cliente</th>
			<th>Nome Equipamento</th>
			<th>ID Ordem</th>
			<th>Problema</th>
			<th>Data de Solicitação</th>
			<th>Data de Finalização</th>
		</tr>	
	
	<c:forEach var="ordem" items="${ordens}">
	
		<tr>
			<td>${ordem.cliente.nome}</td>
			<td>${ordem.equipamento.nome}</td>
			<td>${ordem.id}</td>
			<td>${ordem.problema}</td>
			<td><fmt:formatDate value="${ordem.dataSolicitacao.time}" pattern="dd/MM/yyyy"/></td>
			
			<td>
			<c:if test="${empty ordem.dataFinalizacao }">Não finalizado</c:if>
			<c:if test="${not empty ordem.dataFinalizacao}"><fmt:formatDate value="${ordem.dataFinalizacao.time}" pattern="dd/MM/yyyy"/></c:if>
			</td>
		
			<td><a href="/esequip/ordens/finalizar?id=${ordem.id}">Finalizar</a></td>
		
		</tr>
	
	</c:forEach>
	
	
	</table>
</body>
</html>