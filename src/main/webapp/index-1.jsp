<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
%>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <title>员工列表</title>
    <link rel="shortcut icon" href="#" />
    <script type="text/javascript" src="static/js/jquery-1.12.4.min.js"></script>
    <link href="static/bootstrap-3.3.7-dist/css/bootstrap.min.css" rel="stylesheet">
    <script type="text/javascript" src="static/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
</head>

<body>
    <div class="container">
        <!-- 标题 -->
        <div class="row">
            <div class="col-md-12">
                <h1>员工信息</h1>
            </div>
        </div>
        <div class="row">
            <div class="col-md-3 col-md-offset-9">
                <button class="btn btn-primary" id="emp_add_model_btn">新增员工</button>
                <button class="btn btn-danger">批量删除</button>
            </div>
        </div>
        <div class="row">
            <div class="col-md-12">
                <table class="table table-hover" id="emps_table">
                    <thead>
                        <tr>
                            <th>ID</th>
                            <th>姓名</th>
                            <th>性别</th>
                            <th>邮箱</th>
                            <th>部门</th>
                            <th>操作</th>
                        </tr>
                    </thead>
                    <tbody>
                        <!-- 表格内部数据 -->
                    </tbody>
                </table>
            </div>
        </div>
        <!-- 导航条 -->
        <div class="row">
            <div class="col-md-12 text-center" id="page_nav_area">

            </div>
        </div>
        <!-- 页码信息条 -->
        <div class="row">
            <div class="col-md-12 text-center" id="page_info_area"></div>
        </div>
    </div>

    <!-- 新增员工信息的模态框 -->
    <div class="modal fade" id="empAppModel" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title" id="myModalLabel">新增员工</h4>
                </div>
                <div class="modal-body">
                    <form class="form-horizontal">
                        <div class="form-group">
                            <label for="empName_add_input" class="col-sm-2 control-label">姓名</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" id="empName_add_input" name="empName" placeholder="张三">
                                <span class="help-block"></span>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="email_add_input" class="col-sm-2 control-label">邮箱</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" id="email_add_input" name="email" placeholder="xxx@xxx.xx">
                                <span class="help-block"></span>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label">性别</label>
                            <div class="col-sm-10">
                                <label class="radio-inline">
					  <input type="radio" name="gender" id="gender1_add_input" value="M" checked="checked"> 男
					</label>
                                <label class="radio-inline">
					  <input type="radio" name="gender" id="gender2_add_input" value="F"> 女
					</label>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="email_add_input" class="col-sm-2 control-label">部门</label>
                            <div class="col-sm-4">
                                <!-- 部门提交部门id即可 -->
                                <select class="form-control" name="dId"></select>
                            </div>
                        </div>
                    </form>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
                    <button type="button" class="btn btn-primary" id="emp_save_btn">保存</button>
                </div>
            </div>
        </div>
    </div>

    <!-- 修改员工信息的模态框 -->
    <div class="modal fade" id="empUpdateModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title">修改信息</h4>
                </div>
                <div class="modal-body">
                    <form class="form-horizontal">
                        <div class="form-group">
                            <label for="empName_add_input" class="col-sm-2 control-label">姓名</label>
                            <div class="col-sm-10">
                                <p class="form-control-static" id="empName_update_static"></p>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="email_update_input" class="col-sm-2 control-label">邮箱</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" id="email_update_input" name="email" placeholder="xxx@xxx.xx">
                                <span class="help-block"></span>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label">性别</label>
                            <div class="col-sm-10">
                                <label class="radio-inline">
					  <input type="radio" name="gender" id="gender1_update_input" value="M" checked="checked"> 男
					</label>
                                <label class="radio-inline">
					  <input type="radio" name="gender" id="gender2_update_input" value="F"> 女
					</label>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label">部门</label>
                            <div class="col-sm-4">
                                <!-- 部门提交部门id即可 -->
                                <select class="form-control" name="dId"></select>
                            </div>
                        </div>
                    </form>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
                    <button type="button" class="btn btn-primary" id="emp_update_btn">保存</button>
                </div>
            </div>
        </div>
    </div>


    <script type="text/javascript">
        var totalRecord;
        $(function() {
            // 加载首页
            to_page(1);
        });
        //发ajax请求
        function to_page(pn) {
            $.ajax({
                url: "emps",
                data: "pn=" + pn,
                type: "GET",
                success: function(result) {
                    // 解析显示员工数据
                    build_emps_table(result);

                    // 解析并显示分页信息
                    build_page_info(result);

                    // 解析显示分页条
                    build_page_nav(result);
                }
            });
        }

        function build_emps_table(result) {
            // 清空table表格
            $("#emps_table tbody").empty();

            // 构建数据
            var emps = result.extend.pageInfo.list;
            $.each(emps, function(index, item) {
                var empIdTd = $("<td></td>").append(item.empId);
                var empNameTd = $("<td></td>").append(item.empName);
                var genderTd = $("<td></td>").append(item.gender == "M" ? "男" : "女");
                var emailTd = $("<td></td>").append(item.email);
                var deptNameTd = $("<td></td>").append(item.department.deptName);

                var editBtn = $("<button></button>").addClass("btn btn-primary btn-sm edit_btn")
                    .append($("<span></span>").addClass("glyphicon glyphicon-pencil"))
                    .append(" 编辑");
                editBtn.attr("edit-id", item.empId);
                var delBtn = $("<button></button>").addClass("btn btn-danger btn-sm delete_btn")
                    .append($("<span></span>").addClass("glyphicon glyphicon-trash"))
                    .append(" 删除");

                var btnTd = $("<td></td>").append(editBtn)
                    .append(" ")
                    .append(delBtn);

                $("<tr></tr>").append(empIdTd)
                    .append(empNameTd)
                    .append(genderTd)
                    .append(emailTd)
                    .append(deptNameTd)
                    .append(btnTd)
                    .appendTo("#emps_table tbody");
            });
        }

        function build_page_info(result) {
            $("#page_info_area").empty();

            $("#page_info_area").append("第" + result.extend.pageInfo.pageNum + "页，共" +
                result.extend.pageInfo.pages + "页，总计" +
                result.extend.pageInfo.total + "条记录");
            totalRecord = result.extend.pageInfo.total;
        }

        // 解析分页条
        function build_page_nav(result) {
            $("#page_nav_area").empty();

            var ul = $("<ul></ul>").addClass("pagination");

            // 构建元素
            var firstPageLi = $("<li></li>").append($("<a></a>").append("首页").attr("href", "#"));
            var prePageLi = $("<li></li>").append($("<a></a>").append("&laquo;").attr("href", "#"));
            if (result.extend.pageInfo.hasPreviousPage == false) {
                firstPageLi.addClass("disabled");
                prePageLi.addClass("disabled");
            } else {
                firstPageLi.click(function() {
                    to_page(1);
                });
                prePageLi.click(function() {
                    to_page(result.extend.pageInfo.pageNum - 1);
                });
            }

            var nextPageLi = $("<li></li>").append($("<a></a>").append("&raquo;").attr("href", "#"));
            var lastPageLi = $("<li></li>").append($("<a></a>").append("末页").attr("href", "#"));
            if (result.extend.pageInfo.hasNextPage == false) {
                nextPageLi.addClass("disabled");
                lastPageLi.addClass("disabled");
            } else {
                nextPageLi.click(function() {
                    to_page(result.extend.pageInfo.pageNum + 1);
                });
                lastPageLi.click(function() {
                    to_page(result.extend.pageInfo.pages);
                });
            }

            ul.append(firstPageLi).append(prePageLi);
            // 遍历页码按钮
            $.each(result.extend.pageInfo.navigatepageNums, function(index, item) {
                var numLi = $("<li></li>").append($("<a></a>").append(item));
                if (result.extend.pageInfo.pageNum == item) {
                    numLi.addClass("active");
                } else {
                    numLi.click(function() {
                        to_page(item);
                    });
                }
                ul.append(numLi);
            });

            ul.append(nextPageLi).append(lastPageLi);

            var navEle = $("<nav></nav>").append(ul);
            navEle.appendTo("#page_nav_area");
        }

        //清空表单样式及内容
        function reset_form(ele) {
            $(ele)[0].reset();
            $(ele).find("*").removeClass("has-error has-success");
            $(ele).find(".help-block").text("");
        }

        //点击新增弹出模态框
        $("#emp_add_model_btn").click(function() {
            //清空表单样式及内容
            reset_form("#empAppModel form");
            //首先获取部门选项
            getDepts("#empAppModel select");

            $("#empAppModel").modal({
                backdrop: "static"
            });
        });

        function getDepts(ele) {
            $(ele).empty();
            $.ajax({
                url: "depts",
                type: "GET",
                success: function(result) {
                    $.each(result.extend.depts, function() {
                        var optionEle = $("<option></option>").append(this.deptName).attr("value", this.deptId);
                        optionEle.appendTo(ele);
                    });
                }
            });
        }

        //校验数据格式
        function validate_add_form() {
            var empName = $("#empName_add_input").val();
            var regName = /(^[a-zA-Z0-9_-]{6,16}$)|(^[\u2E80-\u9FFF]{2,5})/;
            if (!regName.test(empName)) {
                show_validate_msg("#empName_add_input", "error", "用户名是2-5位中文或者6-16位英文和数字的组合");
                return false;
            } else {
                show_validate_msg("#empName_add_input", "success", "");
            }

            //校验邮箱
            var email = $("#email_add_input").val();
            var regEmail = /^([a-z0-9_\.-]+)@([\da-z\.-]+)\.([a-z\.]{2,6})$/;
            if (!regEmail.test(email)) {
                show_validate_msg("#email_add_input", "error", "邮箱格式不正确");
                return false;
            } else {
                show_validate_msg("#email_add_input", "success", "");
            }
            return true;
        }

        //校验用户名是否可用
        $("#empName_add_input").change(function() {
            var empName = this.value;
            $.ajax({
                url: "checkuser",
                data: "empName=" + empName,
                type: "POST",
                success: function(result) {
                    if (result.code == 100) {
                        show_validate_msg("#empName_add_input", "success", "用户名可用");
                        $("#emp_save_btn").attr("ajax-va", "success");
                    } else {
                        show_validate_msg("#empName_add_input", "error", result.extend.va_msg);
                        $("#emp_save_btn").attr("ajax-va", "error");
                    }
                }
            });
        });

        //显示校验结果
        function show_validate_msg(ele, status, msg) {
            $(ele).parent().removeClass("has-success has-error");
            $(ele).next("span").text("");
            if ("success" == status) {
                $(ele).parent().addClass("has-success");
                $(ele).next("span").text(msg);
            } else if ("error" == status) {
                $(ele).parent().addClass("has-error");
                $(ele).next("span").text(msg);
            }
        }

        //点击保存
        $("#emp_save_btn").click(function() {
            //校验姓名邮箱格式
            if (!validate_add_form()) {
                return false;
            }

            //用户名可用性校验
            if ($(this).attr("ajax-va") == "error") {
                return false;
            }
            //发送ajax请求保存
            $.ajax({
                url: "emp",
                type: "POST",
                data: $("#empAppModel form").serialize(),
                success: function(result) {
                    if (result.code == 100) {
                        //关闭模态框
                        $('#empAppModel').modal('hide')
                            //翻到最后一页
                        to_page(totalRecord);
                        alert("保存成功！")
                    } else {
                        if (undefined != result.extend.errorFields.email) {
                            show_validate_msg("#email_add_input", "error", result.extend.errorFields.email);
                        }
                        if (undefined != result.extend.errorFields.empName) {
                            show_validate_msg("#empName_add_input", "error", result.extend.errorFields.empName);
                        }
                    }
                }
            });
        });

        //修改员工信息
        $(document).on("click", ".edit_btn", function() {
            getDepts("#empUpdateModal select");

            //回显员工信息
            getEmp($(this).attr("edit-id"));

            $("#empUpdateModal").modal({
                backdrop: "static"
            });
        });

        function getEmp(id) {
            $.ajax({
                url: "emp/" + id,
                type: "GET",
                success: function(result) {
                    var empData = result.extend.emp;
                    $("#empName_update_static").text(empData.empName);
                    $("#email_update_input").val(empData.email);
                    $("#empUpdateModal input[name=gender]").val([empData.gender]);
                    $("#empUpdateModal select").val([empData.dId]);
                }
            });
        }
    </script>
</body>

</html>