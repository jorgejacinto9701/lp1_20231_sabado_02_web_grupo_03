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

<title>Sistemas - Nicoll Katherin Portal Chuquimajo</title>
</head>
<title>Consulta Editorial</title>
</head>
<body>


	<div class="container">
		<h1>Consulta Editorial</h1>
		
		<div class="row" style="margin-top: 5%">
				<div class="col-md-4">
					<label class="control-label" for="id_razonSocial">Razón Social</label>
				</div>
				<div class="col-md-5">
					<input	class="form-control" type="text" id="id_razonSocial">
				</div>
		</div>
		<div class="row" style="margin-top: 1%">
				<div class="col-md-4">
					<label class="control-label" for="id_pais">País</label>
				</div>
				<div class="col-md-5">
					<select	class="form-control" id="id_pais">
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
				<label class="control-label" for="id_filtro">Fecha De Creación</label> 
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
						<th>Razón Social</th>
						<th>Dirección</th>
						<th>Ruc</th>
						<th>Fecha De Creación</th>
						<th>Fecha Registro</th>
						<th>Estado</th>
						<th>País</th>
						<th></th>
					</tr>
				</thead>
				<tbody>


				</tbody>
			</table>

		</div>
		
		
		
		//<!-- INICIO MODAL VER -->
			//<div class="modal fade" id="id_div_modal_ver" >
				//<div class="modal-dialog" style="width: 60%">
					<div class="modal-content">
					<div class="modal-header" >
						<button type="button" class="close" data-dismiss="modal">&times;</button>
						<h4><span class="glyphicon glyphicon-ok-sign"></span>DATOS DE EDITORIAL</h4>
					</div>
					<div class="modal-body" >
						 <div class="panel-group" id="steps">
			                   <div class="panel panel-default">
			                   		<div id="stepOne" class="panel-collapse collapse in">
			                   			<form id="id_form_actualiza">
			                   			<input type="hidden" name="metodo" value="actualiza">
			                   			<input type="hidden" name="idRevista" id="idRevista" >
			                   			<div class="panel-body">
			                                <div class="form-group" >
		                                        <label class="col-lg-3 control-label" for="id_act_razonSocial">Razón Social</label>
		                                        <div class="col-lg-8">
													<input class="form-control" id="id_act_razonSocial" type="text" readonly="readonly"/>
		                                        </div>
		                                    </div> 	
			                                <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_act_direccion">Dirección</label>
		                                        <div class="col-lg-8">
												<input class="form-control" id="id_act_direccion" type="text" readonly="readonly"/>
		                                        </div>
		                                    </div> 
		                                     <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_act_ruc">RUC</label>
		                                        <div class="col-lg-8">
												<input class="form-control" id="id_act_ruc" type="text" readonly="readonly"/>
		                                        </div>
		                                    </div> 
		                                    <div class="form-group" >
		                                        <label class="col-lg-3 control-label" for="id_act_fechaCreacion">Fecha de Creación</label>
		                                        <div class="col-lg-8">
													<input class="form-control" id="id_act_fechaCreacion" type="date" readonly="readonly"/>
		                                        </div>
		                                    </div>
		                                    <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_act_estado">Estado</label>
		                                        <div class="col-lg-8">
													<select class="form-control" id="id_act_estado" name="estado" disabled="disabled">
														<option value=" ">[Seleccione]</option>
														<option value="1">Activo</option>
														<option value="0">Inactivo</option>
													</select>
		                                        </div>
		                                    </div> 	 
			                                <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_act_pais">País</label>
		                                        <div class="col-lg-8">
													<select class="form-control" id="id_act_pais" name="pais" disabled="disabled">
														<option value=" ">[Seleccione]</option>
													</select>
		                                        </div>
		                                    </div> 	 
		                                    <div class="form-group"  >
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
		<!-- FIN MODAL VER -->
		
		
	</div>
	


	<script type="text/javascript">
		$.getJSON("cargaPais", {}, function (data){
			$.each(data, function(index, item){
				$("#id_pais").append("<option value=" +  item.idPais +" >" +  item.nombre+ "</option>");
				$("#id_act_pais").append("<option value=" +  item.idPais +" >" +  item.nombre+ "</option>");
			});	
		});	
	
		$("#id_btn_filtro").click(function() {
			var vrazonSocial = $("#id_razonSocial").val();
			var vpais = $("#id_pais").val();
			var vestado = $("#id_estado").is(":checked") ?  1 : 0;
			var vfecIni = $("#id_fecha_inicio").val();
			var vfecFin = $("#id_fecha_fin").val();
			
			console.log(">> vrazonSocial >> " + vrazonSocial);
			console.log(">> vpais >> " + vpais);
			console.log(">> vestado >> " + vestado);
			console.log(">> vfecIni >> " + vfecIni);
			console.log(">> vfecFin >> " + vfecFin);
			
			$.getJSON("listaEditorialComplejo", {"razonSocial":vrazonSocial,"pais":vpais, "estado":vestado, "fechaInicio":vfecIni, "fechaFin":vfecFin}, function(data) {
				agregarGrilla(data);
			});
		});
		
		function verFormulario(razonSocial, direccion,ruc, fechaCreacion, estado, pais){
			console.log(">> verFormulario >> ");
			$("#id_div_modal_ver").modal("show");
			$("#id_act_razonSocial").val(razonSocial);
			$("#id_act_direccion").val(direccion);
			$("#id_act_ruc").val(ruc);
			$("#id_act_fechaCreacion").val(fechaCreacion);
			$("#id_act_estado").val(estado);
			$("#id_act_pais").val(pais);
		}
		
		
		
		function agregarGrilla(lista){
			 $('#id_table').DataTable().clear();
			 $('#id_table').DataTable().destroy();
			 $('#id_table').DataTable({
					data: lista,
					language: IDIOMA,
					searching: true,
					ordering: true,
					processing: true,
					pageLength: 10,
					lengthChange: false,
					info:true,
					scrollY: 305,
			        scroller: {
			            loadingIndicator: true  
			        },
					columns:[
						{data: "idEditorial",className:'text-center'},
						{data: "razonSocial",className:'text-center'},
						{data: "direccion",className:'text-center'},
						{data: "ruc",className:'text-center'},
						{data: "formatoCreacion",className:'text-center'},
						{data: "fechaRegistro",className:'text-center'},
						{data: function(row, type, val, meta){
							return row.estado == 1 ? "Activo" : "Inactivo";  
						},className:'text-center'},
						{data: "pais.nombre",className:'text-center'},
						
						
						{data: function(row, type, val, meta){
							return '<button type="button" class="btn btn-info btn-sm" onClick="verFormulario(\'' + row.razonSocial + '\',\'' +  row.direccion +'\',\''+  row.ruc + '\',\'' + row.formatoCreacion+'\',\'' + row.estado +'\',\''+  row.pais.idPais +'\');">Ver</button>';  
						},className:'text-center'},                                                          
					]                                     
			    });
			 
			 
			 
			 
			 
		}
	</script>

</body>
</html>



