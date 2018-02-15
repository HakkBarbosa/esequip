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
<h2>Adicionar Equipamentos</h2>
<form action="/esequip/equipamentos" method="post">
		<div>
			<label>ID Cliente: ${cliente.id} </label> <br>
			<label>Nome do Cliente: ${cliente.nome} </label>
			<input type="hidden" name="cliente.id" value="${cliente.id}" />
		</div>
		
		<div>
			<label>Nome: </label>
			<input type="text" name="nome" />
		</div>
		
		<div>
			<label>Marca: </label>
			<input type="text" name="marca" />
		</div>
		
		<div>
			<label>Modelo: </label>
			<input type="text" name="modelo" />
		</div>
		
		<div>
			<label>Numero de Serie: </label>
			<input type="text" name="numeroSerie" /> 
		</div>
		
		<div>
			<label>Acessórios: </label>
			<input type="text" name="acessorios" />
		</div>
		
		<div>
			<button type="submit">Adicionar</button>
		</div>
</form>
</body>
</html>