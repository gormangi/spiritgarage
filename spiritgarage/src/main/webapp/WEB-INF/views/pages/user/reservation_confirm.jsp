<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<script src="/js/user/reservation_confirm.js"></script>

<style type="text/css">
.spirittable{font-size:10pt; overflow-x:auto !important;}
.scrollable table {white-space : normal !important; margin-bottom:5px;}
#myResContentDiv{margin-top:30px;}
</style>

<input type="hidden" id="resComplateName" value="${reservationName }"/>
<input type="hidden" id="resComplatePhone" value="${phone }"/>

<div class="wrapper row3">
	<main class="hoc container clear">
		<div class="content">
		
			<h1><i class="fa fa-wrench" aria-hidden="true"></i>&nbsp;내 예약내역</h1>
			<div class="group btmspace-30 demo">
				<div class="one_half first">
					<div class="scrollable spirittable">
						<table>
							<thead>
								<tr>
									<th><i class="fa fa-adjust"></i>&nbsp;예약시 기입한 이름 입력</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td><input type="text" id="reservation_name" maxlength="10" style="width:100%"/></td>
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
									<th><i class="fa fa-adjust"></i>&nbsp;예약시 기입한 휴대폰번호 입력 ('-' 없이 입력)</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td><input type="text" id="reservation_phone" maxlength="13" style="width:100%"/></td>
								</tr>
							</tbody>
						</table>
					</div>
				</div>
			</div>
			<ul class="nospace inline pushright" style="margin-bottom:20px;">
				<li><a class="btn" href="javascript:void(0);" id="reservationConfirmBtn">확인</a></li>
			</ul>
			
			<div class="scrollable spirittable" id="myResList" style="display:none;">
				<table>
					<thead>
						<tr>
							<th>#</th>
							<th>예약일시</th>
							<th>정비영역</th>
							<th>예약취소</th>
						</tr>
					</thead>
					<tbody id="myReservation_list">
					</tbody>
				</table>
				<nav class="pagination">
					<ul id="myReservation_paging">
					</ul>
				</nav>
			</div>
		
			<div class="scrollable spirittable" id="myResContentDiv" style="display:none;">
				<table>
					<thead>
						<tr>
							<th><i class="fa fa-adjust"></i>&nbsp;예약내용</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td id="myResContent"></td>
						</tr>
					</tbody>
				</table>
			</div>
			
		</div>
		<div class="clear"></div>
	</main>
</div>

<script id="myReservation_list_template" type="text/x-jquery-tmpl">
{{if list.length > 0}}
	{{each(i,item) list}}
		<tr data-reservation-seq="\${item.reservationSeq}">
			<td>\${item.rnum}.</td>
			<td>\${item.reservationDate}</td>
			<td>\${item.chooseArea} <input type="button" name="myResContent" value="내용보기"/></td>
			<td><input type="button" name="myResCancel" data-reservation-date="\${item.reservationDate}" value="예약취소"/></td>
		</tr>
	{{/each}}
{{else}}
	<tr style="text-align:center">
		<td colspan="4">예약내역이 없습니다.</td>
	</tr>
{{/if}}
</script>