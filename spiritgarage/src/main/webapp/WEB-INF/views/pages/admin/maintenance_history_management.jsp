<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<script src="/js/admin/maintenance_history_management.js"></script>

<style type="text/css">
#maintenance_history_list tr{cursor:pointer;}
</style>

<div class="content-wrapper">
	<section class="content-header">
		<div class="container-fluid">
			<div class="row mb-2">
				<div class="col-sm-6">
					<h1>정비이력 관리</h1>
				</div>
				<div class="col-sm-6">
					<ol class="breadcrumb float-sm-right">
						<li class="breadcrumb-item">ADMIN</li>
						<li class="breadcrumb-item">정비이력 관리</li>
					</ol>
				</div>
			</div>
		</div>
	</section>

	<section class="content">
		<div class="row mb-2" id="searchDiv">
			<div class="col-md-3">
				<div class="input-group mb-3">
					<div class="input-group-prepend">
						<span class="input-group-text">이름</span>
					</div>
					<input type="text" class="form-control" id="searchName">
				</div>
			</div>
			<div class="col-md-3">
				<div class="input-group mb-3">
					<div class="input-group-prepend">
						<span class="input-group-text">연락처</span>
					</div>
					<input type="text" class="form-control" id="searchPhone">
				</div>
			</div>
			<div class="col-md-3">
				<div class="input-group mb-3">
					<div class="input-group-prepend">
						<span class="input-group-text">차량등록번호</span>
					</div>
					<input type="text" class="form-control" id="searchCarRegNum">
				</div>
			</div>
			<div class="col-md-1">
				<button type="button" class="btn btn-block btn-primary" id="searchBtn">검색</button>
			</div>
			<div class="col-md-1">
				<button type="button" class="btn btn-block btn-success" id="searchReset">초기화</button>
			</div>
		</div>
		<div class="row">
			<div class="col-12">

				<div class="card">
					<div class="card-header">
						<h3 class="card-title">정비이력 목록</h3>
						<div class="card-tools">
							<button type="button" id="maintenanceHistoryAdd" class="btn btn-block btn-primary btn-sm">정비이력 등록</button>
						</div>
					</div>
					<div class="card-body table-responsive p-0">
						<table class="table table-hover text-nowrap">
							<thead id="maintenance_history_thead">
								<tr>
									<th>#</th>
									<th>연락처</th>
									<th>차량등록번호</th>
									<th>이름</th>
									<th>정비의뢰일</th>
									<th>출고일</th>
									<th>결제금액</th>
									<th>등록자</th>
									<th>등록일</th>
									<th>수정자</th>
									<th>수정일</th>
								</tr>
							</thead>
							<tbody id="maintenance_history_list">
							</tbody>
						</table>
					</div>
					<div class="card-footer clearfix">
						<ul class="pagination pagination-sm m-0 float-right" id="maintenance_history_pagination">
						</ul>
					</div>
				</div>

			</div>
		</div>
	</section>
</div>

<form id="maintenanceHistroyModifyForm">
	<input type="hidden" name="maintenanceHistorySeq"/>
</form>

<script id="maintenance_history_list_template" type="text/x-jquery-tmpl">
{{if list.length > 0}}
	{{each(i,item) list}}
		<tr data-maintenance-history-seq="\${item.maintenanceHistorySeq}">
			<td>\${item.rnum}.</td>
			<td>\${item.phone}</td>
			<td>\${item.carRegNum}</td>
			<td>\${item.name}</td>
			<td>\${item.maintenanceRequestDate}</td>
			<td>\${item.dayOfDelivery}</td>
			<td>\${item.payment}</td>
			<td>\${item.regMngrName}</td>
			<td>\${item.regDate}</td>
			<td>\${item.uptMngrName}</td>
			<td>\${item.uptDate}</td>
		</tr>
	{{/each}}
{{else}}
	<tr style="text-align:center">
		<td colspan="9">등록된 정비이력이 없습니다.</td>
	</tr>
{{/if}}
</script>