<%@page import="com.base.test.Utils.Utils"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>YOYO</title>

<spring:url value="/resources/core/css/lib/font-awesome.min.css"
	var="fontCss" />
<spring:url value="/resources/core/css/lib/bootstrap.min.css"
	var="bootstrapCss" />
<spring:url value="/resources/core/css/menu.css" var="menuCss" />
<spring:url value="/resources/core/css/style.css" var="styleCss" />
<spring:url value="/resources/core/css/lib/checkbox.css"
	var="checkboxCss" />
<spring:url value="/resources/core/css/lib/dataTables.bootstrap.min.css"
	var="dataTablesCss" />
<spring:url value="/resources/core/css/lib/bootstrap-treeview.css"
	var="treeViewCss" />
<spring:url value="/resources/core/css/lib/bootstrap-spinner.css"
	var="spinnerCss" />
<spring:url value="/resources/core/js/lib/jquery-1.9.1.min.js"
	var="jqueryJs" />
<spring:url value="/resources/core/js/lib/bootstrap.min.js"
	var="bootstrapJs" />

<link rel="stylesheet" href="${bootstrapCss}" />
<link rel="stylesheet" href="${fontCss}" />

<link rel="stylesheet" href="${menuCss}" />
<link rel="stylesheet" href="${styleCss}" />
<link rel="stylesheet" href="${checkboxCss}" />

<link rel="stylesheet" href="${dataTablesCss}" />
<link rel="stylesheet" href="${treeViewCss}" />
<link rel="stylesheet" href="${spinnerCss}" />

<script src="${jqueryJs}"></script>
<script src="${bootstrapJs}"></script>

</head>

