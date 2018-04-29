<%@ page language="java" pageEncoding="UTF-8" contentType="text/html;charset=utf-8" %>
<%@ include file="/common/taglibs.jsp" %>
<!DOCTYPE HTML>
<html lang="en">
<head>
	  <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	  <title>创新方法工作平台</title>
	  <!--添加页面框架-->
	  <link rel="import" id="frame" href="/webresources/common/html/appFrame.html">
	  <script type="text/javascript" src="./js/buttonAction.js"></script>
	  <!--静态资源中已经添加的css和js-->
        <script src="./static/dependencies/excel/cpexcel.js"></script>
        <script src="./static/dependencies/excel/shim.js"></script>
        <script src="./static/dependencies/excel/jszip.js"></script>
        <script src="./static/dependencies/excel/xlsx.js"></script>
        <script src="http://cdn.static.runoob.com/libs/angular.js/1.4.6/angular.min.js"></script>
        <!-- FileSaver.js is the library of choice for Chrome -->
        <script type="text/javascript" src="./static/dependencies/excel/Blob.js"></script>
        <script type="text/javascript" src="./static/dependencies/excel/FileSaver.js"></script>
        <script type="text/javascript" src="./static/dependencies/dom-to-image.js"></script>
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
                opacity: 0;
            }

            .file:hover {
                text-decoration: none;
            }

            table input {
                width: 75%;
                height:30px;
                margin-bottom:5px;
            }

            .main-content {
                margin-left: 0px;
            }

            div {
                margin-left: auto;
                margin-right: auto;
            }
            .modal-dialog{
                width:80%;
            }

        </style>
