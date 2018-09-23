<%--
  Created by IntelliJ IDEA.
  User: think
  Date: 2018/9/13
  Time: 11:10
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ page isELIgnored="false" %>

<html>
<head>
    <title>上传收寄</title>
    <link rel="stylesheet" type="text/css" href="/static/common/bootstrap-ie6.min.css"/>
    <link rel="stylesheet" type="text/css" href="/static/common/bootstrap-custom.css"/>
    <script type="text/javascript" src="/static/jquery/jquery-1.8.3.js"></script>
    <script type="text/javascript" src="/static/jquery-jbox/2.3/jquery.jBox-2.3.js"></script>
   <%-- <script type="text/javascript" src="/static/jquery-jbox/2.3/jquery.jBox-2.3.src.js"></script>--%>
   <%-- <script src="/static/jquery-autocomplete/1.2.27/jquery.autocomplete.js" type="text/javascript"></script>--%>

    <link href="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.css" rel="stylesheet" />
    <link href="/static/jquery-jbox/2.3/Skins2/Metro/jbox.css" rel="stylesheet" />

    <script src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.js"></script>

    <script type="text/javascript">
        toastr.options.positionClass = 'toast-top-full-width';
    </script>
    <script type="text/javascript">
      function check() {
          var filePath = $("#file").val();
          if (filePath==''||filePath == null || filePath == undefined) {
              toastr.remove();
             toastr.error("请选择文件！");
              return false;
          }
          return true;
        }
    </script>
    <script type="text/javascript">
        function getBrowser() {
            var ua = window.navigator.userAgent;
            var isIE = window.ActiveXObject != undefined && ua.indexOf("MSIE") != -1;
            var isChrome = ua.indexOf("Chrome") && window.chrome;
            if (isIE) {
                return "IE";
            } else if (isChrome) {
                return "Chrome";
            }
        }
        $(document).ready(function() {
            if (getBrowser() == "IE") {
                var scriptNode = document.createElement("script"),
                    timer,
                    supportLoad = "onload" in scriptNode,
                    onEvent = supportLoad ? "onload" : "onreadystatechange";
                scriptNode[onEvent] = function onLoad() {
                    if (!supportLoad && !timer && /complete|loaded/.test(scriptNode.readyState)) {
                        timer = setTimeout(onLoad)
                        return
                    }
                    if (supportLoad || timer) {
                        clearTimeout(timer)
                        var setportflag = false;
                        k = $('#realWeight').eweighter({
                            deviceModel:'taihang'
                        });
                        if('${chairs.elecScaleAuxPort}'!=""&& '${chairs.elecScaleAuxBaudrate}'!=""){
                            setportflag=true;
                        }
                        if(!setportflag){
                            k.setPortName('COM1');
                            k.setBaudRate('2400');
                        }
                        if(setportflag){
                            k.setPortName('${chairs.elecScaleAuxPort}');
                            k.setBaudRate('${chairs.elecScaleAuxBaudrate}');
                        }

                        $('#realWeight').focus(function(){
                            $(this).attr("data-w",1)
                            k.startGetWeight($(this));
                        }).blur(function() {
                            $(this).attr("data-w",0)
                        })
                        window.onbeforeunload = function() {
                            k.stopGetWeight();
                        }
                    }
                }
                scriptNode.setAttribute("type", "text/javascript");
                scriptNode.setAttribute("src", ctxStatic+"/eweighter/eweighter.js");
                document.getElementsByTagName('head')[0].appendChild(scriptNode);

            } else if (getBrowser() == "Chrome") {
                $(".weight_for_chrome").focus(function() {
                    $(this).attr("data-w", 1)
                }).blur(function() {
                    $(this).attr("data-w", 0)
                })

            }
        });
    </script>
</head>
<body>
<ul class="breadcrumb">
    <li>首页 <span class="divider">&gt;</span></li>
    <li>揽收子系统 <span class="divider">&gt;</span></li>
    <li class="active">苹果上传收寄</li>
</ul>
<div class="container-fluid">
    <div class="content_box" style="padding-top:20px;">
        <form id="inputForm"  action="/apple/save" onsubmit="return check()" method="post"  enctype="multipart/form-data"  class="form-horizontal" style="width: 480px; margin:0 auto;">

           <%-- <div class="accordion-toggle accordion-head" data-toggle="collapse" data-target="#collapseOne" id=""><div class="menu-head">
            <span class="cp-icon  cp-icon-mail"></span>
            <span class="menu_title">apple上传收寄</span>
            </div>--%>
            <div id ="fileup"  class="control-group">
                <div class="controls">
                    <input type="file" id="file" name="file" style="width:220px;opacity: 1;" enctype="multipart/form-data"   data-rule-required="true"/>

                    <input id="btnSubmit" class="btn btn-primary"  type="submit" value="提交"  />
                </div>
            </div>

        </form>
    </div>
    <%--<table id="contentTable" class="table table-striped table-bordered ">
        <thead><tr><th width=10%>失败邮件号${size}个明细</th></tr></thead>
        <tbody>
        <c:forEach items="${info}" var="a">
        <tr>
            <td>${a.waybillNo}</td>

            </c:forEach>
        </tr>
        </tbody>
    </table>--%>
</div>
<c:out value="${res}"></c:out>
<c:if test ="${res == '1'}">
    <script type="text/javascript">
        $(document).ready(function() {
            toastr.remove();
            toastr.success("保存成功 ");
            $.jBox.prompt("${msg}" ,"提示信息！");

        });
    </script>
</c:if>
<c:if test ="${res=='2'}">
    <script type="text/javascript">
        $(document).ready(function() {
            toastr.remove();
            toastr.error("${msg}");
        });
    </script>
</c:if>
</body>
</html>
