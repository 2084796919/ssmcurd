<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2021/8/22
  Time: 18:10
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    pageContext.setAttribute("APP_PATH",request.getContextPath());
%>
<html>
<head>
    <title>员工列表</title>
    <link href="${APP_PATH}//static/js/jquery-1.12.4.min.js">
    <link rel="stylesheet" href="${APP_PATH}/static/bootstrap-3.4.1-dist/css/bootstrap.min.css">
    <script src="${APP_PATH}/static/bootstrap-3.4.1-dist/js/bootstrap.min.js"></script>
</head>
<body>
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <h4>CRUD-SSM</h4>
            </div>
        </div>
        <div class="row">
            <div class="col-md-4 col-xs-offset-9 col-md-offset-9 col-sm-offset-9  col-lg-offset-9">
                <button class="btn btn-primary">添加</button>
                <button class="btn btn-danger">删除</button>

            </div>
            <tr/>
        </div>
        <div class="row">
            <div class="col-md-12">
                <table class="table table-bordered table-hover">
                    <tr>
                        <th>#</th>
                        <th>empName</th>
                        <th>gender</th>
                        <th>email</th>
                        <th>deptName</th>
                        <th>edit</th>
                    </tr>
                    <c:forEach items="${pageInfo.list}" var="item">
                        <tr>
                            <th>${item.empId}</th>
                            <th>${item.empName}</th>
                            <th>${item.gender}</th>
                            <th>${item.email}@qq.com</th>
                            <th>${item.dept.deptName}</th>
                            <th>
                                <button class="btn btn-primary btn-default btn-sm" >
                                    <span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>编辑
                                </button>
                                <button class="btn btn-danger btn-default btn-sm">
                                    <span class="glyphicon glyphicon-trash" aria-hidden="true"></span>删除
                                </button>
                            </th>
                        </tr>
                    </c:forEach>

                </table>
            </div>
        </div>
        <div class="row">
            <div class="col-md-6 col-xs-6 col-sm-6 col-sm-6 col-lg-6">
                <nav aria-label="Page navigation">
                    <ul class="pagination">
                        当前${pageInfo.pageNum}页，总${pageInfo.pages}页，
                        总记录数：${pageInfo.total}

                    </ul>
                </nav>
            </div>
            <div class="col-md-6 col-xs-6 col-sm-6 col-sm-6 col-lg-6">
                <nav aria-label="Page navigation">
                    <ul class="pagination">
                        <li><a href="${APP_PATH}/emps?pn=1">首页</a></li>
                        <%--  上一页  --%>
                        <c:if test="${pageInfo.hasPreviousPage}">
                            <li>
                                <a href="${APP_PATH}/emps?pn=${pageInfo.pageNum-1}" aria-label="Previous">
                                    <span aria-hidden="true">&laquo;</span>
                                </a>
                            </li>
                        </c:if>


                        <%-- 显示页码 --%>
                        <c:forEach items="${pageInfo.navigatepageNums}" var="item">
                            <c:if test="${item == pageInfo.pageNum}">
                                <li class="active"><a href="#" >${item}</a></li>
                            </c:if>
                            <c:if test="${item != pageInfo.pageNum}">
                                <li><a href="${APP_PATH}/emps?pn=${item}">${item}</a></li>
                            </c:if>

                        </c:forEach>

                        <%--下一页--%>
                        <c:if test="${pageInfo.hasNextPage}">
                            <li>
                                <a href="${APP_PATH}/emps?pn=${pageInfo.pageNum+1}" aria-label="Previous">
                                    <span aria-hidden="true">&raquo;</span>
                                </a>
                            </li>
                        </c:if>
                        <li><a href="${APP_PATH}/emps?pn=${pageInfo.pages}">尾页</a></li>
                    </ul>
                </nav>
            </div>
        </div>
    </div>
</body>
</html>