<body>
	<%
		String sessionID = (String) session.getAttribute("sessionID");
		if (!Utils.checkSession(sessionID))
			response.sendRedirect("/Raptor");
	%>
	<div class="main">
		<header class="bg-img header inside">

			<div class="container-fluid">
				<div class="main-header" style="text-align: center;">
					<div class="jci-logo">
						<a href="index.html"><span
							style="color: white; font-size: 40px;">LOGO</span></a>
					</div>
					<div class="project-title hidden-xs hidden-sm hidden-md">
						YOYO Bar and Gril</div>
					<div class="pull-right logout-btn">
						<a href="logout" title="Logout" data-toggle="tooltip"
							data-placement="left" title="Logout"><i
							class="fa fa-power-off fa-lg fa-2x"></i></a>
					</div>
				</div>
				<div class="main-content">
					<div class="project-title mobile  hidden-lg">YOYO Bar and
						Grill</div>
					<div class="container-fluid main-container">
						<!--<div class="section-selection">
							<div class="form-inline form-horizontal">
								<div class="form-group">
									<label class="label">Section : </label> <select
										class="form-control sec-select">
										<option value="bar">Bar</option>
										<option value="lounge">Lounge</option>
										<option value="vip">VIP</option>
									</select>
								</div>
							</div>
						</div>-->
						<div class="box-content section-select-conetnt">
							<button class="btn btn-lg login-button active" data-show="bar">Bar</button>
							<button class="btn btn-lg login-button" data-show="lounge">Lounge</button>
							<button class="btn btn-lg login-button" data-show="vip">VIP</button>
						</div>
						

						<div class="row">
							<div class="col-sm-8">
								<div class="table-layout-section">
									<div class="label">Table Layout</div>
									<div class="table-layout-container bar">
										<c:forEach items="${model.allTables}" var="allTables">
											<c:if test="${allTables.type == 'Bar'}">
												<%-- <c:if test="${allTables.isActive == 1 }">
													<span class="table tableSelect ${isBarTableOccupied}" id="${allTables.id}" style="background-color:yellow" >
														<span class="table-header text-center">${allTables.tableNumber}</span>
														<span class="table-content"></span>
													</span>
												</c:if> --%>
												
												<c:choose>
													<c:when test="${allTables.isActive == 'true' }">
														<span class="table tableSelect occupied" id="${allTables.id}" >
															<span class="table-header text-center">${allTables.tableNumber}</span>
														<span class="table-content"></span>
													</span>
													</c:when>
													
													<c:otherwise>
														<span class="table tableSelect" id="${allTables.id}"  >
														<span class="table-header text-center">${allTables.tableNumber}</span>
														<span class="table-content"></span>
													</span>
													</c:otherwise>
													
												</c:choose>
												
												
											</c:if>
										</c:forEach>
									</div>
									<div class="table-layout-container lounge"
										style="display: none;">
										<c:forEach items="${model.allTables}" var="allTables">
											<c:if test="${allTables.type == 'Lounge'}">
												<span class="table"> <span
													class="table-header text-center">${allTables.tableNumber}</span>
													<span class="table-content"></span>
												</span>
											</c:if>
										</c:forEach>
									</div>
									<div class="table-layout-container vip" style="display: none;">
										<c:forEach items="${model.allTables}" var="allTables">
											<c:if test="${allTables.type == 'VIP'}">
												<span class="table"> <span
													class="table-header text-center">${allTables.tableNumber}</span>
													<span class="table-content"></span>
												</span>
											</c:if>
										</c:forEach>
									</div>
								</div>
							</div>
						
									
							
							<div class="col-sm-4">
								<div class="row">
									<div class="col-sm-12 padding-left-0">
										<div class="order-management box">
											<div class="box-header">Order Management</div>
											<div class="box-content">
												<button class="btn btn-lg login-button new-order"
													>New
													Order</button>
												<button class="btn btn-lg login-button edit-order"
													>Edit
													Order</button>
											</div>
										</div>
									</div>
									<div class="col-sm-12 padding-left-0">
										<div class="bill-management box">
											<div class="box-header">Bill Management</div>
											<div class="box-content">
												<button class="btn btn-lg login-button generate-bill">Generate
													Bill</button>
												<button class="btn btn-lg login-button settle-bill">Settle
													Bill</button>
													
												<button class="btn btn-lg login-button active-bills">Active Bills</button>	
												<a href="report" class="btn btn-lg login-button active-bills" >Report</a>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</header>
	</div>

	<!-- Modal -->
	<div id="newModal" class="modal fade newModal" role="dialog">
		<div class="modal-dialog modal-lg">

			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4 class="modal-title">New Order</h4>
				</div>
				<div class="modal-body">
					<div class="modal-top row">
						<div class="col-sm-6 modal-top-title">
							<span class="title">Section : </span> <span class="order-type">Bar</span>
						</div>
						<div class="col-sm-6 modal-top-title text-right">
							<span class="title">Table : </span> <span
								class="order-table newOrderTableNumber">B1</span>
						</div>
					</div>
					<div class="form-inline row person-count">
						<div class="col-sm-6">
							<label>Waiter Name : </label> <select
								class="form-control waiter-select">
								<c:forEach items="${model.allWaiter}" var="allWaiter">
									<option value="0">${allWaiter.firstName}</option>
								</c:forEach>
							</select>
						</div>
						<div class="col-sm-6 text-right">
							<label>No. Of Persons : </label>
							<div class="input-group spinner">
								<input type="text" class="form-control" value="1" min="0"
									max="250">
								<div class="input-group-btn-vertical">
									<button class="btn btn-default" type="button">
										<i class="fa fa-caret-up"></i>
									</button>
									<button class="btn btn-default" type="button">
										<i class="fa fa-caret-down"></i>
									</button>
								</div>
							</div>
						</div>
					</div>
					<div class="row modal-main-content">
						<div class="col-sm-6 tree-view">
							<div class="search-tree">
								<input type="text" class="form-control" id="searchTree"
									placeholder="Search..." />
							</div>
							<div id="tree"></div>
						</div>
						<div class="col-sm-6 order-table">
							<div class="table-responsive">
								<table id="mainTable"
									class="table table-striped table-bordered hover"
									cellspacing="0" width="100%">
									<thead>
										<tr>
											<th>Item</th>
											<th>Quantity</th>
											<th>Price</th>
											<th class="sort-hide">Delete</th>
										</tr>
									</thead>
									<tbody>
									</tbody>
								</table>
								<div class="text-right form-inline total-price">
									<label>Total : </label> <input type="text"
										class="form-control total-cost" value="0" disabled />
								</div>
								<div class="buttons text-center">
									<button class="btn btn-success give-order">Order</button>
									<button class="btn btn-danger discard-order">Abort</button>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-success settle-bill">Settle Bill</button>
				</div>
			</div>
		</div>
	</div>

	<div id="editModal" class="modal fade editModal" role="dialog">
		<div class="modal-dialog modal-lg">
			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4 class="modal-title">Edit Order</h4>
				</div>
				<div class="modal-body">
					<div class="modal-top row">
						<div class="col-sm-6 modal-top-title">
							<span class="title">Section : </span> <span class="order-type">Bar</span>
						</div>
						<div class="col-sm-6 modal-top-title text-right">
							<span class="title">Table : </span> <span
								class="order-table editOrderTableNumber">B1</span>
						</div>
					</div>
					<div class="form-inline row person-count">
						<div class="col-sm-6">
							<label>Waiter Name : </label> <select
								class="form-control waiter-select">
								<c:forEach items="${model.allWaiter}" var="allWaiter">
									<option value="0">${allWaiter.firstName}</option>
								</c:forEach>
							</select>
						</div>
						<div class="col-sm-6 text-right">
							<label>No. Of Persons : </label>
							<div class="input-group spinner">
								<input type="text" class="form-control" value="1" min="0"
									max="250">
								<div class="input-group-btn-vertical">
									<button class="btn btn-default" type="button">
										<i class="fa fa-caret-up"></i>
									</button>
									<button class="btn btn-default" type="button">
										<i class="fa fa-caret-down"></i>
									</button>
								</div>
							</div>
						</div>
					</div>
					<div class="row modal-main-content">
						<div class="col-sm-6 tree-view">
							<div class="search-tree">
								<input type="text" class="form-control" id="searchTree"
									placeholder="Search..." />
							</div>
							<div id="editTree"></div>
						</div>
						<div class="col-sm-6 order-table">
							<div class="table-responsive">
							<input type="hidden" value="" id="editBillID" />
								<table id="editMainTable"
									class="table table-striped table-bordered hover"
									cellspacing="0" width="100%">
									<thead>
										<tr>
											<th>Item</th>
											<th>Quantity</th>
											<th>Price</th>
											<th class="sort-hide">Delete</th>
										</tr>
									</thead>
									<tbody>
									</tbody>
								</table>
								<div class="text-right form-inline editOrdertotal">
									<label>Total : </label> <input type="text"
										class="form-control total-cost" value="0" disabled />
								</div>
								<div class="buttons text-center">
									<button class="btn btn-success add-order">Order</button>
									<button class="btn btn-danger discard-order">Abort</button>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-success settle-bill">Settle Bill</button>
				</div>
			</div>
		</div>
	</div>

	<!-- Modal -->
	<div id="billModal" class="modal fade" role="dialog">
		<div class="modal-dialog">

			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4 class="modal-title">Generate Bill</h4>
				</div>
				<div class="modal-body">
					<div class="modal-top row">
						<div class="col-sm-6 modal-top-title">
							<span class="title">Section : </span> <span class="order-type">Bar</span>
						</div>
						<div class="col-sm-6 modal-top-title text-right">
							<span class="title">Table : </span> <span
								class="section-order-table settleBillTableNumber">B1</span>
						</div>
					</div>
					<div class="row">
						<div class="col-sm-12 order-table">
							<div class="table-responsive">
							<input type="hidden" value="" id="settleBillID" />
								<table id="billMainTable"
									class="table table-striped table-bordered hover"
									cellspacing="0" width="100%">
									<thead>
										<tr>
											<th>Item</th>
											<th>Quantity</th>
											<th>Price</th>
										</tr>
									</thead>
									<tbody>
									</tbody>
								</table>
								<div class="text-right form-inline settleBilltotal">
									<label>Total : </label> <input type="text"
										class="form-control bill-total-cost" value="900" disabled />
								</div>
							</div>
						</div>
					</div>
					<div class="row payement-options">
						<div class="form-inline col-sm-8">
							<label>Payment By : <label> <select
									class="form-control payment-option">
										<option value="0">Debit Card</option>
										<option value="1">Credit Card</option>
										<option value="2">Cash</option>
										<option value="3">YOYO Club Card</option>
								</select>
						</div>
					</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-success save-settle-bill"
						data-dismiss="modal">Save</button>
					<button type="button" class="btn btn-primary print-bill"
						data-dismiss="modal">Print</button>
					<!--<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>-->
				</div>
			</div>
		</div>
	</div>
	
	<div id="activeBills" class="modal fade" role="dialog">
	  <div class="modal-dialog">

		<!-- Modal content-->
		<div class="modal-content">
		  <div class="modal-header">
			<button type="button" class="close" data-dismiss="modal">&times;</button>
			<h4 class="modal-title">Active Bills</h4>
		  </div>
		  <div class="modal-body">
			<div class="row">
				<div class="col-sm-12 order-table">
					<div class="table-responsive">
						<table id="activebillsTable" class="table table-striped table-bordered hover" cellspacing="0" width="100%">
							<thead>
								<tr>
									<th>Table</th>
									<th>Section</th>
									<th>Amount</th>
									<th>Action</th>
								</tr>
							</thead>
								
							<tbody>
								<tr>
									<td>B1</td>
									<td>Bar</td>
									<td>1200</td>
									<td><button type="button" class="btn btn-success settle-active-bill">Settle Bill</button></td>
									
								</tr>
								<tr>
									<td>B1</td>
									<td>Bar</td>
									<td>1200</td>
									<td><button type="button" class="btn btn-success settle-active-bill">Settle Bill</button></td>
									
								</tr>
								<tr>
									<td>B1</td>
									<td>Bar</td>
									<td>1200</td>
									<td><button type="button" class="btn btn-success settle-active-bill">Settle Bill</button></td>
									
								</tr>
								<tr>
									<td>B1</td>
									<td>Bar</td>
									<td>1200</td>
									<td><button type="button" class="btn btn-success settle-active-bill">Settle Bill</button></td>
								</tr>
								<tr>
									<td>B1</td>
									<td>Bar</td>
									<td>1200</td>
									<td><button type="button" class="btn btn-success settle-active-bill">Settle Bill</button></td>
								</tr>
								<tr>
									<td>B1</td>
									<td>Bar</td>
									<td>1200</td>
									<td><button type="button" class="btn btn-success settle-active-bill">Settle Bill</button></td>
								</tr>
							</tbody>
						</table>
					</div>
				</div>
			</div>
		  </div>
		  <!--<div class="modal-footer">
			<button type="button" class="btn btn-success settle-bill">Settle Bill</button>
		  </div>-->
		</div>

	  </div>
	</div>
	
	
	<div class="menu-overlay"></div>
