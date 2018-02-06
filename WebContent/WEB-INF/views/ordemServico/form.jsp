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
<form action="/esequip/ordemServico" method="post">
	
		<div>	
			<input type="hidden" name="equipamento.id" value="${ordemServico.equipamento.id}" />
		</div>
		
		<div>
			<input type="hidden" name="cliente.id" value="${ordemServico.cliente.id}" />
		</div>
		
		<div>
			<label>ID Cliente: ${cliente.id} </label> <br>
			<label>Nome do Cliente: ${cliente.nome} </label>
		</div> 
		
		<br>
		
		<div>
			<label>ID Equipamento: ${equipamento.id} </label> <br>
			<label>Nome do Equipamento: ${equipamento.nome} </label>
		</div>
		
		<br>
		
		<div>
			<label>Problema: </label>
			<input type="text" name="problema" />
		</div>
		
		<div>
			<label>Data de Solicitação: </label>
			<input type="text" name="dataSolicitacao" />
		</div>
	
		<div>
			<label>Data de Finalização: </label>
			<input type="text" name="dataFinalizacao" />
		</div>
</form>
</body>
</html>