<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
 <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="icon" href="favicon.ico">
    <link href="css/bootstrap.min.css" rel="stylesheet" >
    <link href="css/estilo1.css" rel="stylesheet" type="text/css">
    <link href="css/bootstrap-theme.min.css" rel="stylesheet">
    <link rel="stylesheet" href="css/reset.css"> 
	<link rel="stylesheet" href="css/style.css"> 
	<link rel="stylesheet" href="css/footer-distributed-with-address-and-phones.css">
	<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css">
	<script src="js/modernizr.js"></script>
	<script src="//ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>CC-Alta cliente</title>
</head>
<body>
<form:form  modelAttribute="Persona" method="POST" action="agregarPersona" role="form" id="form" accept-charset="utf-8">
	<form:input path="cod" type="hidden" class="form-control" id="cod" />
	<form:label path="nombre">Nombre:</form:label>
	<form:input path="nombre"/>
	<form:label path="apellido">Apellido:</form:label>
	<form:input path="apellido"/>
	<form:label path="email">E-mail:</form:label>
	<form:input path="email"/>
	<form:label path="pass">Contraseña:</form:label>
	<form:input path="pass"/>
	<input type="submit" value="Dar alta"/>
	</form:form>
	
	<table id="#table" class="table table-striped table-curved table-bordered table-hover">
                <thead>
                    <tr>
                        <th class="col-md-1">#</th>
                        <th class="col-md-3">Nombre</th>
                        <th class="col-md-3">Apellido</th>
                        <th class="col-md-3">E-mail</th>
                        <th class="col-md-2">Contraseña</th>
                    </tr>
                </thead>
                <tbody>
                <c:forEach items="${Listado}" var="Persona">
                
                    <tr>
                        <td><c:out value="${Persona.cod}"/></td>
                        <td><c:out value="${Persona.nombre}"/></td>
                        <td><c:out value="${Persona.apellido}"/></td>
                        <td><c:out value="${Persona.email}"></c:out>
                        <td><c:out value="${Persona.pass}"></c:out>
                    </tr>
                  
                </c:forEach>
                 </tbody>
            </table>
	
	
</body>
</html>