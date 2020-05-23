$(document).ready(function(){
	
	fn.createEditor();
	
	$("#noticeThumbnailFile").on("change",function(){
		fn.noticeThumbnailValidation($(this));
	});
	
	$("#noticeWriteCancel").on("click",function(){
		document.location.href = "/admin/noticeManagement";
	});
	
	$("#noticeWrite").on("click",function(){
		fn.noticeWrite();
	});
	
});

var fn = {
		
		noticeThumbnailValidation : function(me){
			var thumbnail = $(me).val();
			if(thumbnail != ''){
				var extName = thumbnail.substring(thumbnail.lastIndexOf(".")+1).toUpperCase();
				if(extName != 'JPG' && extName != 'PNG' && extName != 'GIF'){
					alert('썸네일 확장자는 jpg , png , gif 만 등록할수있습니다');
					return false;
				}
				if($(me)[0].files[0].size > 1048576){
					alert('썸네일은 1MB 이상 업로드할수없습니다');
					return false;
				}
			}
			
			$("#noticeThumbnailFileLabel").text($(me)[0].files[0].name)
		},
		
		noticeWrite : function(){
			
			var noticeThumbnailFileLabel = $("#noticeThumbnailFileLabel").text();
			if(noticeThumbnailFileLabel == ''){
				alert('썸네일을 등록하세요');
				return false;
			}
			
			var title = $("#title").val();
			if(title == ''){
				alert("제목을 입력하세요");
				return false;
			}
			
			var content = CKEDITOR.instances.content.getData();
			if(content == ''){
				alert('내용을 입력하세요');
				return false;
			}
			
			var formData = new FormData();
			if($("#noticeThumbnailFile")[0].files[0] != null){
				formData.append("thumbnail", $("#noticeThumbnailFile")[0].files[0]);
			}
			formData.append('title',title);
			formData.append('content',content);
			
			$.ajax({
				url : '/admin/noticeWrite',
				data : formData,
				dataType : 'json',
				type : 'post',
				enctype : 'multipart/form-data',
				processData : false, 
				contentType : false,
				success : function(res){
					if(res.state == 'success'){
						alert('정상 등록되었습니다.');
						document.location.href = "/admin/noticeReg";
					}else{
						alert('등록에 실패하였습니다. 관리자에게 문의해주세요');
						return false;
					}
				}
			});
			
		},
		
		createEditor : function(){
			CKEDITOR.replace('content',{
				uploadUrl : '/admin/noticeImageUpload',
				filebrowserImageUploadUrl : '/admin/noticeImageUpload',
				height : 300,
				toolbar : [
					['Source'],
					['Bold','Italic','Underline','Strike','-','Subscript','Superscript'], 
					['NumberedList','BulletedList','-','Outdent','Indent','Blockquote','CreateDiv'], 
					['JustifyLeft','JustifyCenter','JustifyRight','JustifyBlock'], 
					['Link','Unlink','Anchor'], 
					['Image','Table','HorizontalRule','Smiley','SpecialChar','PageBreak'], '/', 
					['Styles','Format','Font','FontSize'], 
					['TextColor','BGColor'], 
					['Maximize', 'ShowBlocks','-','About']
				]
			});
			
			CKEDITOR.on('dialogDefinition', function(ev){
				var dialogName = ev.data.name;
				var dialogDefinition = ev.data.definition;
				
				switch (dialogName) {
					case 'image':
						dialogDefinition.removeContents('Link');
						dialogDefinition.removeContents('advanced');
						break;
					case 'link' :
						dialogDefinition.removeContents('upload');
						dialogDefinition.removeContents('advanced');
				}
			});
		}
}