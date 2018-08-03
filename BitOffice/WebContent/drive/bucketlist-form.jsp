<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.2/jquery.min.js"></script>
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
<title>Bucket List Form</title>
<body>
    <br>
    <div style="text-align: center">
        <h2>
            클라우드 데이터<br> <br>
        </h2>
    </div>
    <div style="margin-left: 5%;">
        <a href="/drive/">
            <button type="button" class="btn btn-primary" style="margin-bottom: 1%;">
                <span class="glyphicon glyphicon-home"> </span>
                &nbsp; Home
            </button>
        </a>
        <form method="post" action="/drive/bucketlist.jsp">
            <input type="text" name="bucket-name" class="form-control" style="width: 50%; float: left"
                placeholder="Enter the name of the bucket to list the items: " required />
            <button class="btn btn-primary" type="submit" style="float: left; margin-left: 1%">
                <span class="glyphicon glyphicon-cloud"></span>
                <span class="glyphicon glyphicon-search"></span>
                &nbsp; 파일 목록
            </button>
        </form>
    </div>
</body>
</html>