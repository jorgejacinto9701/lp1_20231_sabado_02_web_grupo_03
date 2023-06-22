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

<title>Consulta Autor</title>
</head>
<body>

<jsp:include page="intranetCabecera.jsp" />
<div class="container" style="margin-top: 4%">
<h1>Consulta Autor - Renato Rodriguez G3</h1>
<div class="row" style="margin-top: 5%">
				<div class="col-md-4">
				 	<label class="col-lg-3 control-label" for="id_nombre">Nombre</label>
				</div>
				<div class="col-md-5">
					<input class="form-control" id="id_nombre" type="text" />
				</div>
		</div>
		<div class="row" style="margin-top: 1%">
				<div class="col-md-4">
		            <label class="col-lg-3 control-label" for="id_grado">Grado</label>
				</div>
				<div class="col-md-5">
					<select class="form-control" id="id_grado">
						<option value="-1">[Seleccione]</option>
					</select>
				</div>
		</div>
		<div class="row" style="margin-top: 1%">
				<div class="col-md-4">
					<label class="control-label" for="id_estado">Estado</label>
				</div>
				<div class="col-md-5">
					<input type="checkbox" class="custom-control-input" id="id_estado" checked="checked" />
				</div>
		</div>
		<div class="row" style="margin-top: 1%">
			<div class="col-md-3">
				<label class="control-label" for="id_filtro">Fecha Nacimiento</label> 
			</div>	
			<div class="col-md-1"></div>
			
			<div class="col-md-2">
				<input	class="form-control" type="date" id="id_fecha_inicio">
				
			</div>
			<div class="col-md-1"></div>	
			<div class="col-md-2">
				<input	class="form-control" type="date" id="id_fecha_fin">
				
			</div>
			<div class="col-md-1"></div>
			<div class="col-md-2">
				<button type="button" class="btn btn-primary" id="id_btn_filtro">Filtro</button>
				
			</div>	
		</div>
		<div class="row" style="margin-top: 4%">
			<table id="id_table" class="table table-bordered table-hover table-condensed" >
				<thead style='background-color:#337ab7; color:white'>
					<tr>
						<th>Código</th>
						<th>Nombres</th>
						<th>Apellidos</th>
						<th>Fecha Nacimiento</th>
						<th>Fecha Registro</th>
						<th>Telefono</th>
						<th>Estado</th>
						<th>Grado</th>
						<th></th>
					</tr>
				</thead>
				<tbody>
				</tbody>
			</table>
</div>

<!-- INICIO MODAL DE DETALLE-->
		<div class="modal fade" id="id_div_modal_ver" >
			<div class="modal-dialog" style="width: 60%">
					<div class="modal-content">
					<div class="modal-header" >
						<button type="button" class="close" data-dismiss="modal">&times;</button>
						<h4><span class="glyphicon glyphicon-ok-sign"></span> Datos de Autor</h4>
					</div>
					
					<div class="modal-body" >
						 <div class="panel-group" id="steps">
			                   <div class="panel panel-default">
			                   		<div id="stepOne" class="panel-collapse collapse in">
			                   			<form id="id_form_actualiza">
			                   			<input type="hidden" name="metodo" value="actualiza">
			                   			<input type="hidden" name="idAutor" id="idAutor" >
			                   			<div class="panel-body">
			                                <div class="form-group" >
		                                        <label class="col-lg-3 control-label" for="id_act_nombre">Nombres</label>
		                                        
		                                        <div class="col-lg-8">
													<input class="form-control" id="id_act_nombre" name="nombres" placeholder="Ingrese el Nombre" type="text" maxlength="100" readonly="readonly"/>
		                                        </div>
		                                    </div> 	
										<div class="form-group" >
		                                        <label class="col-lg-3 control-label" for="id_act_apellido">Apellidos</label>
		                                        <div class="col-lg-8">
													<input class="form-control" id="id_act_apellido" name="apellidos" placeholder="Ingrese el Apellido" type="text" maxlength="100" readonly="readonly"/>
		                                        </div>
		                                    </div> 	
		                                    	<div class="form-group" >
		                                    	
		                                        <label class="col-lg-3 control-label" for="id_act_fechaNacimiento">Fecha Nacimiento</label>
		                                        <div class="col-lg-8">
		                                        
													<input class="form-control" id="id_act_fechaNacimiento" name="fechaNacimiento" placeholder="Ingrese la fecha de nacimiento" type="date" readonly="readonly" />
		                                        </div>
		                                    </div> 
											<div class="form-group">
											
		                                        <label class="col-lg-3 control-label" for="id_act_telefono">telefono</label>
		                                        
		                                        <div class="col-lg-8">
		                                        
													<input class="form-control" id="id_act_telefono" name="telefono" placeholder="Ingrese el telefono" type="number" maxlength="9" readonly="readonly"/>
		                                        </div>
		                                    </div> 	
		                                    <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_act_estado">Estado</label>
		                                        <div class="col-lg-8">
													<select class="form-control" id="id_act_estado" 	name="estado"	 disabled="disabled">
														<option value=" ">[Seleccione]</option>
														<option value="1">Activo</option>
														<option value="0">Inactivo</option>
													</select>
		                                        </div>
		                                    </div> 	 
			                                <div class="form-group">
			                                
		                                        <label class="col-lg-3 control-label" for="id_act_grado">Grado</label>
		                                        
		                                        <div class="col-lg-8">
		                                        
													<select class="form-control" id="id_act_grado" 		name="grado" 	disabled="disabled">
														<option value=" ">[Seleccione]</option>
													</select>
		                                        </div>
		                                    </div>
		                                     	 
		                                    <div class="form-group">
		                                        <div class="col-lg-12" align="center">
		                                        
		                                        <button type="button" style="width: 80px" id="id_btn_salir" class="btn btn-primary btn-sm" data-dismiss="modal">Salir</button>
												</div>
		                                    </div>   
			                             </div>
			                             </form>
			                        </div>
			                   </div>
			              </div>
			              
					</div>
				</div>
			</div>
		</div>	
		<!-- FIN MODAL DE DETALLE -->






	
