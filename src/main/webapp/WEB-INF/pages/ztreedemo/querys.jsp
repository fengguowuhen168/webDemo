<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<html>
<head>
<%--<meta name="decorator" content="list"/>--%>
<link rel="stylesheet" type="text/css" href="/static/common/bootstrap-custom.css"/>
<style type="text/css">
    
    body{background:#fff;min-width:0;}
    </style> 
</head>
<body>
   

    <table id="contentTable" class="table table-striped table-bordered table-condensed">
        <thead><tr><th width=10%>版本号</th><th width=10%>系统类型</th><th width=10%>允许安装机构</th><th width=10%>当前版本号</th><th width=10%>是否强制安装</th></tr></thead>
        <tbody>
            <%-- <c:forEach items="${pageData.items}" var="a">
             <tr>
             <td>${a.versionId}</td> 
             <td>
                <c:if test ="${a.appType == 'A'}">
                <c:out value="揽投PDA"></c:out>
                </c:if>
                <c:if test ="${a.appType == 'Z'}">
                <c:out value="中转PDA"></c:out>
                </c:if>
                <c:if test ="${a.appType == 'Y'}">
                <c:out value="备份1"></c:out>
                </c:if>
                <c:if test ="${a.appType == 'X'}">
                <c:out value="备份2"></c:out>
                </c:if>
                <c:if test ="${a.appType == 'W'}">
                <c:out value="备份3"></c:out>
                </c:if>
                <c:if test ="${a.appType == 'V'}">
                <c:out value="备份4"></c:out>
                </c:if>
             </td> 
             <td>${a.orgId}</td> 
             <td>${a.appVsersion}</td> 
             <td>
                <c:if test="${a.isForce == 'Y'}">
                <c:out value="是"></c:out>
                </c:if>
                <c:if test="${a.isForce == 'N'}">
                <c:out value="否"></c:out>
                </c:if>
             </td> 
             </tr>  
		</c:forEach>  --%>

        </tbody>
    </table>
</body>

</html>