</head>
<body class="no-skin">
<div id="mainFunctionHtml">
	  <div id="myCustomLi">
			<li class="active">
				  <a data-toggle="tab" href="#abc" id="mainFunction">
						<i class="green ace-icon fa fa-desktop bigger-120"></i>主功能区</a>
			</li>
			<li class="" style="display: none">
				  <a data-toggle="tab" href="#def">
						<i class="purple ace-icon fa fa-pencil-square-o bigger-120"></i>界面2</a>
			</li>
	  </div>
	  <div id="myCustomTab">
          <%--界面1--%>
			<div class="tab-pane active" id="abc">
                <%--按钮组--%>
				  <div id="mainBtnGroup" class="btn-group btn-group-sm">
						<a type="button" class="btn btn-info" id="downloadModelFile" href="./template/template.xls">
							  <span class="menu-icon fa fa-download"></span>下载模板
						</a>
						<a type="button" class="btn btn-info file">
							  <span class="glyphicon glyphicon-upload"></span>文件导入<input class=""
                                id="xlf" type="file" name="xlfile"/>
						</a>
						<a type="button" class="btn btn-info" id="btnSaveToFile">
							  <span class="glyphicon glyphicon-download"></span>文件导出
						</a>
						<a type="button" class="btn btn-info" id="btnDetailShow">
							  <span class="glyphicon glyphicon-ok"></span>预览图片
						</a>
						<a type="button" class="btn btn-info"  id="saveProject">
							  <span class="glyphicon glyphicon-cloud"></span>保存至云
						</a>
				  </div>
                <%--按钮组End--%>

                    <%--SIPOC Table--%>
                <div class="tabble">
                    <div class="row" style="margin-top:2.5em">
                        <div id="home" class="tab-pane active">
                            <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                                <div id="dataTableWrapper" class="table-responsive">
                                    <input id="name" style="text-align:center;width:100%;height:30px;" value="record.name"/>
                                    <table id="dataTable"
                                           class="table table-striped table-bordered table-hover">
                                        <input id="recordId" value="record.id" style="display:none"/>
                                        <thead>
                                        <tr>
                                            <th>供应者
                                                <button class="btn-sui  pull-right " id="btnAddS">添加</button>
                                            </th>
                                            <th>输入
                                                <button class="btn-sui  pull-right " id="btnAddI">添加</button>
                                            </th>
                                            <th>流程
                                                <button class="btn-sui  pull-right " id="btnAddP">添加</button>
                                            </th>
                                            <th>输出
                                                <button class="btn-sui  pull-right " id="btnAddO">添加</button>
                                            </th>
                                            <th>用户
                                                <button class="btn-sui  pull-right " id="btnAddC">添加</button>
                                            </th>
                                        </tr>
                                        </thead>
                                        <tbody id="sipoc_table">
                                        <tr>
                                            <!-- S -->
                                            <td width="20%">
                                                <ul type="none">

                                                        <%--<s:iterator value="{'aaa','bbb'}" id="msg">--%>
                                                        <li>

                                                            <input id="input_s_0"
                                                                   value="value_1" />
                                                            &nbsp;
                                                            <button class="btn btn-danger btn-xs pull-right"
                                                                    onclick="javascript:delElement(this);">
                                                                <i class="ace-icon fa fa-reply icon-only"> <i
                                                                        class="icon-trash icon-white"></i></i>
                                                            </button>

                                                        </li>

                                                </ul>

                                            </td>
                                            <!-- I -->
                                            <td width="20%">
                                                <ul type="none">
                                                    <li>

                                                        <input id="input_i_0"
                                                               value="value_1" />
                                                        &nbsp;
                                                        <button class="btn btn-danger btn-xs pull-right"
                                                                onclick="javascript:delElement(this);">
                                                            <i class="ace-icon fa fa-reply icon-only"> <i
                                                                    class="icon-trash icon-white"></i></i>
                                                        </button>

                                                    </li>
                                                </ul>

                                            </td>
                                            <!-- P -->
                                            <td width="20%">
                                                <ul type="none">
                                                    <li>

                                                        <input id="input_p_0"
                                                               value="value_1" />
                                                        &nbsp;
                                                        <button class="btn btn-danger btn-xs pull-right"
                                                                onclick="javascript:delElement(this);">
                                                            <i class="ace-icon fa fa-reply icon-only"> <i
                                                                    class="icon-trash icon-white"></i></i>
                                                        </button>

                                                    </li>
                                                </ul>

                                            </td>
                                            <!-- O -->
                                            <td width="20%">
                                                <ul type="none">
                                                    <li>

                                                        <input id="input_o_0"
                                                               value="value_1" />
                                                        &nbsp;
                                                        <button class="btn btn-danger btn-xs pull-right"
                                                                onclick="javascript:delElement(this);">
                                                            <i class="ace-icon fa fa-reply icon-only"> <i
                                                                    class="icon-trash icon-white"></i></i>
                                                        </button>

                                                    </li>
                                                </ul>

                                            </td>
                                            <!-- C -->
                                            <td width="20%">
                                                <ul type="none">
                                                    <li>

                                                        <input id="sipoc_input_c_0"
                                                               value="value_1" />
                                                        &nbsp;
                                                        <button class="btn btn-danger btn-xs pull-right"
                                                                onclick="javascript:delElement(this);">
                                                            <i class="ace-icon fa fa-reply icon-only"> <i
                                                                    class="icon-trash icon-white"></i></i>
                                                        </button>

                                                    </li>
                                                </ul>

                                            </td>
                                        </tr>
                                        </tbody>
                                    </table>


                                    <!-- /.table-responsive -->
                                </div>


                            </div>
                        </div>
                    </div>
                </div>
                    <%--SIPOC Table End--%>

                    <%--导出Table--%>
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
                        <td ng-model="a">aaaaaa</td>
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
                <%--导出Table End--%>

                    <%--打印表格--%>
                    <div style="display: none;">
                        <%--表名--%>
                        <div class="row">
                            <div class="col-xs-1 col-sm-1 col-md-1 col-lg-1">
                            </div>
                            <div id="detailShowName" class="col-xs-10 col-sm-10 col-md-10 col-lg-10">
                            </div>
                            <div class="col-xs-1 col-sm-1 col-md-1 col-lg-1">
                            </div>
                        </div>
                        <%--表名End--%>
                        <%--表头+表格内容--%>
                        <div class="row">
                            <div class="col-xs-1 col-sm-1 col-md-1 col-lg-1">
                            </div>

                            <div class="col-xs-2 col-sm-2 col-md-2 col-lg-2">
                                <div id="showS" class="list-group">
                                    <a href="#" class="list-group-item active">
                                        <h4 class="list-group-item-heading">供应者</h4>
                                    </a>
                                </div>
                            </div>


                            <div class="col-xs-2 col-sm-2 col-md-2 col-lg-2">
                                <div id="showI" class="list-group">
                                    <a href="#" class="list-group-item active">
                                        <h4 class="list-group-item-heading">输入</h4>
                                    </a>

                                </div>
                            </div>


                            <div class="col-xs-2 col-sm-2 col-md-2 col-lg-2">
                                <div id="showP" class="list-group">
                                    <a href="#" class="list-group-item active">
                                        <h4 class="list-group-item-heading">过程</h4>
                                    </a>

                                </div>
                            </div>


                            <div class="col-xs-2 col-sm-2 col-md-2 col-lg-2">
                                <div id="showO" class="list-group">
                                    <a href="#" class="list-group-item active">
                                        <h4 class="list-group-item-heading">输出</h4>
                                    </a>
                                </div>
                            </div>


                            <div class="col-xs-2 col-sm-2 col-md-2 col-lg-2">
                                <div id="showC" class="list-group">
                                    <a href="#" class="list-group-item active">
                                        <h4 class="list-group-item-heading">用户</h4>
                                    </a>
                                </div>
                            </div>

                            <div class="col-xs-1 col-sm-1 col-md-1 col-lg-1">
                            </div>
                        </div>
                        <%--表头+表格内容--%>
                    </div>
                    <%--打印表格End--%>
                <%--预览弹层--%>
                    <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
                         aria-hidden="true">
                        <div class="modal-dialog">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <button type="button" class="close" style="margin-left: 30px;"
                                            data-dismiss="modal" aria-hidden="true">
                                        &times;
                                    </button>
                                    <h4 class="modal-title" id="myModalLabel">
                                        SIPOC预览
                                        <small>
                                            <button class="btn btn-info pull-right" id="btnSaveAsPicture"><i
                                                    class="icon-print icon-white"></i>&nbsp保存图片</button></small>
                                    </h4>


                                </div>
