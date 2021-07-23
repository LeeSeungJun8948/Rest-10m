<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title> 권한 없음 </title>
<link href="${pageContext.request.contextPath}/css/sb-admin-2.min.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
<link href="${pageContext.request.contextPath}/css/app/prod/button.css" rel="stylesheet">
<script language="javascript">
function fncGoAfterErrorPage(){
    history.back(-2);
}
</script>
<style type="text/css">
.login_form { width: 100%; 
	          height: 100vh; 
	          display: -webkit-box; 
	          display: -moz-box;
	          display: -ms-flexbox; 
	          display: flex; 
	 
	          -webkit-box-align: center; 
	          -moz-box-align: center;
	          -ms-flex-align: center;
	          align-items: center; /* 수직 정렬 */
	 
	          -webkit-box-pack: center;
	          -moz-box-pack: center; 
	          -ms-flex-pack: center; 
	          justify-content: center; /* 수평 정렬 */ }
</style>
</head>

<body>

<div align="center" class="login_form">
	<!-- 404 -->
	<div>
		<div>
			<div>
				<h3 class="mb-8">권한이 없습니다.</h3>
				<br><br>
				<a class="btn-two small blue" href="javascript:fncGoAfterErrorPage();">이전 페이지</a>
			</div>
		</div>
	</div>
</div>

</body>
</html>
