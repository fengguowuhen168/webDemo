<%--
  Created by IntelliJ IDEA.
  User: think
  Date: 2018/9/4
  Time: 16:17
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
    <title>版本升级</title>
    <style>
        html{
            height: 100%;}
        body{
            overflow: hidden;
            background: #fff;
            overflow-x: hidden;
            min-width: 0;
            height: 100%;
        }
    </style>
    <link rel="stylesheet" type="text/css" href="/static/common/bootstrap-custom.css"/>
</head>
<body>

<div id="content" class="row-fluid row-fluid_custom" style="overflow: hidden;margin-top:0;height:100%">
    <%--<input id="versionId" name="versionId" type="hidden" value="${versionId}"  />
    <input id="appType" name="appType" type="hidden" value="${appType}"  />
    <input id="versionCode" name="versionCode" type="hidden" value="${versionCode}"  />--%>
    <div id="left" class="span4" style="height:1000%;margin-left:0;float: left;width: 50%" >

      <iframe id="versionMenuFrame" name="versionMenuFrame" style="overflow:visible;height:100%;width: 100%;" scrolling="yes" frameborder="no" width="100%"
                src="/winver/ztree" ></iframe>
    </div>
    <div id="right" class="span8" style="height:100%;float: left;width: 50%">
        <iframe id="versionMainFrame" name="versionMainFrame" style="overflow:visible;height:100%;" scrolling="yes" frameborder="no" width="100%"
                src="/winver/querys"></iframe>

    </div>

</div>

</body>
</html>
