<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<script src="/js/user/category_list.js"></script>

<input type="hidden" id="category" value="${category }"/>

<div class="wrapper row3">
	<main class="hoc container clear">
		<div class="content">
			
			<div class="scrollable spirittable">
				<table>
					<thead>
						<tr>
							<th>#</th>
							<th>제목</th>
							<th>내용</th>
							<th>등록일시</th>
						</tr>
					</thead>
					<tbody id="category_list">
					</tbody>
				</table>
				<nav class="pagination">
					<ul id="category_paging">
					</ul>
				</nav>
			</div>
			
		</div>
		<div class="clear"></div>
	</main>
</div>