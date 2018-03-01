<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<style>
ul {
    list-style-type: none;
    margin: 0;
    padding: 0;
    overflow: hidden;
    background-color: #333;
}

li {
    float: left;
}

li a {
    display: block;
    color: white;
    text-align: center;
    padding: 14px 16px;
    text-decoration: none;
}

li a:hover:not(.active) {
    background-color: #111;
}

.active {
    background-color: orange;
}
body {
	border: 2px solid orange;
    background: url(WebContent/img/foto.jpg);
    background-size: 100px 80px;
    background-repeat: no-repeat;
    padding:15px;
}
}
</style>
</head>
<body>
<c:import url="cabecalho.jsp" />
<br>
<ul>
  <li><a class="active" href="/esequip/"> Inicio</a></li>
  <li><a href="/esequip/clientes/form">Novo Cliente</a></li>
  <li><a href="/esequip/clientes">Listar Clientes</a></li>
  <li><a href="/esequip/ordens">Listar Ordem de Serviço</a></li>
</ul>

</body>
</html>
