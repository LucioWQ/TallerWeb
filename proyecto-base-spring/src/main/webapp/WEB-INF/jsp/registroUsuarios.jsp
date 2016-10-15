<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<title>Registro</title>
	
    <link href="<%=request.getContextPath()%>/css/bootstrap.min.css" rel="stylesheet">
    <link href="<%=request.getContextPath()%>/css/style.css" rel="stylesheet">
</head>
<body>
	
	<div class="container">
		<div class="page-header text-center">
			<h1>Registro usuarios</h1>
		</div>
		<div class="row">
			<form:form class="form-horizontal col-md-6 col-md-offset-3" method="POST" action="">
   				<div class="form-group">
				    <div class="col-md-5">
				    	<input type="text" class="form-control" id="nombre" placeholder="Nombre"/>
				    </div>
				 </div>
				 <div class="form-group">
				    <div class="col-md-5">
				    	<input type="text" class="form-control" id="apellido" placeholder="Apellido"/>				    
				    </div>
	  			</div>
	  			
	  			<div class="form-group">
				    <div class="col-md-5">
				    	<input type="text" class="form-control" id="email" placeholder="E-mail"/>
				    </div>
	  			</div>
	  			
	  			<div class="form-group">
				    <div class="col-md-5">
				    	<input type="password" class="form-control" id="contrasena" placeholder="Contraseña"/>
				    </div>
				 </div>
				 <div class="form-group">
				    <div class="col-md-5">
				    	<input type="password" class="form-control" id="confirmar" placeholder="Confirmar contraseña"/>
				    </div>
	  			</div>
	  			
	  			<center>
				<div class="form-group">
						<button type="button" class="btn btn-success">Registro</button>
				</div>
				</center>
				
			</form:form>
  		</div>
	</div>
	
	<style>
		#nombre, #apellido, #email, #contrasena, #confirmar {
					margin: 0 auto;
					width: 275px;
		}
		.btn {		
				padding: 6px 110px;
		}
	</style>
	
    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="<%=request.getContextPath()%>/js/bootstrap.min.js"></script>

</body>
</html>