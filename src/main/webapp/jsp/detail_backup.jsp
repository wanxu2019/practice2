<%@ page language="java" pageEncoding="UTF-8" contentType="text/html;charset=utf-8" %>
<%@ include file="/common/taglibs.jsp" %>
<!DOCTYPE html>
<html lang="zh-CN">
	<head>
		<title>SIPOC</title>
        <script src="../static/dependencies/excel/cpexcel.js"></script>
        <script src="../static/dependencies/excel/shim.js"></script>
        <script src="../static/dependencies/excel/jszip.js"></script>
        <script src="../static/dependencies/excel/xlsx.js"></script>
        <script src="http://cdn.static.runoob.com/libs/angular.js/1.4.6/angular.min.js"></script>
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
                width:75%;
            }
            
            .main-content{
            margin-left: 0px;
            }
            div {
    margin-left: auto;
    margin-right: auto;

}
		
        </style>
	</head>
	<body>
	
	<div style="display:none;">

		<input   id="check" value=<s:property default="空" value="#request.username"/>></input>
   </div>
	
<div class="tabble">
	<ul class="nav nav-tabs" id="myTab">
		<li class=""><a href="../index.jsp">SIPOC管理</a></li>
		<li class="active"><a href="">使用与查询</a></li>
		<li class=""><a  href="../jsp/help.jsp">使用帮助<  /a></li>
	</ul>
	<div class="tab-content">	
<%--************************************************************************************************************************************************************************ --%>
	<nav class="navbar  bg-light" style="background:#f8f9fa!important">
  <ul class="navbar-nav">
    <div class="btn-group" style="backgrond-color:#FF0000" >
		<a style="display:none" class="btn btn-info" href="/SIPOC/">&nbsp返回列表</a>
   		<a class="btn btn-info file" id="downloadModelFile" href="../template/sipoc_template.xls"><i class="icon-home icon-white"></i>&nbsp下载模板</a>
   		<a class="btn btn-info file" id="readFromFile"><i class="icon-book icon-white"></i>&nbsp文件导入<input id="xlf" type="file" name="xlfile"/></a>
        <button class="btn btn-info" id="btnSaveToFile"><i class="icon-share icon-white"></i>&nbsp保存文件</button>
        <button class="btn btn-info" id="btnDetailShow" onclick="javascript:add()"><i class="icon-print icon-white"></i>&nbsp预览图片</button>
       <!--   <button class="btn btn-info" id="btnSaveAsPicture"><i class="icon-print icon-white"></i>&nbsp保存图片</button>-->
        <button style="" class="btn btn-info" id="btnSaveToDb"><i class="icon-asterisk icon-white"></i>&nbsp保存至云</button>
   		<!--<a class="btn btn-info"  href="../jsp/help.jsp"><i class="icon-search icon-white"></i>&nbsp帮助文档</a>-->
   		
   		
   		
   		
   		
        </div>
    
  </ul>
