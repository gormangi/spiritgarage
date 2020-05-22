<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<script src="/js/admin/mngr_management.js"></script>
<div class="content-wrapper">
	<section class="content-header">
		<div class="container-fluid">
			<div class="row mb-2">
				<div class="col-sm-6">
					<h1>관리자 계정 관리</h1>
				</div>
				<div class="col-sm-6">
					<ol class="breadcrumb float-sm-right">
						<li class="breadcrumb-item">ADMIN</li>
						<li class="breadcrumb-item">관리자 계정 관리</li>
					</ol>
				</div>
			</div>
		</div>
	</section>

	<section class="content">
		<div class="container-fluid">
			<div class="row">
				<div class="col-12">
					<div class="card">
						<div class="card-header">
							<h3 class="card-title">관리자 목록</h3>
							<div class="card-tools">
								<button type="button" id="mngrAddBtn"
									class="btn btn-block btn-primary btn-sm">관리자 추가</button>
							</div>
						</div>
						<div class="card-body table-responsive p-0">
							<table class="table table-hover text-nowrap">
								<thead>
									<tr>
										<th style="width: 10px">#</th>
										<th>아이디</th>
										<th>이름</th>
										<th>등록일</th>
										<th>수정일</th>
										<th style="width: 80px">수정</th>
										<th style="width: 100px">사용중지</th>
									</tr>
								</thead>
								<tbody id="mngr_list">
								</tbody>
							</table>
						</div>
						<div class="card-footer clearfix">
							<ul class="pagination pagination-sm m-0 float-right"
								id="mngr_pagination">
							</ul>
						</div>
					</div>
				</div>
			</div>

		</div>
	</section>

</div>

<div class="modal fade" id="mngrAdd-modal">
	<div class="modal-dialog modal-lg">
		<div class="modal-content">
			<div class="modal-header">
				<h4 class="modal-title">관리자 추가</h4>
				<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
			</div>
			<div class="modal-body">
				<div class="card-body">
					<form id="mngrAddForm">
						<div class="form-group">
							<label for="id">아이디</label> <input type="text" class="form-control" name="id" id="id" placeholder="아이디를 입력하세요">
						</div>
						<div class="form-group">
							<label for="name">이름</label> <input type="text" class="form-control" name="name" id="name" placeholder="이름을 입력하세요">
						</div>
						<div class="form-group">
							<label for="password">비밀번호</label> <input type="password" class="form-control" name="password" id="password" placeholder="비밀번호를 입력하세요">
						</div>
						<div class="form-group">
							<label for="passwordConfirm">비밀번호 확인</label> <input type="password" class="form-control" name="passwordConfirm" id="passwordConfirm" placeholder="비밀번호를 입력하세요">
						</div>
						<h5><i class="fas fa-info"></i> Note:</h5>
						비밀번호는 암호화 후 저장되며 아무도 알수없습니다.
					</form>
				</div>
			</div>
			<div class="modal-footer justify-content-between">
				<button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
				<button type="button" class="btn btn-primary" id="mngrAdd">등록</button>
			</div>
		</div>
	</div>
</div>

<div class="modal fade" id="mngrModify-modal">
	<div class="modal-dialog modal-lg">
		<div class="modal-content">
			<div class="modal-header">
				<h4 class="modal-title">관리자 수정</h4>
				<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
			</div>
			<div class="modal-body">
				<div class="card-body">
					<form id="mngrModifyForm">
						<input type="hidden" id="modify_mngrSeq" value=""/>
						<div class="form-group">
							<label for="modify_id">아이디</label> <input type="text" class="form-control" name="modify_id" id="modify_id" placeholder="아이디를 입력하세요">
						</div>
						<div class="form-group">
							<label for="modify_name">이름</label> <input type="text" class="form-control" name="modify_name" id="modify_name" placeholder="이름을 입력하세요">
						</div>
						<div class="form-group">
							<label for="modify_password">비밀번호</label> <input type="password" class="form-control" name="modify_password" id="modify_password" placeholder="비밀번호를 입력하세요">
						</div>
						<div class="form-group">
							<label for="modify_passwordConfirm">비밀번호 확인</label> <input type="password" class="form-control" name="modify_passwordConfirm" id="modify_passwordConfirm" placeholder="비밀번호를 입력하세요">
						</div>
						<h5><i class="fas fa-info"></i> Note:</h5>
						비밀번호는 암호화 후 저장되며 아무도 알수없습니다.
					</form>
				</div>
			</div>
			<div class="modal-footer justify-content-between">
				<button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
				<button type="button" class="btn btn-primary" id="mngrModify">수정</button>
			</div>
		</div>
	</div>
</div>

<script id="mngr_list_template" type="text/x-jquery-tmpl">
{{if list.length > 0}}
	{{each(i,item) list}}
		<tr data-mngr-seq="\${item.mngrSeq}">
			<td>\${item.rnum}.</td>
			<td>\${item.id}</td>
			<td>\${item.name}</td>
			<td>\${item.regDate}</td>
			<td>\${item.uptDate}</td>
			<td><button type="button" name="mngrModifyBtn" class="btn btn-block btn-outline-info btn-xs">수정</button></td>
			{{if item.useYn == 'Y'}}
				<td><button type="button" name="mngrUseStopBtn" class="btn btn-block btn-outline-danger btn-xs">사용중지</button></td>
			{{/if}}
			{{if item.useYn == 'N'}}
				<td><button type="button" name="mngrUseActiveBtn" class="btn btn-block btn-outline-info btn-xs">복구</button></td>
			{{/if}}
		</tr>
	{{/each}}
{{else}}
	<tr style="text-align:center">
		<td colspan="6">NO DATA</td>
	</tr>
{{/if}}
</script>