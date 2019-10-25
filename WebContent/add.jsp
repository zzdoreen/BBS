<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<script type="text/javascript" src="ueditor/ueditor.config.js"></script>  
<script type="text/javascript" src="ueditor/ueditor.all.js"></script> 
<script>
        var UEDITOR_HOME_URL = "/ueditor/";//从项目的根目录开始
         
</script>

</head>
<body>
<textarea id="newsEditor" name="content"> </textarea> 
<script type="text/javascript">  
           UE.getEditor('newsEditor');  
</script>  
</body>
</html>