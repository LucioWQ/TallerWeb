<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="icon" href="favicon.ico">
    <link rel="icon" href="favicon.ico">
    <link href="css/bootstrap.min.css" rel="stylesheet" >
    <link href="css/estilo1.css" rel="stylesheet" type="text/css">
    <link href="css/bootstrap-theme.min.css" rel="stylesheet">
	<link rel="stylesheet" href="css/estiloparatablas.css"> 
	<link rel="stylesheet" href="css/footer-distributed-with-address-and-phones.css">
	<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css">
	<script src="js/modernizr.js"></script>

	<script src="js/jquery-1.11.3.min.js"></script>
	 
	<script src="js/bootstrap.min.js"></script>
    <title>Usuarios</title>
	
	</head>
	
	<body>
        
        <div class="container">
            
            <h1>Usuarios</h1>
            <!-- Modal -->
				<div class="modal fade" id="myModalNorm" tabindex="-1" role="dialog" 
				     aria-labelledby="myModalLabel" aria-hidden="true">
				    <div class="modal-dialog">
				        <div class="modal-content">
				            <!-- Modal Header -->
				            <div class="modal-header">
				                <button type="button" class="close" 
				                   data-dismiss="modal">
				                       <span aria-hidden="true">&times;</span>
				                       <span class="sr-only">Close</span>
				                </button>
				                <h4 class="modal-title" id="myModalLabel">
				                    Completar
               					 </h4>
           					 </div>
            
            	<!-- Modal Body -->
            		<div class="modal-body">
                
                		<form:form modelAttribute="Persona" method="POST" action="agregarPersona" role="form" id="form" accept-charset="utf-8" >
                  
		                  <div class="form-group">
		                    <label for="nombre" >Nombre</label>
		                      <form:input path="nombre" type="text" class="form-control"
		                          id="nombre"  placeholder="Ingresar nombre..." />
		                  </div>
		                  <div class="form-group">
		                    <label for="apellido">Apellido</label>
		                      <form:input path="apellido" type="text" class="form-control"
		                          id="apellido" placeholder="Ingresar apellido..."/>
		                  </div>
		                  <div class="form-group">
		                    <label for="email">Email</label>
		                      <form:input path="email" type="text" class="form-control"
		                          id="email" placeholder="Ingresar email..."/>
		                  </div>
		                  <div class="form-group">
		                    <label for="password">Password</label>
		                      <form:input path="password" type="text" class="form-control"
		                          id="password" placeholder="Ingresar password..."/>
		                  </div>
		                  
		                  <form:button class="btn btn-default pull-right">Guardar</form:button>
		                  <br>
		                  <br>
		              	</form:form>
		              	
            </div>
        </div>
    </div>
