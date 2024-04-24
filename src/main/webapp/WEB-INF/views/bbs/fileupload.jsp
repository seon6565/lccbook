<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2024-04-23
  Time: 오후 2:13
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" trimDirectiveWhitespaces="true" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Title</title>
    <meta charset="UTF-8">
</head>
<body>
<form name="frmFile" id="frmFile" method="post" enctype="multipart/form-data" action="/bbs/fileupload">
    <div>
        <span>파일업로드</span>
        <input type="file" name="file" id="file" />
    </div>
    <div>
        <input type="submit" value="전송" />
    </div>
</form>

<form name="frmFiles" id="frmFiles" method="post" enctype="multipart/form-data" action="/bbs/fileupload2">
    <div>
        <span>파일업로드</span>
        <input type="file" name="files" id="files" multiple/>
    </div>
    <div>
        <input type="submit" value="전송" />
    </div>
</form>
</body>
</html>
