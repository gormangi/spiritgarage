<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<script src="/js/user/maintenance_history.js"></script>

<style type="text/css">
.spirittable{font-size:10pt; overflow-x:auto !important;}
.scrollable table {white-space : normal !important; margin-bottom:5px;}
</style>

<input type="hidden" id="detail_phone" value="${phone }"/>
<input type="hidden" id="detail_carRegNum" value="${carRegNum }"/>

<div class="wrapper row3">
	<main class="hoc container clear">
		<div class="content">
			
			<h1><i class="fa fa-sticky-note" aria-hidden="true"></i>&nbsp;내 정비이력 검색</h1>
			<div class="group btmspace-30 demo" id="maintenanceHistorySearchDiv">
				<div class="one_half first">
					<div class="scrollable spirittable">
						<table>
							<thead>
								<tr>
									<th><i class="fa fa-adjust"></i>&nbsp;연락처 입력 ('-'없이 입력)</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td><input type="text" id="phone" maxlength="11" placeholder="01000000000 '-'없이 입력" style="width:100%"/></td>
								</tr>
							</tbody>
						</table>
					</div>
				</div>
				<div class="one_half">
					<div class="scrollable spirittable">
						<table>
							<thead>
								<tr>
									<th><i class="fa fa-adjust"></i>&nbsp;차량등록번호 입력</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td><input type="text" id="carRegNum" placeholder="xxx가xxxx" maxlength="8" style="width:100%"/></td>
								</tr>
							</tbody>
						</table>
					</div>
				</div>
			</div>
			<ul class="nospace inline pushright" style="margin-bottom:20px;">
				<li><a class="btn" href="javascript:void(0);" id="maintenanceHistoryConfirm">확인</a></li>
			</ul>
			
			<div class="scrollable spirittable" id="myMaintenanceHistoryList" style="display:none;">
				<table>
					<thead>
						<tr>
							<th>#</th>
							<th>정비의뢰일</th>
							<th>출고일</th>
							<th>결제금액</th>
							<th>상세내용</th>
						</tr>
					</thead>
					<tbody id="myMaintenanceHistory_list">
					</tbody>
				</table>
				<nav class="pagination">
					<ul id="myMaintenanceHistory_paging">
					</ul>
				</nav>
			</div>
			
		</div>
		<div class="clear"></div>
	</main>
</div>

<form id="maintenanceHistoryDetailForm">
	<input type="hidden" name="maintenanceHistorySeq" id="form_maintenanceHistorySeq"/>
	<input type="hidden" name="phone" id="form_phone"/>
	<input type="hidden" name="carRegNum" id="form_carRegNum"/>
</form>

<script id="myMaintenanceHistory_list_template" type="text/x-jquery-tmpl">
{{if list.length > 0}}
	{{each(i,item) list}}
		<tr data-maintenance-history-seq="\${item.maintenanceHistorySeq}">
			<td>\${item.rnum}.</td>
			<td>\${item.maintenanceRequestDate}</td>
			<td>\${item.dayOfDelivery}</td>
			<td>\${item.payment}</td>
			<td><input type="button" name="myMaintenanceHistoryDetail" value="상세내용"/></td>
		</tr>
	{{/each}}
{{/if}}
</script>