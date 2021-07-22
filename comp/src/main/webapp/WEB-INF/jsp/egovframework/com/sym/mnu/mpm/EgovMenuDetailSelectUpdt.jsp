<!DOCTYPE html>
<%--
 /**
  * @Class Name : EgovMenuDetailSelectUpdt.jsp
  * @Description : 메뉴정보 상세조회및 수정 화면
  * @Modification Information
  * @
  * @ 수정일               수정자             수정내용
  * @ ----------   --------   ---------------------------
  * @ 2009.03.10   이용               최초 생성
  *   2018.09.10   신용호            표준프레임워크 v3.8 개선
  *
  *  @author 공통서비스 개발팀 이용
  *  @since 2009.03.10
  *  @version 1.0
  *  @see
  *
  */
  /* Image Path 설정 */
--%>
<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="validator" uri="http://www.springmodules.org/tags/commons-validator" %>
<c:set var="ImgUrl" value="/images/egovframework/com/sym/mnu/mpm/"/>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" >
<title><spring:message code="comSymMnuMpm.menuDetailSelectUpdt.title"/></title><!-- 메뉴상세조회및 수정 -->
<script src="<c:url value='/js/egovframework/com/cmm/jquery.js' />"></script>
<script src="<c:url value='/js/egovframework/com/cmm/jqueryui.js' />"></script>

<script type="text/javascript" src="<c:url value="/validator.do"/>"></script>
<validator:javascript formName="menuManageVO" staticJavascript="false" xhtml="true" cdata="false"/>
<script language="javascript1.2" type="text/javaScript">
<!--

/* ********************************************************
* 입력값 validator 함수
******************************************************** */
function fn_validatorMenuList() {

	if(document.menuManageVO.menuNo.value == ""){alert("<spring:message code="comSymMnuMpm.menuList.validate.menuNo.notNull" />"); return false;} //메뉴번호는 필수 항목입니다.
	if(!checkNumber(document.menuManageVO.menuNo.value)){alert("<spring:message code="comSymMnuMpm.menuList.validate.menuNo.onlyNumber" />"); return false;} //메뉴번호는 숫자만 입력 가능합니다.

	if(document.menuManageVO.menuOrdr.value == ""){alert("<spring:message code="comSymMnuMpm.menuList.validate.menuOrdr.notNull" />"); return false;} // 메뉴순서는 필수 항목입니다.
	if(!checkNumber(document.menuManageVO.menuOrdr.value)){alert("<spring:message code="comSymMnuMpm.menuList.validate.menuOrdr.onlyNumber" />"); return false;} //메뉴순서는 숫자만 입력 가능합니다.

	if(document.menuManageVO.upperMenuId.value == ""){alert("<spring:message code="comSymMnuMpm.menuList.validate.upperMenuId.notNull" />"); return false;} //상위메뉴번호는 필수 항목입니다.
	if(!checkNumber(document.menuManageVO.upperMenuId.value)){alert("<spring:message code="comSymMnuMpm.menuList.validate.upperMenuId.onlyNumber" />"); return false;} //상위메뉴번호는 숫자만 입력 가능합니다.

	if(document.menuManageVO.progrmFileNm.value == ""){alert("<spring:message code="comSymMnuMpm.menuList.validate.progrmFileNm.notNull" />"); return false;} //프로그램파일명은 필수 항목입니다.
	if(document.menuManageVO.menuNm.value == ""){alert("<spring:message code="comSymMnuMpm.menuList.validate.menuNm.notNull" />"); return false;} //메뉴명은 필수 항목입니다.

   return true;
}


/* ********************************************************
* 필드값 Number 체크 함수
******************************************************** */
function checkNumber(str) {
   var flag=true;
   if (str.length > 0) {
       for (i = 0; i < str.length; i++) {
           if (str.charAt(i) < '0' || str.charAt(i) > '9') {
               flag=false;
           }
       }
   }
   return flag;
}

/* ********************************************************
 * 수정처리 함수
 ******************************************************** */
function updateMenuManage(form) {
	if(!fn_validatorMenuList()){return;}
	if(confirm("<spring:message code="common.save.msg"/>")){

		if(!validateMenuManageVO(form)){
			return;
		}else{
            form.action="<c:url value='/sym/mnu/mpm/EgovMenuDetailSelectUpdt.do' />";
			form.submit();
		}
	}
}

/* ********************************************************
 * 삭제처리함수
 ******************************************************** */
