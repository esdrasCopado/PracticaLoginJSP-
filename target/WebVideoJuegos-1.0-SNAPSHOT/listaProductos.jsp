<%-- 
    Document   : ListarLibros
    Created on : 18-feb-2018, 17:32:12
    Author     : Christian Gámez
--%>
<%@page import="controller.ProductosControlador"%>
<%@page import="model.Producto"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    
    ProductosControlador cp=new ProductosControlador();
%>
<!DOCTYPE html>
<html lang="es">
	<head>
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
		<meta charset="utf-8" />
		<title>Gestión de libros</title>

		<meta name="description" content="Christian Gámez Udemy" />
		<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0" />

                <%@include file="css.jsp" %>
	</head>

	<body class="no-skin">
		<div id="navbar" class="navbar navbar-default          ace-save-state">
			<div class="navbar-container ace-save-state" id="navbar-container">
				<button type="button" class="navbar-toggle menu-toggler pull-left" id="menu-toggler" data-target="#sidebar">
					<span class="sr-only">Toggle sidebar</span>

					<span class="icon-bar"></span>

					<span class="icon-bar"></span>

					<span class="icon-bar"></span>
				</button>

				<div class="navbar-header pull-left">
					<a href="index.jsp" class="navbar-brand">
						<small>
							<i class="fa fa-book"></i>
							Gestionar Tienda
						</small>
					</a>
				</div>

				<div class="navbar-buttons navbar-header pull-right" role="navigation">
					<ul class="nav ace-nav">
						<li class="grey dropdown-modal">
							<a data-toggle="dropdown" class="dropdown-toggle" href="#">
								<i class="ace-icon fa fa-tasks"></i>
								<span class="badge badge-grey">4</span>
							</a>

							<ul class="dropdown-menu-right dropdown-navbar dropdown-menu dropdown-caret dropdown-close">
								<li class="dropdown-header">
									<i class="ace-icon fa fa-check"></i>
									4 Tasks to complete
								</li>

								<li class="dropdown-content">
									<ul class="dropdown-menu dropdown-navbar">
										<li>
											<a href="#">
												<div class="clearfix">
													<span class="pull-left">Software Update</span>
													<span class="pull-right">65%</span>
												</div>

												<div class="progress progress-mini">
													<div style="width:65%" class="progress-bar"></div>
												</div>
											</a>
										</li>

										<li>
											<a href="#">
												<div class="clearfix">
													<span class="pull-left">Hardware Upgrade</span>
													<span class="pull-right">35%</span>
												</div>

												<div class="progress progress-mini">
													<div style="width:35%" class="progress-bar progress-bar-danger"></div>
												</div>
											</a>
										</li>

										<li>
											<a href="#">
												<div class="clearfix">
													<span class="pull-left">Unit Testing</span>
													<span class="pull-right">15%</span>
												</div>

												<div class="progress progress-mini">
													<div style="width:15%" class="progress-bar progress-bar-warning"></div>
												</div>
											</a>
										</li>

										<li>
											<a href="#">
												<div class="clearfix">
													<span class="pull-left">Bug Fixes</span>
													<span class="pull-right">90%</span>
												</div>

												<div class="progress progress-mini progress-striped active">
													<div style="width:90%" class="progress-bar progress-bar-success"></div>
												</div>
											</a>
										</li>
									</ul>
								</li>

								<li class="dropdown-footer">
									<a href="#">
										See tasks with details
										<i class="ace-icon fa fa-arrow-right"></i>
									</a>
								</li>
							</ul>
						</li>

						<li class="purple dropdown-modal">
							<a data-toggle="dropdown" class="dropdown-toggle" href="#">
								<i class="ace-icon fa fa-bell icon-animated-bell"></i>
								<span class="badge badge-important">8</span>
							</a>

							<ul class="dropdown-menu-right dropdown-navbar navbar-pink dropdown-menu dropdown-caret dropdown-close">
								<li class="dropdown-header">
									<i class="ace-icon fa fa-exclamation-triangle"></i>
									8 Notifications
								</li>

								<li class="dropdown-content">
									<ul class="dropdown-menu dropdown-navbar navbar-pink">
										<li>
											<a href="#">
												<div class="clearfix">
													<span class="pull-left">
														<i class="btn btn-xs no-hover btn-pink fa fa-comment"></i>
														New Comments
													</span>
													<span class="pull-right badge badge-info">+12</span>
												</div>
											</a>
										</li>

										<li>
											<a href="#">
												<i class="btn btn-xs btn-primary fa fa-user"></i>
												Bob just signed up as an editor ...
											</a>
										</li>

										<li>
											<a href="#">
												<div class="clearfix">
													<span class="pull-left">
														<i class="btn btn-xs no-hover btn-success fa fa-shopping-cart"></i>
														New Orders
													</span>
													<span class="pull-right badge badge-success">+8</span>
												</div>
											</a>
										</li>

										<li>
											<a href="#">
												<div class="clearfix">
													<span class="pull-left">
														<i class="btn btn-xs no-hover btn-info fa fa-twitter"></i>
														Followers
													</span>
													<span class="pull-right badge badge-info">+11</span>
												</div>
											</a>
										</li>
									</ul>
								</li>

								<li class="dropdown-footer">
									<a href="#">
										See all notifications
										<i class="ace-icon fa fa-arrow-right"></i>
									</a>
								</li>
							</ul>
						</li>

						<li class="green dropdown-modal">
							<a data-toggle="dropdown" class="dropdown-toggle" href="#">
								<i class="ace-icon fa fa-envelope icon-animated-vertical"></i>
								<span class="badge badge-success">5</span>
							</a>

							<ul class="dropdown-menu-right dropdown-navbar dropdown-menu dropdown-caret dropdown-close">
								<li class="dropdown-header">
									<i class="ace-icon fa fa-envelope-o"></i>
									5 Messages
								</li>

								<li class="dropdown-content">
									<ul class="dropdown-menu dropdown-navbar">
										<li>
											<a href="#" class="clearfix">
												<img src="assets/images/avatars/avatar.png" class="msg-photo" alt="Alex's Avatar" />
												<span class="msg-body">
													<span class="msg-title">
														<span class="blue">Alex:</span>
														Ciao sociis natoque penatibus et auctor ...
													</span>

													<span class="msg-time">
														<i class="ace-icon fa fa-clock-o"></i>
														<span>a moment ago</span>
													</span>
												</span>
											</a>
										</li>

										<li>
											<a href="#" class="clearfix">
												<img src="assets/images/avatars/avatar3.png" class="msg-photo" alt="Susan's Avatar" />
												<span class="msg-body">
													<span class="msg-title">
														<span class="blue">Susan:</span>
														Vestibulum id ligula porta felis euismod ...
													</span>

													<span class="msg-time">
														<i class="ace-icon fa fa-clock-o"></i>
														<span>20 minutes ago</span>
													</span>
												</span>
											</a>
										</li>

										<li>
											<a href="#" class="clearfix">
												<img src="assets/images/avatars/avatar4.png" class="msg-photo" alt="Bob's Avatar" />
												<span class="msg-body">
													<span class="msg-title">
														<span class="blue">Bob:</span>
														Nullam quis risus eget urna mollis ornare ...
													</span>

													<span class="msg-time">
														<i class="ace-icon fa fa-clock-o"></i>
														<span>3:15 pm</span>
													</span>
												</span>
											</a>
										</li>

										<li>
											<a href="#" class="clearfix">
												<img src="assets/images/avatars/avatar2.png" class="msg-photo" alt="Kate's Avatar" />
												<span class="msg-body">
													<span class="msg-title">
														<span class="blue">Kate:</span>
														Ciao sociis natoque eget urna mollis ornare ...
													</span>

													<span class="msg-time">
														<i class="ace-icon fa fa-clock-o"></i>
														<span>1:33 pm</span>
													</span>
												</span>
											</a>
										</li>

										<li>
											<a href="#" class="clearfix">
												<img src="assets/images/avatars/avatar5.png" class="msg-photo" alt="Fred's Avatar" />
												<span class="msg-body">
													<span class="msg-title">
														<span class="blue">Fred:</span>
														Vestibulum id penatibus et auctor  ...
													</span>

													<span class="msg-time">
														<i class="ace-icon fa fa-clock-o"></i>
														<span>10:09 am</span>
													</span>
												</span>
											</a>
										</li>
									</ul>
								</li>

								<li class="dropdown-footer">
									<a href="inbox.html">
										See all messages
										<i class="ace-icon fa fa-arrow-right"></i>
									</a>
								</li>
							</ul>
						</li>

						<li class="light-blue dropdown-modal">
							<a data-toggle="dropdown" href="#" class="dropdown-toggle">
								<img class="nav-user-photo" src="assets/images/avatars/user.jpg" alt="Jason's Photo" />
								<span class="user-info">
									<small>Welcome,</small>
									Jason
								</span>

								<i class="ace-icon fa fa-caret-down"></i>
							</a>

							<ul class="user-menu dropdown-menu-right dropdown-menu dropdown-yellow dropdown-caret dropdown-close">
								<li>
									<a href="#">
										<i class="ace-icon fa fa-cog"></i>
										Settings
									</a>
								</li>

								<li>
									<a href="profile.html">
										<i class="ace-icon fa fa-user"></i>
										Profile
									</a>
								</li>

								<li class="divider"></li>

								<li>
									<a href="#">
										<i class="ace-icon fa fa-power-off"></i>
										Logout
									</a>
								</li>
							</ul>
						</li>
					</ul>
				</div>
			</div><!-- /.navbar-container -->
		</div>

		<div class="main-container ace-save-state" id="main-container">
			<script type="text/javascript">
				try{ace.settings.loadState('main-container')}catch(e){}
			</script>

			<div id="sidebar" class="sidebar                  responsive                    ace-save-state">
				<script type="text/javascript">
					try{ace.settings.loadState('sidebar')}catch(e){}
				</script>

				<div class="sidebar-shortcuts" id="sidebar-shortcuts">
					<div class="sidebar-shortcuts-large" id="sidebar-shortcuts-large">
						<button class="btn btn-success">
							<i class="ace-icon fa fa-signal"></i>
						</button>

						<button class="btn btn-info">
							<i class="ace-icon fa fa-pencil"></i>
						</button>

						<button class="btn btn-warning">
							<i class="ace-icon fa fa-users"></i>
						</button>

						<button class="btn btn-danger">
							<i class="ace-icon fa fa-cogs"></i>
						</button>
					</div>

					<div class="sidebar-shortcuts-mini" id="sidebar-shortcuts-mini">
						<span class="btn btn-success"></span>

						<span class="btn btn-info"></span>

						<span class="btn btn-warning"></span>

						<span class="btn btn-danger"></span>
					</div>
				</div><!-- /.sidebar-shortcuts -->

				<ul class="nav nav-list">
					<li class="">
						<a href="index.jsp">
							<i class="menu-icon fa fa-tachometer"></i>
							<span class="menu-text"> Inicio </span>
						</a>

						<b class="arrow"></b>
					</li>

					<li class="active open">
						<a href="#" class="dropdown-toggle">
							<i class="menu-icon fa fa-book"></i>
							<span class="menu-text"> Gestionar Tienda </span>

							<b class="arrow fa fa-angle-down"></b>
						</a>

						<b class="arrow"></b>

						<ul class="submenu">
							<li class="active">
                                                            <a href="RegistrarProducto.jsp">
									<i class="menu-icon fa fa-caret-right"></i>
									Registrar Producto
								</a>

								<b class="arrow"></b>
							</li>

							<li class="">
                                                            <a href="listaProductos.jsp">
									<i class="menu-icon fa fa-caret-right"></i>
									lista de productos
								</a>

								<b class="arrow"></b>
							</li>
                                                        <li class="">
                                                            <a href="Lista de clientes.jsp">
									<i class="menu-icon fa fa-caret-right"></i>
									lista Clientes
								</a>

								<b class="arrow"></b>
							</li>

						</ul>
					</li>

				</ul><!-- /.nav-list -->

				<div class="sidebar-toggle sidebar-collapse" id="sidebar-collapse">
					<i id="sidebar-toggle-icon" class="ace-icon fa fa-angle-double-left ace-save-state" data-icon1="ace-icon fa fa-angle-double-left" data-icon2="ace-icon fa fa-angle-double-right"></i>
				</div>
			</div>

			<div class="main-content">
				<div class="main-content-inner">
					<div class="breadcrumbs ace-save-state" id="breadcrumbs">
						<ul class="breadcrumb">
							<li>
								<i class="ace-icon fa fa-home home-icon"></i>
								<a href="#">Inicio</a>
							</li>

							
						</ul><!-- /.breadcrumb -->

						<div class="nav-search" id="nav-search">
							<form class="form-search">
								<span class="input-icon">
									<input type="text" placeholder="Search ..." class="nav-search-input" id="nav-search-input" autocomplete="off" />
									<i class="ace-icon fa fa-search nav-search-icon"></i>
								</span>
							</form>
						</div><!-- /.nav-search -->
					</div>

					<div class="page-content">
						<div class="ace-settings-container" id="ace-settings-container">
							<div class="btn btn-app btn-xs btn-warning ace-settings-btn" id="ace-settings-btn">
								<i class="ace-icon fa fa-cog bigger-130"></i>
							</div>

							<div class="ace-settings-box clearfix" id="ace-settings-box">
								<div class="pull-left width-50">
									<div class="ace-settings-item">
										<div class="pull-left">
											<select id="skin-colorpicker" class="hide">
												<option data-skin="no-skin" value="#438EB9">#438EB9</option>
												<option data-skin="skin-1" value="#222A2D">#222A2D</option>
												<option data-skin="skin-2" value="#C6487E">#C6487E</option>
												<option data-skin="skin-3" value="#D0D0D0">#D0D0D0</option>
											</select>
										</div>
										<span>&nbsp; Choose Skin</span>
									</div>

									<div class="ace-settings-item">
										<input type="checkbox" class="ace ace-checkbox-2 ace-save-state" id="ace-settings-navbar" autocomplete="off" />
										<label class="lbl" for="ace-settings-navbar"> Fixed Navbar</label>
									</div>

									<div class="ace-settings-item">
										<input type="checkbox" class="ace ace-checkbox-2 ace-save-state" id="ace-settings-sidebar" autocomplete="off" />
										<label class="lbl" for="ace-settings-sidebar"> Fixed Sidebar</label>
									</div>

									<div class="ace-settings-item">
										<input type="checkbox" class="ace ace-checkbox-2 ace-save-state" id="ace-settings-breadcrumbs" autocomplete="off" />
										<label class="lbl" for="ace-settings-breadcrumbs"> Fixed Breadcrumbs</label>
									</div>

									<div class="ace-settings-item">
										<input type="checkbox" class="ace ace-checkbox-2" id="ace-settings-rtl" autocomplete="off" />
										<label class="lbl" for="ace-settings-rtl"> Right To Left (rtl)</label>
									</div>

									<div class="ace-settings-item">
										<input type="checkbox" class="ace ace-checkbox-2 ace-save-state" id="ace-settings-add-container" autocomplete="off" />
										<label class="lbl" for="ace-settings-add-container">
											Inside
											<b>.container</b>
										</label>
									</div>
								</div><!-- /.pull-left -->

								<div class="pull-left width-50">
									<div class="ace-settings-item">
										<input type="checkbox" class="ace ace-checkbox-2" id="ace-settings-hover" autocomplete="off" />
										<label class="lbl" for="ace-settings-hover"> Submenu on Hover</label>
									</div>

									<div class="ace-settings-item">
										<input type="checkbox" class="ace ace-checkbox-2" id="ace-settings-compact" autocomplete="off" />
										<label class="lbl" for="ace-settings-compact"> Compact Sidebar</label>
									</div>

									<div class="ace-settings-item">
										<input type="checkbox" class="ace ace-checkbox-2" id="ace-settings-highlight" autocomplete="off" />
										<label class="lbl" for="ace-settings-highlight"> Alt. Active Item</label>
									</div>
								</div><!-- /.pull-left -->
							</div><!-- /.ace-settings-box -->
						</div><!-- /.ace-settings-container -->

						<div class="page-header">
							<h1>
								Gestionar Productos
								<small>
                                                                    <i class="ace-icon fa fa-angle-double-right"></i>
                                                                    Lista de Productos
                                                                </small>
                                                        </h1>
                                                </div><!-- /.page-header -->

                                                <div class="row">
                                                    <div class="col-xs-12">
                                                        <!-- PAGE CONTENT BEGINS -->
                                                        <!-- /.row -->

                                                        <div class="row">
                                                            <div class="col-xs-12">
                                                                <div class="table-header">
                                                                    Registro de Productos
                                                                </div>

                                                                <!-- div.table-responsive -->

                                                                <!-- div.dataTables_borderWrap -->
                                                                <div>
                                                                    <table id="dynamic-table" class="table table-striped table-bordered table-hover">
                                                                        <thead>
                                                                            <tr>
                                                                                <th>codigo de producto</th>
                                                                                <th>Imagen</th>
                                                                                <th class="hidden-480">Nombre</th>

                                                                                <th>
                                                                                    
                                                                                    Precio
                                                                                </th>
                                                                                <th>

                                                                                    Stock
                                                                                </th>

                                                                            </tr>
                                                                        </thead>
                                                                        <tbody>
                                                                            <% for (Producto producto : cp.getProductoList()) { %>
                                                                            <tr>
                                                                                <td><a href="#"><%= producto.getId() %></a></td>
                                                                                <td class="hidden-480"><img src="<%= producto.getImg() %>" alt="" width="75"></td>
                                                                                <td><%= producto.getNombre() %></td>
                                                                                <td><%= producto.getPrecio() %></td>
                                                                                <td><span class="label label-sm label-success"><%= producto.getStock() %></span></td>
                                                                                <td>
                                                                                    <div class="hidden-sm hidden-xs action-buttons">
                                                                                        <a class="blue" href="#" onclick="accionProducto(event, 'ver')">
                                                                                            <i class="ace-icon fa fa-search-plus bigger-130"></i>
                                                                                        </a>
                                                                                        <a class="green" href="#" onclick="accionProducto(event, 'editar')">
                                                                                            <i class="ace-icon fa fa-pencil bigger-130"></i>
                                                                                        </a>
                                                                                        <a class="red" href="#" onclick="accionProducto(event, 'eliminar')">
                                                                                            <i class="ace-icon fa fa-trash-o bigger-130"></i>
                                                                                        </a>
                                                                                    </div>
                                                                                    <div class="hidden-md hidden-lg">
                                                                                        <div class="inline pos-rel">
                                                                                            <button class="btn btn-minier btn-yellow dropdown-toggle" data-toggle="dropdown" data-position="auto">
                                                                                                <i class="ace-icon fa fa-caret-down icon-only bigger-120"></i>
                                                                                            </button>
                                                                                            <ul class="dropdown-menu dropdown-only-icon dropdown-yellow dropdown-menu-right dropdown-caret dropdown-close">
                                                                                                <li>
                                                                                                    
                                                                                                        
                                                                                                    
                                                                                                    <a href="#" class="tooltip-info" data-rel="tooltip" title="View" onclick="accionProducto(event, 'ver')">
                                                                                                        <span class="blue">
                                                                                                            <i class="ace-icon fa fa-search-plus bigger-120"></i>
                                                                                                        </span>
                                                                                                    </a>
                                                                                                    
                                                                                                </li>
                                                                                                <li>
                                                                                                    <a href="#" class="tooltip-success" data-rel="tooltip" title="Edit" onclick="accionProducto(event, 'editar')" >
                                                                                                        <span class="green">
                                                                                                            <i class="ace-icon fa fa-pencil-square-o bigger-120"></i>
                                                                                                        </span>
                                                                                                    </a>
                                                                                                </li>
                                                                                                <li>
                                                                                                    <a href="#" class="tooltip-error" data-rel="tooltip" title="Delete"  onclick="accionProducto(event, 'eliminar')" >
                                                                                                        <span class="red">
                                                                                                            <i class="ace-icon fa fa-trash-o bigger-120"></i>
                                                                                                        </span>
                                                                                                    </a>
                                                                                                </li>

                                                                                            </ul>
                                                                                        </div>
                                                                                    </div>
                                                                                </td>
                                                                            </tr>
                                                                            <% } %>
                                                                        </tbody>
                                                                    </table>
                                                                </div>
                                                                        <dialog id="dialogProducto">
                                                                            <div id="imagenDialogProducto">
                                                                                
                                                                            </div>
                                                                            <form action="#" class="form-horizontal">
                                                                                
                                                                                <label class="col-sm-3 control-label no-padding-right">
                                                                                     Nombre Producto
                                                                                 </label>
                                                                                <div class="col-sm-9 ">
                                                                                <input type="text" name="nombreProducto" id="nombreProducto">
                                                                                </div>
                                                                                <label class="col-sm-3 control-label no-padding-right">
                                                                                     Precio Producto
                                                                                 </label>
                                                                                <div class="col-sm-9 ">
                                                                                <input type="text" name="precioProducto" id="precioProducto">
                                                                                </div>
                                                                                <label class="col-sm-3 control-label no-padding-right">
                                                                                     Stock disponible
                                                                                 </label>
                                                                                <div class="col-sm-9 ">
                                                                                <input type="text" name="precioProducto" id="stockProducto">
                                                                                </div>
                                                                                <menu>
                                                                                    <button id="cancel" class="btn btn-sm btn-danger pull-left" data-dismiss="moda" onclick="cerrarDialogo()">
                                                                                        <i class="ace-icon fa fa-times">
                                                                                            cerrar
                                                                                        </i>
                                                                                    </button>
                                                                                
                                                                                <div id="botonDialog">
                                                                                    
                                                                                </div>
                                                                                </menu>
                                                                                
                                                                            </form>
                                                                        </dialog>

                                                                <div class="modal-footer no-margin-top">
                                                                    <button class="btn btn-sm btn-danger pull-left" data-dismiss="modal">
                                                                        <i class="ace-icon fa fa-times"></i>
                                                                        Close
                                                                    </button>

                                                                    <ul class="pagination pull-right no-margin">
                                                                        <li class="prev disabled">
                                                                            <a href="#">
                                                                                <i class="ace-icon fa fa-angle-double-left"></i>
                                                                            </a>
													</li>

													<li class="active">
														<a href="#">1</a>
													</li>

													<li>
														<a href="#">2</a>
													</li>

													<li>
														<a href="#">3</a>
													</li>

													<li class="next">
														<a href="#">
															<i class="ace-icon fa fa-angle-double-right"></i>
														</a>
													</li>
												</ul>
											</div>
										</div><!-- /.modal-content -->
									</div><!-- /.modal-dialog -->
								</div>

								<!-- PAGE CONTENT ENDS -->
							</div><!-- /.col -->
						</div><!-- /.row -->
					</div><!-- /.page-content -->
				</div>
			</div><!-- /.main-content -->

			<div class="footer">
				<div class="footer-inner">
					<div class="footer-content">
						<span class="bigger-120">
							Esdras Coapdo&copy; 2023
						</span>

						&nbsp; &nbsp;
						<span class="action-buttons">
							<a href="#">
								<i class="ace-icon fa fa-twitter-square light-blue bigger-150"></i>
							</a>

							<a href="#">
								<i class="ace-icon fa fa-facebook-square text-primary bigger-150"></i>
							</a>

							<a href="#">
								<i class="ace-icon fa fa-rss-square orange bigger-150"></i>
							</a>
						</span>
					</div>
				</div>
			</div>

			<a href="#" id="btn-scroll-up" class="btn-scroll-up btn btn-sm btn-inverse">
				<i class="ace-icon fa fa-angle-double-up icon-only bigger-110"></i>
			</a>
		

		<!-- basic scripts -->

		<!--[if !IE]> -->
		<script src="assets/js/jquery-2.1.4.min.js"></script>

		<!-- <![endif]-->

		<!--[if IE]>
