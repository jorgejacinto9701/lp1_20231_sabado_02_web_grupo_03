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
<body>

<jsp:include page="intranetCabecera.jsp" />
<div class="container" style="margin-top: 4%">
<h4>Crud Editorial</h4>

	<div class="row" style="margin-top: 5%">
			<div class="col-md-3">
				<label class="control-label" for="id_filtro">Razon Social</label> 
			</div>	
			<div class="col-md-6">
				<input	class="form-control" type="text" id="id_filtro" placeholder="Ingrese el nombre">
			</div>	
			<div class="col-md-1">
				<button type="button" class="btn btn-primary" id="id_btn_filtro">Filtro</button>
			</div>
			<div class="col-md-1">
				<button type="button" class="btn btn-primary" data-toggle='modal' data-target="#id_div_modal_registra">Registra</button>
			</div>	
		</div>


		<div class="row" style="margin-top: 4%">
			<table id="id_table" class="table table-bordered table-hover table-condensed" >
				<thead style='background-color:#337ab7; color:white'>
					<tr>
						<th>ID</th>
						<th>Razon Social</th>
						<th>Direccion</th>
						<th>Ruc</th>
						<th>Fecha de creacion</th>
						<th>Estado</th>
						<th>Pais</th>
						<th></th>
						<th></th>
						<th></th>
					</tr>
				</thead>
				<tbody>


				</tbody>
			</table>

		</div>
		
		
		<!-- INICIO MODAL DE REGISTRO -->
		<div class="modal fade" id="id_div_modal_registra" >
			<div class="modal-dialog" style="width: 60%">
					<div class="modal-content">
					<div class="modal-header" >
						<button type="button" class="close" data-dismiss="modal">&times;</button>
						<h4><span class="glyphicon glyphicon-ok-sign"></span> Registro de Editorial</h4>
					</div>
					<div class="modal-body" >
						 <div class="panel-group" id="steps">
			                   <div class="panel panel-default">
			                   		<div id="stepOne" class="panel-collapse collapse in">
			                   			<form id="id_form_registra">
			                   			<input type="hidden" name="metodo" value="inserta">
			                   			<div class="panel-body">
			                                <div class="form-group" >
		                                        <label class="col-lg-3 control-label" for="id_reg_razonSocial">Razon Social</label>
		                                        <div class="col-lg-8">
													<input class="form-control" id="id_reg_razonSocial" name="razonSocial" placeholder="Ingrese la Razon Social" type="text" maxlength="200"/>
		                                        </div>
		                                    </div> 	
		                                    <div class="form-group" >
		                                        <label class="col-lg-3 control-label" for="id_reg_direccion">Direccion</label>
		                                        <div class="col-lg-8">
													<input class="form-control" id="id_reg_direccion" name="direccion" placeholder="Ingrese la direccion" type="text" maxlength="200"/>
		                                        </div>
		                                    </div> 
		                                    <div class="form-group" >
		                                        <label class="col-lg-3 control-label" for="id_reg_ruc">Ruc</label>
		                                        <div class="col-lg-8">
													<input class="form-control" id="id_reg_ruc" name="ruc" placeholder="Ingrese el ruc" type="text" maxlength="11"/>
		                                        </div>
		                                    </div> 

		                                    <div class="form-group" >
		                                        <label class="col-lg-3 control-label" for="id_reg_fechaCreacion">Fecha de Creación</label>
		                                        <div class="col-lg-8">
													<input class="form-control" id="id_reg_fechaCreacion" name="fechaCreacion" placeholder="Ingrese la fecha de Creacion" type="date" />
		                                        </div>
		                                    </div> 
			                                <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_reg_pais">Pais</label>
		                                        <div class="col-lg-8">
													<select class="form-control" id="id_reg_pais" name="pais">
														<option value=" ">[Seleccione]</option>
													</select>
		                                        </div>
		                                    </div> 	 
		                                    <div class="form-group">
		                                        <div class="col-lg-12" align="center">
		                                        	<button type="button" style="width: 80px" id="id_btn_registra" class="btn btn-primary btn-sm">Registra</button>
		                                        	<button type="button" style="width: 80px" id="id_btn_reg_cancelar" class="btn btn-primary btn-sm" data-dismiss="modal">Cancela</button>
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
		<!-- FIN MODAL DE REGISTRO -->
		
		
			<!-- INICIO MODAL DE ACTUALIZA -->
		<div class="modal fade" id="id_div_modal_actualiza" >
			<div class="modal-dialog" style="width: 60%">
					<div class="modal-content">
					<div class="modal-header" >
						<button type="button" class="close" data-dismiss="modal">&times;</button>
						<h4><span class="glyphicon glyphicon-ok-sign"></span> Actualiza de Editorial</h4>
					</div>
					<div class="modal-body" >
						 <div class="panel-group" id="steps">
			                   <div class="panel panel-default">
			                   		<div id="stepOne" class="panel-collapse collapse in">
			                   			<form id="id_form_actualiza">
			                   			<input type="hidden" name="metodo" value="actualiza">
			                   			<input type="hidden" name="idEditorial" id="idEditorial">
			                   			<div class="panel-body">
			                                <div class="form-group" >
		                                        <label class="col-lg-3 control-label" for="id_act_razonSocial">Razon Social</label>
		                                        <div class="col-lg-8">
													<input class="form-control" id="id_act_razonSocial" name="razonSocial" placeholder="Ingrese la razon social" type="text" maxlength="200"/>
		                                        </div>
		                                    </div> 	
		                                    <div class="form-group" >
		                                        <label class="col-lg-3 control-label" for="id_act_direccion">Direccion</label>
		                                        <div class="col-lg-8">
													<input class="form-control" id="id_act_direccion" name="direccion" placeholder="Ingrese la direccion" type="text" maxlength="200"/>
		                                        </div>
		                                    </div> 	
		                                    <div class="form-group" >
		                                        <label class="col-lg-3 control-label" for="id_act_ruc">Ruc</label>
		                                        <div class="col-lg-8">
													<input class="form-control" id="id_act_ruc" name="ruc" placeholder="Ingrese la ruc" type="text" maxlength="11"/>
		                                        </div>
		                                    </div> 	
		                                    <div class="form-group" >
		                                        <label class="col-lg-3 control-label" for="id_act_fechaCreacion">Fecha de Creación</label>
		                                        <div class="col-lg-8">
													<input class="form-control" id="id_act_fechaCreacion" name="fechaCreacion" placeholder="Ingrese la fechaCreacion" type="date" />
		                                        </div>
		                                    </div> 	
		                                    <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_act_estado">Estado</label>
		                                        <div class="col-lg-8">
													<select class="form-control" id="id_act_estado" name="estado">
														<option value=" ">[Seleccione]</option>
														<option value="1">Activo</option>
														<option value="0">Inactivo</option>
													</select>
		                                        </div>
		                                    </div> 	 
			                                <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_act_pais">Pais</label>
		                                        <div class="col-lg-8">
													<select class="form-control" id="id_act_pais" name="pais">
														<option value=" ">[Seleccione]</option>
													</select>
		                                        </div>
		                                    </div> 	 
		                                    <div class="form-group">
		                                        <div class="col-lg-12" align="center">
		                                        	<button type="button" style="width: 80px" id="id_btn_actualiza" class="btn btn-primary btn-sm">Actualiza</button>
		                                        	<button type="button" style="width: 80px" id="id_btn_act_cancelar" class="btn btn-primary btn-sm" data-dismiss="modal">Cancela</button>
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
			var vfiltro = $("#id_filtro").val();
			$.getJSON("crudEditorial", {"metodo": "lista","filtro":vfiltro}, function(data) {
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
					scrollY: 410,
			        scroller: {
			            loadingIndicator: true
			        },
			        
			        
					columns:[  
						{data: "idEditorial",className:'text-center'},
						{data: "razonSocial",className:'text-center'},
						{data: "direccion",className:'text-center'},
						{data: "ruc",className:'text-center'},
						{data: "formatoCreacion",className:'text-center'},
						{data: function(row, type, val, meta){
							return row.estado == 1 ? "Activo" : "Inactivo";  
						},className:'text-center'},
						{data: "pais.nombre",className:'text-center'},
						{data: function(row, type, val, meta){
						return '<button type="button" class="btn btn-info btn-sm" onClick="verFormularioActualiza(\'' + row.idEditorial + '\',\'' +  row.razonSocial  + '\',\'' +  row.direccion + '\',\''+row.ruc + '\',\'' +  row.formatoCreacion + '\',\'' +  row.estado + '\',\'' +  row.pais.idPais +'\');">Editar</button>';  
						},className:'text-center'},
						{data: function(row, type, val, meta){
						return '<button type="button" class="btn btn-warning btn-sm" onClick="eliminacionLogica(\'' + row.idEditorial +'\');" >E.Lógica</button>';
						},className:'text-center'},
						{data: function(row, type, val, meta){
						return '<button type="button" class="btn btn-danger btn-sm"  onClick="eliminacionFisica(\'' + row.idEditorial +'\');" >E.Física</button>';
						},className:'text-center'},
					]    
			        
			     
			        
			        
			    });
		}
		
		   $("#id_btn_actualiza").click(function() {
				var validator = $('#id_form_actualiza').data('bootstrapValidator');
			    validator.validate();
				
			    if (validator.isValid()) {
			        $.ajax({
				          type: "POST",
				          url: "crudEditorial", 
				          data: $('#id_form_actualiza').serialize(),
				          success: function(data){
				        	  mostrarMensaje(data.mensaje);
				        	  agregarGrilla(data.datos);
				        	  validator.resetForm();
				        	  $('#id_div_modal_actualiza').modal("hide");
				          },
				          error: function(){
				        	  mostrarMensaje(MSG_ERROR);
				          }
				    });
			    }
			});
		   
		   
		$("#id_btn_registra").click(function(){
			var validator = $('#id_form_registra').data('bootstrapValidator');
		    validator.validate();
		    
		 
			
			
		    if (validator.isValid()) {
		        $.ajax({
			          type: "POST",
			          url: "crudEditorial", 
			          data: $('#id_form_registra').serialize(),
			          success: function(data){
			        	  mostrarMensaje(data.mensaje);
	 		        	  agregarGrilla(data.datos);
	 		        	  validator.resetForm();
			        	  $('#id_div_modal_registra').modal("hide");
			        	  limpiarFormulario();
			          },
			          error: function(){
			        	  mostrarMensaje(MSG_ERROR);
			          }
		        });
		    } 
		});	
		
		$.getJSON("cargaPais", {}, function (data){
			$.each(data, function(index, item){
				$("#id_reg_pais").append("<option value=" +  item.idPais +" >" +  item.nombre+ "</option>");
				$("#id_act_pais").append("<option value=" +  item.idPais +" >" +  item.nombre+ "</option>");
			});	
		});	
		
		function verFormularioActualiza(idEditorial, razonSocial, direccion,ruc, fechaCreacion, estado, pais){
			console.log(">> verFormularioActualiza >> " + idEditorial);
			$("#id_div_modal_actualiza").modal("show");
			$("#idEditorial").val(idEditorial);
			$("#id_act_razonSocial").val(razonSocial);
			$("#id_act_direccion").val(direccion);
			$("#id_act_ruc").val(ruc);
			$("#id_act_fechaCreacion").val(fechaCreacion);
			$("#id_act_estado").val(estado);
			$("#id_act_pais").val(pais);
		}
		
		
		$(document).ready(function() {
		    $('#id_form_registra').bootstrapValidator({
		        message: 'This value is not valid',
		        feedbackIcons: {
		            valid: 'glyphicon glyphicon-ok',
		            invalid: 'glyphicon glyphicon-remove',
		            validating: 'glyphicon glyphicon-refresh'
		        },
		        
		        fields:{
		        	razonSocial : {  
		        		selector: "#id_reg_razonSocial",
		        		validators : {
		        			notEmpty: {
		                        message: 'La Razon Social es requerido'
		                    },
		                    stringLength: {
		                        min: 3,
		                        max: 30,
		                        message: 'El Razon Social tiene de 3 a 30 caracteres'
		                    },
		        		}
		        	},
		        	
		        	direccion: {  
		        		selector: "#id_reg_direccion",
		        		validators : {
		        			notEmpty: {
		                        message: 'La direccion es requerida'
		                    },
		                    stringLength: {
		                        min: 3,
		                        max: 200,
		                        message: 'La frecuencia tiene de 3 a 200 caracteres'
		                    },
		        		}
		        	},
		        	
		        	
		        	
		        	ruc : {  
		        		selector: "#id_reg_ruc",
		        		validators : {
		        			notEmpty: {
		                        message: 'La ruc es requerido'
		                    },
		                    stringLength: {
		                        min: 1,
		                        max: 11,
		                        message: 'El ruc tiene de 1 a 11 caracteres'
		                    },
		        		}
		        	},
		        	
		        	
		        	fechaCreacion : {
		        		selector: "#id_reg_fechaCreacion",
		        		validators : {
		        			notEmpty: {
		                        message: 'La fecha de creacion es requerida'
		                    },
		        		}
		        	},
		        	
		        	Pais : {
		        		selector: "#id_reg_pais",
		        		validators : {
		        			notEmpty: {
		                        message: 'El pais es requerido'
		                    },
		        		}
		        	},        	
		        }
		    });
		});
		
		$(document).ready(function() {
		    $('#id_form_actualiza').bootstrapValidator({
		        message: 'This value is not valid',
		        feedbackIcons: {
		            valid: 'glyphicon glyphicon-ok',
		            invalid: 'glyphicon glyphicon-remove',
		            validating: 'glyphicon glyphicon-refresh'
		        },
		        
		        fields:{
		        	razonSocial : {  
		        		selector: "#id_act_razonSocial",
		        		validators : {
		        			notEmpty: {
		                        message: 'La razon Social es requerido'
		                    },
		                    stringLength: {
		                        min: 3,
		                        max: 30,
		                        message: 'La razon Social tiene de 3 a 30 caracteres'
		                    },
		        		}
		        	},
		        	
		        	direccion : {  
		        		selector: "#id_act_direccion",
		        		validators : {
		        			notEmpty: {
		                        message: 'La direccion es requerida'
		                    },
		                    stringLength: {
		                        min: 3,
		                        max: 200,
		                        message: 'La direccion tiene de 3 a 200 caracteres'
		                    },
		        		}
		        	},
		        	
		        	ruc : {  
		        		selector: "#id_act_ruc",
		        		validators : {
		        			notEmpty: {
		                        message: 'El ruc es requerido'
		                    },
		                    stringLength: {
		                        min: 3,
		                        max: 200,
		                        message: 'El ruc tiene de 3 a 200 caracteres'
		                    },
		        		}
		        	},
		        	
		        	fechaCreacion : {
		        		selector: "#id_act_fechaCreacion",
		        		validators : {
		        			notEmpty: {
		                        message: 'La fecha de creacion es requerida'
		                    },
		        		}
		        	},
		        	
		        	estado : {
		        		selector: "#id_act_estado",
		        		validators : {
		        			notEmpty: {
		                        message: 'El estado es requerido'
		                    },
		        		}
		        	},  
		        	
		        	pais : {
		        		selector: "#id_act_pais",
		        		validators : {
		        			notEmpty: {
		                        message: 'El pais es requerido'
		                    },
		        		}
		        	},        	
		        }
		    });
		});		
		
		function limpiarFormulario(){	
			$('#id_reg_razonSocial').val("");
			$('#id_reg_direccion').val("");
			$('#id_reg_ruc').val("");
			$('#id_reg_fechaCreacion').val("");
			$('#id_reg_pais').val(" ");
			$('#id_act_razonSocial').val("");
			$('#id_act_direccion').val("");
			$('#id_act_ruc').val("");
			$('#id_act_fechaCreacion').val("");
			$('#id_act_estado').val(" ");
			$('#id_act_pais').val(" ");
			
		}
		
		function eliminacionLogica(idEditorial){
			 $.ajax({
		          type: "POST",
		          url: "crudEditorial", 
		          data: {"metodo":"eLogica", "idEditorial":idEditorial},
		          success: function(data){
		        	  agregarGrilla(data.datos);
		          },
		          error: function(){
		        	  mostrarMensaje(MSG_ERROR);
		          }
		    });
		}
		   
		   
		   function eliminacionFisica(idEditorial){	
				var array = [idEditorial];
				mostrarMensajeConfirmacion(MSG_ELIMINAR, accionEliminacionFisica,null,array);
			}

			function accionEliminacionFisica(array){
				 $.ajax({
			          type: "POST",
			          url: "crudEditorial", 
			          data: {"metodo":"eFisica", "idEditorial":array[0]},
			          success: function(data){
			        	  mostrarMensaje(data.mensaje);
			        	  agregarGrilla(data.datos);
			          },
			          error: function(){
			        	  mostrarMensaje(MSG_ERROR);
			          }
			    });
			}
			
		
		</script>
</body>
</html>



