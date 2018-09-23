<%--
  Created by IntelliJ IDEA.
  User: think
  Date: 2018/8/29
  Time: 17:27
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>ztreedemo</title>
    <meta http-equiv="content-type" content="text/html; charset=UTF-8">
<%--   <link rel="stylesheet" href="/static/jquery-ztree/3.5.12/css/demo.css" type="text/css">--%>
    <link rel="stylesheet" href="/static/jquery-ztree/3.5.12/css/zTreeStyle/zTreeStyle.css" type="text/css">
    <script type="text/javascript" src="/static/jquery/jquery-1.8.3.js"></script>
    <script type="text/javascript" src="/static/jquery-ztree/3.5.12/js/jquery.ztree.core-3.5.js"></script>
    <script type="text/javascript" src="/static/jquery-ztree/3.5.12/js/jquery.ztree.excheck-3.5.js"></script>
    <script type="text/javascript" src="/static/jquery-jbox/2.3/jquery.jBox-2.3.js"></script>
    <script type="text/javascript" src="/static/jquery-jbox/2.3/i18n/jquery.jBox-zh-CN.js"></script>
    <link rel="stylesheet" href="/static/jquery-jbox/2.3/Skins2/Metro/jbox.css" type="text/css">
    <link rel="stylesheet" href="/static/jquery-jbox/2.3/Skins2/Metro/jbox_style.css" type="text/css">




    <link rel="stylesheet" type="text/css" href="/static/common/bootstrap-custom.css"/>
    <style type="text/css">
        .ztree {overflow:auto;margin:0;_margin-top:0px;padding:10px 0 0 10px;}/*--
        .ztree li span.button.level0, .ztree li a.level0 {display:none;height:0;}
        .ztree li ul.level0 {padding:0;background:none;}--*/
        .accordion-inner{padding:2px;}
        .accordion-group{height:500px;}
        body {overflow:hidden;padding-left:0;padding-right:0;min-width:0;background:#fff;height:100%!important;padding-bottom:0}
        .breadcrumb{padding:0px 0 !important;}
    </style>
    <script type="text/javascript">
        function onClick(e, treeId, treeNode) {
            var zTree = $.fn.zTree.getZTreeObj("treeDemo1");
            nodes = zTree.getSelectedNodes();
            var code = nodes[0].nameCn;
            alert("code"+code);
        }
        $().ready(function(){
            $("html").height("100%")
            $("body").height("100%")

        })
    </script>
    <script language="JavaScript">
        var zTreeObj;
        // zTree 的参数配置，深入使用请参考 API 文档（setting 配置详解）
        var setting = {
            view: {
                dblClickExpand: true,
                showIcon:true
            },
            data: {
                simpleData: {
                    enable: true,
                    idKey : "id",
                    pIdKey : "parentOrgCode"
                },
                key:{
                    name:"nameCn"
                },
                keep:{
                    parent:true
                }

            },
            check :{
                enable: true,
                chkStyle:"checkbox",
                chkboxType :{ "Y" : "ps", "N" : "ps" },
                radioType:"all"
            },
            callback: {
                onClick: onClick,
            }

        };
        // zTree 的数据属性，深入使用请参考 API 文档（zTreeNode 节点数据详解）

        var zNodes = [
            { "id":1, "nameCn":"test1",icon: "/static/images/icon_pay.png",
                children: [
                    { "id":3, "nameCn":"test3"},
                    { "id":4, "nameCn":"test4"},
                    { "id":5, "nameCn":"test5"}
                ]
            },
            { "id":2, "nameCn":"test2" ,
                children: [
                    { "id":6, "nameCn":"test6"},
                    { "id":7, "nameCn":"test7"}
                ]
            }


        ];
        $(document).ready(function(){
            zTreeObj = $.fn.zTree.init($("#treeDemo1"), setting, zNodes);
        });


    </script>
<script type="text/javascript">


    function query(){
        alert("1111111111111");
        top.$.jBox.open("iframe:/ztree/query", "详细信息", 800, 320,{buttons: { '确认': true}});
        alert("query");
    }
</script>


</head>
<body>

<form id="treeForm"  class="breadcrumb form-search" style="height:100%;margin-bottom:0px;background:#fff;">
    <div class="accordion-group" style="height:100%;margin-bottom:0px;position:relative;top:0px;left:0" >
        <div class="accordion-heading" style="position:absolute;left:0;top:0;z-index:5">
            <a class="accordion-toggle" style="color:#fff">机构列表</a>
        </div>
        <div class="search_item" style="position:absolute;top:0px;right:0;width:100%;background:#ddd;z-index:5">
            <input name="orgID" id="orgID" placeholder="输入8位机构号" onkeyup="value=value.replace(/[^\d]/g,'')" type="text"  style="width:100%;padding-right:50px" />
            <input class="btn btn-primary" type="button" value="快速定位" onclick="queryOrgId()" style="position:absolute;right:0;top:0;padding-left:10px;padding-right:10px;">

        </div>
        <input id="versionId" name="versionId" type="hidden" value="${versionId}"  />
        <input id="appType" name="appType" type="hidden" value="${appType}"  />
        <input id="versionCode" name="versionCode" type="hidden" value="${versionCode}"  />


        <div class="zTreeDemoBackground left"></div>
        <div style="height:100%;width:100%;position:absolute;top:0;left:0;z-index:4">
            <ul id="treeDemo1" class="ztree" style="height:100%;padding-top:80px;box-sizing:border-box"></ul>
            <br />
        </div>
    </div>
</form>

</form>
</div>

</body>
</html>