<script src="assets/js/jquery-1.11.3.min.js"></script>
<![endif]-->
		<script type="text/javascript">
			if('ontouchstart' in document.documentElement) document.write("<script src='assets/js/jquery.mobile.custom.min.js'>"+"<"+"/script>");
		</script>
		<script src="assets/js/bootstrap.min.js"></script>

		<!-- page specific plugin scripts -->
		<script src="assets/js/jquery.dataTables.min.js"></script>
		<script src="assets/js/jquery.dataTables.bootstrap.min.js"></script>
		<script src="assets/js/dataTables.buttons.min.js"></script>
		<script src="assets/js/buttons.flash.min.js"></script>
		<script src="assets/js/buttons.html5.min.js"></script>
		<script src="assets/js/buttons.print.min.js"></script>
		<script src="assets/js/buttons.colVis.min.js"></script>
		<script src="assets/js/dataTables.select.min.js"></script>

		<!-- ace scripts -->
		<script src="assets/js/ace-elements.min.js"></script>
		<script src="assets/js/ace.min.js"></script>
                <script >
                    

function cerrarDialogo() {
var miDialogo = document.getElementById("dialogProducto");
var contenedorImg = document.getElementById("imagenDialogProducto");
var imagen = contenedorImg.querySelector("img"); // Selecciona la imagen dentro del contenedor

if (imagen) {
  contenedorImg.removeChild(imagen); // Elimina la imagen del contenedor
} else {
  console.log("La imagen no fue encontrada.");
}
var contenedor = document.getElementById("botonDialog");
    var botonAEliminar = contenedor.querySelector("button"); // Seleccionar el primer botón dentro del contenedor

    if (botonAEliminar) {
      contenedor.removeChild(botonAEliminar); // Eliminar el botón del contenedor
    } else {
      
    }
  miDialogo.close(); // Cierra el diálogo
}
    
  var id="";
  var nombre="";
  var stock="";
  var precio="";
  
  var img="";
  
