<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>


<%@include file="../includes/header.jsp"%>
<div class="row">
	<div class="col-lg-12">
		<h1 class="page-header">Tables</h1>
	</div>
	<!-- /.col-lg-12 -->
</div>
<!-- /.row -->
<div class="row">
	<div class="col-lg-12">
		<div class="panel panel-default">
			<div class="panel-heading">DataTables Advanced Tables
			<button id='regBtn' type="button" class="btn btn-xs pull-right">
				Register New Board</button>
			</div>
			<div class="panel-body">
				<table width="100%"
					class="table table-striped table-bordered table-hover">
					<thead>
						<tr>
							<th>BNO</th>
							<th>Title</th>
							<th>Writer</th>
							<th>RegDate</th>
							<th>UpdateDate</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${list}" var="board">
							<tr class="odd gradeX">
								<td>${board.bno}</td>
								<td><a href='/board/get?bno=<c:out value="${board.bno}"/>'>
								<c:out value="${board.title}"/>
								</a>
								</td>
								<td>${board.writer}</td>
								<td><fmt:formatDate pattern="yyy-MM-dd"
										value="${board.regdate}" /></td>
								<td><fmt:formatDate pattern="yyy-MM-dd"
										value="${board.updateDate}" /></td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
				<!-- /.table-responsive -->

			</div>
			<!-- /.row -->

		<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
				aria-labelledby="myModalLabel" aria-hidden="true">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal"
								aria-hidden="true">&times;</button>
							<h4 class="modal-title" id="myModalLabel">Modal title</h4>
						</div>
						<div class="modal-body">처리가 완료되었습니다.</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-default"
								data-dismiss="modal">Close</button>
						</div>
					</div>
				</div>
			</div>


<script type="text/javascript">
$(document).ready(function(){
	var result = '<c:out value="${result}"/>';

	checkModal(result);
	
	history.replaceState({}, null, null);
	
	function checkModal(result) {
		
		if(result ==='' || history.state){
			return;
		}
		if(parseInt(result) > 0) {
			$(".modal-body").html(
			"게시글 " + parseInt(result) + " 번이 등록되었습니다. ");		
		}
			$("#myModal").modal("show");
		}

	$("#regBtn").on("click",(function() {
		self.location = "/board/register";
	});
});

</script>

			<%@include file="../includes/footer.jsp"%>