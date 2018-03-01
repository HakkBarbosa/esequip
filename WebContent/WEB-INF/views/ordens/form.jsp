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
<title>Ordem de Serviço</title>
</head>
<body>
<c:import url="../menu.jsp"></c:import>
<h1>Adicionando Ordem de Serviço</h1>
<form action="/esequip/ordens" method="post">
		
		
		<div>
			<label>Nome do Cliente: ${cliente.nome} </label>
			<input type="hidden" name="cliente.id" value="${cliente.id }">
		</div>
		
		<div>
			<label>Nome do Equipamento: ${equipamento.nome} </label>
			<select name="equipamento.id">
				<c:forEach var="equipamento" items="${equipamentos}">
					<option value="${equipamento.id}">${equipamento.id} - ${equipamento.nome} - ${equipamento.marca} </option>
				</c:forEach>
			</select>
		</div>
		
		<div>
			<label>Problema:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </label>
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