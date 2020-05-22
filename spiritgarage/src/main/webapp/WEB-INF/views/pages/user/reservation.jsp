<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<script src='/js/library/ckeditor/ckeditor.js'></script>
<script src="/js/user/reservation.js"></script>

<style type="text/css">
.spirittable{font-size:10pt; overflow-x:auto !important;}
.scrollable table {white-space : normal !important;}
.btmspace-50{margin-bottom:0px !important;}
</style>

<div class="wrapper row3">
	<main class="hoc container clear">
		<div class="content">
		
			<h1><i class="fa fa-wrench" aria-hidden="true"></i>&nbsp;예약하기</h1>
			<div class="group btmspace-50 demo">
				<div class="one_third first">
					<div class="scrollable spirittable">
						<table>
							<thead>
								<tr>
									<th><i class="fa fa-adjust"></i>&nbsp;예약 희망 날짜 선택<br />예약을 희망하시는 날짜와 시간을 선택해 주세요.</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td><input type="text" id="reservation_date" style="width:100%" readonly="readonly"/></td>
								</tr>
							</tbody>
						</table>
					</div>
				</div>
				<div class="one_third">
					<div class="scrollable spirittable">
						<table>
							<thead>
								<tr>
									<th><i class="fa fa-adjust"></i>&nbsp;이름<br />예약자 성함을 입력해주세요.</th>
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
				<div class="one_third">
					<div class="scrollable spirittable">
						<table>
							<thead>
								<tr>
									<th><i class="fa fa-adjust"></i>&nbsp;휴대폰 번호<br />'-' 없이 입력해주세요</th>
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
			<div class="scrollable spirittable">
				<table>
					<thead>
						<tr>
							<th><i class="fa fa-adjust"></i>&nbsp;정비 영역 선택<br />정비를 희망하시는 정비 영역을 선택해 주세요.</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td id="maintenanceAreaTd">
								<label style="display:inline-block;margin-right:10px;"><input type="checkbox" name="choose_area" value="엔진엔진엔진" style="display:inline-block"/>엔진엔진엔진</label>
								<label style="display:inline-block;margin-right:10px;"><input type="checkbox" name="choose_area" value="엔진엔진엔진" style="display:inline-block"/>엔진엔진엔진</label>
								<label style="display:inline-block;margin-right:10px;"><input type="checkbox" name="choose_area" value="엔진엔진엔진" style="display:inline-block"/>엔진엔진엔진</label>
								<label style="display:inline-block;margin-right:10px;"><input type="checkbox" name="choose_area" value="엔진엔진엔진" style="display:inline-block"/>엔진엔진엔진</label>
								<label style="display:inline-block;margin-right:10px;"><input type="checkbox" name="choose_area" value="엔진엔진엔진" style="display:inline-block"/>엔진엔진엔진</label>
								<label style="display:inline-block;margin-right:10px;"><input type="checkbox" name="choose_area" value="엔진엔진엔진" style="display:inline-block"/>엔진엔진엔진</label>
								<label style="display:inline-block;margin-right:10px;"><input type="checkbox" name="choose_area" value="엔진엔진엔진" style="display:inline-block"/>엔진엔진엔진</label>
								<label style="display:inline-block;margin-right:10px;"><input type="checkbox" name="choose_area" value="엔진엔진엔진" style="display:inline-block"/>엔진엔진엔진</label>
								<label style="display:inline-block;margin-right:10px;"><input type="checkbox" name="choose_area" value="엔진엔진엔진" style="display:inline-block"/>엔진엔진엔진</label>
								<label style="display:inline-block;margin-right:10px;"><input type="checkbox" name="choose_area" value="엔진엔진엔진" style="display:inline-block"/>엔진엔진엔진</label>
								<label style="display:inline-block;margin-right:10px;"><input type="checkbox" name="choose_area" value="엔진엔진엔진" style="display:inline-block"/>엔진엔진엔진</label>
							</td>
						</tr>
					</tbody>
				</table>
			</div>
			<div class="scrollable spirittable">
				<table>
					<thead>
						<tr>
							<th><i class="fa fa-adjust"></i>&nbsp;예약 내용 (선택사항)</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td>
								<textarea id="reservation_content" name="reservation_content"></textarea>
							</td>
						</tr>
					</tbody>
				</table>
			</div>
			<ul class="nospace inline pushright">
				<li><a class="btn" href="javascript:void(0);" id="goReservation">예약</a></li>
				<li><a class="btn inverse" href="javascript:void(0);" id="goReservationConfirm">내 예약내역 보기</a></li>
			</ul>

			<div id="calendar" style="display:none;"></div>
		</div>
		<div class="clear"></div>
	</main>
</div>

<form id="reservationComplateForm">
	<input type="hidden" id="p_reservation_name" name="reservationName"/>
	<input type="hidden" id="p_reservation_phone" name="phone"/>
</form>