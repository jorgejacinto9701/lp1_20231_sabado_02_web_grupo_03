<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<!DOCTYPE html>
<html lang="esS">
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">

<script type="text/javascript" src="js/jquery.min.js"></script>
<script type="text/javascript" src="js/jquery.dataTables.min.js"></script>
<script type="text/javascript" src="js/dataTables.bootstrap.min.js"></script>
<script type="text/javascript" src="js/bootstrap.min.js"></script>
<script type="text/javascript" src="js/bootstrapValidator.js"></script>
<script type="text/javascript" src="js/global.js"></script>
<link rel="stylesheet" href="css/bootstrap.css" />
<link rel="stylesheet" href="css/dataTables.bootstrap.min.css" />
<link rel="stylesheet" href="css/bootstrapValidator.css" />

<title>Sistemas - Jorge Jacinto Gutarra</title>
</head>
<body>

	<div class="container">
		<h1>CRUD Autor Renato Rodriguez g3</h1>

		<div class="row" style="margin-top: 5%">
			<div class="col-md-3">
				<label class="control-label" for="id_filtro">Nombres</label>
			</div>
			<div class="col-md-6">
				<input class="form-control" type="text" id="id_filtro"
					placeholder="Ingrese el nombre">
			</div>
			<div class="col-md-1">
				<button type="button" class="btn btn-primary" id="id_btn_filtro">Filtra</button>
			</div>
			<div class="col-md-1">
				<button type="button" class="btn btn-primary" data-toggle='modal'
					data-target="#id_div_modal_registra">Registra</button>
			</div>
		</div>


		<div class="row" style="margin-top: 4%">
			<table id="id_table"
				class="table table-bordered table-hover table-condensed">
				<thead style='background-color: #337ab7; color: white'>
					<tr>
						<th>Código</th>
						<th>Nombre</th>
						<th>apellido</th>
						<th>FechaNaci</th>
						<th>telefono</th>
						<th>estado</th>
						<th>Cargo</th>
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
		<div class="modal fade" id="id_div_modal_registra">
			<div class="modal-dialog" style="width: 60%">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal">&times;</button>
						<h4>
							<span class="glyphicon glyphicon-ok-sign"></span> Registro de
							Autor
						</h4>
					</div>
					<div class="modal-body">
						<div class="panel-group" id="steps">
							<div class="panel panel-default">
								<div id="stepOne" class="panel-collapse collapse in">
									<form id="id_form_registra">
										<input type="hidden" name="metodo" value="inserta">
										<div class="panel-body">
											<div class="form-group">
												<label class="col-lg-3 control-label" for="id_reg_nombre">Nombre</label>
												<div class="col-lg-8">
													<input class="form-control" id="id_reg_nombre"
														name="nombre" placeholder="Ingrese el Nombre" type="text"
														maxlength="100" />
												</div>
											</div>
											<div class="form-group">
												<label class="col-lg-3 control-label" for="id_apellidos">Apellidos</label>
												<div class="col-lg-8">
													<input class="form-control" id="id_apellidos" name="nombre"
														placeholder="Ingrese el Apellidos" type="text"
														maxlength="100" />
												</div>
											</div>
											<div class="form-group">
												<label class="col-lg-3 control-label" for="id_fecha">Fecha
													Nacimiento</label>
												<div class="col-lg-8">
													<input class="form-control" id="id_fecha"
														name="fechaNacimiento" type="date" />
												</div>
											</div>
											<div class="form-group">
												<label class="col-lg-3 control-label" for="id_telefono">telefono</label>
												<div class="col-lg-8">
													<input class="form-control" id="id_telefono"
														name="telefono" placeholder="Ingrese el telefono"
														type="text" maxlength="9" />
												</div>
											</div>
											<div class="form-group">
												<label class="col-lg-3 control-label" for="id_estado">Estado</label>
												<div class="col-lg-8">
													<input class="form-control" id="id_estado" name="estado"
														placeholder="Ingrese el estado" type="text"
														maxlength="100" />
												</div>
											</div>
											<div class="form-group">
												<label class="col-lg-3 control-label" for="id_Grado">Cargo</label>
												<div class="col-lg-8">
													<select class="form-control" id="id_Grado" name="grado">
														<option value=" ">[Seleccione]</option>
													</select>
												</div>
											</div>
											<div class="form-group">
												<div class="col-lg-12" align="center">
													<button type="button" style="width: 80px"
														id="id_btn_registra" class="btn btn-primary btn-sm">Registra</button>
													<button type="button" style="width: 80px"
														id="id_btn_reg_cancelar" class="btn btn-primary btn-sm"
														data-dismiss="modal">Cancela</button>
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
		<div class="modal fade" id="id_div_modal_actualiza">
			<div class="modal-dialog" style="width: 60%">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal">&times;</button>
						<h4>
							<span class="glyphicon glyphicon-ok-sign"></span> Actualiza de
							Autor
						</h4>
					</div>
					<div class="modal-body">
						<div class="panel-group" id="steps">
							<div class="panel panel-default">
								<div id="stepOne" class="panel-collapse collapse in">

									<input type="hidden" name="metodo" value="actualiza"> <input
										type="hidden" name="idCliente" id="idCliente">
									<div class="panel-body">
										<div class="form-group">
											<label class="col-lg-3 control-label" for="id_nombre">Nombre</label>
											<div class="col-lg-8">
												<input class="form-control" id="id_nombre" name="nombre"
													placeholder="Ingrese el Nombre" type="text" maxlength="100" />
											</div>
										</div>
										<div class="form-group">
											<label class="col-lg-3 control-label" for="id_apellidos">Apellido</label>
											<div class="col-lg-8">
												<input class="form-control" id="id_apellidos"
													name="apellido" placeholder="Ingrese el apellido"
													type="text" maxlength="8" />
											</div>
										</div>
										<div class="form-group">
											<label class="control-label" for="id_fecha">Fecha
												Nacimiento</label> <input class="form-control" type="date"
												id="id_fecha" name="fecha" placeholder="Ingrese la fecha">
										</div>
									</div>
									<div class="form-group">
										<label class="control-label" for="id_telefono">Telefono</label>
										<input class="form-control" type="text" id="id_telefono"
											name="telefono" placeholder="Ingrese el telefono"
											maxlength="8">
									</div>
									<div class="form-group">
										<label class="col-lg-3 control-label" for="id_estado">Estado</label>
										<div class="col-lg-8">
											<select class="form-control" id="id_estado" name="estado">
												<option value=" ">[Seleccione]</option>
												<option value="1">Activo</option>
												<option value="0">Inactivo</option>
											</select>
										</div>
									</div>
									<div class="form-group">
										<label class="col-lg-3 control-label" for="id_Grado">Grado</label>
										<div class="col-lg-8">
											<select class="form-control" id="id_Grado" name="grado">
												<option value=" ">[Seleccione]</option>
											</select>
										</div>
									</div>
									<div class="form-group">
										<div class="col-lg-12" align="center">
											<button type="button" style="width: 80px"
												id="id_btn_actualiza" class="btn btn-primary btn-sm">Actualiza</button>
											<button type="button" style="width: 80px"
												id="id_btn_act_cancelar" class="btn btn-primary btn-sm"
												data-dismiss="modal">Cancela</button>
										</div>
									</div>
								</div>

							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- FIN MODAL DE ACTUALIZA -->



	<script type="text/javascript">
		$("#id_btn_filtro").click(function() {
			var vfiltro = $("#id_filtro").val();
			$.getJSON("crudAutor", {
				"metodo" : "lista",
				"filtro" : vfiltro
			}, function(data) {
				agregarGrilla(data);
			});
		});

		function agregarGrilla(lista) {
			$('#id_table').DataTable().clear();
			$('#id_table').DataTable().destroy();
			$('#id_table')
					.DataTable(
							{
								data : lista,
								language : IDIOMA,
								searching : true,
								ordering : true,
								processing : true,
								pageLength : 10,
								lengthChange : false,
								info : true,
								scrollY : 410,
								scroller : {
									loadingIndicator : true
								},
								columns : [
										{
											data : "idAutor",
											className : 'text-center'
										},
										{
											data : "nombres",
											className : 'text-center'
										},
										{
											data : "apellidos",
											className : 'text-center'
										},
										{
											data : "formateadoFecNac",
											className : 'text-center'
										},
										{
											data : "telefono",
											className : 'text-center'
										},

										{
											data : function(row, type, val,
													meta) {
												return row.estado == 1 ? "Activo"
														: "Inactivo";
											},
											className : 'text-center'
										},
										{
											data : "Grado.nombre",
											className : 'text-center'
										},
										{
											data : function(row, type, val,
													meta) {
												return '<button type="button" class="btn btn-info btn-sm" onClick="verFormularioActualiza(\''
														+ row.idAutor
														+ '\',\''
														+ row.nombres
														+ '\',\''
														+ row.apellido
														+ '\',\''
														+ row.formateadoFecNac
														+ '\',\''
														+ row.telefono
														+ '\',\''
														+ row.estado
														+ '\',\''
														+ row.grado.idGrado
														+ '\');">Editar</button>';
											},
											className : 'text-center'
										},
										{
											data : function(row, type, val,
													meta) {
												return '<button type="button" class="btn btn-warning btn-sm" onClick="eliminacionLogica(\''
														+ row.idEmpleado
														+ '\');" >E.Lógica</button>';
											},
											className : 'text-center'
										},
										{
											data : function(row, type, val,
													meta) {
												return '<button type="button" class="btn btn-danger btn-sm"  onClick="eliminacionFisica(\''
														+ row.idEmpleado
														+ '\');" >E.Física</button>';
											},
											className : 'text-center'
										}, ]
							});
		}
		function eliminacionLogica(idAutor) {
			$.ajax({
				type : "POST",
				url : "crudAutor",
				data : {
					"metodo" : "eLogica",
					"idAutor" : idAutor
				},
				success : function(data) {
					agregarGrilla(data.datos);
				},
				error : function() {
					mostrarMensaje(MSG_ERROR);
				}
			});
		}

		function eliminacionFisica(idAutor) {
			var array = [ idAutor ];
			mostrarMensajeConfirmacion(MSG_ELIMINAR, accionEliminacionFisica,
					null, array);
		}

		function accionEliminacionFisica(array) {
			$.ajax({
				type : "POST",
				url : "crudAutor",
				data : {
					"metodo" : "eFisica",
					"idAutor" : array[0]
				},
				success : function(data) {
					mostrarMensaje(data.mensaje);
					agregarGrilla(data.datos);
				},
				error : function() {
					mostrarMensaje(MSG_ERROR);
				}
			});
		}

		function verFormularioActualiza(idAutor, nombre, apellido,
				fechaNacimiento, telefono, estado, Cargo) {
			console.log(">> verFormularioActualiza >> " + idAutor);
			$("#id_div_modal_actualiza").modal("show");
			$("#idAutor").val(idAutor);
			$("#id_nombre").val(nombre);
			$("#id_apellido").val(apellidos);
			$("#id_fecha").val(fecha);
			$("#id_telefono").val(telefono);
			$("#id_estado").val(estado);
			$("#id_cargo").val(cargo);
		}

		$.getJSON("cargaCategoria", {}, function(data) {
			$.each(data, function(index, item) {
				$("#id_reg_categoria").append(
						"<option value='"+ item.idCargo +"'>" + item.nombre
								+ "</option>");
				$("#id_act_categoria").append(
						"<option value='"+ item.idCargo +"'>" + item.nombre
								+ "</option>");
			})
		});

		function eliminacionFisica(idCliente) {
			var array = [ idCliente ];
			mostrarMensajeConfirmacion(MSG_ELIMINAR, accionEliminacionFisica,
					null, array);
		}

		function accionEliminacionFisica(array) {
			$.ajax({
				type : "POST",
				url : "crudAutor",
				data : {
					"metodo" : "eFisica",
					"idAutor" : array[0]
				},
				success : function(data) {
					mostrarMensaje(data.mensaje);
					agregarGrilla(data.datos);
				},
				error : function() {
					mostrarMensaje(MSG_ERROR);
				}
			});
		}

		$("#id_btn_registra").click(function() {
			var validator = $('#id_form_registra').data('bootstrapValidator');
			validator.validate();

			if (validator.isValid()) {
				$.ajax({
					type : "POST",
					url : "crudCliente",
					data : $('#id_form_registra').serialize(),
					success : function(data) {
						mostrarMensaje(data.mensaje);
						agregarGrilla(data.datos);
						validator.resetForm();
						$('#id_div_modal_registra').modal("hide");
					},
					error : function() {
						mostrarMensaje(MSG_ERROR);
					}
				});
			}
		});

		$("#id_btn_actualiza").click(function() {
			var validator = $('#id_form_actualiza').data('bootstrapValidator');
			validator.validate();

			if (validator.isValid()) {
				$.ajax({
					type : "POST",
					url : "crudAutor",
					data : $('#id_form_actualiza').serialize(),
					success : function(data) {
						mostrarMensaje(data.mensaje);
						agregarGrilla(data.datos);
						validator.resetForm();
						$('#id_div_modal_actualiza').modal("hide");
					},
					error : function() {
						mostrarMensaje(MSG_ERROR);
					}
				});
			}
		});

		function eliminacionLogica(idCliente) {
			$.ajax({
				type : "POST",
				url : "crudAutor",
				data : {
					"metodo" : "eLogica",
					"idAutor" : idAutor
				},
				success : function(data) {
					agregarGrilla(data.datos);
				},
				error : function() {
					mostrarMensaje(MSG_ERROR);
				}
			});
		}

		$(document)
				.ready(
						function() {
							$('#id_form_registra')
									.bootstrapValidator(
											{
												message : 'This value is not valid',
												feedbackIcons : {
													valid : 'glyphicon glyphicon-ok',
													invalid : 'glyphicon glyphicon-remove',
													validating : 'glyphicon glyphicon-refresh'
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
														selector : "#id_apellidos",
														validators : {
															notEmpty : {
																message : 'El apellido es requerido'
															},
															stringLength : {
																min : 3,
																max : 30,
																message : 'El apellido tiene de 3 a 30 caracteres'
															},
														}
													},
													fecha : {
														selector : "#id_fecha",
														validators : {
															notEmpty : {
																message : 'La fecha de nacimiento es requerido'
															}
														}
													},

													telefono : {
														selector : "#id_telefono",
														validators : {
															notEmpty : {
																message : 'El telefono es requerido'
															},
															stringLength : {
																min : 3,
																max : 30,
																message : 'El numero de telefono tiene de 2 a 9 caracteres'
															},
														}
													},
													estado : {
														selector : "#id_estado",
														validators : {
															notEmpty : {
																message : 'El estado es requerido'
															},
														}
													},
													grado : {
														selector : "#id_grado",
														validators : {
															notEmpty : {
																message : 'El grado es requerido'
															},
														}
													},
												}
											});
						});

		$(document)
				.ready(
						function() {
							$('#id_form_actualiza')
									.bootstrapValidator(
											{
												message : 'This value is not valid',
												feedbackIcons : {
													valid : 'glyphicon glyphicon-ok',
													invalid : 'glyphicon glyphicon-remove',
													validating : 'glyphicon glyphicon-refresh'
												},

												fields : {
													nombre : {
														selector : "#id_nombre",
														validators : {
															notEmpty : {
																message : 'El nombre es requerido'
															},
															stringLength : {
																min : 3,
																max : 30,
																message : 'El nombre tiene de 3 a 30 caracteres'
															},
														}
													},
													apellidos : {
														selector : "#id_apellidos",
														validators : {
															notEmpty : {
																message : 'El apellido es requerido'
															},
															stringLength : {
																min : 3,
																max : 30,
																message : 'El apellido tiene de 3 a 30 caracteres'
															},
														}
													},
													fecha : {
														selector : "#id_fecha",
														validators : {
															notEmpty : {
																message : 'La fecha de nacimiento es requerido'
															}
														}
													},

													telefono : {
														selector : "#id_telefono",
														validators : {
															notEmpty : {
																message : 'El telefono es requerido'
															},
															stringLength : {
																min : 3,
																max : 30,
																message : 'El numero de telefono tiene de 2 a 9 caracteres'
															},
														}
													},
													estado : {
														selector : "#id_estado",
														validators : {
															notEmpty : {
																message : 'El estado es requerido'
															},
														}
													},
													grado : {
														selector : "#id_grado",
														validators : {
															notEmpty : {
																message : 'El grado es requerido'
															},
														}
													},
												}
											});
						});

		function limpiarFormulario() {
			$('#id_nombre').val("");
			$('#id_apellido').val("");
			$('#id_fecha').val("");
			$('#id_telefono').val("");
			$('#id_estado').val(" ");
			$('#id_cargo').val(" ");
		}
	</script>



</body>
</html>