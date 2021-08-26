<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2021/8/21
  Time: 9:26
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    pageContext.setAttribute("APP_PATH",request.getContextPath());
%>
<html>
<head>
    <title>员工列表</title>
    <script src="${APP_PATH}//static/js/jquery-1.12.4.min.js"></script>
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
            <button class="btn btn-primary" id="addEmp" data-toggle="modal" >添加</button>
            <button class="btn btn-danger" id="dele_emps">删除</button>

        </div>
        <tr/>
    </div>
    <div class="row">
        <div class="col-md-12">
            <table class="table table-bordered table-hover">
                <thead>
                    <tr>
                        <th>
                            <input type="checkbox" id="checkAll"/>
                        </th>
                        <th>#</th>
                        <th>empName</th>
                        <th>gender</th>
                        <th>email</th>
                        <th>deptName</th>
                        <th>edit</th>
                    </tr>
                </thead>

                <tbody id="dataShow">
                    <%--<tr>--%>
                    <%--<th>${item.empId}</th>--%>
                    <%--<th>${item.empName}</th>--%>
                    <%--<th>${item.gender}</th>--%>
                    <%--<th>${item.email}@qq.com</th>--%>
                    <%--<th>${item.dept.deptName}</th>--%>
                    <%--<th>--%>
                    <%--<button class="btn btn-primary btn-default btn-sm" >--%>
                    <%--<span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>编辑--%>
                    <%--</button>--%>
                    <%--<button class="btn btn-danger btn-default btn-sm">--%>
                    <%--<span class="glyphicon glyphicon-trash" aria-hidden="true"></span>删除--%>
                    <%--</button>--%>
                    <%--</th>--%>
                    <%--</tr>--%>

                </tbody>
            </table>
        </div>
    </div>
    <div class="row">
        <div class="col-md-6 col-xs-6 col-sm-6 col-sm-6 col-lg-6">
            <nav aria-label="Page navigation">
                <ul class="pagination" id="page_info">

                </ul>
            </nav>
        </div>
        <div class="col-md-6 col-xs-6 col-sm-6 col-sm-6 col-lg-6">
            <nav aria-label="Page navigation">
                <ul class="pagination" id="nav_list">
                    <%--  上一页  --%>
                    <%--<c:if test="${pageInfo.hasPreviousPage}">--%>
                        <%--<li>--%>
                            <%--<a href="${APP_PATH}/emps?pn=${pageInfo.pageNum-1}" aria-label="Previous">--%>
                                <%--<span aria-hidden="true">&laquo;</span>--%>
                            <%--</a>--%>
                        <%--</li>--%>
                    <%--</c:if>--%>


                    <%-- 显示页码 --%>
                    <%--<c:forEach items="${pageInfo.navigatepageNums}" var="item">--%>
                        <%--<c:if test="${item == pageInfo.pageNum}">--%>
                            <%--<li class="active"><a href="#" >${item}</a></li>--%>
                        <%--</c:if>--%>
                        <%--<c:if test="${item != pageInfo.pageNum}">--%>
                            <%--<li><a href="${APP_PATH}/emps?pn=${item}">${item}</a></li>--%>
                        <%--</c:if>--%>

                    <%--</c:forEach>--%>

                    <%--下一页--%>
                    <%--<c:if test="${pageInfo.hasNextPage}">--%>
                        <%--<li>--%>
                            <%--<a href="${APP_PATH}/emps?pn=${pageInfo.pageNum+1}" aria-label="Previous">--%>
                                <%--<span aria-hidden="true">&raquo;</span>--%>
                            <%--</a>--%>
                        <%--</li>--%>
                    <%--</c:if>--%>
                    <%--<li><a href="${APP_PATH}/emps?pn=${pageInfo.pages}">尾页</a></li>--%>
                </ul>
            </nav>
        </div>
    </div>
</div>

