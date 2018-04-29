<%@ page language="java" pageEncoding="UTF-8" contentType="text/html;charset=utf-8" %>
<%@ include file="/common/taglibs.jsp" %>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <title>SIPOC</title>
    <style>
        .main-content {
            margin-left: 0px;
        }
    </style>
    <script src="./static/js/index.js"></script>
    <s:head/>
</head>
<body>
<div class="tabble">
    <ul class="nav nav-tabs" id="myTab">
        <li class="active"><a data-toggle="tab" href="">SIPOC管理</a></li>
        <li class=""><a id="checkDetail">使用与查询</a></li>
        <li class=""><a href="./jsp/help.jsp">使用帮助</a></li>
    </ul>
    <div class="tab-content">
 <%--***************************************************************************************************************************** --%>
        <nav class="navbar  bg-light" style="background:#f8f9fa!important">
            <ul class="navbar-nav">
                <div class="btn-group" style="backgrond-color:#FF0000">
                    <button class="btn btn-info" id="btnNew" onclick="javascript:add()"><i class="icon-file"></i>&nbsp新建&nbspSIPOC
                    </button>
                </div>
            </ul>
        </nav>
        <div style="display:none;">
            <input id="check" value=<s:property default="空" value="#request.username"/>></input>
        </div>
        <div id="home" class="tab-pane active">
            <div class="row" style="margin-top:1em">
                <div class="col-xs-12">
                    <div class="table-responsive">
                        <table id="sample-table-1"
                               class="table table-striped table-bordered table-hover">
                            <thead style="max-width:2em">
                            <tr>
                                <th>ID</th>
                                <th>名字</th>
                                <th>操作</th>
                            </tr>
                            </thead>
                            <tbody>
                            <s:iterator value="recordList" id="records">
                                <s:if test="prostat == 0 || prostat == null">
                                    <tr>
                                        <!-- app名称 -->
                                        <td>${id}</td>

                                        <!-- APP地址 -->
                                        <td>${name}</td>

                                        <!-- 操作 -->
                                        <td style="max-width:150px;">
                                            <div class="visible-md visible-lg hidden-sm hidden-xs btn-group">
                                                <a type="submit" class="btn btn-xs btn-info"
                                                   onclick="modifyRecord(${id})">
                                                    <i class="icon-edit bigger-120"></i>查看
                                                </a>

                                                <a type="submit" class="btn btn-xs btn-danger"
                                                   onclick="deleteRecord(${id})">
                                                    <i class="icon-trash bigger-120"></i>删除
                                                </a>
                                            </div>
                                        </td>

                                    </tr>
                                </s:if>
                            </s:iterator>
                            </tbody>
                        </table>
                    </div>
                    <!-- /.table-responsive -->
                </div>
            </div>
        </div>
    </div>
</div>
<!-- 添加APP类型 modal对话框 -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close"
                        data-dismiss="modal" aria-hidden="true">
                    &times;
                </button>
                <h4 class="modal-title" id="myModalLabel">
                    新建记录
                </h4>
            </div>
            <div class="modal-body">
                <s:form id="addRecordForm" action="api/addRecord" method="post" enctype="multipart/form-data">
                    <br>
                    请输入记录名称：
                    <input type="text" id="newRecordName" name="name" size="40"/>

                    </br>
                </s:form>
                <button class="btn" id="btnAddRecord" onclick="javascript:addRecord()">添加</button>
            </div>
        </div>
        <!-- /.modal-content -->
    </div>
    <!-- /.modal -->
</div>
</body>
</html>
