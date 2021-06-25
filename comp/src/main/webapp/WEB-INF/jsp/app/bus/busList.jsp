<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div>
		<table class="table">
			<c:forEach items="${bus}" var="buss">
				<tr>
					<th>${buss.codeId }</th>
				</tr>
			</c:forEach>
		</table>
	</div>
</body>
</html>