function actualizarProducto(){
    var datos = {
      id: id,
      nombre: nombre,
      precio:precio,
      stock:stock
     // Agrega aquí los datos que deseas enviar al servlet
    };

    fetch('ControladorProducto', {
    method: 'PUT',
    headers: {
    'Content-Type': 'application/json' // Tipo de contenido, puede variar según el tipo de datos que envíes
    },
    body: JSON.stringify(datos) // Convierte los datos a formato JSON para enviarlos
    })
    
    .then(function(response) {
    if (response.ok) {
    // La petición PUT fue exitosa
    console.log("Petición PUT exitosa");
    // Puedes realizar más acciones aquí si la petición fue exitosa
    } else {
    // La petición PUT falló
    console.error("Error en la petición PUT");
    }
    })
    
    .catch(function(error) {
    // Manejo de errores de red u otros errores de la petición
    console.error("Error en la petición PUT:", error);
    });
  }
  function obtenerDatosInput(){
    nombre=document.getElementById("nombreProducto").value;
    precio=document.getElementById("precioProducto").value;
    stock=document.getElementById("stockProducto").value;
  }

  function actualizarDatos(event){
    event.preventDefault(); // Evita el comportamiento predeterminado del enlace
   // Accede a los datos de la fila (por ejemplo, el texto de las celdas)
   var fila = event.target.closest('tr'); // Encuentra la fila asociada al enlace
   var celdas = fila.getElementsByTagName('td'); // Obtiene las celdas de la fila
   id = celdas[0].innerText;
   nombre = celdas[2].innerText;
   precio = celdas[3].innerText;
   stock = celdas[4].innerText;
   img=fila.getElementsByTagName("img");
  }
  
  function accionProducto(event, accion) {
  
  
  actualizarDatos(event);
  var favDialog = document.getElementById("dialogProducto");
  
  var nombreProducto=document.getElementById("nombreProducto");
  var nombrePrecio=document.getElementById("precioProducto");
  var nombreStock=document.getElementById("stockProducto");
  


   imagenSRG=img[0].src;
  
  nombreProducto.value=nombre;
  nombrePrecio.value=precio;
  nombreStock.value=stock;
  
var imagen = document.createElement("img");
var contenedorImg = document.getElementById("imagenDialogProducto");
imagen.src = imagenSRG; // Asigna la ruta de la imagen al atributo src de la nueva imagen
imagen.width=400;
contenedorImg.appendChild(imagen);

  // Ejemplo de modificación: Cambiar el color de fondo de la fila
  

  // Aquí puedes realizar acciones adicionales según la acción seleccionada
  if (accion === 'ver') {
    // Lógica para mostrar detalles del producto
    
    favDialog.showModal();
  } else if (accion === 'editar') {
      
    var boton=document.createElement("button");
    boton.innerHTML="ACTUALIZAR";
    boton.classList.add("btn","btn-success");
    boton.style.marginLeft = "10px";
    
    boton.onclick = function() {
        obtenerDatosInput();
        actualizarProducto();
        location.reload();
  };

  // Seleccionamos el contenedor donde queremos añadir el botón
  var contenedor = document.getElementById("botonDialog");

  // Añadimos el botón al contenedor en el DOM
  contenedor.appendChild(boton);
  
    // Lógica para editar el producto
    favDialog.showModal();
  } else if (accion === 'eliminar') {
          var boton=document.createElement("button");
    boton.innerHTML="ELIMINAR";
    boton.classList.add("btn","btn-sm","btn-danger","pull-left");
    boton.style.marginLeft = "10px";
      boton.onclick = function() {
    alert("¡Has hecho clic en el botón creado con JavaScript! eliminar");
  };

  // Seleccionamos el contenedor donde queremos añadir el botón
  var contenedor = document.getElementById("botonDialog");

  // Añadimos el botón al contenedor en el DOM
  contenedor.appendChild(boton);
  
    // Lógica para eliminar el producto
    favDialog.showModal();
  }
}
                </script>
		<!-- inline scripts related to this page -->
		<script type="text/javascript">

			jQuery(function($) {
				//initiate dataTables plugin
				var myTable = 
				$('#dynamic-table')
				//.wrap("<div class='dataTables_borderWrap' />")   //if you are applying horizontal scrolling (sScrollX)
				.DataTable( {
					bAutoWidth: false,
					"aoColumns": [
					  { "bSortable": false },
					  null, null,null, null, null,
					  { "bSortable": false }
					],
					"aaSorting": [],
					
					
					//"bProcessing": true,
			        //"bServerSide": true,
			        //"sAjaxSource": "http://127.0.0.1/table.php"	,
			
					//,
					//"sScrollY": "200px",
					//"bPaginate": false,
			
					//"sScrollX": "100%",
					//"sScrollXInner": "120%",
					//"bScrollCollapse": true,
					//Note: if you are applying horizontal scrolling (sScrollX) on a ".table-bordered"
					//you may want to wrap the table inside a "div.dataTables_borderWrap" element
			
					//"iDisplayLength": 50
			
			
					select: {
						style: 'multi'
					}
			    } );
			
				
				
				$.fn.dataTable.Buttons.defaults.dom.container.className = 'dt-buttons btn-overlap btn-group btn-overlap';
				
				new $.fn.dataTable.Buttons( myTable, {
					buttons: [
					  {
						"extend": "colvis",
						"text": "<i class='fa fa-search bigger-110 blue'></i> <span class='hidden'>Show/hide columns</span>",
						"className": "btn btn-white btn-primary btn-bold",
						columns: ':not(:first):not(:last)'
					  },
					  {
						"extend": "copy",
						"text": "<i class='fa fa-copy bigger-110 pink'></i> <span class='hidden'>Copy to clipboard</span>",
						"className": "btn btn-white btn-primary btn-bold"
					  },
					  {
						"extend": "csv",
						"text": "<i class='fa fa-database bigger-110 orange'></i> <span class='hidden'>Export to CSV</span>",
						"className": "btn btn-white btn-primary btn-bold"
					  },
					  {
						"extend": "excel",
						"text": "<i class='fa fa-file-excel-o bigger-110 green'></i> <span class='hidden'>Export to Excel</span>",
						"className": "btn btn-white btn-primary btn-bold"
					  },
					  {
						"extend": "pdf",
						"text": "<i class='fa fa-file-pdf-o bigger-110 red'></i> <span class='hidden'>Export to PDF</span>",
						"className": "btn btn-white btn-primary btn-bold"
					  },
					  {
						"extend": "print",
						"text": "<i class='fa fa-print bigger-110 grey'></i> <span class='hidden'>Print</span>",
						"className": "btn btn-white btn-primary btn-bold",
						autoPrint: false,
						message: 'This print was produced using the Print button for DataTables'
					  }		  
					]
				} );
				myTable.buttons().container().appendTo( $('.tableTools-container') );
				
				//style the message box
				var defaultCopyAction = myTable.button(1).action();
				myTable.button(1).action(function (e, dt, button, config) {
					defaultCopyAction(e, dt, button, config);
					$('.dt-button-info').addClass('gritter-item-wrapper gritter-info gritter-center white');
				});
				
				
				var defaultColvisAction = myTable.button(0).action();
				myTable.button(0).action(function (e, dt, button, config) {
					
					defaultColvisAction(e, dt, button, config);
					
					
					if($('.dt-button-collection > .dropdown-menu').length == 0) {
						$('.dt-button-collection')
						.wrapInner('<ul class="dropdown-menu dropdown-light dropdown-caret dropdown-caret" />')
						.find('a').attr('href', '#').wrap("<li />")
					}
					$('.dt-button-collection').appendTo('.tableTools-container .dt-buttons')
				});
			
				////
			
				setTimeout(function() {
					$($('.tableTools-container')).find('a.dt-button').each(function() {
						var div = $(this).find(' > div').first();
						if(div.length == 1) div.tooltip({container: 'body', title: div.parent().text()});
						else $(this).tooltip({container: 'body', title: $(this).text()});
					});
				}, 500);
				
				
				
				
				
				myTable.on( 'select', function ( e, dt, type, index ) {
					if ( type === 'row' ) {
						$( myTable.row( index ).node() ).find('input:checkbox').prop('checked', true);
					}
				} );
				myTable.on( 'deselect', function ( e, dt, type, index ) {
					if ( type === 'row' ) {
						$( myTable.row( index ).node() ).find('input:checkbox').prop('checked', false);
					}
				} );
			
			
			
			
				/////////////////////////////////
				//table checkboxes
				$('th input[type=checkbox], td input[type=checkbox]').prop('checked', false);
				
				//select/deselect all rows according to table header checkbox
				$('#dynamic-table > thead > tr > th input[type=checkbox], #dynamic-table_wrapper input[type=checkbox]').eq(0).on('click', function(){
					var th_checked = this.checked;//checkbox inside "TH" table header
					
					$('#dynamic-table').find('tbody > tr').each(function(){
						var row = this;
						if(th_checked) myTable.row(row).select();
						else  myTable.row(row).deselect();
					});
				});
				
				//select/deselect a row when the checkbox is checked/unchecked
				$('#dynamic-table').on('click', 'td input[type=checkbox]' , function(){
					var row = $(this).closest('tr').get(0);
					if(this.checked) myTable.row(row).deselect();
					else myTable.row(row).select();
				});
			
			
			
				$(document).on('click', '#dynamic-table .dropdown-toggle', function(e) {
					e.stopImmediatePropagation();
					e.stopPropagation();
					e.preventDefault();
				});
				
				
				
				//And for the first simple table, which doesn't have TableTools or dataTables
				//select/deselect all rows according to table header checkbox
				var active_class = 'active';
				$('#simple-table > thead > tr > th input[type=checkbox]').eq(0).on('click', function(){
					var th_checked = this.checked;//checkbox inside "TH" table header
					
					$(this).closest('table').find('tbody > tr').each(function(){
						var row = this;
						if(th_checked) $(row).addClass(active_class).find('input[type=checkbox]').eq(0).prop('checked', true);
						else $(row).removeClass(active_class).find('input[type=checkbox]').eq(0).prop('checked', false);
					});
				});
				
				//select/deselect a row when the checkbox is checked/unchecked
				$('#simple-table').on('click', 'td input[type=checkbox]' , function(){
					var $row = $(this).closest('tr');
					if($row.is('.detail-row ')) return;
					if(this.checked) $row.addClass(active_class);
					else $row.removeClass(active_class);
				});
			
				
			
				/********************************/
				//add tooltip for small view action buttons in dropdown menu
				$('[data-rel="tooltip"]').tooltip({placement: tooltip_placement});
				
				//tooltip placement on right or left
				function tooltip_placement(context, source) {
					var $source = $(source);
					var $parent = $source.closest('table')
					var off1 = $parent.offset();
					var w1 = $parent.width();
			
					var off2 = $source.offset();
					//var w2 = $source.width();
			
					if( parseInt(off2.left) < parseInt(off1.left) + parseInt(w1 / 2) ) return 'right';
					return 'left';
				}
				
				
				
				
				/***************/
				$('.show-details-btn').on('click', function(e) {
					e.preventDefault();
					$(this).closest('tr').next().toggleClass('open');
					$(this).find(ace.vars['.icon']).toggleClass('fa-angle-double-down').toggleClass('fa-angle-double-up');
				});
				/***************/
				
				
				
				
				
				/**
				//add horizontal scrollbars to a simple table
				$('#simple-table').css({'width':'2000px', 'max-width': 'none'}).wrap('<div style="width: 1000px;" />').parent().ace_scroll(
				  {
					horizontal: true,
					styleClass: 'scroll-top scroll-dark scroll-visible',//show the scrollbars on top(default is bottom)
					size: 2000,
					mouseWheelLock: true
				  }
				).css('padding-top', '12px');
				*/
			
			
			})
		</script>
	</body>
</html>
