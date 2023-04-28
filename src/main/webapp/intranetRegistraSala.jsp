<<!DOCTYPE html>
<html lang="esS" >
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
<script type="text/javascript" src="js/jquery.min.js"></script>
<script type="text/javascript" src="js/bootstrap.min.js"></script>
<script type="text/javascript" src="js/bootstrapValidator.js"></script>
<script type="text/javascript" src="js/global.js"></script>
<link rel="stylesheet" href="css/bootstrap.css"/>
<link rel="stylesheet" href="css/dataTables.bootstrap.min.css"/>
<link rel="stylesheet" href="css/bootstrapValidator.css"/>

<title>Registra sala</title> 


</head>
<body>



<div class="container">
<h1>Registra  salas</h1>  <h3>Autor: Miguel Rivera</h3>

	<form id="id_form"> 
			<input type="hidden" name="metodo" value="registra">
			<div class="form-group">
				<label class="control-label" for="id_razonsocial">Numero</label>
				<input class="form-control" type="number" id="id_numero" name="numero" placeholder="ingrese nuemro">
			</div>	
			<div class="form-group">
				<label class="control-label" for="id_piso">Piso</label>
				<input class="form-control" type="number" id="id_piso" name="piso" placeholder="piso" maxlength="11">
			</div>			
			<div class="form-group">
				<label class="control-label" for="id_numueroAlumnos">Alumnos</label>
				<input class="form-control" type="number" id="id_NumeroAlumnos" name="Alumnos" placeholder="Ingrese alumno">
			</div>	
			<div class="form-group">
				<label class="control-label" for="id_celular">Recursos</label>
				<input class="form-control" type="text" id="id_Recursos" name="Recusos" placeholder="Ingrese su recursos" maxlength="9">
			</div>	
		   <div class="form-group">
				<label class="control-label" for="id_fecha">Fecha Registro</label>
				<input class="form-control" type="date" id="id_fecha" name="fecha" placeholder="Ingrese la fecha">
			</div>	
				<div class="form-group">
				<label class="control-label" for="id_estado">Estado</label>
				<input class="form-control" type="text" id="id_estado" name="estado" placeholder="Ingrese Estado" maxlength="1">
			</div>		
			<div class="form-group">
				<label class="control-label" for="id_sede">Sede </label> <select
					class="form-control" id="id_sede" name="Sede">
					<option value=" ">[Seleccione]</option>
				</select>
			</div>
			<div class="form-group">
				<button type="button" class="btn btn-primary" id="id_btn_registra">Crea Sala</button>
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
        message: 'This value is not valid',
        feedbackIcons: {
            valid: 'glyphicon glyphicon-ok',
            invalid: 'glyphicon glyphicon-remove',
            validating: 'glyphicon glyphicon-refresh'
        },
        
        fields:{
        	numero : {
        		selector: "#id_numero",
        		validators : {
        			notEmpty: {
        				message: "El nuemro  es requerida"
        			},
        			stringLength: {
        				min: 1,
        				max: 20,
        				message: ' numero minimos es  1 a 20 caracteres'
        			},
        		}
        	},
       
        	piso : {
        		selector: "#id_piso",
        		validators : {
        			notEmpty: {
                        message: 'El piso es requerido'
                    },
                    stringLength: {
        				min: 1,
        				max: 10,
        				message: ' numero minimos es  1 a 10 caracteres'
        			},
        		}
        	},
        	
        	direccion: {
        		selector: "#id_fecha",
        		validators : {
        			notEmpty: {
        				message: "La fecha es requerida"
        			},
        			stringLength: {
        				min: 5,
        				max: 30,
        				message: ''
        			},
        		}
        	},
       
        	numeroAlumnos : {
        		selector: "#id_numeroAlumnos",
        		validators : {
        			notEmpty: {
                        message: ' alumnos es requerido'
                    },
                    regexp: {
                        regexp: /^[0-9]{9}$/,
                        message: 'maximos 9 alumnos '
                    },
        		}
        	},
        	recusros: {
        		selector: "#id_recursos",
        		validators : {
        			notEmpty: {
        				message: "El recusrsos es requerido"
        			},
        			stringLength: {
        				min: 3,
        				max: 30,
        				message: 'El nombre tiene entre 3 a 30 caracteres'
        			},
        		}
        	},
        	estado: {
        		selector: "#id_estado",
        		validators : {
        			notEmpty: {
        				message: "El estado es requerido"
        			},
        			regexp: {
                        regexp: /^[0-9]{1}$/,
                        message: 'El estado tiene 1 digito'
                    },
        		}
        	},
        	tipo : {
        		selector: "#id_sede",
        		validators : {
        			notEmpty: {
                        message: 'la sede es requerido'
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
	          url: "registraSala", 
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

	$.getJSON("cargaSede", {}, function (data){
		$.each(data, function(index, item){
			$("#id_sede").append("<option value=" +  item.idsede +" >" +  item.iso + item.nombre + "</option>");
		});	
	});		

	
	function limpiarFormulario(){	
		$('#id_numero').val('');
		$('#id_piso').val('');
		$('#id_numeroAlumnso').val(' ');
		$('#id_recusros').val(' ');
		$('#id_estado').val(' ');
		$('#id_sede').val(' ');
	}
</script>
	
</body>
</html>




