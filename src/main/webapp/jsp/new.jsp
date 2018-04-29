<%@ page language="java" pageEncoding="UTF-8" contentType="text/html;charset=utf-8" %>
<%@ include file="/common/taglibs.jsp" %>
<!DOCTYPE html>
<html lang="zh-CN">
	<head>
		<title>Index</title>
        <script src="./static/js/index.js"></script>
		<s:head />
	</head>
	<body>
    <p>
        <button class="btn" id="btnNew">新建</button>
        <button class="btn btn-primary" id="btnImport">从文件导入</button>
        <button class="btn btn-info" id="btnReadDb">读取数据库</button>
    </p>
    <div id="home" class="tab-pane active">
        <div class="row">
            <div class="col-xs-12">
                <div class="table-responsive">
                    <table id="sample-table-1"
                           class="table table-striped table-bordered table-hover">
                        <thead>
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
                                    <td >${id}</td>

                                    <!-- APP地址 -->
                                    <td>${name}</td>

                                    <!-- 操作 -->
                                    <td>
                                        <div class="visible-md visible-lg hidden-sm hidden-xs btn-group">
                                            <a type="submit" class="btn btn-xs btn-info" onclick="modifyRecord(this)">
                                                <i class="icon-edit bigger-120"></i>查看
                                            </a>

                                            <a type="submit" class="btn btn-xs btn-danger" onclick="deleteRecord(${id})">
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
	</body>
</html>
