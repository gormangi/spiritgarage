<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<script src="/js/user/maintenance_history_detail.js"></script>

<style type="text/css">
.spirittable{font-size:10pt; overflow-x:auto !important;}
.scrollable table {white-space : normal !important; margin-bottom:5px;}
pre{margin:auto !important;}
</style>

<input type="hidden" id="maintenanceHistorySeq" value="${maintenanceHistorySeq }"/>
<input type="hidden" id="parent_phone" value="${phone }"/>
<input type="hidden" id="parent_carRegNum" value="${carRegNum }"/>

<div class="wrapper row3">
	<main class="hoc container clear">
		<div class="content">
			<h5><i class="fa fa-dot-circle-o" aria-hidden="true"></i>&nbsp;차량정보</h5>
			<div class="scrollable spirittable">
				<table>
					<colgroup>
						<col width="25%"/>
						<col width="25%"/>
						<col width="25%"/>
						<col width="25%"/>
					</colgroup>
					<tr>
						<th>차량등록번호</th>
						<td id="carRegNum"></td>
						<th>전화번호</th>
						<td id="phone"></td>
					</tr>
					<tr>
						<th>소유자성명</th>
						<td id="name"></td>
						<th>차량등록일</th>
						<td id="carRegDate"></td>
					</tr>
					<tr>
						<th>정비의뢰일</th>
						<td id="maintenanceRequestDate"></td>
						<th>주행거리</th>
						<td id="distanceDriven"></td>
					</tr>
				</table>
			</div>
			<h5 style="margin-top:10px;"><i class="fa fa-dot-circle-o" aria-hidden="true"></i>&nbsp;사업자정보</h5>
			<div class="scrollable spirittable">
				<table>
					<colgroup>
						<col width="16%"/>
						<col width="16%"/>
						<col width="16%"/>
						<col width="16%"/>
						<col width="16%"/>
						<col width="16%"/>
					</colgroup>
					<tr>
						<th>업체명</th>
						<td>스피릿개러지</td>
						<th>대표자성명</th>
						<td>주형용</td>
						<th>전화번호</th>
						<td>031-314-8884</td>
					</tr>
					<tr>
						<th>주소</th>
						<td colspan="3">(14961)경기도 시흥시 포동 20-19 스피릿개러지</td>
						<th>출고일</th>
						<td id="dayOfDelivery"></td>
					</tr>
				</table>
			</div>
			<h5 style="margin-top:10px;"><i class="fa fa-dot-circle-o" aria-hidden="true"></i>&nbsp;정비내역</h5>
			<div class="scrollable spirittable">
				<table>
					<colgroup>
						<col width="15%"/>
						<col width="60%"/>
						<col width="15%"/>
					</colgroup>
					<thead>
						<tr>
							<th>정비구분</th>
							<th>정비내용</th>
							<th>부품구분</th>
						</tr>
					</thead>
					<tbody id="maintenanceHistoryDetailList">
					</tbody>
				</table>
			</div>
			
			<div class="one_third first" style="margin-top:20px;">
				<div class="scrollable spirittable">
					<table>
						<thead>
							<tr>
								<th>결제금액</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td id="payment" style="text-align:right;"></td>
							</tr>
						</tbody>
					</table>
				</div>
			</div>
		</div>
		<div class="clear"></div>
		<a class="btn inverse" href="javascript:void(0);" id="goMyMaintenanceHistoryList"><i class="fa fa-arrow-left"></i>  돌아가기</a>
	</main>
</div>

<form id="goBackForm">
	<input type="hidden" name="phone" id="goBack_phone"/>
	<input type="hidden" name="carRegNum" id="goBack_carRegNum"/>
</form>