</body>
</html>

<spring:url value="/resources/core/js/lib/jquery.nicescroll.js"
	var="nicescrollJs" />
<spring:url value="/resources/core/js/lib/bootstrap-treeview.js"
	var="treeviewJs" />
<spring:url value="/resources/core/js/lib/jquery.dataTables.min.js"
	var="dataTableJs" />
<spring:url value="/resources/core/js/lib/dataTables.bootstrap.min.js"
	var="dataBootJs" />

<script src="${nicescrollJs}"></script>
<script src="${treeviewJs}"></script>
<script src="${dataTableJs}"></script>
<script src="${dataBootJs}"></script>

<script>
	$('.bg-img').css("min-height", $(window).height() + "px");
	$(window).resize(function() {
		$('.bg-img').css("min-height", $(window).height() + "px");
	});

	/*$('.sec-select').change(
			function() {
				var section = $(".sec-select option:selected").val();
				if (section == "bar") {
					$('.table-layout-container.bar').siblings(
							'.table-layout-container').fadeOut(
							"slow",
							function() {
								setTimeout(function() {
									$('.table-layout-container.bar').fadeIn(
											"slow");
								}, 600)
							})
				} else if (section == "lounge") {
					$('.table-layout-container.lounge').siblings(
							'.table-layout-container').fadeOut(
							"slow",
							function() {
								setTimeout(function() {
									$('.table-layout-container.lounge').fadeIn(
											"slow");
								}, 600)
							})
				} else
					$('.table-layout-container.vip').siblings(
							'.table-layout-container').fadeOut(
							"slow",
							function() {
								setTimeout(function() {
									$('.table-layout-container.vip').fadeIn(
											"slow");
								}, 600)
							})
			});*/
			