<%--打印表格--%>

                                <div id="print" style="width:100%;text-align: center;">
                                    <canvas id="canvas" width="1000px" height="1000px"></canvas>
                                </div>
<%--打印表格End--%>
                            </div>
                        </div>
                    </div>
                <%--预览弹层End--%>
            </div>
          <%--界面1End--%>
          <%--界面2--%>
			<div style="display: none" class="tab-pane" id="def">
				  这是界面2
			</div>
          <%--界面2End--%>
	  </div>
</div>
<!--帮助页面-->
<div id="helpHtml">
	  <div class="page-header">
			<h1>
				  **App使用说明
			</h1>
	  </div>
	  <div class="alert alert-block alert-success" id="appHelp">
			<div class="helpClass">
				  <p class="helpP">
						<i class="ace-icon fa fa-check green"></i>
						欢迎使用<strong class="green">App</strong>, 使用流程如下：<br>
						&nbsp;&nbsp;&nbsp;&nbsp;1、首先*****<br>
						截图<br>
						&nbsp;&nbsp;&nbsp;&nbsp;2、其次*****<br>
						截图<br>
						&nbsp;&nbsp;&nbsp;&nbsp;3、最后*****<br>
						截图<br>
				  <p>
			</div>
	  </div>
</div>
</body>
<script src="./static/js/draw.js"></script>
<script src="./static/js/detail.js"></script>
</html>