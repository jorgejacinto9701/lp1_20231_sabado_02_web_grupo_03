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

<title>CUD SALA</title>
</head>
<body>


 <div class="container">
		<h1>CRUD SALA</h1>
		<br>
		<br>
		<h5>AUTOR: MIGUEL RIVERA </h5>

		<div class="row" style="margin-top: 5%">
			<div class="col-md-3">
				<label class="control-label" for="id_filtro">Numeros</label> 
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
						<th>Numero</th>
						<th>piso</th>
						<th>numAlumnos</th>
						<th>Recursos</th>
						<th>Sede</th>
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
						<h4><span class="glyphicon glyphicon-ok-sign"></span> Registro de Sala</h4>
					</div>
					<div class="modal-body" >
						 <div class="panel-group" id="steps">
			                   <div class="panel panel-default">
			                   		<div id="stepOne" class="panel-collapse collapse in">
			                   			<form id="id_form_registra">
			                   			<input type="hidden" name="metodo" value="inserta">
			                   			<div class="panel-body">
			                                <div class="form-group" >
		                                        <label class="col-lg-3 control-label" for="id_reg_numero">Numero</label>
		                                        <div class="col-lg-8">
													<input class="form-control" id="id_reg_numero" name="numero" placeholder="Ingrese el Nummero" type="text" maxlength="8"/>
		                                        </div>
		                                    </div> 	
		                                    <div class="form-group" >
		                                        <label class="col-lg-3 control-label" for="id_reg_piso">Piso</label>
		                                        <div class="col-lg-8">
													<input class="form-control" id="id_reg_piso" name="piso" placeholder="Ingrese la piso" type="text" maxlength="200"/>
		                                        </div>
		                                    </div> 

		                                    <div class="form-group" >
		                                        <label class="col-lg-3 control-label" for="id_reg_numAlumnos">numAlumnos</label>
		                                        <div class="col-lg-8">
													<input class="form-control" id="id_reg_numAlumnos" name="numAlumnos" placeholder="Ingrese alumnos" type="text" maxlength="10" />
		                                        </div>
		                                    </div> 
			                                <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_reg_sede">Sede</label>
		                                        <div class="col-lg-8">
													<select class="form-control" id="id_reg_sede" name="sede">
														<option value=" ">[Seleccione]</option>
													</select>
		                                        </div>
		                                    </div> 	 
		                                    <div class="form-group">
		                                    <br><br>
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
						<h4><span class="glyphicon glyphicon-ok-sign"></span> Actualiza de Sala</h4>
					</div>
					<div class="modal-body" >
						 <div class="panel-group" id="steps">
			                   <div class="panel panel-default">
			                   		<div id="stepOne" class="panel-collapse collapse in">
			                   			<form id="id_form_actualiza">
			                   			<input type="hidden" name="metodo" value="actualiza">
			                   			<input type="hidden" name="idRevista" id="idRevista">
			                   			<div class="panel-body">
			                                <div class="form-group" >
		                                        <label class="col-lg-3 control-label" for="id_act_nombre">Numero</label>
		                                        <div class="col-lg-8">
													<input class="form-control" id="id_act_nombre" name="nombre" placeholder="Ingrese el Nombre" type="text" maxlength="200"/>
		                                        </div>
		                                    </div> 	
		                                    <div class="form-group" >
		                                        <label class="col-lg-3 control-label" for="id_act_frecuencia">Piso</label>
		                                        <div class="col-lg-8">
													<input class="form-control" id="id_act_frecuencia" name="frecuencia" placeholder="Ingrese la frecuencia" type="text" maxlength="200"/>
		                                        </div>
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
		                                        <label class="col-lg-3 control-label" for="id_act_sede">Sede</label>
		                                        <div class="col-lg-8">
													<select class="form-control" id="id_act_sede" name="sede">
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
			$.getJSON("crudSede", {"metodo": "lista","filtro":vfiltro}, function(data) {
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
						{data: "idRevista",className:'text-center'},
						{data: "nombre",className:'text-center'},
						{data: "frecuencia",className:'text-center'},
						{data: "formatoCreacion",className:'text-center'},
						{data: function(row, type, val, meta){
							return row.estado == 1 ? "Activo" : "Inactivo";  
						},className:'text-center'},
						{data: "modalidad.descripcion",className:'text-center'},
						{data: function(row, type, val, meta){
						return '<button type="button" class="btn btn-info btn-sm" onClick="verFormularioActualiza(\'' + row.idSala + '\',\'' +  row.numero   + '\',\'' +  row.piso + '\',\'' + '\',\'' +  row.piso + '\',\''+  row.numAlumnos + '\',\'' + '\',\'' +  row.recursos + '\',\''  row.estado + '\',\'' +  row.sede.idSede +'\');">Editar</button>';  
						},className:'text-center'},
						{data: function(row, type, val, meta){
						return '<button type="button" class="btn btn-warning btn-sm" onClick="eliminacionLogica(\'' + row.idSde +'\');" >E.Lógica</button>';
						},className:'text-center'},
						{data: function(row, type, val, meta){
						return '<button type="button" class="btn btn-danger btn-sm"  onClick="eliminacionFisica(\'' + row.idSede +'\');" >E.Física</button>';
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
				          url: "crudSala", 
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
			          url: "crudSala", 
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
		
		$.getJSON("cargaSede", {}, function (data){
			$.each(data, function(index, item){
				$("#id_reg_sede").append("<option value=" +  item.idSede +" >" +  item.descripcion+ "</option>");
				$("#id_act_sede").append("<option value=" +  item.idSede +" >" +  item.descripcion+ "</option>");
			});	
		});	
		
		function verFormularioActualiza(idSala, numero, piso, numalumnos, recursos, estado, sede){
			console.log(">> verFormularioActualiza >> " + idSala);
			$("#id_div_modal_actualiza").modal("show");
			$("#idSala").val(idSala);
			$("#id_act_numero").val(numero);
			$("#id_act_piso").val(piso);
			$("#id_act_numAlumnos").val(numAlumnos);
			$("#id_act_recursos").val(recursos);
			$("#id_act_estado").val(estado);
			$("#id_act_sede").val(sede);
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
		        	numero : {  
		        		selector: "#id_reg_numero",
		        		validators : {
		        			notEmpty: {
		                        message: 'debe ingresar numero'
		                    },
		                    stringLength: {
		                        min: 3,
		                        max: 20,
		                        message: 'El numero minimo 3 a 20 caracteres'
		                    },
		        		}
		        	},
		        	
		        	piso : {  
		        		selector: "#id_reg_piso",
		        		validators : {
		        			notEmpty: {
		                        message: 'debe ingresar piso'
		                    },
		                    stringLength: {
		                        min: 1,
		                        max: 20,
		                        message: 'minimo 1 a  20 caracteres'
		                    },
		        		}
		        	},
		        	
		        	alaumnos : {
		        		selector: "#id_reg_numaAlumnos",
		        		validators : {
		        			notEmpty: {
		                        message: 'debe ingresar alumno'
		                    },
		                    stringLength: {
		                        min: 1,
		                        max: 20,
		                        message: 'minimo 1 a  20 caracteres'
		        		}
		        	},
		        	
		        	recursos : {
		        		selector: "#id_reg_recursos",
		        		validators : {
		        			notEmpty: {
		                        message: 'La recursos es requerida'
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
		        	nombre : {  
		        		selector: "#id_act_nombre",
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
		        	
		        	frecuencia : {  
		        		selector: "#id_act_frecuencia",
		        		validators : {
		        			notEmpty: {
		                        message: 'La frecuencia es requerida'
		                    },
		                    stringLength: {
		                        min: 3,
		                        max: 200,
		                        message: 'El nombre tiene de 3 a 200 caracteres'
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
		        	
		        	modalidad : {
		        		selector: "#id_act_modalidad",
		        		validators : {
		        			notEmpty: {
		                        message: 'La modalidad es requerida'
		                    },
		        		}
		        	},        	
		        }
		    });
		});		
		
		function limpiarFormulario(){	
			$('#id_reg_numero').val("");
			$('#id_reg_piso').val("");
			$('#id_reg_numAlumnos').val("");
			$('#id_reg_sede').val(" ");
			$('#id_act_numero').val("");
			$('#id_act_piso').val("");
			$('#id_act_numAlumnos').val("");
			$('#id_act_estado').val(" ");
			$('#id_act_sede').val(" ");
			
		}
		
		function eliminacionLogica(idSala){
			 $.ajax({
		          type: "POST",
		          url: "crudSala", 
		          data: {"metodo":"eLogica", "idSala":idSala},
		          success: function(data){
		        	  agregarGrilla(data.datos);
		          },
		          error: function(){
		        	  mostrarMensaje(MSG_ERROR);
		          }
		    });
		}
		   
		   
		   function eliminacionFisica(idSala){	
				var array = [idSala];
				mostrarMensajeConfirmacion(MSG_ELIMINAR, accionEliminacionFisica,null,array);
			}

			function accionEliminacionFisica(array){
				 $.ajax({
			          type: "POST",
			          url: "crudSala", 
			          data: {"metodo":"eFisica", "idSala":array[0]},
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