function deleteMenuManage(form) {
	if(confirm("<spring:message code="common.delete.msg"/>")){
        form.action="<c:url value='/sym/mnu/mpm/EgovMenuManageDelete.do' />";
		form.submit();
	}
}
/* ********************************************************
 * 목록조회 함수
 ******************************************************** */
function selectList(){
	location.href = "<c:url value='/sym/mnu/mpm/EgovMenuManageSelect.do' />";
}

/* ********************************************************
 * 파일명 엔터key 목록조회  함수
 ******************************************************** */
function press() {
    if (event.keyCode==13) {
    	searchFileNm();    // 원래 검색 function 호출
    }
}


<c:if test="${!empty resultMsg}">alert("${resultMsg}");</c:if>
-->
</script>
<script type="text/javascript">
    $(document).ready(function () {
    	// 파일검색 화면 호출 함수
        $('#popupProgrmFileNm').click(function (e) {
        	e.preventDefault();
            //var page = $(this).attr("href");
            var pagetitle = $(this).attr("title");
            var page = "<c:url value='/sym/prm/EgovProgramListSearchNew.do'/>";
            var $dialog = $('<div></div>')
            .html('<iframe style="border: 10px solid; " src="' + page + '" width="100%" height="100%"></iframe>')
            .dialog({
            	autoOpen: false,
                modal: true,
                width: 950,
                height: 850,
                title: pagetitle
        	});
        	$dialog.dialog('open');
    	});
        // 메뉴이동 화면 호출 함수
        $('#popupUpperMenuId').click(function (e) {
        	e.preventDefault();
            //var page = $(this).attr("href");
            var pagetitle = $(this).attr("title");
            var page = "<c:url value='/sym/mnu/mpm/EgovMenuListSelectMvmnNew.do'/>";
            var $dialog = $('<div style="overflow:hidden;padding: 0px 0px 0px 0px;"></div>')
            .html('<iframe style="border: 10px solid; " src="' + page + '" width="100%" height="100%"></iframe>')
            .dialog({
            	autoOpen: false,
                modal: true,
                width: 950,
                height: 850,
                title: pagetitle
        	});
        	$dialog.dialog('open');
    	});
	});
</script>
</head>
<body>

<noscript class="noScriptTitle"><spring:message code="common.noScriptTitle.msg" /></noscript><!-- 자바스크립트를 지원하지 않는 브라우저에서는 일부 기능을 사용하실 수 없습니다. -->

<form:form commandName="menuManageVO" name="menuManageVO"  action ="<c:url value='/sym/mnu/mpm/EgovMenuDetailSelectUpdt.do' />" method="post">