</div>
	<script type="text/javascript">
	$.getJSON("cargaGrado", {}, function (data){
		$.each(data, function(index, item){
			
			$("#id_grado").append("<option value=" +  item.idGrado +" >" +  item.descripcion+ "</option>");
			
			$("#id_act_grado").append("<option value=" +  item.idGrado +" >" +  item.descripcion+ "</option>");
		});	
	});
	

	$("#id_btn_filtro").click(function() {
		var vnombre = $("#id_nombre").val();
		var vgrado = $("#id_grado").val();
		var vestado = $("#id_estado").is(":checked") ?  1 : 0;
		var vfecIni = $("#id_fecha_inicio").val();
		var vfecFin = $("#id_fecha_fin").val();
		
		
		console.log(">> vnombre >> " + vnombre);
		console.log(">> vgrado >> " + vgrado);
		console.log(">> vestado >> " + vestado);
		console.log(">> vfecIni >> " + vfecIni);
		console.log(">> vfecFin >> " + vfecFin);
		
		$.getJSON("consultaAutor", {"nombre":vnombre,"grado":vgrado, "estado": vestado, "fechaInicio":vfecIni, "fechaFin":vfecFin}, function(data) {
			agregarGrilla(data);
		});
	});
	
	
	function agregarGrilla(lista){
		 $('#id_table').DataTable().clear();
		 $('#id_table').DataTable().destroy();
		 $('#id_table').DataTable({
				data: lista,
				language: IDIOMA,
				searching: true,
				ordering: true,
				processing: true,
				pageLength: 12,
				lengthChange: false,
				info:true,
				scrollY: 305,
		        scroller: {
		            loadingIndicator: true
		        },
				columns:[
					{data: "idAutor",className:'text-center'},
					{data: "nombres",className:'text-center'},
					{data: "apellidos",className:'text-center'},
					{data: "formateadoFecNac",className:'text-center'},
					{data: "fechaRegistro",className:'text-center'},
					{data: "telefono",className:'text-center'},
					{data: function(row, type, val, meta){
						return row.estado == 1 ? "Activo" : "Inactivo";  
					},className:'text-center'},
					{data: "grado.descripcion",className:'text-center'},
					{data: function(row, type, val, meta){
						return '<button type="button" class="btn btn-info btn-sm" onClick="verFormulario(\'' + row.nombres + '\',\'' + row.apellidos + '\',\'' +  row.formateadoFecNac + '\',\'' + row.telefono + '\',\'' +  row.estado + '\',\'' +  row.grado.idGrado +'\');">Ver</button>';  
					},className:'text-center'},
					
					]                                     
		    });
	}
	
	function verFormulario(nombres,apellidos,fechaNacimiento, telefono ,estado , grado){
		
		
		
		
		
		console.log(">>> verFormulario ");
		$("#id_div_modal_ver").modal("show");
		$("#id_act_nombre").val(nombres);
		$("#id_act_fechaNacimiento").val(fechaNacimiento);
		$("#id_act_apellido").val(apellidos);
		$("#id_act_grado").val(grado);
		$("#id_act_estado").val(estado);
		$("#id_act_telefono").val(telefono);
	}
	
	
		</script>

</body>
</html>



