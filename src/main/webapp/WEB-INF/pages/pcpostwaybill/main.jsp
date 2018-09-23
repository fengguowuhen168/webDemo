<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html lang="en">
<head>
    <title>PC快速收寄</title>
    <meta name="decorator" content="default"/>
 <style type="text/css">
    .table-actions {  margin: 0 6px 0 6px; }
    .container { width: 800px; margin: 0 auto; }
    .autocomplete-suggestions { -webkit-box-sizing: border-box; -moz-box-sizing: border-box; box-sizing: border-box; border: 1px solid #999; background: #FFF; cursor: default; overflow: auto; -webkit-box-shadow: 1px 4px 3px rgba(50, 50, 50, 0.64); -moz-box-shadow: 1px 4px 3px rgba(50, 50, 50, 0.64); box-shadow: 1px 4px 3px rgba(50, 50, 50, 0.64); }
    .autocomplete-suggestion { padding: 2px 5px;  overflow: hidden; }
    .autocomplete-no-suggestion { padding: 2px 5px;}
    .autocomplete-selected { background: #4d93fd; }
    .autocomplete-suggestions strong { font-weight: bold; color: #000; }
    .autocomplete-group { padding: 2px 5px; }
    .autocomplete-group strong { font-weight: bold; font-size: 16px; color: #000; display: block; border-bottom: 1px solid #000; }
    .container-fluid{ margin-bottom: 1px!important;}
    </style>
  <script src="${ctxStatic}/jquery-autocomplete/1.2.27/jquery.autocomplete.js" type="text/javascript"></script> 
  <link rel="stylesheet" href="${ctxpickup}/css/postwaybill/main.css"/>
  <link rel="stylesheet" href="${ctxpickup}/css/common/toastr.css"/>
  <link rel="stylesheet" href="${ctxpickup}/css/common/bootstrap-table.css"/>
  <link href="${ctxStatic}/common/bootstrap-custom.css" type="text/css" rel="stylesheet" /> 
  <link href="${ctxStatic}/common/index.css" type="text/css" rel="stylesheet" /> 
  <script type="text/javascript" src="${ctxpickup}/js/pcpostwaybill/main.js"></script>
  <script type="text/javascript" src="${ctxpickup}/js/common/toastr.js"></script> 
  <script type="text/javascript" src="${ctxpickup}/js/common/bootstrap-table.js"></script> 
  <script type="text/javascript">
          toastr.options.positionClass = 'toast-top-full-width';
  </script>
   <script type="text/javascript">var ctx = '${ctx}', ctxStatic='${ctxStatic}';</script>
   <script type="text/javascript" src="${ctxpickup}/js/postwaybill/product.js"></script>

<style type="text/css">
        .form-fold {
            background: #FFFFFF;
            padding-right: 30px;
            padding-left: 30px;
         }
        label{
            text-align: right;
            padding-left: 0px;
            padding-right: 5px;
            margin-left: 0px;
            margin-right: 0px;
        }
       
       .row-fluid{
         margin-bottom: 6px;
           margin-top: 6px;
       } 
       button{
       padding-right:5px;padding-left:5px 
       }
       #CoralDeviceActiveXrealWeightdefault{
        width:0;height:0
       }
       .btn+.btn{margin-left:0px;}
        .jbox-content{
            overflow-y:hidden !important;
        }
        div.jbox .jbox-button {
            height: auto!important;
            padding-left: 26px!important;
            padding-right: 26px!important;
            padding-top: 5px;
            padding-bottom: 5px;
            background: #4d58fd;
            border-color: #ccc;
            color: #fff;
        }
        .menu-head {
        padding-top: 8px;
        padding-left: 10px;
        padding-right: 30px;
        padding-bottom: 3px;
        border-bottom: thin solid #d8e2e9;
        font-size: 14px;
       }
       textarea[readonly] {
        background-color: #dee0e2;
       }
      
       .row-fluid_custom {
        padding-left: 870px;
        padding-right: 30px;
        box-sizing: border-box;
        margin-top: 15px;
        line-height: 0;
    }

    element.style {
    margin-bottom: -26px;
    padding-left: 10px;
    padding-right: 610px;
    }

    #orderSource .select2-choice{
        height:47px !important;
        margin:0px;
        font-size: 16px;
        font-weight:bold;  
        border: 2px solid;
        margin-right: 0px;
        margin-left: 0px;
    }

     input[type="radio"], input[type="checkbox"] {
       margin: 5px 3px;
     }

    </style>
<script type="text/javascript">
    function getBrowser() {
        var ua = window.navigator.userAgent;
        var isIE = window.ActiveXObject != undefined && ua.indexOf("MSIE") != -1;
        var isChrome = ua.indexOf("Chrome") && window.chrome;
        if (isIE) {
            return "IE";
        } else if (isChrome) {
            return "Chrome";
        }
    }
    $(document).ready(function() {
    if (getBrowser() == "IE") {
        var scriptNode = document.createElement("script"),
            timer,
            supportLoad = "onload" in scriptNode,
            onEvent = supportLoad ? "onload" : "onreadystatechange";
        scriptNode[onEvent] = function onLoad() {
            if (!supportLoad && !timer && /complete|loaded/.test(scriptNode.readyState)) {
                timer = setTimeout(onLoad)
                return
            }
            if (supportLoad || timer) {
                clearTimeout(timer)
                var setportflag = false;
                k = $('#realWeight').eweighter({
                    deviceModel:'taihang'
                });
                if('${chairs.elecScaleAuxPort}'!=""&& '${chairs.elecScaleAuxBaudrate}'!=""){
                    setportflag=true;
                }
                if(!setportflag){
                    k.setPortName('COM1');
                    k.setBaudRate('2400');
                }
                if(setportflag){
                    k.setPortName('${chairs.elecScaleAuxPort}');
                    k.setBaudRate('${chairs.elecScaleAuxBaudrate}');
                }

                $('#realWeight').focus(function(){
                    $(this).attr("data-w",1)
                    k.startGetWeight($(this));
                }).blur(function() {
                    $(this).attr("data-w",0)
                })
                window.onbeforeunload = function() {
                    k.stopGetWeight();
                }
            }
        }
        scriptNode.setAttribute("type", "text/javascript");
        scriptNode.setAttribute("src", ctxStatic+"/eweighter/eweighter.js"); 
        document.getElementsByTagName('head')[0].appendChild(scriptNode);

    } else if (getBrowser() == "Chrome") {
        $(".weight_for_chrome").focus(function() {
            $(this).attr("data-w", 1)
        }).blur(function() {
            $(this).attr("data-w", 0)
        })

    }
    });  
</script>

</head>
<body   id="">

  <form id="inputForm"  class="form-horizontal" >
    <div class="container-fluid">
       <div class="accordion-toggle accordion-head" data-toggle="collapse" data-target="#collapseOne" id="">
            <div class="menu-head">
                <span class="cp-icon  cp-icon-mail"></span>
                <span class="menu_title">邮件信息</span>
                 <span style="color: #4D93FD;margin-left:100px;top:16px">失败件数:
                  <span style="color: #FC8346;font-size:19px" id= "numberfail">0</span>
                </span>
                <span style="color: #4D93FD;margin-left:100px;top:16px">成功件数:
                  <span style="color: #FC8346;font-size:19px" id= "numberCollapse">0</span>
                </span>
                <span style="color: #4D93FD;margin-left:50px;top:16px">收寄总金额:
                  <span style="color: #FC8346;font-size:19px" id= "tatoAmountCollapse">0</span>元
                </span>
                <span class="btn-unfold"></span>
            </div>
        </div>
       <div id="collapseOne" class="accordion-body collapse in">
                     <div class="row-fluid">
                       <div class="span3"> 
                         <label class="span4"> <font color="red">*</font> 可售卖产品:</label>
                         <input type="text" name="" id="bizProductNames" class="span8" data-rule-required="true" style=" margin-left:0px;"></input>
                         
                      </div>
                       <div class="span3">
                           <label class="span4"><font color="red">*</font>客户名称:</label> 
                           <input type="text" name="senders" id="senders" class="span8" AUTOCOMPLETE="off" style=" margin-left:0px;" data-rule-required="true">
                           <script type="text/javascript" src="${ctxpickup}/js/pcpostwaybill/customer.js?2101117-04-293331151"></script>
                       </div>
                      <div class="span3"> 
                          <label  class="span4"><font color="red">*</font> 子客户:</label>                
                          <select name="senderWarehouseId" class="span8"id="senderWarehouseId" type="text" style=" margin-left:0px;" data-rule-required="true"> 
                          </select>
                      </div>
                     <div class="span3">
                         <label class="span4">客户代码</label>             
                         <input  id= "senderNo" class="span8" type="text" name="senderNo" readonly="readonly" /> 
                       </div>
                   </div>
                  <div class="row-fluid">
                  
                  <div class="span3" id="orderSource">
                        <label class="span4" ><font color="red">*</font>订单渠道:</label>
                        <select name="ecommerceNo" class="span8" id="ecommerceNo" type="text" style=" margin-left:0px;"  > 
                        </select>
                    </div>
                      <div class="span3">
                        <label class="span4"><font color="red">*</font>邮件号:</label>
                        <input name="waybillNo" class="span8"  id="waybillNo" type="text"  data-rule-required="true"   maxlength="45" style="text-transform:uppercase; height: 50px;padding: 2px 2px; font-size: 18px;font-weight:bold;  border: 2px solid"/>                 
                    </div>
                     <div class="span3">
                        <label class="span4"><font color="red">*</font>实际重量g:</label>              
                        <input name="realWeight"class="span8 weight_for_chrome"id="realWeight" type="text"  value="" data-rule-required="true" maxlength="8" style="padding-right: 0px; height: 50px;padding: 2px 2px; font-size: 18px;font-weight:bold;  border: 2px solid"/>
                       
                    </div>
                     <div class="span3">
                        <label class="span4">长(cm):</label>           
                       <input name="length"class="span8"id="length" type="text"maxlength="6" style="padding-right: 0px; height: 50px;padding: 2px 2px; font-size: 18px;font-weight:bold;  border: 2px solid"/>
                    </div>
                    
                  </div> 
                   
                   <div class="row-fluid">
                     <div class="span3">
                        <label class="span4">宽(cm):</label>
                        <input name="width"class="span8"id="width" type="text"maxlength="6"style="padding-right: 0px;"/>            
                    </div>
                     <div class="span3">
                        <label class="span4">高(cm):</label>      
                        <input name="height"class="span8"id="height" type="text"maxlength="6"style="padding-right: 0px;"/>
                    </div>
                    <div class="span3">
                        <label class="span4" for="realWeightSD" style="display:inline-block;">锁定重量</label>      
                        <input type="checkbox" id="realWeightSD" value="1"  style="padding-right: 0px;"/>
                        <label for="postBlendSD"  id="postBlendSD1" style="display:inline-block;margin-left:50px;">混合收寄</label>
                        <input type="checkbox" id="postBlendSD">
                        <label for="lockCustomer" id="lockCustomer1" style="display:inline-block;margin-left:50px;">锁定客户</label>
                        <input type="checkbox" id="lockCustomer">
                    </div>
                    <div class="span3">
                        <label for="lockExportGrid" id="lockExportGrid1" style="display:inline-block;margin-left:15px;">格口语音播放</label>
                        <input type="checkbox" id="lockExportGrid">
                    </div>
                    
                    </div> 
           </div>
        </div>
 
     <div class="container-fluid ">
        　　
        <div class="row-fluid"style="height:40px">
            <div id="message"class="span9" style="padding-left: 19px;padding-top: 10px;font-size:23px"" > 
        
            </div>
          <div class="span3">  
                <button class="btn btn-primary"  type="button" id= "smt" accessKey="s" position:absolute; style="padding-right:5px;padding-left:5px ;">下一件【S】</button>
                <button class="btn btn-primary"  type="button" id= "paymentCZ" accessKey="c"  position:absolute; style="padding-right:0px;padding-left:8px ">重置【C】</button>
           </div>
        </div>
    </div>
      <div class="row-fluid">
           
        <div class="span4"  >
            <table  class="table table-striped table-bordered " id= "tablefail"  ata-toggle="table" data-url="data2.json" data-height="264"  >
            <thead>
               <tr>
                  <th>邮件号</th>
                  <th>重量</th>
               </tr>
             </thead>
            </table>
        </div>
      <div class="span8"  >
            <table  class="table table-striped table-bordered " id= "tablebordered"  ata-toggle="table" data-url="data2.json" data-height="264"  >
            <thead>
               <tr>
                  <th>邮件号</th>
                  <th>重量</th>
                  <th>格口</th> 
                  <th>收件地址</th>
               </tr>
             </thead>
            </table>
        </div>
       
         </div>   
        
        
           <div class="hide">
              <audio id="success" ><source src="${ctxStatic}/pickup/music/operate_success.wav"></audio>
          </div>
              
           <div class="hide">
              <audio id="fail" ><source src="${ctxStatic}/pickup/music/operate_fail.wav"></audio>
          </div>
              
         <div class="hide">
              <audio id="order_repeat" ><source src="${ctxStatic}/pickup/music/order_repeat.wav"></audio>
          </div>
          
           <div class="hide">
              <audio id="nothingmsg" ><source src="${ctxStatic}/pickup/music/nothingmsg.wav"></audio>
          </div>
           <div class="hide">
              <audio id="nothingOrg" ><source src="${ctxStatic}/pickup/music/nothingOrg.wav"></audio>
          </div>
          
           
     <div class="hide">
         	<audio id="nothingmsg0">
				<source src="${ctxStatic}/pickup/music/a0.wav">
			 </audio>
			<audio id="nothingmsg1">
				<source src="${ctxStatic}/pickup/music/a1.wav">
			</audio>
			<audio id="nothingmsg2">
				<source src="${ctxStatic}/pickup/music/a2.wav">
			</audio>
			<audio id="nothingmsg3">
				<source src="${ctxStatic}/pickup/music/a3.wav">
			</audio>
			<audio id="nothingmsg4">
				<source src="${ctxStatic}/pickup/music/a4.wav">
			</audio>
			<audio id="nothingmsg5">
				<source src="${ctxStatic}/pickup/music/a5.wav">
			</audio>
			<audio id="nothingmsg6">
				<source src="${ctxStatic}/pickup/music/a6.wav">
			</audio>
			<audio id="nothingmsg7">
				<source src="${ctxStatic}/pickup/music/a7.wav">
			</audio>
			<audio id="nothingmsg8">
				<source src="${ctxStatic}/pickup/music/a8.wav">
			</audio>
			<audio id="nothingmsg9">
				<source src="${ctxStatic}/pickup/music/a9.wav">
			</audio>
			<audio id="nothingmsg11">
				<source src="${ctxStatic}/pickup/music/a11.wav">
			</audio>
			<audio id="nothingmsg99">
				<source src="${ctxStatic}/pickup/music/a99.wav">
			</audio>
     </div>
        
     
     <div class="hide">
        <input type="text" name="bizProductNo" id="bizProductNo" class="input-medium " style="display: none;"data-rule-required="true"></input>
        <input type="text" name="bizProductId" id="bizProductId" class="input-medium " style="display: none;" data-rule-required="true"></input>
        <input type="text" name="bizProductName" id="bizProductName" class="input-medium " style="display: none;" data-rule-required="true"></input>
        <input type="text" name="senderWarehouseName" id="senderWarehouseName" class="input-medium " style="display: none;" data-rule-required="true"></input>
        <input type="text" name="senderId" id="senderId" class="input-medium " style="display: none;" data-rule-required="true"></input>
        <input type="text" id="sender" name="sender"  style="display: none;" data-rule-required="true"/>
        <input type="text" id= "weightUpperBound">
       <input type="text" id="pickupAttribute" value="${pickupAttribute}">机构属性
     </div>
     
     
</form>








<script type="text/javascript">
$(document).ready(function(){
  ///  ===================================================
       $.ajax({
          type : 'POST',
          url :ctx+'/pcpostwaybill/queryecommerce',
          data :{"query":$("#pickupAttribute").val()},
          dataType : 'JSON',
          success : function(dto) {
        	  if($("#pickupAttribute").val()=="A"){
	              jQuery("#ecommerceNo").append("<option value='Wu'>无</option>");
	              for(var i=0;i<dto.length;i++){
	                  jQuery("#ecommerceNo").append("<option value='"+dto[i].code+"'>"+dto[i].name+"</option>");
	              }
	              $("#ecommerceNo").select2("val","Wu");
        	  }else{
	              for(var i=0;i<dto.length;i++){
	                  jQuery("#ecommerceNo").append("<option value='"+dto[i].code+"'>"+dto[i].name+"</option>");
	              }
	              $("#ecommerceNo").select2("val","TAOBAO");
          }
          }
         });
      
   //====================================================== 
    
    $("#ecommerceNo").change(function(){
        if($("#ecommerceNo").val()!="Wu"){
            $("#postBlendSD").attr("checked",false);
            $('#postBlendSD').attr("disabled",true);
        }else{
            $('#postBlendSD').attr("disabled",false);
        }
        if($("#ecommerceNo").val()=="TAOBAO" && $("#pickupAttribute").val()=="B"){
            $("#lockCustomer1").show();
            $("#lockCustomer").show();
        }else{
           $("#lockCustomer").prop("checked",false);
           $("#lockCustomer1").hide();
           $("#lockCustomer").hide();
     }
    });
  //=========================================================  
    if($("#pickupAttribute").val()=="B"){
        $("#postBlendSD").attr("disabled",true); 
        $("#postBlendSD").hide();
        $("#postBlendSD1").hide();
    }else if($("#pickupAttribute").val()=="A"){
         $("#lockCustomer").attr("checked",false);
         $("#lockCustomer1").hide();
         $("#lockCustomer").hide();
    }
  //==================================================================  
   
    
    
    
    
    $("#inputForm").validate({
        submitHandler: function(form){
            var senderWarehouseId=$("#senderWarehouseId").val();
                if(senderWarehouseId==""){
                $("#senderWarehouseId").select2("open");
                 $("#senderWarehouseId").focus();   
                 toastr.remove();
                 toastr.error("请选择子客户信息 ");    
                    return;
                }
             $("#senderWarehouseName").val($("#senderWarehouseId").find("option:selected").text());

            $.ajax({
                url : ctx+"/pcpostwaybill/insertinto", // 请求url
                type : "post", // 提交方式
                dataType : "json", // 数据类型
                data : $('#inputForm').serialize(),// 参数序列化
                beforeSend:function(){
                  loading('正在提交，请稍等...');
                },
                complete:function(){
                 closeLoading();
                },
                success : function(data) { // 提交成功的回调函数
                    if(data.resCode==null ||data.resCode==""){
                        MARK=0;
                        MARKS=0;
                         var waybillNo=$("#waybillNo").val();
                         /* var realWeight= $("#realWeight").val();  */
                         var trCargo="";
                           trCargo +="<tr>"
                           trCargo +="<td>"+waybillNo.toUpperCase()+"</td>";
                           trCargo +="<td>"+(data.detail[0].realWeight!= undefined ? data.detail[0].realWeight : '')+"</td>";
                           trCargo +="<td>"+(data.innerHtml!= undefined ? data.innerHtml : '')+"</td>";
                           trCargo +="<td>"+(data.detail[0].receiverAddr!= undefined ? data.detail[0].receiverAddr : '')+"</td>";
                           trCargo +="</tr>"
                           $("#tablebordered tr:first").after(trCargo); 

                         	if(	$("#lockExportGrid").is(':checked')){
                         		voiceBroadcast((data.detail[0].reserved10!= undefined ? data.detail[0].reserved10 : ''));
                            }
                           toastr.remove();
                           toastr.success("保存成功 "); 
                          
                           var success=document.getElementById("success");
                           var nothingOrg=document.getElementById("nothingOrg");
                           
                           if(data.innerHtml==null || data.innerHtml==""){
                               nothingOrg.play();
                           }else{
                        	   if(!$("#lockExportGrid").is(':checked')){
                        		   success.play();
                        	   }
                           }
                           
                           if(!$("#realWeightSD").is(':checked')){
                               $("#realWeight").val(""); 
                            }
                           $("#waybillNo").val("");
                           $("#length").val("");
                           $("#width").val("");
                           $("#height").val("");
                           $("#waybillNo").focus(); 
                           $("#message").html("<font color='green'>"+(waybillNo.toUpperCase()+"金额："+data.comment+"元   格口:"+data.innerHtml)+"</font>");  
                           var tatoAmountCollapse=  $("#tatoAmountCollapse").html(); 
                           $("#tatoAmountCollapse").html((parseFloat(data.comment)+parseFloat(tatoAmountCollapse)).toFixed(2));
                           NUMBERCOLLAPSE++;
                           $("#numberCollapse").html(NUMBERCOLLAPSE) ;
                          
                    }else{
                        toastr.remove();
                        toastr.error(data.resMess);
                        var waybillNo=$("#waybillNo").val();
                        var realWeight=$("#realWeight").val();
                        
                        var fail=document.getElementById("fail")
                        fail.play();
                        $("#message").html("<font color='red'>"+(waybillNo+data.resMess)+"</font>"); 
                        if(!$("#realWeightSD").is(':checked')){
                            $("#realWeight").val(""); 
                         }
                        $("#waybillNo").val("");
                        $("#length").val("");
                        $("#width").val("");
                        $("#height").val("");
                        $("#waybillNo").focus(); 
                        var a= $.inArray(waybillNo,arrs);
                        if(a==-1){
                            arrs.push(waybillNo);
                            var trCargo="";
                            trCargo +="<tr>"
                            trCargo +="<td>"+waybillNo.toUpperCase()+"</td>";
                            trCargo +="<td>"+(realWeight!= undefined ? realWeight : '')+"</td>";
                            trCargo +="</tr>"
                            $("#tablefail tr:first").after(trCargo);
                            NUMBERFAIL++;
                            $("#numberfail").html(NUMBERFAIL) ;
                        }
                    }
                },
                error:function(e){
                    toastr.remove();
                    toastr.error(e.resMess);
                }
            })
        
        },
        rules: {
            waybillNo: {
                          required: true,
                          minlength:13, 
                          maxlength:13
                     },
             realWeight: {
                        required: true,
                        digits: true
                       },
            
              height:{
                  digits:true,
              },
              width:{
                  digits:true,
              },
              length:{
                  digits:true,
              },
             
         },
       messages: {
           waybillNo: {
                    minlength: "不能小于13个字符"
                   },
           realWeight: {
                digits: "只能为 数字 "
                  }
         }
    }); 
    
});
    
  
    

//2位数语音播报
function voiceBroadcast (qq){
	var zqbds = /^[0-9]\d*$/;//匹配是否输入数量正确//
	if (zqbds.test(qq)) {
		var qq = parseInt(qq).toString();
		if (qq.length == 1) {
			var num = document.getElementById("nothingmsg" + qq);
			num.play();
		} else if (qq.length == 2) {
			if(qq==11 || qq==99){
				var num = document.getElementById("nothingmsg" + qq);
				num.play();
			}else{
				var num = document.getElementById("nothingmsg"+ qq.substr(0, 1))
				num.play();
				setTimeout(function() {
					var num = document.getElementById("nothingmsg"+ qq.substr(1, 2))
					num.play();
				}, 450);
			}
		}
	}
}
var MARKS=0;
var MARK=0;//一体机收寄标书

$(document).ready(function() {
     var reg = /^[0-9]{6}$/; 
     $("#waybillNo").keydown(function loadPkpInternalInfo(event){
      if(event.keyCode==13||event.keyCode==9){
             
             var bizProductNo =$("#bizProductNo").val();
             if(bizProductNo==''){
             $('#waybillNo').val("");
             $("#bizProductNames").focus();
             toastr.remove();
             toastr.error('请先选择产品');
              return false;
             }
          var waybillNos = $('#waybillNo').val();
          var ecommerceNo = $("#ecommerceNo").val();
          if(waybillNos==''){
            $("#waybillNo").focus();
            return false;
          }
         var data=waybillNos.split(",");
         var waybillNo =data[0];
         $("#waybillNo").val(waybillNo);
         if(data.length>1){
            $("#realWeight").val(data[1]);
            if(data.length>4) {
                 $("#length").val(data[2]);
                 $("#width").val(data[3]);
                 $("#height").val(data[4]);
            }
             MARK=1;//一体化表示
         }else{
             MARK=0; 
         }
         var postBlend=0;//混合收寄标示
         if($("#postBlendSD").is(':checked')){
           postBlend=1;
         }
   $.ajax({
            url : ctx+ '/pcpostwaybill/pcquerypostwaybill',
            type: 'POST',
            data: {'waybillNo':waybillNo,'ecommerceNo':ecommerceNo,"postBlend":postBlend,"bizProductNo":bizProductNo},
            dataType: 'JSON',
            success: function(result){  
            	 if(result.status==2){//无预估 
                     MARK=0;
                     toastr.remove();
                     toastr.error(result.msg);  
                     
                     var waybillNo=$("#waybillNo").val();
                     var realWeight= $("#realWeight").val();
                     var nothingmsg=document.getElementById("nothingmsg")
                     nothingmsg.play();
                    $("#message").html("<font color='red'>"+(result.msg)+"</font>");  
                   var a= $.inArray(waybillNo,arrs);
                   if(a==-1 || $("#realWeightSD").is(':checked')){
                       arrs.push(waybillNo);
                       var trCargo="";
                       trCargo +="<tr>"
                       trCargo +="<td>"+waybillNo.toUpperCase()+"</td>";
                       trCargo +="<td>"+(realWeight!= undefined ? realWeight : '')+"</td>";
                       trCargo +="</tr>"
                       $("#tablefail tr:first").after(trCargo);
                       NUMBERFAIL++;
                       $("#numberfail").html(NUMBERFAIL) ;
                   }
                    
                     $("#waybillNo").val("");
                     $("#waybillNo").focus();
                    
                 }else if(result.status==3){
                     var order_repeat=document.getElementById("fail")
                     order_repeat.play();
                     MARK=0;
                     $("#waybillNo").val("");
                     $("#waybillNo").focus();
                     $("#message").html("<font color='red'>"+result.msg+"</font>");
                    toastr.remove();
                    toastr.error(result.msg);   
                 }
                 else if(result.status==1){//已收寄
                     MARK=0;
                     $("#waybillNo").val("");
                     $("#waybillNo").focus();
                     var order_repeat=document.getElementById("order_repeat")
                     order_repeat.play();
                     $("#message").html("<font color='red'>"+(result.msg)+"</font>");  
                     toastr.remove();
                     toastr.error(result.msg);                          
                 }else if(result.status==0){
                	 
       //==========================================有预估信息====================================             
                     var share=result.data; 
            $("#message").html("<font color='green'>"+(share.waybillNo+"收件地址：" +share.receiverProvinceName+share.receiverCityName+share.receiverCountyName)+"</font>");  
                     //混合收寄
       //==================================邮务规则======================================================           
                 if($("#pickupAttribute").val()=='A'){
                     if(postBlend=="1"){
                    	 $("#sender").val("");
                         $("#senders").val("");
                         $("#senderId").val("");
                         $("#senderNo").val("");
                         $("#senderWarehouseId").empty();
                         $("#senderWarehouseId").select2("val","");
                         if(share.senderNo !=""){
                        	  $("#sender").val(share.sender);
                              $("#senders").val(share.sender);
                              $("#senderId").val(share.senderId);
                              $("#senderNo").val(share.senderNo)
                              jQuery("#senderWarehouseId").append("<option value="+share.senderWarehouseId+">"+share.senderWarehouseName+"</option>");  
                              $("#senderWarehouseId").select2("val",share.senderWarehouseId);
                              
                         }
                     }
                     if($("#ecommerceNo").val()!="Wu"){
                         if( $("#senderNo").val()!=share.senderNo){
                          qureysenderNoAction(share);
                     } else{
                    	 if($("#senderWarehouseId").val() !=share.senderWarehouseId){
                             $("#senderWarehouseId").select2("val",share.senderWarehouseId);
                         } 
                     }
                  }  	
                   
                }else{
         //==========================================速递规则=========================================       	 
                      if(share.ecommerceNo!="" && share.ecommerceNo!="Taobao"){
                           $("#senders").attr("disabled",true);
                        }else{
                           $("#senders").attr("disabled",false);  
                        }
                       if(share.senderNo=="" || null==share.senderNo){
                           $("#senders").attr("disabled",false);
                       }
                       if( !$("#lockCustomer").is(":checked")){
                           $("#sender").val("");
                           $("#senders").val("");
                           $("#senderId").val("");
                           $("#senderNo").val("");
                           $("#senderWarehouseId").empty();
                           $("#senderWarehouseId").select2("val","");
                           if(share.senderNo !="" && null !=share.senderNo){
                           $("#sender").val(share.sender);
                           $("#senders").val(share.sender);
                           $("#senderId").val(share.senderId);
                           $("#senderNo").val(share.senderNo)
                           jQuery("#senderWarehouseId").append("<option value="+share.senderWarehouseId+">"+share.senderWarehouseName+"</option>");  
                           $("#senderWarehouseId").select2("val",share.senderWarehouseId);
                           }
                   }   
                }
                    
                     
                     
                   //=============如果是一体机，或锁定重量直接完成收寄  ================
                     if(MARK==1 || $("#realWeightSD").is(':checked')){
                         $("#inputForm").submit();
                       }
                   }
           
            },
            error:function(e){ 
                toastr.remove();
                toastr.error('加载信息失败!'+e); }
        }); 
        }
    }); 
     
 });
function qureysenderNoAction(share){
    $("#sender").val("");
    $("#senders").val("");
    $("#senderId").val("");
    $("#senderNo").val("");
    $("#senderWarehouseId").empty();
    $("#senderWarehouseId").select2("val","");
   var senderId=share.senderNo;
   if(senderId==null || senderId=="" || senderId.length<13){
       return;
   }
    
        $.ajax({
            type : 'POST',
            url :ctx+'/common/customerins',
            data :{customerId:senderId},
            dataType : 'JSON',
            success : function(dto) {
                if(dto!=null){
                var cus =dto.baseCustome;
                
                if(cus==null || cus==""){
                    return;
                }
                var list=dto.customerPickupMsg;
                $("#senderType").val("1");  
                $("#sender").val(cus.name);
                $("#senders").val(cus.name);
                $("#senderId").val(cus.id);
                $("#senderNo").val(cus.customerSubCode);
               
                $("#senderWarehouseId").empty();
                $("#senderWarehouseId").select2("val","");
           
                if(list!=""){
                    for(var i=0;i<list.length;i++){
                        var name=list[i].pickupAddrAlias;
                         var customerId=list[i].id;
                     jQuery("#senderWarehouseId").append("<option value="+customerId+">"+name+"</option>");  
                      }
                  }
                $("#senderWarehouseId").select2("val",share.senderWarehouseId);//寄件客户分仓编号
                
                }
            }
        });

};
</script>  
</body>
</html>