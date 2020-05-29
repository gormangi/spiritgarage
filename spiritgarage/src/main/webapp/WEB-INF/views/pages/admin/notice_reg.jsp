<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<script src='/js/library/ckeditor/ckeditor.js'></script>
<script src="/js/admin/notice_reg.js"></script>

<input type="hidden" id="rMod" value="${rMod }"/>
<input type="hidden" id="noticeSeq" value="${noticeSeq }"/>

<div class="content-wrapper">
	<section class="content-header">
		<div class="container-fluid">
			<div class="row mb-2">
				<div class="col-sm-6">
					<h1>공지사항 관리</h1>
				</div>
				<div class="col-sm-6">
					<ol class="breadcrumb float-sm-right">
						<li class="breadcrumb-item">ADMIN</li>
						<li class="breadcrumb-item">공지사항 관리</li>
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
						<form role="form">
							<div class="card-body">
								<div class="form-group">
									<label for="exampleInputFile">썸네일</label>
									<div class="input-group">
										<div class="custom-file">
											<input type="file" class="custom-file-input" id="noticeThumbnailFile" accept="image/x-png,image/gif,image/jpeg" />
											<label class="custom-file-label" id="noticeThumbnailFileLabel" style="display:none;"></label>
											<label class="custom-file-label" id="noticeOriginThumbnailFileLabel" style="display:none;"></label>
										</div>
									</div>
								</div>
								<div class="form-group">
									<label for="title">제목</label>
									<input type="text" class="form-control" maxlength="300" id="title" placeholder="제목을 입력하세요">
								</div>
								<div class="form-group">
									<label for="title">내용</label>
									<textarea id="content" name="content"></textarea>
								</div>
							</div>
							<div class="card-footer">
								<button type="button" id="noticeWrite" class="btn btn-primary" style="display:none;">추가</button>
								<button type="button" id="noticeModify" class="btn btn-primary" style="display:none;">수정</button>
								<button type="button" id="noticeWriteCancel" class="btn btn-default">취소</button>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</section>
</div>