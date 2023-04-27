<!DOCTYPE html>
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

<title>Registra Proveedor</title>
</head>
<body>


<div class="container">
<h1>Registra Proveedor</h1>

	<form id="id_form"> 
			<input type="hidden" name="metodo" value="registra">
			<div class="form-group">
				<label class="control-label" for="id_razonsocial">Razón Social</label>
				<input class="form-control" type="text" id="id_razonsocial" name="razonsocial" placeholder="Ingrese la Razon Social">
			</div>	
			<div class="form-group">
				<label class="control-label" for="id_ruc">RUC</label>
				<input class="form-control" type="text" id="id_ruc" name="ruc" placeholder="Ingrese el ruc" maxlength="11">
			</div>			
			<div class="form-group">
				<label class="control-label" for="id_dirección">Dirección</label>
				<input class="form-control" type="text" id="id_direccion" name="direccion" placeholder="Ingrese su Dirección">
			</div>	
			<div class="form-group">
				<label class="control-label" for="id_celular">Celular</label>
				<input class="form-control" type="text" id="id_celular" name="celular" placeholder="Ingrese su número de Celular" maxlength="9">
			</div>	
		<div class="form-group">
				<label class="control-label" for="id_contacto">Contacto</label>
				<input class="form-control" type="text" id="id_contacto" name="contacto" placeholder="Ingrese nombre de Contacto">
			</div>	
				<div class="form-group">
				<label class="control-label" for="id_estado">Estado</label>
				<input class="form-control" type="text" id="id_estado" name="estado" placeholder="Ingrese Estado" maxlength="1">
			</div>		
			<div class="form-group">
				<label class="control-label" for="id_Pais"> Pais </label> <select
					class="form-control" id="id_pais" name="pais">
					<option value=" ">[Seleccione]</option>
				</select>
			</div>
			<div class="form-group">
				<button type="button" class="btn btn-primary" id="id_btn_registra">Crea Proveedor</button>
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
        	razonsocial : {
        		selector: "#id_razonsocial",
        		validators : {
        			notEmpty: {
        				message: "La razon social es requerida"
        			},
        			stringLength: {
        				min: 5,
        				max: 30,
        				message: 'La razon social debe tener entre 5 a 30 caracteres'
        			},
        		}
        	},
       
        	ruc : {
        		selector: "#id_ruc",
        		validators : {
        			notEmpty: {
                        message: 'El ruc es requerido'
                    },
                    regexp: {
                        regexp: /^[0-9]{11}$/,
                        message: 'El dni tiene 11 dígitos'
                    },
        		}
        	},
        	
        	direccion: {
        		selector: "#id_direccion",
        		validators : {
        			notEmpty: {
        				message: "La direccion es requerida"
        			},
        			stringLength: {
        				min: 5,
        				max: 30,
        				message: 'La direccion debe tener entre 5 a 30 caracteres'
        			},
        		}
        	},
       
        	celular : {
        		selector: "#id_celular",
        		validators : {
        			notEmpty: {
                        message: 'El celular es requerido'
                    },
                    regexp: {
                        regexp: /^[0-9]{9}$/,
                        message: 'El dni tiene 9 dígitos'
                    },
        		}
        	},
        	contacto: {
        		selector: "#id_contacto",
        		validators : {
        			notEmpty: {
        				message: "El contacto es requerido"
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
        		selector: "#id_pais",
        		validators : {
        			notEmpty: {
                        message: 'El pais es requerido'
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
	          url: "registraProveedor", 
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

	$.getJSON("cargaPais", {}, function (data){
		$.each(data, function(index, item){
			$("#id_pais").append("<option value=" +  item.idPais +" >" +  item.iso + item.nombre + "</option>");
		});	
	});		

	
	function limpiarFormulario(){	
		$('#id_razonsocial').val('');
		$('#id_ruc').val('');
		$('#id_direccion').val(' ');
		$('#id_celular').val(' ');
		$('#id_contacto').val(' ');
		$('#id_pais').val(' ');
	}
</script>
	
</body>
</html>