<!-- 员工添加 Modal -->
<div class="modal fade" id="empAddModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" id="myModalLabel">添加员工</h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal">
                    <div class="form-group">
                        <label class="col-sm-2 control-label">empName</label>
                        <div class="col-sm-10">
                            <input type="text" name="empName" class="form-control" id="empName_add_input" placeholder="empName">
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">email</label>
                        <div class="col-sm-10">
                            <input type="text" name="email" class="form-control" id="email_add_input" placeholder="email@qq.com">
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">gender</label>
                        <div class="col-sm-10">
                            <label class="radio-inline">
                                <input type="radio" name="gender" id="gender1_add_input" value="M" checked="checked"> 男
                            </label>
                            <label class="radio-inline">
                                <input type="radio" name="gender" id="gender2_add_input" value="W"> 女
                            </label>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">deptName</label>
                        <div class="col-sm-4">
                            <!-- 部门提交部门id即可 -->
                            <select class="form-control" name="dId" id="dept_id_select">
                            </select>
                        </div>
                    </div>
                </form>

                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
                <button type="button" class="btn btn-primary" id="sub_emp">保存</button>
            </div>
        </div>
    </div>
</div>

<!-- 员工修改 Modal -->
<div class="modal fade" id="empUpModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" >修改员工</h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal">
                    <div class="form-group">
                        <label class="col-sm-2 control-label">empName</label>
                        <div class="col-sm-10">
                            <p class="form-control-static" id="empName_update_static"></p>
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">email</label>
                        <div class="col-sm-10">
                            <input type="text" name="email" class="form-control" id="email_update_input" placeholder="email@qq.com">
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">gender</label>
                        <div class="col-sm-10">
                            <label class="radio-inline">
                                <input type="radio" name="gender" id="gender1_update_input" value="M" checked="checked"> 男
                            </label>
                            <label class="radio-inline">
                                <input type="radio" name="gender" id="gender2_update_input" value="W"> 女
                            </label>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">deptName</label>
                        <div class="col-sm-4">
                            <!-- 部门提交部门id即可 -->
                            <select class="form-control" name="dId" id="dept_id_update">
                            </select>
                        </div>
                    </div>
                </form>

                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
                <button type="button" class="btn btn-primary" id="update_emp">修改</button>
            </div>
        </div>
    </div>
