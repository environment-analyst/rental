<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="vo.NtcVo"%>
<%
NtcVo article = (NtcVo) request.getAttribute("article");
%>
<div class="board-box">
    <div class="dash-title-box">
        <h2>공지사항 게시판 관리</h2>
    </div>

    <h4 class="board-top-title">공지사항 게시글 수정</h4>
    <div class="board-form-box">
        <form class="board-form" name="modifyform">
        <input type="hidden" name="NOTICENUM" value="<%=article.getNOTICENUM()%>">
            <div class="form-frame board-title-box">
                <div class="label-tag board-title-text">글 제목</div>
                <input type="text" id="NOTICETITLE" name="NOTICETITLE" value="<%=article.getNOTICETITLE()%>" placeholder="제목 입력">
            </div>

            <div class="form-frame board-info-box">
                <div class="label-tag board-info-text">글 내용</div>
                <textarea name="NOTICECONTENT" id="NOTICECONTENT" cols="30" rows="20"><%=article.getNOTICECONTENT()%></textarea>
            </div>


            <div class="btn-frame">
                <button type="button" onclick="nctmodi()">수정</button>
                <button type="button" onclick="adminList()">취소</button>
            </div>
        </form>
    </div>
</div>

    <script>
    function nctmodi(){
    	$.ajax({
    		url : "ntcModify.no",
    		type : "post",
    		data : {
    			NOTICENUM : modifyform.NOTICENUM.value,
    			NOTICETITLE : modifyform.NOTICETITLE.value,
    			NOTICECONTENT : modifyform.NOTICECONTENT.value,
    		},
    		cache : false,
    		dataType : "json",
    		success : function(res){
    			if(res.msg=='ok') adminList();
    		},
    		error : function(err){
    			console.log('에러발생: ', err);
    		}
    	});
    }
    
    function adminList(){
	    $.ajax({
	        url: "dashBoardInclude/announceboardmng.jsp",
	        type: "GET",
	        success: function(data) {
	            $("#content").html(data);
	        },
	        error: function() {
	            $("#content").html("Error loading page.");
	        }
	    });
    }
    </script>

<%@include file="../dashFooter.jsp"%>