<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<script src="/js/admin/notice_management.js"></script>

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
				<div class="col-12">
					<div class="card">
						<div class="card-header">
							<h3 class="card-title">공지사항 목록</h3>
							<div class="card-tools">
								<button type="button" id="noticeAddBtn" class="btn btn-block btn-primary btn-sm">공지사항 추가</button>
							</div>
						</div>
						<div class="card-body table-responsive p-0">
							<table class="table table-hover text-nowrap">
								<thead>
									<tr>
										<th style="width: 10px">#</th>
										<th style="width: 15px">메인화면노출</th>
										<th>썸네일</th>
										<th>제목</th>
										<th>등록자</th>
										<th>등록일</th>
									</tr>
								</thead>
								<tbody id="notice_list">
								</tbody>
							</table>
						</div>
						<div class="card-footer clearfix">
							<ul class="pagination pagination-sm m-0 float-right" id="notice_pagination">
							</ul>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
</div>

<form id="noticeModifyForm">
	<input type="hidden" name="noticeSeq"/>
</form>

<script id="notice_list_template" type="text/x-jquery-tmpl">
{{if list.length > 0}}
	{{each(i,item) list}}
		<tr data-notice-seq="\${item.noticeSeq}">
			<td>\${item.rnum}.</td>
			<td>
				<div class="custom-control custom-switch">
					<input type="checkbox" class="custom-control-input" name="mainViewYn" id="mainViewYn\${i}">
					<label class="custom-control-label" for="mainViewYn\${i}"></label>
				</div>
			</td>
			<td><a href="javascript:void(0);"><img src="\${item.thumbnailUrl}" style="width:70px;height:70px;"/></td>
			<td><a href="javascript:void(0);">\${item.title}</a></td>
			<td>\${item.regMngrName}</td>
			<td>\${item.regDate}</td>
		</tr>
	{{/each}}
{{else}}
	<tr style="text-align:center">
		<td colspan="6">등록된 공지사항이 없습니다.</td>
	</tr>
{{/if}}
</script>