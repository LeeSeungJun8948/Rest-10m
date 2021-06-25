<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div align="left">
		<table>
			<tr>
				<th>코드ID</th>
				<th>코드NAME</th>
			</tr>
			<c:forEach items="${commlist }" var="cl">
				<tr>
					<td>${cl.codeId }</td>
					<td>${cl.codeIdNm }</td>
				</tr>
			</c:forEach>
		</table>
	</div>
</body>
</html>