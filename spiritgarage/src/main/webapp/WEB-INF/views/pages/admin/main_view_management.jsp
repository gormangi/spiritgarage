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
		
		<div class="row">
			<div class="col-md-4">
				<div class="card">
					<div class="card-header">
						<h3 class="card-title">메인 카테고리 노출 설정</h3>
						<div class="card-tools">
							
						</div>
					</div>
					<div class="card-body table-responsive p-0">
						<table class="table table-hover text-nowrap">
							<thead>
								<tr>
									<th>#</th>
									<th>카테고리명</th>
									<th>노출여부</th>
								</tr>
							</thead>
							<tbody id="category_list">
								
							</tbody>
						</table>
					</div>
				</div>
			</div>
			<div class="col-md-8">
				<div class="card">
					<div class="card-header">
						<h3 class="card-title">메인 FOOTER CONTACT 설정</h3>
						<div class="card-tools">
							<button type="button" id="footer_contact_save" class="btn btn-primary btn-sm">저장</button>
						</div>
					</div>
					<div class="card-body">
						<div class="form-group">
							<label for="footer_contact_location"><i class="fa fa-map-marker"></i>&nbsp;&nbsp;위치</label>
							<input type="text" class="form-control" id="footer_contact_location" placeholder="(14961)경기도 시흥시 포동 20-19 스피릿개러지" maxlength="150"/>
						</div>
						<div class="form-group">
							<label for="footer_contact_mobile"><i class="fa fa-phone"></i>&nbsp;&nbsp;mobile</label>
							<input type="text" class="form-control" id="footer_contact_mobile" placeholder="010-7476-7884" maxlength="150"/>
						</div>
						<div class="form-group">
							<label for="footer_contact_phone"><i class="fa fa-fax"></i>&nbsp;&nbsp;phone</label>
							<input type="text" class="form-control" id="footer_contact_phone" placeholder="031-314-8884" maxlength="150"/>
						</div>
					</div>
				</div>
				<div class="card">
					<div class="card-header">
						<h3 class="card-title">메인 FOOTER 영업시간 설정</h3>
						<div class="card-tools">
							<button type="button" id="footer_openhour_save" class="btn btn-primary btn-sm">저장</button>
						</div>
					</div>
					<div class="card-body">
						<div class="form-group">
							<textarea rows="3" class="form-control" id="footer_openhour" maxlength="150"></textarea>
						</div>
					</div>
				</div>
				<div class="card">
					<div class="card-header">
						<h3 class="card-title">메인 FOOTER 주요 분야 설정</h3>
						<div class="card-tools">
							<button type="button" id="footer_mainfield_save" class="btn btn-primary btn-sm">저장</button>
						</div>
					</div>
					<div class="card-body">
						<div class="form-group">
							<textarea rows="3" class="form-control" id="footer_mainfield" maxlength="150"></textarea>
						</div>
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

<script id="category_list_template" type="text/x-jquery-tmpl">
{{if list.length > 0}}
	{{each(i,item) list}}
		<tr data-blog-category-seq="\${item.blogCategorySeq}">
			<td>
				<div class="custom-control custom-switch custom-switch-off-danger custom-switch-on-success">
					<input type="checkbox" class="custom-control-input" name="category" id="category\${i}" {{if item.displayYn == 'Y'}}checked="checked"{{/if}}>
					<label class="custom-control-label" for="category\${i}"></label>
				</div>
			</td>
			<td>\${item.category}</td>
			<td>{{if item.displayYn == 'Y'}}노출{{/if}}{{if item.displayYn == 'N'}}미노출{{/if}}</td>
		</tr>
	{{/each}}
{{else}}
	<tr style="text-align:center">
		<td colspan="3">등록된 카테고리가 없습니다.</td>
	</tr>
{{/if}}
</script>