<%--
  Created by IntelliJ IDEA.
  User: HQKJ
  Date: 2019/8/29
  Time: 10:30
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>太平洋保险山东分公司</title>
    <link href="/static/css/left.css" type="text/css" rel="stylesheet">

    <%
        session = request.getSession();
        Object user = session.getAttribute("user");
        if (user == null) {
            response.sendRedirect(request.getContextPath() + "/jsps/login.jsp");
        }
    %>
</head>
<body>

<div class="col-sm-3">
    <div class="m_nav">
        <div class="ncm_l_top">
            菜单栏
        </div>
        <!-- 列表菜单-->
        <div class="mv_mt">
            <c:if test="${user.level==0 || user.level==1}">
                <div class="n_tit n_tit2" id="viewData">
                    <img src="/static/img/left/temp3.jpg" width="20" height="20" style="background-color: #9acfea">
                    <a href="${pageContext.request.contextPath}/jsps/manage/checkManageData.jsp"
                       style="color: black;text-decoration: none">
                        查看数据
                    </a>
                </div>
            </c:if>

            <c:if test="${user.level==0 || user.level==1}">
                <div class="n_tit" id="institution">
                    <img src="/static/img/left/temp1.jpg" width="20" height="20">
                        <%-- <a href="${pageContext.request.contextPath}/organ/findOrgan" style="color: black;text-decoration: none">
                             机构管理
                         </a>--%>
                    <a href="${pageContext.request.contextPath}/jsps/manage/OrganManagement.jsp"
                       style="color: black;text-decoration: none">
                        机构管理
                    </a>
                </div>
            </c:if>

            <c:if test="${user.level==0 || user.level==1}">
                <div class="n_tit" id="userManage">
                    <img src="/static/img/left/temp1.jpg" width="20" height="20">
                    <a href="${pageContext.request.contextPath}/jsps/manage/userManagement.jsp"
                       style="color: black;text-decoration: none">
                        用户管理
                    </a>
                </div>
            </c:if>


            <%-------------------------------------------------------------------------------------------------------------------------------------------%>


            <c:if test="${user.level==2}">
                <div class="n_tit n_tit2" id="viewData">
                    <img src="/static/img/left/temp3.jpg" width="20" height="20" style="background-color: #9acfea">
                    <a href="${pageContext.request.contextPath}/jsps/manage/checkCountyUserData.jsp"
                       style="color: black;text-decoration: none">
                        查看数据
                    </a>
                </div>
            </c:if>

            <c:if test="${user.level==2}">
                <div class="n_tit" id="forecastData">
                    <img src="/static/img/left/temp2.jpg" width="20" height="20">
                        <%-- <a href="${pageContext.request.contextPath}/jsps/countyUser/forecastData.jsp" style="color: black;text-decoration: none">
                             预报数据
                         </a>--%>
                    <a href="${pageContext.request.contextPath}/jsps/countyUser/predictionData.jsp"
                       style="color: black;text-decoration: none">
                        预报数据
                    </a>
                </div>
            </c:if>

            <c:if test="${user.level==2}">
                <div class="n_tit" id="addData">
                    <img src="/static/img/left/temp2.jpg" width="20" height="20">
                        <%--<a href="${pageContext.request.contextPath}/jsps/countyUser/showData.jsp" style="color: black;text-decoration: none">
                            上传数据
                        </a>--%>
                    <a href="${pageContext.request.contextPath}/jsps/countyUser/viewData.jsp"
                       style="color: black;text-decoration: none">
                        上传数据
                    </a>
                </div>
            </c:if>
            <ul>

            </ul>

        </div>
    </div>
</div>
</body>
<script src="/static/js/login.js"></script>
</html>
