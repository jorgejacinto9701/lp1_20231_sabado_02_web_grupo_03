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
<h4>Registra Autor</h4>
<form action="registraAlumno" id="id_form"> 
			<input type="hidden" name="metodo" value="registra">	
			<div class="form-group">
				<label class="control-label" for="id_nombre">Nombres</label>
				<input class="form-control" type="text" id="id_nombre" name="nombre" placeholder="Ingrese el nombre">
			</div>
			<div class="form-group">
				<label class="control-label" for="id_apellidos">Apellidos</label>
				<input class="form-control" type="text" id="id_apellidos" name="apellidos" placeholder="Ingrese el apellido" maxlength="8">
			</div>
			<div class="form-group">
				<label class="control-label" for="id_fecha">Fecha Nacimiento</label>
				<input class="form-control" type="date" id="id_fecha" name="fecha" placeholder="Ingrese la fecha">
			</div>
			<div class="form-group">
				<label class="control-label" for="id_telefono">Telefono</label>
				<input class="form-control" type="text" id="id_telefono" name="telefono" placeholder="Ingrese el telefono" maxlength="8">
			</div>
			<div class="form-group">
				<label class="control-label" for="id_Grado"> Grado </label> <select
					class="form-control" id="id_grado" name=grado>
					<option value=" ">[Seleccione]</option>
				</select>
			</div>
			<div class="form-group">
				<button type="button" class="btn btn-primary" id="id_btn_registra">Crea Autor</button>
			</div>
	</form>
</div>
<div>
</div>



<script type="text/javascript	">
$(document).ready(function() {
    $('#id_form').bootstrapValidator({
        message: 'This value is not valid',
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
                        message: 'El nombre es requerido'
                    },
                    stringLength: {
                        min: 3,
                        max: 30,
                        message: 'El nombre tiene de 3 a 30 caracteres'
                    },
        		}
        	},
        	apellidos : {
        		selector: "#id_apellidos",
        		validators : {
        			notEmpty: {
                        message: 'El apellido es requerido'
                    },
                    stringLength: {
                        min: 3,
                        max: 30,
                        message: 'El apellido tiene de 3 a 30 caracteres'
                    },
        		}
        	},
        	fecha : {
        		selector: "#id_fecha",
        		validators : {
        			notEmpty: {
                        message: 'La fecha de nacimiento es requerido'
                    }
        		}
        	},
        	
        	telefono : {
        		selector: "#id_telefono",
        		validators : {
        			notEmpty: {
                        message: 'El telefono es requerido'
                    },
                    stringLength: {
                        min: 3,
                        max: 30,
                        message: 'El numero de telefono tiene de 2 a 9 caracteres'
                    },
        		}
        	},
        	grado : {
        		selector: "#id_grado",
        		validators : {
        			notEmpty: {
                        message: 'El grado es requerido'
                    },
        		}
        	},        	
        }
  
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
	          url: "registraAutor", 
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

	$.getJSON("cargaGrado", {}, function (data){
		$.each(data, function(index, item){
			$("#id_grado").append("<option value=" +  item.idGrado +" >" +  item.descripcion + "</option>");
		});	
	});		

	
	function limpiarFormulario(){	
		$('#id_nombres').val('');
		$('#id_apellidos').val('');
		$('#id_fecha').val(' ');
		$('#id_telefono').val(' ');
		$('#id_grado').val(' ');
		
	}
</script>


	

</body>
</html>



