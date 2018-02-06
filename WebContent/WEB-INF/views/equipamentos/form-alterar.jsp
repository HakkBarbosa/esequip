<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Alterar equipamento</title>
</head>
<body>
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
			<label>Nome: </label> <input type="text" name="nome"
				value="${equipamento.nome}" />
		</div>

		<div>
			<label>Marca: </label> <input type="text" name="marca"
				value="${equipamento.marca}" />
		</div>

		<div>
			<label>Modelo: </label> <input type="text" name="modelo"
				value="${equipamento.modelo}" />
		</div>

		<div>
			<label>N�mero de S�rie: </label> <input type="text"
				name="numeroSerie" value="${equipamento.numeroSerie}" />
		</div>

		<div>
			<label>Acess�rios: </label> <input type="text" name="acessorios"
				value="${equipamento.acessorios}" />
		</div>

		<div>
			<button type="submit">Alterar</button>
		</div>

	</form>
</body>
</html>