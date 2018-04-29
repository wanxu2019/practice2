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
        <script type="text/javascript" src="../static/dependencies/dom-to-image.js"></script>

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
                width:120px;
            }
           
        </style>
	</head>
	<body style="margin-left:200px">
	
	
	<div class="row" >
	
	<div class="col-xs-12 col-sm-12 col-md-2 col-lg-2" >
	<div style="background-color:yellow;">
	<p>
		<div class="btn-group" style="backgrond-color:#FF0000" >
		<a style="display:none" class="btn btn-info" href="/SIPOC/">&nbsp返回列表</a>
   		<a class="btn btn-info file" id="downloadModelFile" href="../template/sipoc_template.xls"><i class="icon-search icon-white"></i>&nbsp下载模板</a>
   		<a class="btn btn-info file" id="readFromFile"><i class="icon-file icon-white"></i>&nbsp文件导入<input id="xlf" type="file" name="xlfile"/></a>
        <button class="btn btn-info" id="btnSaveToFile"><i class="icon-download icon-white"></i>&nbsp保存文件</button>
        <button class="btn btn-info" id="btnSaveAsPicture"><i class="icon-print icon-white"></i>&nbsp保存图片</button>
        <button style="display:none" class="btn btn-info" id="btnSaveToDb">&nbsp保存至数据库</button>
        </div>
    </p>
    </div>
    </div>
   
    
    
    
    <div id="home" class="tab-pane active">
        
        	
           <div class="col-xs-12 col-sm-12 col-md-8 col-lg-6" >
                <div id="dataTableWrapper" class="table-responsive">
                    <input id="name" style="width:160px;" value="请输入"/>
                    <input id="name"  value="请输入"/>
                    
                    <table id="dataTable"
                           class="table table-striped table-bordered table-hover">
                        <input id="recordId" value="${record.id}" style="display:none"/>
                        <thead>
                        <tr>
                            <th>供应者</th>
                            <th>输入</th>
                            <th>流程</th>
                            <th>输出</th>
                            <th>用户</th>
                        </tr>
                        </thead>
                        <tbody>
                                <tr>
                                    <!-- S -->
                                    <td width="20%">
                                        <ul type="none">
                                            <s:iterator value="sMessageList" id="msg" status="st">
                                            <%--<s:iterator value="{'aaa','bbb'}" id="msg">--%>
                                                <li>
                                                
                                                <input id="input_s_<s:property value="#st.count-1"/>" value="<s:property value="msg"/>"/>
                                                <button class="btn btn-danger btn-sm" onclick="javascript:delElement(this);">
                                                <i class="ace-icon fa fa-reply icon-only"> <i class="icon-trash icon-white"></i></i>
                                                </button>
                                                
                                                </li>
                                            </s:iterator>
                                        </ul>
                                    <p><button class="btn-sui btn-primary btn-block" id="btnAddS">添加</button></p>
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

  
    <%--测试用--%>
    <%--<pre id="out"></pre>--%>
    <%--<div id="htmlout"></div>--%>

    <script src="../static/js/detail.js"></script>
    </body>
</html>
