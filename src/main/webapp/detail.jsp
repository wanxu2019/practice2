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
						<a type="button" class="btn btn-info" id="downloadModelFile" href="./template/sipoc_template.xls">
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
                      <a type="button" class="btn btn-info" id="saveAsProject" data-toggle="modal" data-target="#saveAsModal">
                          <span class="menu-icon fa fa-folder"></span>另存为
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
				  SIPOC App使用说明
			</h1>
	  </div>
	  <div class="alert alert-block alert-success" id="appHelp">
			<div class="helpClass">
				  <p class="helpP">
						<i class="ace-icon fa fa-check green"></i>
						欢迎使用<strong class="green">SIPOC App</strong>,本应用为SIPOC图快速在线绘制工具，可供匿名用户和登陆用户使用，以下仅以登陆用户为例介绍应用的使用与功能，使用流程如下：<br>
						<strong>1、用户登陆</strong><br>
                      &nbsp;&nbsp;&nbsp;&nbsp;输入应用地址打开应用页面后，如未使用过其他应用默认为匿名用户。点击页面右上角游客位置，呼出下拉框，点击登陆跳转至登陆页面，输入用户名和密码，点击登陆按钮即可完成登陆。<br>
                </p>
                      <div style="width:100%;text-align: center"><img src="static/img/help/1.png" style="width: 80%;"></div>
                <p class="helpP">
						<strong>2、项目管理与新建</strong><br>
                      &nbsp;&nbsp;&nbsp;&nbsp;本应用中将每个SIPOC图称为一个SIPOC项目，进行统一管理。登陆用户可以在页面左侧边栏上方看到绿色和蓝色的按钮，分别为项目管理按钮和项目新建按钮，点击项目管理功能按钮可跳转至项目管理页面，点击项目新建功能按钮可弹出新建项目弹出框。<br>
                      &nbsp;&nbsp;&nbsp;&nbsp;在项目管理页面可对已有项目进行查看和删除操作，用户也可在左侧边栏直接对项目进行查看和删除。在新建项目弹出框输入项目名和备注后再点击确认即可新建新项目。
                      <br>
                </p>
                <div style="width:100%;text-align: center"><img src="static/img/help/2.png" style="width: 80%;"></div>
                <p class="helpP">
						<strong>3、项目编辑</strong><br>
                          &nbsp;&nbsp;&nbsp;&nbsp;新建新项目后，用户可以选择新建好的项目进行编辑，例如此处选择“项目1”。用户可以直接在网页上对项目进行编辑。<br>
                </p>
                <div style="width:100%;text-align: center"><img src="static/img/help/3-1.png" style="width: 80%;"></div>
                <p class="helpP">
                          &nbsp;&nbsp;&nbsp;&nbsp;用户也可下载模板文件通过修改模板文件或者将当前SIPOC图项目导出并进行编辑然后上传完成对当前SIPOC图的修改和编辑。<br>
                </p>
                <div style="width:100%;text-align: center"><img src="static/img/help/3-2.png" style="width: 80%;"></div>
                <p class="helpP">
						<strong>4、数据保存</strong><br>
                              &nbsp;&nbsp;&nbsp;&nbsp;在完成SIPOC图内容编辑以后用户可以选择将文件导出为excel文件或者图片。保存为excel文件的方法为点击工具条上的“文件导出”按钮，保存为图片的方法为点击工具条上的“预览图片”按钮，弹出预览图片，确认无误后点击保存图片按钮。导出文件和图片会保存在浏览器默认下载目录中。另外，登陆用户可以使用保存至云功能，将数据保存至数据库。<br>
                </p>
                <div style="width:100%;text-align: center"><img src="static/img/help/4.png" style="width: 80%;"></div>
                <p class="helpP">
						<strong>5、生成报告</strong><br>
                            &nbsp;&nbsp;&nbsp;&nbsp;完成SIPOC图编辑后，用户还可以在本应用中快速生成报告，方法为选择“报告编辑”分页，然后进行修改，然后点击“保存Word”按钮即可。<br>
                </p>
                <div style="width:100%;text-align: center"><img src="static/img/help/5.png" style="width: 80%;"></div>
			</div>
	  </div>
</div>
<!--另存为模态框-->
<div class="modal fade" id="saveAsModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" style="display: none;">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title" id="newProjectModalTitle">
                    新建项目
                </h4>
            </div>
            <div class="modal-body">
                <!-- <%--输入框组--%> -->
                <div class="input-group">
                    <span class="input-group-addon">项目名：</span>
                    <input type="text" class="form-control" placeholder="请输入项目名称" id="saveAsProjectNameModal">
                </div>
                <br>
                <div class="input-group">
                    <span class="input-group-addon">备 注：</span>
                    <input type="text" class="form-control" placeholder="请输入备注" id="saveAsProjectRemarkModal">
                </div>
                <br>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭
                </button>
                <button type="button" class="btn btn-primary" onclick="saveAsProject()" id="saveAsProButton">
                    确认
                </button>
            </div>
        </div>
    </div>
</div>
</body>
<script src="./static/js/draw.js"></script>
<script src="./static/js/detail.js"></script>
</html>