</nav>
	
	
	
	
	
	
	
	
	<div class="row" style="margin-top:2.5em">
	<%-- 
	<div style=" margin-left: 1.5em;" class="col-xs-12 col-sm-12 col-md-1 col-lg-1" >
	<div >
	<p style=" margin: auto;">
		<div class="btn-group" style="backgrond-color:#FF0000" >
		<a style="display:none" class="btn btn-info" href="/SIPOC/">&nbsp返回列表</a>
   		<a class="btn btn-info file" id="downloadModelFile" href="../template/sipoc_template.xls"><i class="icon-home icon-white"></i>&nbsp下载模板</a>
   		<a class="btn btn-info file" id="readFromFile"><i class="icon-book icon-white"></i>&nbsp文件导入<input id="xlf" type="file" name="xlfile"/></a>
        <button class="btn btn-info" id="btnSaveToFile"><i class="icon-share icon-white"></i>&nbsp保存文件</button>
        <button class="btn btn-info" id="btnDetailShow" onclick="javascript:add()"><i class="icon-print icon-white"></i>&nbsp预览图片</button>
       <!--   <button class="btn btn-info" id="btnSaveAsPicture"><i class="icon-print icon-white"></i>&nbsp保存图片</button>-->
        <button style="" class="btn btn-info" id="btnSaveToDb"><i class="icon-asterisk icon-white"></i>&nbsp保存至云</button>
   		<!--<a class="btn btn-info"  href="../jsp/help.jsp"><i class="icon-search icon-white"></i>&nbsp帮助文档</a>-->
   		
   		
   		
   		
   		
        </div>
        
        
        
    </p>
    <b>注意事项：</b>
    <p>
   	 推荐在PC端使用
    </p>
    </div>
    </div>
   --%>
    
    
    
    <div id="home" class="tab-pane active">
        
        	
           <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12" >
                <div id="dataTableWrapper" class="table-responsive">
                
                
                    <input id="name" style="text-align:center;width:100%"  value="${record.name}"/>
                    
                   
                    <table id="dataTable"
                           class="table table-striped table-bordered table-hover">
                        <input id="recordId" value="${record.id}" style="display:none"/>
                        <thead>
                        <tr>
                            <th>供应者   <button class="btn-sui  pull-right " id="btnAddS" >添加</button></th>
                            <th>输入 <button class="btn-sui  pull-right " id="btnAddI" >添加</button></th>
                            <th>流程<button class="btn-sui  pull-right " id="btnAddP" >添加</button></th>
                            <th>输出<button class="btn-sui  pull-right " id="btnAddO" >添加</button></th>
                            <th>用户<button class="btn-sui  pull-right " id="btnAddC" >添加</button></th>
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
                                                
                                                <input id="input_s_<s:property value="#st.count-1"/>" value="<s:property value="msg"/>"/ id="test">
                                                &nbsp;
                                                <button class="btn btn-danger btn-xs pull-right" onclick="javascript:delElement(this);">
                                                <i class="ace-icon fa fa-reply icon-only"> <i class="icon-trash icon-white"></i></i>
                                                </button>
                                                
                                                </li>
                                            </s:iterator>
                                        </ul>
                                   
                                    </td>
                                    <!-- I -->
                                    <td  width="20%">
                                        <ul type="none">
                                            <s:iterator value="iMessageList" id="msg" status="st">
                                                <%--<s:iterator value="{'aaa','bbb'}" id="msg">--%>
                                                <li><input id="input_i_<s:property value="#st.count-1"/>" value="<s:property value="msg"/>"/>
                                                &nbsp;
                                                <button class="btn btn-danger btn-xs pull-right" onclick="javascript:delElement(this);">
                                                <i class="ace-icon fa fa-reply icon-only"><i class="icon-trash icon-white"></i></i>
                                                </button>
                                                </li>
                                            </s:iterator>
                                        </ul>
                                        
                                    </td>
                                    <!-- P -->
                                    <td  width="20%">
                                        <ul type="none">
                                            <s:iterator value="pMessageList" id="msg" status="st">
                                                <%--<s:iterator value="{'aaa','bbb'}" id="msg">--%>
                                                <li><input id="input_p_<s:property value="#st.count-1"/>" value="<s:property value="msg"/>"/>
                                                &nbsp;
                                                <button class="btn btn-danger btn-xs pull-right" onclick="javascript:delElement(this);">
                                                 <i class="ace-icon fa fa-reply icon-only"> <i class="icon-trash icon-white"></i></i>
                                                </button>
                                                </li>
                                            </s:iterator>
                                        </ul>
                                        
                                    </td>
                                    <!-- O -->
                                    <td  width="20%">
                                        <ul type="none">
                                            <s:iterator value="oMessageList" id="msg" status="st">
                                                <%--<s:iterator value="{'aaa','bbb'}" id="msg">--%>
                                                <li><input id="input_o_<s:property value="#st.count-1"/>" value="<s:property value="msg"/>"/>
                                                &nbsp;
                                                <button class="btn btn-danger btn-xs pull-right" onclick="javascript:delElement(this);">
                                                <i class="ace-icon fa fa-reply icon-only"> <i class="icon-trash icon-white"></i></i>
                                                </button>
                                                </li>
                                            </s:iterator>
                                        </ul>
                                        
                                    </td>
                                    <!-- C -->
                                    <td  width="20%">
                                        <ul type="none">
                                            <s:iterator value="cMessageList" id="msg" status="st">
                                                <%--<s:iterator value="{'aaa','bbb'}" id="msg">--%>
                                                <li><input id="input_c_<s:property value="#st.count-1"/>" value="<s:property value="msg"/>"/>
                                                &nbsp;
                                                <button class="btn btn-danger btn-xs pull-right" onclick="javascript:delElement(this);">
                                                <i class="ace-icon fa fa-reply icon-only"> <i class="icon-trash icon-white"></i></i>
                                                </button>
                                                </li>
                                            </s:iterator>
                                        </ul>
                                        
                                    </td>
                                </tr>
                        </tbody>
                    </table>
                    
                   
                <!-- /.table-responsive -->
            </div>
           
        
    </div>
    </div>
    
    
    
