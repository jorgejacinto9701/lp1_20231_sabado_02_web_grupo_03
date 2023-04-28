<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<!DOCTYPE html>
<html lang="esS" >
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">

<script type="text/javascript" src="js/jquery.min.js"></script>
<script type="text/javascript" src="js/jquery.dataTables.min.js"></script>
<script type="text/javascript" src="js/dataTables.bootstrap.min.js"></script>
<script type="text/javascript" src="js/bootstrap.min.js"></script>
<script type="text/javascript" src="js/bootstrapValidator.js"></script>
<script type="text/javascript" src="js/global.js"></script>
<link rel="stylesheet" href="css/bootstrap.css"/>
<link rel="stylesheet" href="css/dataTables.bootstrap.min.css"/>
<link rel="stylesheet" href="css/bootstrapValidator.css"/>

<title>Sistemas - Jorge Jacinto Gutarra</title>
</head>
<body>

<jsp:include page="intranetCabecera.jsp" />
<div class="container" style="margin-top: 4%">
<h4>Registra Revista</h4>
<h6>Autor:NICOLL KATHERIN PORTAL CHUQUIMAJO</h6>

<form action="registraRevista" id="id_form"> 
			<input type="hidden" name="metodo" value="registra">	
			<div class="form-group">
				<label class="control-label" for="id_nombre">Nombre</label>
				<input class="form-control" type="text" id="id_nombre" name="nombre" placeholder="Ingrese el nombre de la revista">
			</div>
			<div class="form-group">
				<label class="control-label" for="id_frecu">Frecuencia</label>
				<select class="form-control" id="id_frecu" name="frecuencia" >
						<option value="">[Seleccione]</option>
						<option value="Semanal Todos los lunes">Semanal Todos los lunes</option>
						<option value="Semanal Todos los martes">Semanal Todos los martes</option>
						<option value="Semanal Todos los miercoles">Semanal Todos los miércoles</option>
						<option value="Semanal Todos los jueves">Semanal Todos los jueves</option>
						<option value="Semanal Todos los viernes">Semanal Todos los viernes</option>
						<option value="Semanal Todos los sabado">Semanal Todos los sábado</option>
						<option value="Semanal Todos los domingo">Semanal Todos los domingo</option>
				</select>
			</div>
			<div class="form-group">
				<label class="control-label" for="id_fechaCr">Fecha de Creación</label>
				<input class="form-control" type="date" id="id_fechaCr" name="fechaCr" placeholder="Ingrese la fecha de creación">
			</div>
						<div class="form-group">
				<label class="control-label" for="id_modalidad">Modalidad</label>
				<select class="form-control" id="id_modalidad" name="modalidad" >
						<option value="">[Seleccione]</option>
				</select>
			</div>
			<div class="form-group">
				<button type="submit" class="btn btn-primary" id="id_btn_registra">Crear Revista</button>
			</div>
			
	</form>
</div>

<script type="text/javascript">
$("#success-alert").fadeTo(1000, 500).slideUp(500, function(){
    $("#success-alert").slideUp(500);
});
</script>

<script type="text/javascript">
$(document).ready(function() {
    $('#id_form').bootstrapValidator({
        message: 'Este valor no es válido',
        feedbackIcons: {
            valid: 'glyphicon glyphicon-ok',
            invalid: 'glyphicon glyphicon-remove',
            validating: 'glyphicon glyphicon-refresh'
        },
        
        fields:{
        	nombre : {  
        		selector: "#id_nombre",
        		validators : {
        			notEmpty: {
                        message: 'El nombre de la revista es requerido'
                    },
                    stringLength: {
                        min: 3,
                        max: 30,
                        message: 'El nombre de la revista debe tener de 3 a 30 caracteres'
                    },
        		}
        	},
        	frecuencia : {
        		selector: "#id_frecu",
        		validators : {
        			notEmpty: {
                        message: 'La frecuencia es requerida'
                    },
        		}
        	},
        	fechaC : {
        		selector: "#id_fechaCr",
        		validators : {
        			notEmpty: {
                        message: 'La fecha de creación es requerido'
                    }
        		}
        	},
        	modalidad : {
        		selector: "#id_modalidad",
        		validators : {
        			notEmpty: {
                        message: 'La modalidad es requerida'
                    }
        		}
        	}, 
        }
  
    });

    // Validate the form manually
    $('#validateBtn').click(function() {
        $('#id_form').bootstrapValidator('validate');
    });
});
</script>

<script type="text/javascript">
	$("#id_btn_registra").click(function(){
		var validator = $('#id_form').data('bootstrapValidator');
	    validator.validate();
		
	    if (validator.isValid()) {
	        $.ajax({
	          type: "POST",
	          url: "registraRevista", 
	          data: $('#id_form').serialize(),
	          success: function(data){
	        	  mostrarMensaje(data.mensaje);
	        	  limpiarFormulario();
	        	  validator.resetForm();
	          },
	          error: function(){
	        	  mostrarMensaje(MSG_ERROR);
	          }
	        });
	        
	    }
	});

	$.getJSON("cargaModalidad", {}, function (data){
		$.each(data, function(index, item){
			$("#id_modalidad").append("<option value=" +  item.idModalidad +" >" +  item.descripcion + "</option>");
		});	
	});		

	
	function limpiarFormulario(){	
		$('#id_nombre').val('');
		$('#id_frecu').val('');
		$('#id_fechaCr').val('');
		$('#id_modalidad').val('');
	}
</script>
</body>
</html>