</div>
<script>
    var totalRecord ;
    var userNameIsUse = true
    var upEmpId,currentPage;
    $(function () {
        selePages(1);
        //用户添加页面展开
        $("#addEmp").click(function () {
            // 重置表单
            reset_form("#empAddModal form")
            //获取部门
            getDeptsShow("#dept_id_select");
            $('#empAddModal').modal({
                backdrop : "static"
            })
        })
        //添加用户
        $("#sub_emp").click(function () {
            var str = $("#empAddModal form").serialize();

            // if(!validdate_add_from()){
            //     return false;
            // }
            if(userNameIsUse){
                $.ajax({
                    url: "${APP_PATH}/emp",
                    type: "post",
                    data:str,
                    success: function (res) {
                        if(res.code == 100){
                            $('#empAddModal').modal('hide')
                            selePages(totalRecord);
                        }else {
                        //    失败信息
                            if(res.extend.error.email != undefined ){
                                show_validate_msg("#email_add_input","error",res.extend.error.email)
                            }
                            if(res.extend.error.empName != undefined){
                                show_validate_msg("#empName_add_input","error",res.extend.error.email)
                            }
                        }
                    }
                })
            }else {

            }

        })
        //查询用户名是否可用
        $("#empName_add_input").change(function () {
            var empName = $("#empName_add_input").val();
            var nameReg = /(^[a-zA-Z0-9]{6,16}$)|(^[\u2E80-\u9FFF]{2,5})/;
            if(!nameReg.test(empName)){
                // $("#empName_add_input").parent().addClass("has-error")
                // $("#empName_add_input").next("span").text("用户名可以是2-5位中文或6-16英文")
                show_validate_msg("#empName_add_input","error","用户名可以是2-5位中文或6-16英文")
                return false
            }else {
                $.ajax({
                    url: "${APP_PATH}/checkUserName",
                    data: "empName="+empName,
                    type: "get",
                    success: function (res) {
                        if(res.code == 100){
                            show_validate_msg("#empName_add_input","status","用户名可用");
                            userNameIsUse = true
                        }else {
                            userNameIsUse = false
                            show_validate_msg("#empName_add_input","error","用户名不可用");
                        }
                    }
                })
            }

        })
        //编辑按钮
        $(document).on("click",".edit_btn",function () {
            //用户id
            upEmpId =$(this).attr("edit_id")
            //部门信息
            getDeptsShow("#dept_id_update")
            //用户信息
            getEmp(upEmpId)
            $("#empUpModal").modal({
                backdrop: "static"
            })
        })
        //点击更新
        $("#update_emp").click(function () {
            var upData = $("#empUpModal form").serialize()

            //验证邮箱
            var email = $("#email_update_input").val();
            var emailReg = /^([A-Za-z0-9_\-\.])+\@([A-Za-z0-9_\-\.])+\.([A-Za-z]{2,4})$/

            if(!emailReg.test(email)){
                show_validate_msg("#email_update_input","error","邮箱格式不正确")
                return false
            }else{
                show_validate_msg("#email_update_input","status","")
            }

            $.ajax({
                url: "${APP_PATH}/emp/"+upEmpId,
                type:"PUT",
                data: upData,
                success: function (res) {
                    $("#empUpModal").modal("hide")
                    selePages(currentPage)
                }
            })
        })
        // 单个点击删除
        $(document).on("click",".dele_btn",function () {
            //用户id
            upEmpId =$(this).attr("edit_id")
            var empName = $(this).parents("tr").find("td:eq(2)").text();
            if(confirm("确认删除【"+empName+"】吗？")){
                $.ajax({
                    url:"${APP_PATH}/emp/"+upEmpId,
                    type: "delete",
                    success:function (res) {
                        if(res.code == 100){
                            selePages(currentPage)
                        }
                    }
                })
            }

        })
        // 多个全选
        $("#checkAll").click(function () {
            $(".check_item").prop("checked",$(this).prop("checked"))
        })
        // 多个单选
        $(document).on("click",".check_item",function () {
            var flag = $(".check_item:checked").length == $(".check_item").length
            $("#checkAll").prop("checked",flag)
        })
        //多个删除
        $("#dele_emps").click(function () {
            var nameStr = "",ids=""
            $.each($(".check_item:checked"),function () {
                nameStr += $(this).parents("tr").find("td:eq(2)").text()+"，"
                ids += $(this).parents("tr").find("td:eq(1)").text()+"-"
            })
            nameStr = nameStr.substr(0,nameStr.length-1)
            ids = ids.substr(0,ids.length-1)
            if(confirm("确认删除【"+nameStr+"】吗")){
                $.ajax({
                    url:"${APP_PATH}/emp/"+ids,
                    type:"delete",
                    success: function (res) {
                        if(res.code == 100){
                            alert(res.msg)
                            selePages(currentPage);
                        }
                    }
                })
            }
        })
    })()

    //填充表格信息
    function showDates(res) {
        if(res.code == 100){
            $("#checkAll").prop("checked",false)
            list = res.extend.pageInfo.list;
            listStr = ""
            $.each(list,function (index, item) {
                listStr+="<tr><td><input type='checkbox' class='check_item'/> </td><td>"+item.empId+"</td><td>"+item.empName+"</td><td>"+(item.gender=="M"? "男":"女")+"</td><td>"+item.email+"</td><td>"+item.dept.deptName+"</td>"
                listStr+= "<td><button class=\"btn btn-primary btn-default btn-sm edit_btn\" edit_id=\""+item.empId+"\"><span class=\"glyphicon glyphicon-pencil\" aria-hidden=\"true\"></span>编辑</button><button class=\"btn btn-danger btn-default btn-sm dele_btn\" edit_id=\""+item.empId+"\"><span class=\"glyphicon glyphicon-trash\" aria-hidden=\"true\"></span>删除</button></td></tr>"

            })
            $("#dataShow").html(listStr)
        }else {
            alert("获取数据失败")
        }
    }
    //填充分页信息
    function build_page_info(res) {
        pageInfo = res.extend.pageInfo
        totalRecord = pageInfo.total
        currentPage = pageInfo.pageNum
        test = " 当前"+pageInfo.pageNum+"页，总"+pageInfo.pages+"页，总记录数："+pageInfo.total
        $("#page_info").html(test)
    }
    //创建分页条
    function build_page_nav(res) {
        pageInfo = res.extend.pageInfo
        if(pageInfo.hasPreviousPage){
            str = "<li onclick=\"selePages("+1+")\"><a href=\"#\" >首页</a></li>"
            str += "<li onclick=\"selePages("+ (pageInfo.pageNum - 1) +")\"><a href=\"#\" ><span aria-hidden=\"true\">&laquo;</span></a></li>"
        }else {
            str = "<li class='disabled' ><a href=\"#\">首页</a></li>"
            str += "<li class='disabled' ><a href=\"#\"><span aria-hidden=\"true\">&laquo;</span></a></li>"
        }

        $.each(pageInfo.navigatepageNums,function (i,item) {
            if (item == pageInfo.pageNum){
                str+="<li class='active'><a href=\"#\">"+item+"</a></li>"
            }else {
                str+="<li onclick=\"selePages("+item+")\"><a href=\"#\">"+item+"</a></li>"
            }
        })


        if(pageInfo.hasNextPage){
            str += "<li onclick=\"selePages("+ (pageInfo.pageNum + 1) +")\"><a href=\"#\"><span aria-hidden=\"true\">&raquo;</span></a></li>"
            str += "<li onclick=\"selePages("+ pageInfo.pages +")\"><a href=\"#\">尾页</a></li>"
        }else {
            str += "<li class='disabled'><a href=\"#\"><span aria-hidden=\"true\">&raquo;</span></a></li>"
            str += "<li class='disabled'><a href=\"#\">尾页</a></li>"
        }

        $("#nav_list").html(str);
    }
    //获取分页数据
    function selePages(pn) {
        $.ajax({
            url:"${APP_PATH}/emps",
            data:"pn="+pn,
            type:"get",
            success:function (res) {
                //    显示数据
                showDates(res)
                //    显示分页信息
                build_page_info(res)
                //    显示分页条
                build_page_nav(res)
            }
        });
    }
    //获取部门信息
    function getDeptsShow(ele){
        //清空之前填充的
        $(ele).empty()
        $.ajax({
            url:"${APP_PATH}/depts",
            type:"get",
            success:function (res) {
                list = res.extend.depts
                $.each(list,function (i,item) {
                    var optionEle = $("<option></option>").append(item.deptName).attr("value",item.deptId);
                    optionEle.appendTo(ele)
                })

            }
        });
    }
    //校验表单
    function validdate_add_from() {
        var empName = $("#empName_add_input").val();
        var nameReg = /(^[a-zA-Z0-9]{6,16}$)|(^[\u2E80-\u9FFF]{2,5})/;
        if(!nameReg.test(empName)){
            // $("#empName_add_input").parent().addClass("has-error")
            // $("#empName_add_input").next("span").text("用户名可以是2-5位中文或6-16英文")
            show_validate_msg("#empName_add_input","error","用户名可以是2-5位中文或6-16英文")
            return false
        }else {
            // $("#empName_add_input").parent().addClass("has-success")
            // $("#empName_add_input").next("span").text("")
            show_validate_msg("#empName_add_input","status","")
        }

        var email = $("#email_add_input").val();
        var emailReg = /^([A-Za-z0-9_\-\.])+\@([A-Za-z0-9_\-\.])+\.([A-Za-z]{2,4})$/

        if(!emailReg.test(email)){
            // $("#email_add_input").parent().addClass("has-error")
            // $("#email_add_input").next("span").text("用户名可以是2-5位中文或6-16英文")
            show_validate_msg("#email_add_input","error","邮箱格式不正确")
            return false
        }else{
            // $("#email_add_input").parent().addClass("has-success")
            // $("#email_add_input").next("span").text("")
            show_validate_msg("#email_add_input","status","")
        }
        return true
    }
    //提示信息
    function  show_validate_msg(ele,status,msg) {
        $(ele).parent().removeClass("has-error")
        if(status == "status"){
            $(ele).parent().addClass("has-success")
            $(ele).next("span").text(msg)
        }else  if (status == "error"){
            $(ele).parent().addClass("has-error")
            $(ele).next("span").text(msg)
        }
    }
    // 重置表单
    function reset_form(ele) {

        $(ele)[0].reset();
        $(ele).find("*").removeClass("has-error has-success")
        $(ele).find(".help-block").text("")
    }
    // 员工信息查询
    function getEmp(id) {
        $.ajax({
            url:"${APP_PATH}/getEmp/"+id,
            type: "get",
            success:function (res) {
               console.log(res)
                if (res.code == 100){
                //   显示信息
                    data = res.extend.emp
                    $("#empName_update_static").text(data.empName)
                    $("#email_update_input").val(data.email)
                    $("#empUpModal input[name=gender]").val([data.gender])
                    console.log( $("#dept_id_update"))
                    $("#dept_id_update").val([data.dId])
                }
            }
        })
    }
</script>
</body>
</html>