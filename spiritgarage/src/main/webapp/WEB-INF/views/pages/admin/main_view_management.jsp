<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<script src="/js/admin/main_view_management.js"></script>

<style type="text/css">
#mainSlide_list tr td:nth-child(2) span , #mainSlide_list tr td:nth-child(3) span , #mainSlide_list tr td:nth-child(4) span{
	display: inline-block; width: 200px; white-space: nowrap; overflow: hidden; text-overflow: ellipsis;
}
</style>

<div class="content-wrapper">
	<section class="content-header">
		<div class="container-fluid">
			<div class="row mb-2">
				<div class="col-sm-6">
					<h1>메인화면 관리</h1>
				</div>
				<div class="col-sm-6">
					<ol class="breadcrumb float-sm-right">
						<li class="breadcrumb-item">ADMIN</li>
						<li class="breadcrumb-item">메인화면 관리</li>
					</ol>
				</div>
			</div>
		</div>
	</section>

	<section class="content">
		<div class="row">
			<div class="col-12">

				<div class="card">
					<div class="card-header">
						<h3 class="card-title">메인슬라이드 설정</h3>
						<div class="card-tools">
							<button type="button" id="mainSlideAddBtn" class="btn btn-primary btn-sm">메인슬라이드 추가</button>
						</div>
					</div>
					<div class="card-body table-responsive p-0">
						<table class="table table-hover text-nowrap">
							<thead id="mainSlide_thead">
								<tr>
									<th>슬라이드 구분</th>
									<th>TOP TEXT</th>
									<th>MIDDLE TEXT</th>
									<th>BOTTOM TEXT</th>
									<th>배너이미지</th>
									<th>예약버튼 사용</th>
									<th>정비이력버튼 사용</th>
									<th>슬라이드 순서</th>
									<th>수정</th>
									<th>삭제</th>
								</tr>
							</thead>
							<tbody id="mainSlide_list">
							</tbody>
						</table>
					</div>
				</div>

			</div>
		</div>
	</section>

</div>

<div class="modal fade" id="mainSlide-modal">
	<div class="modal-dialog modal-lg">
		<div class="modal-content">
			<div class="modal-header">
				<h4 class="modal-title"></h4>
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="modal-body">
				<div class="card-body">
					<form id="mainSlideForm">
						
						<input type="hidden" id="mainSlideModal_mainSlideSeq"/>

						<table class="table table-bordered text-center">
							<tbody>
								<tr>
									<th>슬라이드구분</th>
									<td>
										<div class="custom-control custom-radio">
											<input class="custom-control-input" type="radio" id="slideDvRadio1" name="mainSlideModal_slideDv" value="T" checked="checked"><label for="slideDvRadio1" class="custom-control-label">텍스트형</label>
										</div>
										<div class="custom-control custom-radio">
											<input class="custom-control-input" type="radio" id="slideDvRadio2" name="mainSlideModal_slideDv" value="F"><label for="slideDvRadio2" class="custom-control-label">배너형</label>
										</div>
									</td>
								</tr>
							</tbody>
						</table>
						
						<table class="table table-bordered text-center" id="mainSlideModal_slideDvText" style="display:none">
							<tbody>
								<tr>
									<th>TOP TEXT</th>
									<td>
										<textarea class="form-control" rows="3" id="mainSlideModal_topText" maxlength="100" placeholder="슬라이드 상단 문구 입력"></textarea>
									</td>
								</tr>
								<tr>
									<th>MIDDLE TEXT</th>
									<td>
										<textarea class="form-control" rows="3" id="mainSlideModal_middleText" maxlength="100" placeholder="슬라이드 중앙 문구 입력"></textarea>
									</td>
								</tr>
								<tr>
									<th>BOTTOM TEXT</th>
									<td>
										<textarea class="form-control" rows="3" id="mainSlideModal_bottomText" maxlength="100" placeholder="슬라이드 하단 문구 입력"></textarea>
									</td>
								</tr>
							</tbody>
						</table>
						
						<table class="table table-bordered text-center" id="mainSlideModal_slideDvFile" style="display:none">
							<tbody>
								<tr>
									<th>배너이미지</th>
									<td>
										<div class="custom-file">
											<input type="file" class="custom-file-input" id="mainSlideModal_bannerFile" accept="image/x-png,image/gif,image/jpeg" />
											<label class="custom-file-label" id="mainSlideModal_bannerFileLabel" style="display:none;"></label>
											<label class="custom-file-label" id="mainSlideModal_bannerFileModifyLabel" style="display:none;"></label>
										</div>
									</td>
								</tr>
							</tbody>
						</table>
						
						<table class="table table-bordered text-center">
							<tbody>
								<tr>
									<th>버튼</th>
									<td>
										<div class="custom-control custom-checkbox">
											<input class="custom-control-input" type="checkbox" id="mainSlideModal_reservationBtnYn"/>
											<label for="mainSlideModal_reservationBtnYn" class="custom-control-label">예약버튼 사용</label>
										</div>
										<div class="custom-control custom-checkbox">
											<input class="custom-control-input" type="checkbox" id="mainSlideModal_maintenanceHistoryBtnYn"/>
											<label for="mainSlideModal_maintenanceHistoryBtnYn" class="custom-control-label">정비이력버튼 사용</label>
										</div>
									</td>
								</tr>
							</tbody>
						</table>
						
					</form>
				</div>
			</div>
			<div class="modal-footer justify-content-between">
				<button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
				<button type="button" class="btn btn-primary" id="mainSlideAdd" style="display:none">추가</button>
				<button type="button" class="btn btn-primary" id="mainSlideModify" style="display:none">수정</button>
			</div>
		</div>
	</div>
</div>

<script id="mainSlide_list_template" type="text/x-jquery-tmpl">
{{if list.length > 0}}
	{{each(i,item) list}}
		<tr data-main-slide-seq="\${item.mainSlideSeq}" data-main-slide-order="\${item.mainSlideOrder}">
			<td>\${item.slideDv}</td>
			<td><span>\${item.topText}</span></td>
			<td><span>\${item.middleText}</span></td>
			<td><span>\${item.bottomText}</span></td>
			<td>\${item.originFileName}</td>
			<td>\${item.reservationBtnYn}</td>
			<td>\${item.maintenanceHistoryBtnYn}</td>
			<td>
				<span>\${item.mainSlideOrder}</span>
				<button type="button" {{if item.mainSlideMinOrder == item.mainSlideOrder}}disabled="disabled"{{/if}} name="mainSlideOrderUpBtn" class="btn btn-primary btn-sm"><i class="fa fa-arrow-circle-up"></i></button>
				<button type="button" {{if item.mainSlideMaxOrder == item.mainSlideOrder}}disabled="disabled"{{/if}} name="mainSlideOrderDownBtn" class="btn btn-primary btn-sm"><i class="fa fa-arrow-circle-down"></i></button>
			</td>
			<td><button type="button" name="mainSlideModifyBtn" class="btn btn-block btn-outline-info btn-xs">수정</button></td>
			<td><button type="button" name="mainSlideDelBtn" class="btn btn-block btn-outline-danger btn-xs">삭제</button></td>
		</tr>
	{{/each}}
{{else}}
	<tr style="text-align:center">
		<td colspan="10">등록된 슬라이드가 없습니다.</td>
	</tr>
{{/if}}
</script>