<div class="wTableFrm">
	<!-- 타이틀 -->
	<h3 class="mb-4"><spring:message code="comSymMnuMpm.menuDetailSelectUpdt.pageTop.title"/></h3><!-- 메뉴상세조회및 수정 -->

	<!-- 등록폼 -->
	<table class="table">
		<colgroup>
			<col style="width:12%" />
			<col style="" />
			<col style="width:12%" />
			<col style="" />
		</colgroup>
		<tr>
			<th><spring:message code="comSymMnuMpm.menuDetailSelectUpdt.menuNo"/> <span class="pilsu" style="color: red">*</span></th><!-- 메뉴No -->
			<td class="left">
			    <c:out value="${menuManageVO.menuNo}"/>
				<form:hidden path="menuNo" />
				<form:errors path="menuNo" />
			</td>
			<th><spring:message code="comSymMnuMpm.menuDetailSelectUpdt.menuOrder"/> <span class="pilsu" style="color: red">*</span></th><!-- 메뉴순서 -->
			<td class="left">
			    <form:input class="form-control" path="menuOrdr" maxlength="10" title="<spring:message code='comSymMnuMpm.menuDetailSelectUpdt.menuOrder'/>" cssStyle="width:100px"/><!-- 메뉴순서 -->
      			<form:errors path="menuOrdr" />
			</td>
		</tr>
		<tr>
			<th><spring:message code="comSymMnuMpm.menuDetailSelectUpdt.menuNm"/> <span class="pilsu" style="color: red">*</span></th><!-- 메뉴명 -->
			<td class="left">
			    <form:input class="form-control" path="menuNm" title="<spring:message code='comSymMnuMpm.menuDetailSelectUpdt.menuNm'/>" style="width:40%"/><!-- 메뉴명 -->
      			<form:errors path="menuNm" />
			</td>
			<th><spring:message code="comSymMnuMpm.menuDetailSelectUpdt.upperMenuId"/> <span class="pilsu" style="color: red">*</span></th><!-- 상위메뉴No -->
			<td class="left">
				<div class="form-inline form-group">
				    <form:input class="form-control mr-2" path="upperMenuId" maxlength="10" title="<spring:message code='comSymMnuMpm.menuDetailSelectUpdt.upperMenuId'/>" cssStyle="width:150px"/><!-- 상위메뉴No -->
					<form:errors path="upperMenuId" />
					<a id="popupUpperMenuId" href="<c:url value='/sym/mnu/mpm/EgovMenuListSelectMvmn.do' />" target="_blank" title="<spring:message code="comSymMnuMpm.menuDetailSelectUpdt.newWindow"/>"><img src="<c:url value='/images/app/all/btn_search.png' />"
					    alt='' width="15" height="15" /></a><!--새창으로 --><!-- 메뉴선택 검색 -->
				</div>
			</td>
		</tr>
		<tr>
			<th><spring:message code="comSymMnuMpm.menuDetailSelectUpdt.progrmFileNm"/> <span class="pilsu" style="color: red">*</span></th><!-- 파일명 -->
			<td class="left" colspan="3">
				<div class="form-inline form-group">
				    <form:input class="form-control mr-2" path="progrmFileNm" size="150" maxlength="150" title="<spring:message code='comSymMnuMpm.menuDetailSelectUpdt.progrmFileNm'/>" style="width:40%"/><!-- 파일명 -->
				    <form:errors path="progrmFileNm" />
			        <a id="popupProgrmFileNm" href="<c:url value='/sym/prm/EgovProgramListSearch.do' />" target="_blank" title="<spring:message code="comSymMnuMpm.menuDetailSelectUpdt.newWindow"/>"><img src="<c:url value='/images/app/all/btn_search.png' />"
			         alt='' width="15" height="15" /></a><!-- 새창으로 이동 --><!-- 프로그램파일명 검색 -->
		    	</div>
			</td>
		</tr>
		<tr>
			<th><spring:message code="comSymMnuMpm.menuDetailSelectUpdt.relateImageNm"/> <span class="pilsu" style="color: red">*</span></th><!-- 관련이미지명 -->
			<td class="left">
			    <form:input class="form-control" path="relateImageNm" size="15" maxlength="15" title="<spring:message code='comSymMnuMpm.menuDetailSelectUpdt.relateImageNm'/>" style="width:87%"/><!-- 관련이미지명 -->
      			<form:errors path="relateImageNm" />
			</td>
			<th><spring:message code="comSymMnuMpm.menuDetailSelectUpdt.relateImagePath"/> <span class="pilsu" style="color: red">*</span></th><!-- 관련이미지경로 -->
			<td class="left">
			    <form:input class="form-control" path="relateImagePath" size="15" maxlength="15" title="<spring:message code='comSymMnuMpm.menuDetailSelectUpdt.relateImagePath'/>" style="width:87%"/><!-- 관련이미지경로 -->
      			<form:errors path="relateImagePath" />
			</td>
		</tr>
		<tr>
			<th><spring:message code="comSymMnuMpm.menuDetailSelectUpdt.menuDc"/> <span class="pilsu" style="color: red">*</span></th><!-- 메뉴설명 -->
			<td class="left" colspan="3">
			    <form:textarea class="form-control" path="menuDc" rows="10" cols="30" title="<spring:message code='comSymMnuMpm.menuDetailSelectUpdt.menuDc'/>" style="width:40%"/><!-- 메뉴설명 -->
      			<form:errors path="menuDc"/>
			</td>
		</tr>
	</table>

	<!-- 하단 버튼 -->
	<div class="btn">
		<input class="btn-two blue small mr-2" type="submit" value='<spring:message code="button.update" />' onclick="updateMenuManage(document.forms[0]); return false;" /><!-- 수정 -->
		<a class="btn-two blue small mr-2" href="<c:url value='/uss/ion/evt/selectEventRceptList.do'/>?menuNo=<c:out value='${menuManageVO.menuNo}'/>" onclick="deleteMenuManage(document.forms[0]); return false;"><spring:message code="button.delete" /></a><!-- 삭제 -->
		<a class="btn-two blue small mr-2" href="<c:url value='/sym/mnu/mpm/EgovMenuManageSelect.do'/>" onclick="selectList(); return false;"><spring:message code="button.list"/></a><!-- 목록 -->
	</div>
	<div style="clear:both;"></div>
</div>

<input type="hidden" name="tmp_SearchElementName" value=""/>
<input type="hidden" name="tmp_SearchElementVal" value=""/>
<input name="cmd"    type="hidden"   value="update"/>
</form:form>

</body>
</html>

