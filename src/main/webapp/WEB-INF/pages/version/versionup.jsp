<%--
  Created by IntelliJ IDEA.
  User: think
  Date: 2018/9/5
  Time: 9:48
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<script src="/static/jquery-fileuploader/jquery.ajaxfileupload.js" type="text/javascript"></script>
<link rel="stylesheet" type="text/css" href="/static/common/bootstrap-custom.css"/>
<script src="/static/jquery/jquery-1.8.3.js" type="text/javascript"></script>

<style>
    label.error{display:inline-block!important}
    body{background:#fff}
</style>
<html>
<head>
    <title>app上传</title>
    <
    <script type="text/javascript">
        function check(){
            var valu="";
            var type = document.getElementsByName("uploadType");
            for(var i=0;i<type.length;i++){
                if(type[i].checked)
                    valu = type[i].value;
            }

            if(valu == 1){
                $("#filepa").show(500);
                $("#fileup").hide(500);
            }
            if(valu == 2){
                $("#filepa").hide(500);
                $("#fileup").show(500);
                //document.getElementById("fileup").style.display="block";
                //document.getElementById("filepa").style.display="none";
            }

        }
    </script>
</head>
<body>
<div class="container-fluid">
    <div class="content_box" style="padding-top:20px;">
        <form id="inputForm" action="/winver/apk/upload" method="post" enctype="multipart/form-data" class="form-horizontal" style="
    width: 480px; margin:0 auto;">

            <div class="control-group">
                <label class="control-label">应用类型：</label>
                <div class="controls">

                    ${fns:dictSelect("appType","MDS_WIN_TYPE"," class=\"input-medium\" style=\"width:220px;\"","请选择")}
                </div>
            </div>

            <div class="control-group" >
                <label class="control-label">当前版本编号：</label>
                <div class="controls">
                    <input name="oldVersionId" id="oldVersionId" value="" type="text" disabled="true" data-rule-required="true" style="width:220px;" />
                </div>
            </div>

            <div class="control-group" >
                <label class="control-label">版本编号：</label>
                <div class="controls">
                    <input name="versionId" id="versionId"   type="text" onblur= "checkVersion()" style="width:220px;" data-rule-required="true" />
                    <span id="showResult"></span>
                </div>
            </div>

            <div class="control-group" >
                <label class="control-label">当前版本序号：</label>
                <div class="controls">
                    <input name="oldVersionCode" id="oldVersionCode" value="" type="text" disabled="true" data-rule-required="true" style="width:220px;" />
                </div>
            </div>

            <div class="control-group" >
                <label class="control-label">版本序号：</label>
                <div class="controls">
                    <input name="versionCode" id="versionCode" placeholder="只能输入数字" onkeyup="value=value.replace(/[^\d]/g,'')"  type="text" onblur= "checkVersionCode()" style="width:220px;" data-rule-required="true" />
                    <span id="showCode"></span>
                </div>
            </div>

            <!--          <div class="control-group">
                          <label class="control-label">是否最新版：</label>
                          <div class="controls">
                               <select name="isNewFlag" style=" height:32px;  width:220px" data-rule-required="true">
                                   <option value="Y" >是</option>
                                   <option value="N" >否</option>
                               </select>
                          </div>
                     </div> -->

            <div class="control-group">
                <label class="control-label">上传方式：</label>
                <div class="controls" style="height: 20px;padding-top: 11px;">
                    <input  name="uploadType" type="radio" value="1"  onclick="check();"  checked="checked" /><span style="margin-left:8px;">路径上传</span>
                    <input  name="uploadType" type="radio" value="2"  onclick="check();"/><span style="margin-left:8px;">文件上传</span>
                </div>
            </div>

            <div id ="filepa"  class="control-group">
                <label class="control-label">文件路径：</label>
                <div class="controls">
                    <textarea rows=1 name="filePath" id="filePath" data-rule-required="true"></textarea>
                </div>
            </div>

            <div id ="fileup" style="display: none;" class="control-group">
                <label class="control-label">文件上传：</label>
                <div class="controls">
                    <input type="file" id="file" name="file" style="width:220px;opacity: 1;" data-rule-required="true"/>
                    <!-- 		       <input id="uploadfile" class="btn btn-primary" type="button" value="上传"  onclick="upload()" />
                     -->
                </div>
            </div>

            <div class="control-group">
                <label class="control-label">版本描述：</label>
                <div class="controls">
                    <textarea rows=4 name="versionDesc" id="versionDesc" data-rule-required="true"></textarea>
                </div>
            </div>

            <div class="form-actions" style="width:324px;border:none;background:none;text-align:right;padding-left:0!important;margin-top:0">
                <input id="btnSubmit" class="btn btn-primary" type="submit" value="提交"  />&nbsp;
                <input id="btnCancel" class="btn btn-second" type="button" value="返 回" onclick="history.go(-1)"/>
            </div>

        </form>
    </div>
</div>

</body>
</html>