<%--************************************************************************************************************************************************************************ --%>	    
 </div>
   </div>   
    
    
    
    
    
    
    

    <table id="exportTable" style="display:none" >
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
        <tr >
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
    
    
    
  
 
    
    <%--测试用--%>
    <%--<pre id="out"></pre>--%>
    <%--<div id="htmlout"></div>--%>
  <!-- 这是之后要放进detailShow.js里的代码 -->
    <scripe>
    	
    
    
    </scripe>
    
    

    
    
    
    
    
    
    
	
	
	<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog">
        <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close"
                            data-dismiss="modal" aria-hidden="true">
                        &times;
                    </button>
                    <h4 class="modal-title" id="myModalLabel">
                        SIPOC预览
                        <small><button  class="btn-sui  pull-right "" id="btnSaveAsPicture"><i class="icon-print icon-white"></i>&nbsp保存图片</button></small>
                    </h4>
                    
                    
                    
                </div>
        
        <div id="print">
        <div class="row">
        <div class="col-xs-1 col-sm-1 col-md-1 col-lg-1" >
		</div>
		<div id="detailShowName" class="col-xs-10 col-sm-10 col-md-10 col-lg-10" >
		</div>
		<div class="col-xs-1 col-sm-1 col-md-1 col-lg-1" >
		</div>
        </div>
        
		<div class="row">
		
		
		<div class="col-xs-1 col-sm-1 col-md-1 col-lg-1" >
		</div>
	
		 <div class="col-xs-2 col-sm-2 col-md-2 col-lg-2" >
		 <div id="showS" class="list-group">
		 	<a href="#" class="list-group-item active">
		 		<h4 class="list-group-item-heading">供应者</h4>
			</a>
		</div>
		</div>
		
		
		 
		 
		 
		 <div class="col-xs-2 col-sm-2 col-md-2 col-lg-2" >
		 <div id="showI" class="list-group">
		 	<a href="#" class="list-group-item active">
		 		<h4 class="list-group-item-heading">输入</h4>
			</a>

		</div>
		 </div>
		 
		 
		 
		 
		 
		 <div class="col-xs-2 col-sm-2 col-md-2 col-lg-2" >
		 <div id="showP" class="list-group">
		 	<a href="#" class="list-group-item active">
		 		<h4 class="list-group-item-heading">过程</h4>
			</a>

		</div>
		</div>
		
		 
		
		 
		 
		 <div class="col-xs-2 col-sm-2 col-md-2 col-lg-2" >
		 <div id="showO" class="list-group">
		 	<a href="#" class="list-group-item active">
		 		<h4 class="list-group-item-heading">输出</h4>
			</a>
		</div>
		</div>
		
		
		 
		 
		 
		 <div class="col-xs-2 col-sm-2 col-md-2 col-lg-2" >
		 <div id="showC" class="list-group">
		 	<a href="#" class="list-group-item active">
		 		<h4 class="list-group-item-heading">用户</h4>
			</a>
		</div>
		</div>
		
		<div class="col-xs-1 col-sm-1 col-md-1 col-lg-1" >
		</div>
	</div>
	
	</div>
	
	
	
	
	
	</div>
	</div>
	</div>
	
	
	
	
	
	
    <script src="../static/js/detail.js"></script>
    
   
    </body>
</html>
