<%@ page language="java" pageEncoding="UTF-8" contentType="text/html;charset=utf-8" %>
<%@ include file="/common/taglibs.jsp" %>
<!DOCTYPE html>
<html lang="zh-CN">
	<head>
		<title>Index</title>
        <script src="../static/dependencies/excel/cpexcel.js"></script>
        <script src="../static/dependencies/excel/shim.js"></script>
        <script src="../static/dependencies/excel/jszip.js"></script>
        <script src="../static/dependencies/excel/xlsx.js"></script>
        <!-- FileSaver.js is the library of choice for Chrome -->
        <script type="text/javascript" src="../static/dependencies/excel/Blob.js"></script>
        <script type="text/javascript" src="../static/dependencies/excel/FileSaver.js"></script>

        <script src="../static/js/detail.js"></script>
		<s:head />
        <style>
            .file {
                position: relative;
                display: inline-block;
                overflow: hidden;
                text-decoration: none;
                text-indent: 0;
                line-height: 20px;
            }
            .file input {
                position: absolute;
                font-size: 100px;
                right: 0;
                top: 0;
                opacity: 0;//不透明度
            }
            .file:hover {
                text-decoration: none;
            }

            table input{
                width:150px;
            }
        </style>
	</head>
	<body>


    <a style="display:none" class="btn" href="/SIPOC/">返回列表</a>
    <a class="btn file" id="downloadModelFile" href="../template/sipoc_template.xls"><i class="icon-search icon-white"></i>下载模板文件</a>
    <a class="btn file" id="readFromFile">从文件导入<input id="xlf" type="file" name="xlfile"/></a>
    <div id="home" class="tab-pane active">
        <div class="row">
            <div class="col-xs-12">
                <div class="table-responsive">
                    <table id="sample-table-1"
                           class="table table-striped table-bordered table-hover">
                        <input id="recordId" value="${record.id}" style="display:none"/>
                        <thead>
                        <input id="name" value="${record.name}"/>
                        <tr>
                            <th>供应者</th>
                            <th>输入</th>
                            <th>流程</th>
                            <th>输出</th>
                            <th>客户</th>
                        </tr>
                        </thead>
                        <tbody>
                                <tr>
                                    <!-- S -->
                                    <td width="20%">
                                        <ul type="none">
                                            <s:iterator value="sMessageList" id="msg" status="st">
                                            <%--<s:iterator value="{'aaa','bbb'}" id="msg">--%>
                                                <li><input id="input_s_<s:property value="#st.count-1"/>" value="<s:property value="msg"/>"/><button class="btn btn-danger btn-sm" onclick="javascript:delElement(this);">
                                                    <i class="ace-icon fa fa-reply icon-only">删除</i>
                                                </button>
                                                </li>
                                            </s:iterator>
                                        </ul>
                                    <p><button  class="sui-btn  btn-primary" id="btnAddS">添加</button></p>
                                    </td>
                                    <!-- I -->
                                    <td  width="20%">
                                        <ul type="none">
                                            <s:iterator value="iMessageList" id="msg" status="st">
                                                <%--<s:iterator value="{'aaa','bbb'}" id="msg">--%>
                                                <li><input id="input_i_<s:property value="#st.count-1"/>" value="<s:property value="msg"/>"/><button class="btn btn-danger btn-sm" onclick="javascript:delElement(this);">
                                                    <i class="ace-icon fa fa-reply icon-only">删除</i>
                                                </button>
                                                </li>
                                            </s:iterator>
                                        </ul>
                                        <p><button class="btn btn-primary" id="btnAddI">添加</button></p>
                                    </td>
                                    <!-- P -->
                                    <td  width="20%">
                                        <ul type="none">
                                            <s:iterator value="pMessageList" id="msg" status="st">
                                                <%--<s:iterator value="{'aaa','bbb'}" id="msg">--%>
                                                <li><input id="input_p_<s:property value="#st.count-1"/>" value="<s:property value="msg"/>"/><button class="btn btn-danger btn-sm" onclick="javascript:delElement(this);">
                                                    <i class="ace-icon fa fa-reply icon-only">删除</i>
                                                </button>
                                                </li>
                                            </s:iterator>
                                        </ul>
                                        <p><button class="btn btn-primary" id="btnAddP">添加</button></p>
                                    </td>
                                    <!-- O -->
                                    <td  width="20%">
                                        <ul type="none">
                                            <s:iterator value="oMessageList" id="msg" status="st">
                                                <%--<s:iterator value="{'aaa','bbb'}" id="msg">--%>
                                                <li><input id="input_o_<s:property value="#st.count-1"/>" value="<s:property value="msg"/>"/><button class="btn btn-danger btn-sm" onclick="javascript:delElement(this);">
                                                    <i class="ace-icon fa fa-reply icon-only">删除</i>
                                                </button>
                                                </li>
                                            </s:iterator>
                                        </ul>
                                        <p><button class="btn btn-primary" id="btnAddO">添加</button></p>
                                    </td>
                                    <!-- C -->
                                    <td  width="20%">
                                        <ul type="none">
                                            <s:iterator value="cMessageList" id="msg" status="st">
                                                <%--<s:iterator value="{'aaa','bbb'}" id="msg">--%>
                                                <li><input id="input_c_<s:property value="#st.count-1"/>" value="<s:property value="msg"/>"/><button class="btn btn-danger btn-sm" onclick="javascript:delElement(this);">
                                                    <i class="ace-icon fa fa-reply icon-only">删除</i>
                                                </button>
                                                </li>
                                            </s:iterator>
                                        </ul>
                                        <p><button class="btn btn-primary" id="btnAddC">添加</button></p>
                                    </td>
                                </tr>
                        </tbody>
                    </table>


                </div>
                <!-- /.table-responsive -->
            </div>
        </div>
    </div>
    <p>
        <button class="btn" id="btnSaveToFile">保存至文件</button>
        <button style="display:none"  class="btn btn-info" id="btnSaveToDb">保存至数据库</button>
    </p>

    <table id="exportTable" style="display:none">
        <thead>
        <tr>
            <th>S</th>
            <th>I</th>
            <th>P</th>
            <th>O</th>
            <th>C</th>
        </tr>
        </thead>
        <tbody>
        <tr>
            <td>aaaaaa</td>
            <td>aaaaaa</td>
            <td>aaaaaa</td>
            <td>aaaaaa</td>
            <td>aaaaaa</td>
        </tr>
        <tr>
            <td>bbbbb</td>
            <td>bbbbb</td>
            <td>bbbbb</td>
            <td>bbbbb</td>
            <td>bbbbb</td>
        </tr>
        <tr>
            <td>cccccccc</td>
            <td>cccccccc</td>
            <td>cccccccc</td>
            <td>cccccccc</td>
            <td>cccccccc</td>
        </tr>
        </tbody>
    </table>
    <%--测试用--%>
    <%--<pre id="out"></pre>--%>
    <%--<div id="htmlout"></div>--%>

    <script src="../static/js/detail.js"></script>
    </body>
</html>
