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

<title>Consulta Proveedor</title>
</head>
<body>

<jsp:include page="intranetCabecera.jsp" />
<div class="container" style="margin-top: 4%">
<h4>Dávila Diaz Diego</h4>

<div class="container">
		<h1>Consulta Proveedor</h1>
		
		<div class="row" style="margin-top: 5%">
		     <div class="col-md-4">
		          <label class="control-label" for="id_RazonSocial">Razon Social</label>
		     </div>
		     <div class="col-md-5">
		          <input class="control-label" type="text" id="id_RazonSocial">
		     </div>
		</div>
		
		<div class="row" style="margin-top: 1%">
		     <div class="col-md-4">
		          <label class="control-label" for="id_pais">Pais</label>
		     </div>
		     <div class="col-md-5">
		          <select class="form-control" id="id_pais">
		              <option value="-1">[Seleccione]</option>
		          </select>
		     </div>
		</div>
		
		<div class="row" style="margin-top: 1%">
		     <div class="col-md-4">
		          <label class="control-label" for="id_estado">Estado</label>
		     </div>
		     <div class="col-md-5">
		          <input class="custom-control-input" type="checkbox" id="id_estado" checked="checked">
		     </div>
		</div>

		<div class="row" style="margin-top: 1%">
			<div class="col-md-3">
				<label class="control-label" for="id_filtro">Fecha Registro</label> 
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
							<th>idProveedor</th>
							<th>Razon Social</th>
							<th>RUC</th>
							<th>Direccion</th>
							<th>Celular</th>
							<th>Contacto</th>
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
		
		<!-- INICIO MODAL DE ACTUALIZA -->
		<div class="modal fade" id="id_div_modal_ver" >
			<div class="modal-dialog" style="width: 60%">
					<div class="modal-content">
					<div class="modal-header" >
						<button type="button" class="close" data-dismiss="modal">&times;</button>
						<h4><span class="glyphicon glyphicon-ok-sign"></span>Datos de Proveedor</h4>
					</div>
					<div class="modal-body" >
						 <div class="panel-group" id="steps">
			                   <div class="panel panel-default">
			                   		<div id="stepOne" class="panel-collapse collapse in">
			                   			<form id="id_form_actualiza">
			                   			<input type="hidden" name="metodo" value="actualiza">
			                   			<input type="hidden" name="idProveedor" id="idProveedor" >
			                   			<div class="panel-body">
			                                <div class="form-group" >
		                                        <label class="col-lg-3 control-label" for="id_act_RazonSocial">Razon Social</label>
		                                        <div class="col-lg-8">
													<input class="form-control" id="id_act_RazonSocial" type="text" readonly="readonly"/>
		                                        </div>
		                                    </div> 	
		                                    <div class="form-group" >
		                                        <label class="col-lg-3 control-label" for="id_act_RUC">RUC</label>
		                                        <div class="col-lg-8">
													<input class="form-control" id="id_act_RUC" type="text" readonly="readonly"/>
		                                        </div>
		                                    </div> 
		                                    <div class="form-group" >
		                                        <label class="col-lg-3 control-label" for="id_act_direccion">Direccion</label>
		                                        <div class="col-lg-8">
													<input class="form-control" id="id_act_direccion" type="text" readonly="readonly"/>
		                                        </div>
		                                    </div> 
											<div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_act_celular">Celular</label>
		                                        <div class="col-lg-8">
													<input class="form-control" id="id_act_celular" type="text" readonly="readonly"/>
		                                        </div>
		                                    </div> 	 
		                                    <div class="form-group" >
		                                        <label class="col-lg-3 control-label" for="id_act_contacto">Contacto</label>
		                                        <div class="col-lg-8">
													<input class="form-control" id="id_act_contacto" type="text" readonly="readonly"/>
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
		                                        <label class="col-lg-3 control-label" for="id_act_pais">Pais</label>
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
		<!-- FIN MODAL DE ACTUALIZA -->
	</div>


	<script type="text/javascript">
		$("#id_btn_filtro").click(function() {
			var vRazonSocial = $("#id_RazonSocial").val();
			var vpais = $("#id_pais").val();
			var vestado = $("#id_estado").is(":checked") ? 1 : 0;
			var vfecIni = $("#id_fecha_inicio").val();
			var vfecFin = $("#id_fecha_fin").val();
			
			console.log(">> vRazonSocial >> " + vRazonSocial);
			console.log(">> vpais >> " + vpais);
			console.log(">> vestado >> " + vestado);
			console.log(">> vfecIni >> " + vfecIni);
			console.log(">> vfecFin >> " + vfecFin);
			
			
			$.getJSON("consultaProveedor", {"RazonSocial":vRazonSocial,"pais":vpais, "estado":vestado, "fechaInicio":vfecIni, "fechaFin":vfecFin}, function(data) {
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
					pageLength: 10,
					lengthChange: false,
					info:true,
					scrollY: 305,
			        scroller: {
			            loadingIndicator: true
			        },
					columns:[
						{data: "idProveedor",className:'text-center'},
						{data: "RazonSocial",className:'text-center'},
						{data: "RUC",className:'text-center'},
						{data: "direccion",className:'text-center'},
						{data: "celular",className:'text-center'},
						{data: "contacto",className:'text-center'},
						{data: "fechaRegistro",className:'text-center'},
						{data: function(row, type, val, meta){
							return row.estado == 1 ? "Activo" : "Inactivo";  
						},className:'text-center'},
						{data: "pais.nombre",className:'text-center'},
						{data: function(row, type, val, meta){
							return '<button type="button" class="btn btn-info btn-sm" onClick="verFormulario(\'' + row.RazonSocial + '\',\'' + row.RUC + '\',\'' + row.direccion + '\',\'' +  row.celular + '\',\'' +  row.contacto + '\',\'' + row.estado + '\',\'' +  row.pais.idPais +'\');">Ver</button>';  
						},className:'text-center'},
					]                                     
			    });
		}
		
		$.getJSON("cargaPais", {}, function (data){
			$.each(data, function(index, item){
				$("#id_pais").append("<option value=" +  item.idPais +" >" +  item.nombre+ "</option>");
				$("#id_act_pais").append("<option value=" +  item.idPais +" >" +  item.nombre+ "</option>");
			});	
		});
		
		function verFormulario( RazonSocial, RUC, direccion, celular, contacto, estado, pais){
        	console.log(">> verFormulario ")
        	$("#id_div_modal_ver").modal("show");
            $("#id_act_RazonSocial").val(RazonSocial);
            $("#id_act_RUC").val(RUC);
            $("#id_act_direccion").val(direccion);
            $("#id_act_celular").val(celular);
            $("#id_act_contacto").val(contacto);
			$("#id_act_estado").val(estado);
			$("#id_act_pais").val(pais);
        }
	</script>


	
</div>
</body>
</html>

