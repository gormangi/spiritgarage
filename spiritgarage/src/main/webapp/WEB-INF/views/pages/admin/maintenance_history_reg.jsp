<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<script src="/js/library/jquery/jquery.inputmask.bundle.min.js"></script>
<script src="/js/admin/maintenance_history_reg.js"></script>

<style type="text/css">
#maintenance_history_detail_list tr td:nth-child(1) span{
	display: inline-block; width: 200px; white-space: nowrap; overflow: hidden; text-overflow: ellipsis;
}
#maintenance_history_detail_list tr td:nth-child(2) span{
	display: inline-block; width: 700px; white-space: nowrap; overflow: hidden; text-overflow: ellipsis;
}
</style>

<input type="hidden" id="rMod" value="${rMod }"/>
<input type="hidden" id="maintenanceHistorySeq" value="${maintenanceHistorySeq }"/>

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
		<div class="container-fluid">
			<div class="row">
				<div class="col-md-12">
				
					<div class="card card-primary">
						<div class="card-header">
							<h3 class="card-title"></h3>
						</div>
						<div class="card-body">
							<form role="form">
								<div class="row">
									<div class="col-sm-4">
										<div class="form-group">
											<label><span style="color:red; margin-right:8px;">*</span>연락처</label>
											<input type="text" class="form-control" id="phone" maxlength="11" placeholder="01000000000 '-'없이 입력"/>
										</div>
									</div>
									
									<div class="col-sm-4">
										<div class="form-group">
											<label><span style="color:red; margin-right:8px;">*</span>차량등록번호</label>
											<input type="text" class="form-control" placeholder="xxx가xxxx" id="carRegNum" maxlength="8"/>
										</div>
									</div>
									
									<div class="col-sm-4">
										<div class="form-group">
											<label>이름</label>
											<input type="text" class="form-control" placeholder="홍길동" id="name"/>
										</div>
									</div>
								</div>
								<div class="row">
									<div class="col-sm-4">
										<div class="form-group">
											<label>차량등록일</label>
											<input type="text" class="form-control" id="carRegDate" data-inputmask-alias="datetime" data-inputmask-inputformat="yyyy-mm-dd" data-mask/>
										</div>
									</div>
									
									<div class="col-sm-4">
										<div class="form-group">
											<label><span style="color:red; margin-right:8px;">*</span>정비의뢰일</label>
											<input type="text" class="form-control" id="maintenanceRequestDate" data-inputmask-alias="datetime" data-inputmask-inputformat="yyyy-mm-dd" data-mask/>
										</div>
									</div>
									
									<div class="col-sm-4">
										<div class="form-group">
											<label><span style="color:red; margin-right:8px;">*</span>출고일</label>
											<input type="text" class="form-control" id="dayOfDelivery" data-inputmask-alias="datetime" data-inputmask-inputformat="yyyy-mm-dd" data-mask/>
										</div>
									</div>
								</div>
								<div class="row mb-5">
									<div class="col-sm-4">
										<div class="form-group">
											<label>주행거리</label>
											<input type="text" class="form-control" id="distanceDriven" data-inputmask-inputformat="999,999,999,999" data-mask/>
										</div>
									</div>
									
									<div class="col-sm-4">
										<div class="form-group">
											<label>결제금액</label>
											<input type="text" class="form-control" id="payment"  data-inputmask-inputformat="999,999,999,999" data-mask/>
										</div>
									</div>
								</div>
								
								<div class="row mb-2">
									<div class="col-sm-10">
										<h5>정비내역</h5>
									</div>
									<div class="col-sm-2">
										<button type="button" id="maintenanceHistoryDetailModalOpen" class="btn btn-block btn-primary btn-sm">정비내역 추가</button>
									</div>
								</div>
								<div class="row">
									<div class="card-body table-responsive table-bordered p-0">
										<table class="table table-hover text-nowrap">
											<thead id="maintenance_history_detail_thead">
												<tr>
													<th style="width:250px;">정비구분</th>
													<th>정비내용</th>
													<th style="width:250px;">부품구분</th>
													<th style="width:80px;">수정</th>
													<th style="width:80px;">삭제</th>
												</tr>
											</thead>
											<tbody id="maintenance_history_detail_list">
											</tbody>
										</table>
									</div>
								</div>
								
							</form>
						</div>
						<div class="card-footer">
							<button type="button" id="maintenanceHistoryWrite" class="btn btn-primary" style="display:none;">등록</button>
							<button type="button" id="maintenanceHistoryModify" class="btn btn-primary" style="display:none;">수정</button>
							<button type="button" id="maintenanceHistoryDelete" class="btn btn-danger" style="display:none;">삭제</button>
							<button type="button" id="maintenanceHistoryCancel" class="btn btn-default">취소</button>
						</div>
					</div>
					
				</div>
			</div>
		</div>
	</section>
</div>

<div class="modal fade" id="maintenanceHistoryDetailAdd-modal">
	<input type="hidden" id="detailOrder"/>
	<div class="modal-dialog modal-lg">
		<div class="modal-content">
			<div class="modal-header">
				<h4 class="modal-title"></h4>
				<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
			</div>
			<div class="modal-body">
				<div class="card-body">
					<form id="maintenanceHistoryDetailAddForm">
						
						<div class="row">
							<div class="col-sm-6">
								<div class="form-group">
									<label>정비구분</label>
									<input type="text" class="form-control" id="maintenanceHistoryDetail_maintenanceDv" maxlength="100"/>
								</div>
							</div>
							<div class="col-sm-6">
								<div class="form-group">
									<label>부품구분</label>
									<select class="form-control" id="maintenanceHistoryDetail_partsClass">
										<option value="N">신품</option>
										<option value="R">중고</option>
										<option value="X">해당없음</option>
									</select>
								</div>
							</div>
						</div>
						<div class="row">
							<div class="col-sm-12">
								<div class="form-group">
									<label>정비내용</label>
									<textarea rows="5" class="form-control" id="maintenanceHistoryDetail_workContent" maxlength="1000"></textarea>
								</div>
							</div>
						</div>
						
					</form>
				</div>
			</div>
			<div class="modal-footer justify-content-between">
				<button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
				<button type="button" class="btn btn-primary" id="maintenanceHistoryDetailAdd" style="display:none;">추가</button>
				<button type="button" class="btn btn-primary" id="maintenanceHistoryDetailModify" style="display:none;">수정</button>
			</div>
		</div>
	</div>
</div>