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
<h1>Adicionando Ordem de Serviço</h1>
<form action="/esequip/ordens" method="post">
		<div>
			<label>ID Equipamento: ${equipamento.id} </label>
			<select name="equipamento.id">
				<c:forEach var="equipamento" items="${equipamentos}">
				<option value="${equipamento.id}">${equipamento.id}</option>
				</c:forEach>
			</select>
		</div>
		
		<div>
			<label>Nome do Equipamento: ${equipamento.nome} </label>
			<select name="equipamento.id">
				<c:forEach var="equipamento" items="${equipamentos}">
				<option value="${equipamento.id}">${equipamento.nome}</option>
				</c:forEach>
			</select>
		</div>
		
		<div>
			<label>ID Cliente: ${cliente.id} </label>
			<select name="cliente.id">
				<c:forEach var="cliente" items="${clientes}">
				<option value="${cliente.id}">${cliente.id}</option>
				</c:forEach>
			</select>
		</div>
		
		<div>
			<label>Nome do Cliente: ${cliente.nome} </label>
			<select name="cliente.id">
				<c:forEach var="cliente" items="${clientes}">
				<option value="${cliente.id}">${cliente.nome}</option>
				</c:forEach>
			</select>
		</div>
		
		<div>
			<label>Problema: </label>
			<input type="text" name="problema" />
		</div>
		
		<div>
			<label>Data de Solicitação: </label>
			<input type="text" name="dataSolicitacao" />
		</div>
		
		<div>
			<button type="submit">Adicionar</button>
		</div>
</form>
</body>
</html>