<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<link href='https://cdnjs.cloudflare.com/ajax/libs/fullcalendar/2.9.1/fullcalendar.min.css' rel='stylesheet' />
<link rel="stylesheet" href="/layout/styles/daterangepicker.css">
<script src="/js/library/moment.min.js"></script>
<script src="/js/library/daterangepicker.js"></script>
<script src='https://cdnjs.cloudflare.com/ajax/libs/fullcalendar/2.9.1/fullcalendar.min.js'></script>
<script src='https://cdnjs.cloudflare.com/ajax/libs/fullcalendar/2.9.1/lang/ko.js'></script>

<style type="text/css">
.resManagementCalendar{background-color:white;}
#reservation_list tr{cursor:pointer;}
#reservation_not_poss_list tr td:nth-child(3) span{
	display: inline-block; width: 700px; white-space: nowrap; overflow: hidden; text-overflow: ellipsis;
}
</style>

<script src="/js/admin/reservation_management.js"></script>
<div class="content-wrapper">
	<section class="content-header">
		<div class="container-fluid">
			<div class="row mb-2">
				<div class="col-sm-6">
					<h1>예약 관리</h1>
				</div>
				<div class="col-sm-6">
					<ol class="breadcrumb float-sm-right">
						<li class="breadcrumb-item">ADMIN</li>
						<li class="breadcrumb-item">예약 관리</li>
					</ol>
				</div>
			</div>
		</div>
	</section>
	
	<section class="content">
		<div class="row">
			<div class="col-md-8">
				<div class="card">
					<div class="card-header">
						<h3 class="card-title">예약 목록</h3>
						<div class="card-tools">
							<div class="input-group input-group-sm" style="width: 220px;">
								<input type="text" id="reservationSearchWord" class="form-control float-right" placeholder="예약자 &휴대전화번호검색">
								<div class="input-group-append">
									<button type="button" id="reservationSearchBtn" class="btn btn-default"><i class="fas fa-search"></i></button>
								</div>
							</div>
						</div>
					</div>
					<div class="card-body table-responsive p-0">
						<table class="table table-hover text-nowrap">
							<thead>
								<tr>
									<th style="width: 10px">#</th>
									<th>예약일시</th>
									<th>예약자명</th>
									<th>휴대폰번호</th>
									<th>정비영역</th>
									<th>예약상태</th>
								</tr>
							</thead>
							<tbody id="reservation_list">
							</tbody>
						</table>
					</div>
					<div class="card-footer clearfix">
						<ul class="pagination pagination-sm m-0 float-right" id="reservation_pagination">
						</ul>
					</div>
				</div>
			</div>
			<div class="col-md-4">
				<div class="card">
					<div class="card-header">
						<h3 class="card-title">정비 영역</h3>
						<div class="card-tools">
							<button type="button" id="maintenanceAreaAddBtn" class="btn btn-block btn-primary btn-sm">정비 영역 추가</button>
						</div>
					</div>
					<div class="card-body table-responsive p-0">
						<table class="table table-hover text-nowrap">
							<thead>
								<tr>
									<th style="width: 10px">#</th>
									<th>정비영역</th>
									<th>등록일</th>
									<th>삭제</th>
								</tr>
							</thead>
							<tbody id="maintenance_area_list">
							</tbody>
						</table>
					</div>
					<div class="card-footer clearfix">
						<ul class="pagination pagination-sm m-0 float-right" id="maintenance_area_pagination">
						</ul>
					</div>
				</div>
			</div>
		</div>
		<div class="row">
			<div class="col-md-12">
				<div class="card">
					<div class="card-header">
						<h3 class="card-title">예약불가일 설정</h3>
						<div class="card-tools">
							<button type="button" id="reservationNotPossAdd" class="btn btn-block btn-primary btn-sm">예약불가일 추가</button>
						</div>
					</div>
					<div class="card-body table-responsive p-0">
						<table class="table table-hover text-nowrap">
							<thead>
								<tr>
									<th>시작일</th>
									<th>종료일</th>
									<th>사유</th>
									<th>등록자</th>
									<th>등록일</th>
									<th>삭제</th>
								</tr>
							</thead>
							<tbody id="reservation_not_poss_list">
							</tbody>
						</table>
					</div>
				</div>
			</div>
		</div>
		<div class="row" id="reservationInfoDiv" style="display:none;">
			<div class="col-md-12">
				<div class="card card-outline card-info">
					<div class="card-header">
						<h3 class="card-title">예약 내용</h3>
						<div class="card-tools">
							<button type="button" class="btn btn-tool btn-sm" id="reservationInfoDivHideBtn">
							<i class="fas fa-times"></i></button>
						</div>
					</div>
					<div class="card-body pad" id="reservationInfo">
					</div>
				</div>
			</div>
		</div>
		<div class="row">
			<div class="col-12">
				<div id="calendar" class="resManagementCalendar"></div>
			</div>
		</div>
	</section>
</div>

<div class="modal fade" id="maintenanceAreaAdd-modal">
	<div class="modal-dialog modal-lg">
		<div class="modal-content">
			<div class="modal-header">
				<h4 class="modal-title">정비 영역 추가</h4>
				<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
			</div>
			<div class="modal-body">
				<div class="card-body">
					<form id="maintenanceAreaAddForm">
						<div class="form-group">
							<label for="add_maintenanceName">정비영역</label> <input type="text" class="form-control" name="add_maintenanceName" id="add_maintenanceName" placeholder="정비영역을 입력하세요">
						</div>
					</form>
				</div>
			</div>
			<div class="modal-footer justify-content-between">
				<button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
				<button type="button" class="btn btn-primary" id="maintenanceAreaAdd">추가</button>
			</div>
		</div>
	</div>
