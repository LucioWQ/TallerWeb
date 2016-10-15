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
    <link href="css/bootstrap.min.css" rel="stylesheet" >
    <link href="css/estilo1.css" rel="stylesheet" type="text/css">
    <link href="css/bootstrap-theme.min.css" rel="stylesheet">
	<link rel="stylesheet" href="css/estiloparatablas.css">
	<link rel="stylesheet" href="css/footer-distributed-with-address-and-phones.css">
	<script src="js/modernizr.js"></script>
	<script src="js/jquery-1.11.3.min.js"></script>
	<script src="js/bootstrap.min.js"></script>
	
    <title>Productos</title>
	</head>
	<body>
        <div class="container">
            <h1>Productos</h1>
            
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
                    Producto
                </h4>
            </div>
            
            <!-- Modal Body -->
            <div class="modal-body">
                
                <form:form modelAttribute="Producto" method="POST" action="agregarProducto" role="form" id="form" accept-charset="utf-8" >         
                  <div class="form-group">
                    <label for="descrip" >Descripcion</label>
                      <form:input path="descrip" type="text" class="form-control"
                          id="descrip"  placeholder="Ingresar descrip..." />
                  </div>
                  <div class="form-group">
                    <label for="precio">($) Precio</label>
                      <form:input path="precio" type="text" class="form-control"
                          id="precio" placeholder="Ingresar precio..."/>
                  </div>
      
                  <form:button class="btn btn-default pull-right ">Editar!</form:button>
                  <br>
                  <br>
                </form:form>
                
        
            </div>
        </div>
    </div>
</div>
            
	        <div id="cont">
	            <img src="img/lupa.png" alt="icono de lupa negra inclinada hacia la izquierda" class="mostrar" id="lupa"/>
	            <div class="form-group pull-right target" style="display:none" id="search">
	                    <input type="text"  class="search form-control target" placeholder="Que estas buscando?">
	                </div>
				<span class="counter pull-right"></span>
	            
            
            	<a href='#myModalNorm' data-toggle='modal' data-target='#myModalNorm' class="btn btn-secondary openmodal" role="button" id="nuevo"> + Producto</a>
            </div>
            
            <table class="table table-striped table-curved table-bordered table-hover results">
                <thead>
                    <tr>
                        <th class="col-md-8">Descripción</th>
                        <th class="col-md-1">($) Precio</th>
                        <th class="col-md-2">Opciones</th>
                    </tr>
                </thead>
                <tbody>
                <c:forEach items="${Listado}" var="Producto">
                	<c:if test="${Producto.estado}">
                    <tr>
                        <td><c:out value="${Producto.descrip}"/></td>
                        <td><c:out value="${Producto.precio}"/></td>
                        <td><a href='#myModalNorm' data-toggle='modal' data-descrip="<c:out value="${Producto.descrip}"/>" data-precio=<c:out value="${Producto.precio}"/> data-target='#myModalNorm' class='openmodal'><img src='img/editarnegro.png' alt='Icono de un lapiz de color negro' id='editar'></a><a href="borrarProducto?descrip=<c:out value="${Producto.descrip}"/>"><img src='img/cesto.png' alt='Icono de un cesto de basura negro' id='cesto'></a></td>
                    </tr>
                    </c:if>
                </c:forEach>
                 </tbody>
            </table>
        </div>


	<!-- Carga el modal que se abre al tocar el botón de editar producto -->
	<script>
            $(document).on("click", ".openmodal", function () {
                var cod = $(this).data('cod');
                var descrip = $(this).data('descrip');
                var precio = $(this).data('precio');
                
                $(".modal-body #cod").val( cod );
                $(".modal-body #descrip").val( descrip );
                $(".modal-body #precio").val( precio );
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
        
	</body>
</html>