$(document).on('click','.section-select-conetnt .btn',function(){
	var section = $(this).attr('data-show');
	
	$(this).siblings().removeClass('active');
	$(this).addClass('active');
	
	if(section == "bar"){
		$('.table-layout-container.bar').siblings('.table-layout-container').fadeOut("slow",function(){
			setTimeout(function(){
				$('.table-layout-container.bar').fadeIn("slow");
			},600)
			
		})
	}
	else if(section == "lounge"){
		$('.table-layout-container.lounge').siblings('.table-layout-container').fadeOut("slow",function(){
			setTimeout(function(){
				$('.table-layout-container.lounge').fadeIn("slow");
			},600)
		})
	}
	else
		$('.table-layout-container.vip').siblings('.table-layout-container').fadeOut("slow",function(){
			setTimeout(function(){
				$('.table-layout-container.vip').fadeIn("slow");
			},600)
		})
	
	
});			

	var treeData = [ {
		text : "Food Menu",
		nodes : [ {
			text : "Veg",
			nodes : [
				<c:forEach items="${model.allFoodMenu}" var="allFoodMenu">
					<c:if test="${allFoodMenu.veg == 'true'}">
						{
							text : "${allFoodMenu.itemName}",
							tags : [${allFoodMenu.cost}]
						},
					</c:if>
				</c:forEach>
			]
		}, {
			text : "Non Veg",
			nodes : [ 
				<c:forEach items="${model.allFoodMenu}" var="allFoodMenu">
					<c:if test="${allFoodMenu.veg == 'false'}">
						{
							text : "${allFoodMenu.itemName}",
							tags : [${allFoodMenu.cost}]
						},
					</c:if>
				</c:forEach>
			]
		} ]
	}, {
		text : "Bar Mneu",
		nodes : [ {
			text : "Special",
			nodes : [ 
				<c:forEach items="${model.allBarMenu}" var="allBarMenu">
					{
						text : "${allBarMenu.itemName}",
						tags : [${allBarMenu.cost}]
					},
				</c:forEach>	
			]
		}]
	} ];

	/*** new code *********/

	$('.generate-bill').on('click', function() {
		//var section = $('.sec-select').val();
	
		var section = $('.section-select-conetnt .btn.active').attr('data-show');
		
		if($('.'+section).find('.occupied.selected').length > 0){
			$('#bill .order-type').html(section.toUpperCase());
			var table_no = $('.'+section).find('.occupied.selected').attr('data-table-no');
			$('#bill .section-order-table').html(table_no);
			$('.payement-options').hide();
			$('.save-settle-bill').hide();
			$('.print-bill').show();
			$('.yoyo-card-payment-details').hide();
			$('#bill').modal('show');
			
		}
		else
			alert('Please select occupied table');
	});

	$('.settle-bill').on('click', function() {
		$('#billMainTable tbody').html('');
		$('#billModal .total-cost').val('0');
    	var tableNumber = $('.settleBillTableNumber').text();
    	var data = {
	    		"tableNumber":tableNumber
	    	};
    	$.ajax({
            url: 'getOrder',
            data: tableNumber,
            type: "POST",           
            beforeSend: function(xhr) {
                xhr.setRequestHeader("Accept", "application/json");
                xhr.setRequestHeader("Content-Type", "application/json");
            },
            success: function(data){
            	alert(JSON.stringify(data));
                for (var i = 0; i < data.orders.length; i++) {
                	var id = data.orders[i].id;
                	var item = data.orders[i].orderItem;
					var price = data.orders[i].cost;
					var quantity = data.orders[i].quantity;
					var className = (item).replace(/ /g, '-');
	                var tr = "";
					tr = '<tr id="'+id+'"class="'+className+'" data-unit-price="'+price+'"><td class="orderItem">'
							+ item
							+ '</td>'
							+ '<td>'
							+ '<div class="input-group spinner">'
							+ '<input type="text" class="form-control quantity-value" value="'+quantity+'" min="0" max="100">'
							+ '<div class="input-group-btn-vertical">'
							+ '<button class="btn btn-default" type="button"><i class="fa fa-caret-up"></i></button>'
							+ '<button class="btn btn-default" type="button"><i class="fa fa-caret-down"></i></button>'
							+ '</div>'
							+ '</div>'
							+ '</td>'
							+ '<td class="total-row-price">'
							+ price
							+ '</td></tr>';

					$('#billMainTable tbody').append(tr);
					$('#settleBillID').val(data.id);
					$('.settleBilltotal').find('input').val(data.amount);
					$('#billModal').modal('show');
				}
            },
            error: function(xhr, textStatus, errorThrown){
                alert('request failed');
                return false;
            }
        });

	});
	
	$('.active-bills').on('click',function(){
		$('#activeBills').modal('show');
	});
	
	/*$(document).on('click','#activeBills .settle-active-bill',function({
		$('#activeBills').modal('hide');
		$('#bill').modal('show');
	});*/
	
	$('#activeBills .settle-active-bill').on('click',function(){
		$('#activeBills').modal('hide');
		$('#bill').modal('show');
	})
	
	/****** code to occupy table ****/

	/*$(document).on('click','.occupied',function(){
		$(this).toggleClass('selected');
	});*/

	$(document).on('click','.table-layout-container .table,.lounge-box,.vip-box',function(){
		$(this).siblings().removeClass('selected');
		if(!$(this).hasClass('selected'))
			$(this).addClass('selected');
		else
			//alert('Table is already occupied & order is already placed.');
			$(this).removeClass('selected');
	});
	
	$('#newModal').on('hidden.bs.modal', function () {
		//var section = $('.sec-select').val();
		var section = $('.section-select-conetnt .btn.active').attr('data-show');
		$('.'+section).find('.occupied.selected').toggleClass('selected');
		$('.'+section).find('.selected').removeClass('selected');
		location.reload(true);
	})
	
	$('#editModal').on('hidden.bs.modal', function () {
		//var section = $('.sec-select').val();
		var section = $('.section-select-conetnt .btn.active').attr('data-show');
		$('.'+section).find('.occupied.selected').toggleClass('selected');
		$('.'+section).find('.selected').removeClass('selected');
		location.reload(true);
	})
	
	

	$('#bill').on('hidden.bs.modal', function () {
		//var section = $('.sec-select').val();
		var section = $('.section-select-conetnt .btn.active').attr('data-show');
		$('.'+section).find('.occupied.selected').toggleClass('selected');
		$('.'+section).find('.selected').removeClass('selected');
		location.reload(true);
	})

	$(document)
			.on(
					'click',
					'.spinner .btn:first-of-type',
					function() {
						var btn = $(this);
						var input = btn.closest('.spinner').find('input');
						if (input.attr('max') == undefined
								|| parseInt(input.val()) < parseInt(input
										.attr('max'))) {
							input.val(parseInt(input.val(), 10) + 1);
						} else {
							btn.next("disabled", true);
						}
						var row = $(this).closest('tr');
						fnChangeRowPrice(row, parseInt(input.val()));
					});

	$(document)
			.on(
					'click',
					'.spinner .btn:last-of-type',
					function() {
						var btn = $(this);
						var input = btn.closest('.spinner').find('input');
						if (input.attr('min') == undefined
								|| parseInt(input.val()) > parseInt(input
										.attr('min'))) {
							input.val(parseInt(input.val(), 10) - 1);
						} else {
							btn.prev("disabled", true);
						}
						var row = $(this).closest('tr');
						fnChangeRowPrice(row, parseInt(input.val()));
					});

	$(document).on(
			'click',
			'.delete-item',
			function() {
				var row = $(this).closest('tr');
				$(row).remove();
				if ($('#mainTable tbody tr').length == 0) {
					$('.check-icon').each(
							function() {
								$(this).removeClass('glyphicon-check')
										.addClass('glyphicon-unchecked');
							})
				}
				var item = $(this).closest('tr').attr('class').replace(/-/g,
						' ');
				$('.node-tree').each(
						function() {
							var text = $(this).contents().filter(function() {
								return this.nodeType == Node.TEXT_NODE;
							}).text();

							if (text == item)
								$(this).find('.check-icon').removeClass(
										'glyphicon-check').addClass(
										'glyphicon-unchecked');
						})
				
				fnCalculateTotalPrice();
			});

	$(document).on(
			'click',
			'.discard-order',
			function() {
				$('#mainTable tbody').html('');
				if ($('#mainTable tbody tr').length == 0) {
					$('.check-icon').each(
							function() {
								$(this).removeClass('glyphicon-check')
										.addClass('glyphicon-unchecked');
							})
				}
				$('.total-cost').val('0');
			});

	$(document).on('change', '.quantity-value', function() {
		var row = $(this).closest('tr');
		var val = $(row).find('.quantity-value').val();
		fnChangeRowPrice(row);
	});

	function fnChangeRowPrice(row, val) {
		var totalRowPrice = "";
		var unitPrice = $(row).attr('data-unit-price');
		totalRowPrice = unitPrice * val;
		$(row).find('.total-row-price').text(totalRowPrice);
		fnCalculateTotalPrice();
	}
	
	function fnCalculateTotalPrice() {
		var tableRows = $('#mainTable tbody tr');
		var totalPrice = 0;
		for (var i = 0; i < tableRows.length; i++) {
			var row = tableRows[i];
			var rowTotalPrice = $(row).find('.total-row-price').text();
			totalPrice += parseInt(rowTotalPrice);
		}
		$('.total-cost').val(totalPrice);
	}

	/*function fnCalculateTotalPrice(mode) {
		if (mode = 'New')
			{
			var tableRows = $('#mainTable tbody tr');
			var totalPrice = 0;
			for (var i = 0; i < tableRows.length; i++) {
				var row = tableRows[i];
				var rowTotalPrice = $(row).find('.total-row-price').text();
				totalPrice += parseInt(rowTotalPrice);
			}
			$('.total-cost').val(totalPrice);
			}
		else if (mode = 'Edit')
			{
			var tableRows = $('#editMainTable tbody tr');
			var totalPrice = 0;
			for (var i = 0; i < tableRows.length; i++) {
				var row = tableRows[i];
				var rowTotalPrice = $(row).find('.total-row-price').text();
				totalPrice += parseInt(rowTotalPrice);
			}
			$('.editOrdertotal').find('input').val(totalPrice);
			
			}
		
	}*/
	

	$('#searchTree').on('keyup', search);

	var tree = $('#tree')
			.treeview(
					{
						showTags : true, //newly added for tags as price
						data : treeData,
						onhoverColor : "#eee",
						showCheckbox : true,
						showIcon : true,
						selectable : true,
						onNodeChecked : function(event, node) {
							if (node.nodes == undefined) {
								var item = node.text;
								var price = node.tags[0];
								var className = (item).replace(/ /g, '-');
								var tr = "";
								tr = '<tr class="'+className+'" data-unit-price="'+price+'"><td class="orderItem">'
										+ item
										+ '</td>'
										+ '<td>'
										+ '<div class="input-group spinner">'
										+ '<input type="text" class="form-control quantity-value" value="1" min="0" max="100">'
										+ '<div class="input-group-btn-vertical">'
										+ '<button class="btn btn-default" type="button"><i class="fa fa-caret-up"></i></button>'
										+ '<button class="btn btn-default" type="button"><i class="fa fa-caret-down"></i></button>'
										+ '</div>'
										+ '</div>'
										+ '</td>'
										+ '<td class="total-row-price">'
										+ price
										+ '</td>'
										+ '<td><a href="#" class="delete-item"><i class="fa fa-trash fa-lg"></i></a></td></tr>';

								$('#mainTable tbody').append(tr);
								fnCalculateTotalPrice();
							}
						},
						onNodeUnchecked : function(event, node) {
							console.log(node);
							if (node.nodes == undefined) {
								var item = node.text;
								var price = node.tags[0];
								var className = (item).replace(/ /g, '-');
								$('.' + className).remove();
								fnCalculateTotalPrice();
							}
						}
					});
	
	var tree = $('#editTree')
			.treeview(
					{
						showTags : true, //newly added for tags as price
						data : treeData,
						onhoverColor : "#eee",
						showCheckbox : true,
						showIcon : true,
						selectable : true,
						onNodeChecked : function(event, node) {
							if (node.nodes == undefined) {
								var item = node.text;
								var price = node.tags[0];
								var className = (item).replace(/ /g, '-');
								var tr = "";
								tr = '<tr class="'+className+'" data-unit-price="'+price+'"><td class="orderItem">'
										+ item
										+ '</td>'
										+ '<td>'
										+ '<div class="input-group spinner">'
										+ '<input type="text" class="form-control quantity-value" value="1" min="0" max="100">'
										+ '<div class="input-group-btn-vertical">'
										+ '<button class="btn btn-default" type="button"><i class="fa fa-caret-up"></i></button>'
										+ '<button class="btn btn-default" type="button"><i class="fa fa-caret-down"></i></button>'
										+ '</div>'
										+ '</div>'
										+ '</td>'
										+ '<td class="total-row-price">'
										+ price
										+ '</td>'
										+ '<td><a href="#" class="delete-item"><i class="fa fa-trash fa-lg"></i></a></td></tr>';
		
								$('#editMainTable tbody').append(tr);
								//fnCalculateTotalPrice();
								var tableRows = $('#editMainTable tbody tr');
								var totalPrice = 0;
								for (var i = 0; i < tableRows.length; i++) {
									var row = tableRows[i];
									var rowTotalPrice = $(row).find('.total-row-price').text();
									totalPrice += parseInt(rowTotalPrice);
								}
								$('.editOrdertotal').find('input').val(totalPrice);
							}
						},
						onNodeUnchecked : function(event, node) {
							console.log(node);
							if (node.nodes == undefined) {
								var item = node.text;
								var price = node.tags[0];
								var className = (item).replace(/ /g, '-');
								$('.' + className).remove();
								fnCalculateTotalPrice();
							}
						}
					});
	
	$(document).ready(function () {
	    $(document).on('click', '.give-order', function () {
	    	var tableNumber = $('.newOrderTableNumber').text();
	    	var totalAmount = $('.total-cost').val();
	    	var data = {
		    		"tableNumber":tableNumber,
		    	 	"amount":totalAmount,
		    	    "totalAmount":totalAmount,
		    	    "isActive":"true"
		    	};
	    	data.orders = [];
	    	$('#mainTable tbody tr').each(function() {
	    		  $this = $(this)
	    		  var orderItem = $this.find("td.orderItem").html();
	    		  var quantity = $this.find('.spinner').find('input').val();
	    		  var cost = $this.find("td.total-row-price").html();
	    		  data.orders.push({"orderItem":orderItem,
	    			 	"cost":cost,
	        			"quantity":quantity,
	        			"type":"Food",
	        			"kot":"false"	
	    			  }	);
	    	});
	    	alert(JSON.stringify(data));
	    	
	    	$.ajax({
	            url: 'saveOrder',
	            data: JSON.stringify(data),
	            type: "POST",           
	            beforeSend: function(xhr) {
	                xhr.setRequestHeader("Accept", "application/json");
	                xhr.setRequestHeader("Content-Type", "application/json");
	            },
	            success: function(data){ 
	                alert(JSON.stringify(data));
	            }
	        });
	        return true;
	    });
	}); 
	
	$(document).ready(function () {
	    $(document).on('click', '.add-order', function () {
	    	var billID = $('#editBillID').val();
	    	var tableNumber = $('.editOrderTableNumber').text();
	    	var totalAmount = $('.editOrdertotal').find('input').val();
	    	var data = {
	    			"id":billID,
		    		"tableNumber":tableNumber,
		    	 	"amount":totalAmount,
		    	    "totalAmount":totalAmount,
		    	    "isActive":"true"
		    	};
	    	data.orders = [];
	    	$('#editMainTable tbody tr').each(function() {
	    		  $this = $(this);
	    		  var orderID = $this.attr('id');
	    		  var orderItem = $this.find("td.orderItem").html();
	    		  var quantity = $this.find('.spinner').find('input').val();
	    		  var cost = $this.find("td.total-row-price").html();
	    		  data.orders.push({
	    			  	"id":orderID,
	    			  	"orderItem":orderItem,
	    			 	"cost":cost,
	        			"quantity":quantity,
	        			"type":"Food",
	        			"kot":"false"	
	    			  }	);
	    	});
	    	alert(JSON.stringify(data));
	    	
	    	$.ajax({
	            url: 'editOrder',
	            data: JSON.stringify(data),
	            type: "POST",           
	            beforeSend: function(xhr) {
	                xhr.setRequestHeader("Accept", "application/json");
	                xhr.setRequestHeader("Content-Type", "application/json");
	            },
	            success: function(data){ 
	                alert(JSON.stringify(data));
	            }
	        });
	        return true;
	    });
	}); 
	
	$(document).ready(function () {
	    $(document).on('click', '.save-settle-bill', function () {
	    	var billID = $('#settleBillID').val();
	    	var tableNumber = $('.settleBillTableNumber').text();
	    	var totalAmount = $('.settleBilltotal').find('input').val();
	    	var paymentMode = $('.payment-option option:selected').text();
	    	var data = {
	    			"id":billID,
		    		"tableNumber":tableNumber,
		    	 	"amount":totalAmount,
		    	    "totalAmount":totalAmount,
		    	    "paymentMode":paymentMode,
		    	    "isActive":"false"
		    	};
	    	data.orders = [];
	    	$('#billMainTable tbody tr').each(function() {
	    		  $this = $(this);
	    		  var orderID = $this.attr('id');
	    		  var orderItem = $this.find("td.orderItem").html();
	    		  var quantity = $this.find('.spinner').find('input').val();
	    		  var cost = $this.find("td.total-row-price").html();
	    		  data.orders.push({
	    			  	"id":orderID,
	    			  	"orderItem":orderItem,
	    			 	"cost":cost,
	        			"quantity":quantity,
	        			"type":"Food",
	        			"kot":"false"	
	    			  }	);
	    	});
	    	alert(JSON.stringify(data));
	    	$.ajax({
	            url: 'editOrder',
	            data: JSON.stringify(data),
	            type: "POST",           
	            beforeSend: function(xhr) {
	                xhr.setRequestHeader("Accept", "application/json");
	                xhr.setRequestHeader("Content-Type", "application/json");
	            },
	            success: function(data){ 
	                alert(JSON.stringify(data));
	            },
	            error: function(xhr, textStatus, errorThrown){
	                alert('request failed');
	                return false;
	            }
	        });
	        return true;
	    });
	}); 

	function search() {
		var pattern = $('#searchTree').val();
		var options = {
		};
		var results = tree.treeview('search', [ pattern, options ]);
	}
	
	$( "div" ).data( "tables", 
			{ 
				<c:forEach items="${model.allTables}" var="allTables">
					${allTables.id}: {tableNumber: "${allTables.tableNumber}", type: "${allTables.type}"},
				</c:forEach>
			}
	);
	
	$(document).ready(function () {
	    $(document).on('click', '.tableSelect', function () {
	        var tableid = $(this).attr('id');
	        $.each($( "div" ).data( "tables" ), function(key, item){
	            if(key == tableid){
	            	$('.newOrderTableNumber').text(item.tableNumber);
	            	$('.editOrderTableNumber').text(item.tableNumber);
	            	$('.settleBillTableNumber').text(item.tableNumber);
	            }
	        });
	        return true;
	    });
	}); 
	
	$(document).ready(function () {
		$('.new-order').on('click',function(){
			//var section = $('.sec-select').val();
			
			var section = $('.section-select-conetnt .btn.active').attr('data-show');
			
			if($('.'+section).find('.selected').length > 0){
				if($('.'+section).find('.selected').hasClass('occupied')){
					alert('Order already placed.Please click on Edit Order');
					$('.'+section).find('.selected').removeClass('selected');
					return;
				}
				$('#newModal .order-type').html(section.toUpperCase());
				var table_no = $('.'+section).find('.occupied.selected').attr('data-table-no');
				$('#newModal .modal-top-title .order-table').text(table_no);
				$('#newModal #mainTable tbody').html('');
				$('#newModal .total-cost').val('0');
				$('#newModal').modal('show');
			}
			else{
				alert('Please select the table');
				$('.'+section).find('.selected').removeClass('selected');
			}

		});
	});
	
	$(document).on('click', '.edit-order', function () {
		$('#editMainTable tbody').html('');
		$('#editModal .total-cost').val('0');
    	var tableNumber = $('.editOrderTableNumber').text();
    	var data = {
	    		"tableNumber":tableNumber
	    	};
    	//alert(JSON.stringify(data));
    	
    	$.ajax({
            url: 'getOrder',
            data: tableNumber,
            type: "POST",           
            beforeSend: function(xhr) {
                xhr.setRequestHeader("Accept", "application/json");
                xhr.setRequestHeader("Content-Type", "application/json");
            },
            success: function(data){ 
                //alert(JSON.stringify(data));
                for (var i = 0; i < data.orders.length; i++) {
                	var id = data.orders[i].id;
                	var item = data.orders[i].orderItem;
					var price = data.orders[i].cost;
					var quantity = data.orders[i].quantity;
					var className = (item).replace(/ /g, '-');
	                var tr = "";
	                tr = '<tr id="'+id+'"class="'+className+'" data-unit-price="'+price+'"><td class="orderItem">'
							+ item
							+ '</td>'
							+ '<td>'
							+ '<div class="input-group spinner">'
							+ '<input type="text" class="form-control quantity-value" value="'+quantity+'" min="0" max="100">'
							+ '<div class="input-group-btn-vertical">'
							+ '<button class="btn btn-default" type="button"><i class="fa fa-caret-up"></i></button>'
							+ '<button class="btn btn-default" type="button"><i class="fa fa-caret-down"></i></button>'
							+ '</div>'
							+ '</div>'
							+ '</td>'
							+ '<td class="total-row-price">'
							+ price
							+ '</td>'
							+ '<td><a href="#" class="delete-item"><i class="fa fa-trash fa-lg"></i></a></td></tr>';

					$('#editMainTable tbody').append(tr);
				}
                $('#editBillID').val(data.id);
				$('#editModal').modal('show');
                $('.editOrdertotal').find('input').val(data.amount);
            },
            error: function(xhr, textStatus, errorThrown){
                alert('request failed');
                return false;
            }
        });
    });

</script>