</div>

<div class="modal fade" id="reservationNotPossAdd-modal">
	<div class="modal-dialog modal-lg">
		<div class="modal-content">
			<div class="modal-header">
				<h4 class="modal-title">예약불가일 추가</h4>
				<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
			</div>
			<div class="modal-body">
				<div class="card-body">
					<form id="reservationNotPossAddForm">
						<div class="form-group">
							<label for="reservationNotPossDateRange">예약 불가범위</label>
							<div class="input-group">
								<div class="input-group-prepend">
									<span class="input-group-text"><i class="far fa-clock"></i></span>
								</div>
								<input type="text" class="form-control float-right" id="reservationNotPossDateRange" readonly="readonly">
							</div>
						</div>
						<div class="form-group">
							<label for="reservationNotPossReason">사유</label>
							<div class="input-group">
								<input type="text" class="form-control" id="reservationNotPossReason" maxlength="1000"/>
							</div>
						</div>
					</form>
				</div>
			</div>
			<div class="modal-footer justify-content-between">
				<button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
				<button type="button" class="btn btn-primary" id="reservationNotPossAddBtn">추가</button>
			</div>
		</div>
	</div>
</div>

<script id="maintenance_area_list_template" type="text/x-jquery-tmpl">
{{if list.length > 0}}
	{{each(i,item) list}}
		<tr data-maintenance-area-seq="\${item.maintenanceAreaSeq}">
			<td>\${item.rnum}.</td>
			<td>\${item.maintenanceName}</td>
			<td>\${item.regDate}</td>
			<td><input type="button" class="btn btn-block btn-danger btn-xs" name="maintenanceAreaDel" value="삭제"/></td>
		</tr>
	{{/each}}
{{else}}
	<tr style="text-align:center">
		<td colspan="4">등록된 정비 영역이 없습니다.</td>
	</tr>
{{/if}}
</script>

<script id="reservation_not_poss_list_template" type="text/x-jquery-tmpl">
{{if list.length > 0}}
	{{each(i,item) list}}
		<tr data-not-possible-seq="\${item.notPossibleSeq}">
			<td>\${item.startDate}</td>
			<td>\${item.endDate}</td>
			<td><span>\${item.reason}</span></td>
			<td>\${item.regMngrName}</td>
			<td>\${item.regDate}</td>
			<td><input type="button" class="btn btn-block btn-danger btn-xs" name="reservationNotPossibleDel" value="삭제"></td>
		</tr>
	{{/each}}
{{else}}
	<tr style="text-align:center">
		<td colspan="6">설정된 예약불가일이 없습니다.</td>
	</tr>
{{/if}}
</script>

<script id="reservation_list_template" type="text/x-jquery-tmpl">
{{if list.length > 0}}
	{{each(i,item) list}}
		<tr data-reservation-seq="\${item.reservationSeq}">
			<td>\${item.rnum}.</td>
			<td>\${item.reservationDate}</td>
			<td>\${item.reservationName}</td>
			<td>\${item.phone}</td>
			<td>\${item.chooseArea}</td>
			{{if item.useYn == 'Y'}}
				<td><p class="text-primary">예약완료</p></td>
			{{/if}}
			{{if item.useYn == 'N'}}
				<td><p class="text-danger">예약취소</p></td>
			{{/if}}
		</tr>
	{{/each}}
{{else}}
	<tr style="text-align:center">
		<td colspan="6">등록된 예약이 없습니다.</td>
	</tr>
{{/if}}
</script>

<script id="reservationInfo_template" type="text/x-jquery-tmpl">
{{if useYn == 'Y'}}
	<input type="button" class="btn btn-block btn-danger btn-sm" value="예약취소" id="reservationCancelBtn" data-reservation-seq="\${reservationSeq}" style="width:80px;"/>
{{/if}}
{{if useYn == 'N'}}
	<input type="button" class="btn btn-block btn-success btn-sm" value="예약복구" id="reservationRepBtn" data-reservation-seq="\${reservationSeq}" style="width:80px;"/>
{{/if}}
<dl>
	<blockquote>
		<dt>예약상태</dt>
		{{if useYn == 'Y'}}
			<dd><p class="text-primary">예약완료</p></dd>
		{{/if}}
		{{if useYn == 'N'}}
			<dd><p class="text-danger">예약취소</p></dd>
		{{/if}}
	</blockquote>
	<blockquote class="quote-secondary">
		<dt>예약일시</dt>
		<dd>\${reservationDate}</dd>
	</blockquote>
	<blockquote>
		<dt>예약자명</dt>
		<dd>\${reservationName}</dd>
	</blockquote>
	<blockquote class="quote-secondary">
		<dt>휴대폰번호</dt>
		<dd>\${phone}</dd>
	</blockquote>
	<blockquote>
		<dt>정비영역</dt>
		<dd>\${chooseArea}</dd>
	</blockquote>
	<blockquote class="quote-secondary">
		<dt>예약 내용</dt>
		<dd>{{html reservationContent}}</dd>
	</blockquote>
</dl>
</script>