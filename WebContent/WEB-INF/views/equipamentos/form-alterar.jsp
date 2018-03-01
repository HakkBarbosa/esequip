<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
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
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Alterar equipamento</title>
</head>
<body>
<%-- 	<c:import url="cabecalho.jsp"></c:import> --%>
	<c:import url="../menu.jsp"></c:import>
	<h1>Alterando Equipamento</h1>
	<form action="/esequip/equipamentos/alterar" method="post">
		<div>
			<input type="hidden" name="cliente.id" value="${equipamento.cliente.id }" />
		</div>
		<div>
			<label>ID: </label> <input type="text" name="id"
				value="${equipamento.id}" readonly="readonly" />
		</div>

		<div>
			<label>Nome:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </label> <input type="text" name="nome"
				value="${equipamento.nome}" />
		</div>

		<div>
			<label>Marca:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </label> <input type="text" name="marca"
				value="${equipamento.marca}" />
		</div>

		<div>
			<label>Modelo:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </label> <input type="text" name="modelo"
				value="${equipamento.modelo}" />
		</div>

		<div>
			<label>N° de Série: </label> <input type="text"
				name="numeroSerie" value="${equipamento.numeroSerie}" />
		</div>

		<div>
			<label>Acessórios: </label> <input type="text" name="acessorios"
				value="${equipamento.acessorios}" />
		</div>

		<div>
			<button type="submit">Alterar</button>
		</div>

	</form>
</body>
</html>