</div>
            
            <div id="cont">
	            <img src="img/lupa.png" alt="icono de lupa negra inclinada hacia la izquierda" class="mostrar" id="lupa"/>
	            <div style="display:none" class="form-group pull-right target" id="search">
	                    <input type="text" class="search form-control" placeholder="Que estas buscando?">
	                </div>
				<span class="counter pull-right"></span>
	            
            
            	<a href='#myModalNorm' data-toggle='modal' data-target='#myModalNorm' class="btn btn-secondary openmodal" role="button" id="nuevoprod"> + Usuario</a>
            </div>
            
            <table id="#table" data-resizable-column-id="tablaPrueba" class="table table-striped table-curved table-bordered table-hover results acomodar">
                <thead>
                    <tr>
                        <th data-resizable-column-id="apellido" class="col-md-3">Apellido</th>
                        <th data-resizable-column-id="nombre" class="col-md-3">Nombre</th>
                        <th data-resizable-column-id="email" class="col-md-3">Email</th>
                    	<th data-resizable-column-id="pass" class="col-md-1">Contraseña</th>
                    	<th data-resizable-column-id=opciones"" class="col-md-2">Opciones</th>
                    </tr>
                </thead>
                <tbody>
                <c:forEach items="${Listado}" var="Persona">
                	<c:if test="${Persona.estado}">
                    <tr>
                        <td><c:out value="${Persona.apellido}"/></td>
                        <td><c:out value="${Persona.nombre}"/></td>
                        <td><c:out value="${Persona.email}"/></td>
                        <td><c:out value="${Persona.password}"/></td>                        
 						<td><a href='#myModalNorm' data-toggle='modal' data-nombre="<c:out value="${Persona.nombre}"/>" data-apellido="<c:out value="${Persona.apellido}"/>" data-email="<c:out value="${Persona.email}"/>" data-password="<c:out value="${Persona.password}"/>" data-target='#myModalNorm' class='openmodal'><img src='img/editarnegro.png' alt='Icono de un lapiz de color negro' id='editar'></a><a href="borrarPersona?email=<c:out value="${Persona.email}"/>"><img src='img/cesto.png' alt='Icono de un cesto de basura negro' id='cesto'></a></td>               
                    </tr>
                    </c:if>
                </c:forEach>
                 </tbody>
            </table>
        </div>

	<script>
            $(document).on("click", ".openmodal", function () {
                var codPersona = $(this).data('codPersona');
                var apellido = $(this).data('apellido');
                var nombre = $(this).data('nombre');
                var email = $(this).data('email');
                var password = $(this).data('password');
                
                $(".modal-body #codPersona").val( codPersona );
                $(".modal-body #apellido").val( apellido );
                $(".modal-body #nombre").val( nombre );
                $(".modal-body #email").val( email );
                $(".modal-body #password").val( password );
            }); 
     </script>
        
              <!-- Script para el input de buscar -->
		<script>
            $(document).ready(function() {
                  $(".search").keyup(function () {
                    var searchTerm = $(".search").val();
                    var listItem = $('.results tbody').children('tr');
                    var searchSplit = searchTerm.replace(/ /g, "'):containsi('")

                  $.extend($.expr[':'], {'containsi': function(elem, i, match, array){
                        return (elem.textContent || elem.innerText || '').toLowerCase().indexOf((match[3] || "").toLowerCase()) >= 0;
                    }
                  });

                  $(".results tbody tr").not(":containsi('" + searchSplit + "')").each(function(e){
                    $(this).attr('visible','false');
                  });

                  $(".results tbody tr:containsi('" + searchSplit + "')").each(function(e){
                    $(this).attr('visible','true');
                  });
                  
                  var jobCount = $('.results tbody tr[visible="true"]').length;
                    $('.counter').text(jobCount + ' item');

                  if(jobCount == '0') {$('.no-result').show();}
                    else {$('.no-result').hide();}
                          });
                });
        </script>
        
        
        <!-- Script para ordenar la tabla por columna  -->
        <script>
            $(document).ready(function(){ 
                $('th').click(function() {
                    var table = $(this).parents('table').eq(0)
                    var rows = table.find('tr:gt(0)').toArray().sort(comparer($(this).index()))
                    this.asc = !this.asc
                    if (!this.asc) {
                      rows = rows.reverse()
                    }
                    for (var i = 0; i < rows.length; i++) {
                      table.append(rows[i])
                    }
                    setIcon($(this), this.asc);
                  })

                  function comparer(index) {
                    return function(a, b) {
                      var valA = getCellValue(a, index),
                        valB = getCellValue(b, index)
                      return $.isNumeric(valA) && $.isNumeric(valB) ? valA - valB : valA.localeCompare(valB)
                    }
                  }

                  function getCellValue(row, index) {
                    return $(row).children('td').eq(index).html()
                  }

                  function setIcon(element, asc) {
                    $("th").each(function(index) {
                      $(this).removeClass("sorting");
                      $(this).removeClass("asc");
                      $(this).removeClass("desc");
                    });
                    element.addClass("sorting");
                    if (asc) element.addClass("asc");
                    else element.addClass("desc");
                  }
            });
          
        </script>
       <script>
        $(document).ready(function(){
      
    		$(".mostrar").click(function(){
    			
    			$('.target').show(1000);
    		 });
    		$(".ocultar").click(function(){
    			$('.target').hide("linear");
    		});
    	});	
        
        </script>
        
        <script src="http://cdnjs.cloudflare.com/ajax/libs/store.js/1.3.14/store.min.js"></script>
     <!-- <script src="js/jquery.resizableColumns.js"></script> -->
  <script>
    $(function(){
      $("table").resizableColumns({
        store: window.store
      });
    });
  </script>
          
	</body>
</html>