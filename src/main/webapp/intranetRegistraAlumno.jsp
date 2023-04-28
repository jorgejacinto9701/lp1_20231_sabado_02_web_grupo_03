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

<link rel="stylesheet" href="css/bootstrap.css"/>
<link rel="stylesheet" href="css/dataTables.bootstrap.min.css"/>
<link rel="stylesheet" href="css/bootstrapValidator.css"/>

<title>Sistemas - Jorge Jacinto Gutarra</title>
</head>
<body>

<jsp:include page="intranetCabecera.jsp" />
<div class="container" style="margin-top: 4%">
<h4>Registra Alumno</h4>

		<form action="insertaAlumno" id="id_form"> 
						<input type="hidden" name="metodo" value="registra">	
						<div class="form-group">
								<label class="control-label" for="id_nombre">Nombres</label>
								<input class="form-control" type="text" id="id_nombre" name="nombre" placeholder="Ingrese el nombre">
						</div>
						<div class="form-group">
								<label class="control-label" for="id_apellido">Apellidos</label>
								<input class="form-control" type="text" id="id_apellido" name="apellido" placeholder="Ingrese el apellido">
						</div>
						<div class="form-group">
								<label class="control-label" for="id_fecha">Fecha Nacimiento</label>
								<input class="form-control" type="text" id="id_fecha" name="fecha" placeholder="Ingrese la fecha">
						</div>
						<div class="form-group">
								<label class="control-label" for="id_correo">Correo</label>
								<input class="form-control" type="text" id="id_correo" name="correo" placeholder="Ingrese el correo">
						</div>
						<div class="form-group">
								<button type="submit" class="btn btn-primary" >Crea Alumno</button>
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
        	
        }
  
    });

    // Validate the form manually
    $('#validateBtn').click(function() {
        $('#id_form').bootstrapValidator('validate');
    });
});
</script>

</body>
</html>



