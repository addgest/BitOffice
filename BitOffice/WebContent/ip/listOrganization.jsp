<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page pageEncoding="EUC-KR"%>

<!--  ///////////////////////// JSTL  ////////////////////////// -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!DOCTYPE html>

<html lang="ko">
	
<head>
	<meta charset="EUC-KR">
	
	<!-- 참조 : http://getbootstrap.com/css/   참조 -->
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	
	<!--  ///////////////////////// Bootstrap, jQuery CDN ////////////////////////// -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>



    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jstree/3.2.1/themes/default/style.min.css" />
     <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/1.12.1/jquery.min.js"></script> 
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jstree/3.2.1/jstree.min.js"></script>	
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>
	
	 <!-- tree -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jstree/3.2.1/jstree.min.js"></script> 	
	
	<!-- Bootstrap Dropdown Hover CSS -->
   <link href="/css/animate.min.css" rel="stylesheet">
   <link href="/css/bootstrap-dropdownhover.min.css" rel="stylesheet">
    <!-- Bootstrap Dropdown Hover JS -->
   <script src="/javascript/bootstrap-dropdownhover.min.js"></script>
   
   <!-- jQuery UI toolTip 사용 CSS-->
  <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  <!-- jQuery UI toolTip 사용 JS-->
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	
	<!--  ///////////////////////// CSS ////////////////////////// -->
	<style>
	  body {
            padding-top : 50px;
        }
    </style>
    
     <!--  ///////////////////////// JavaScript ////////////////////////// -->
   <script type="text/javascript">
    
        $(function () {       	
		        $.ajax( 
					{
						
						url : "/organization/json/listOrganization",	
						method : "POST" ,
						dataType : "json" ,
						headers : {
							"Accept" : "application/json",
							"Content-Type" : "application/json"
						},
						success : function(JSONData , status) {

								createJSTree(JSONData);
		
						},	
						error : function(error) {
					        alert("조회실패!");
					    }
		
				});    
      
        });

        function createJSTree(jsondata) {        	
            $('#SimpleJSTree').jstree({
                'core': {
                    'data':
                    		jsondata                    		
                    	} 
                    ,'types': {
                    'default' : {
                        'icon' : {
                            'image' : '/admin/views/images/file.png'
                        }
                    }
              	  }               
                ,'plugins' : [
                	//"checkbox",
                	//"contextmenu",
                	//"dnd",
                	//"massload",
                	//"search",
                	//"sort",
                	//"state",
                	//"types",
                	//"unique",
                	//"wholerow",
                	//"changed",
                	//"conditionalselect"
                ]
            });  
            
/*               $('#SimpleJSTree').bind('select_node.jstree', function(event, data){
                var id = data.instance.get_node(data.selected).id;        //id 가져오기
                var parent = data.instance.get_node(data.selected).parent;        //id 가져오기
                var text = data.instance.get_node(data.selected).text;        //id 가져오기
                var id2 = data.node.id;
                
                
                if(parent !="#"){
               	 //$("ol").append("<li>"+text+"</li>");
                }
            });    */
            
              $('#SimpleJSTree').on("hover_node.jstree", function (node, data) {     	
            	
                //alert("안녕");
                //alert(data.rslt.obj.attr("id"));
            });    
      
          	
            
             $("#btn1").click(function(){

            	var jsfields = $('#SimpleJSTree').jstree('get_selected'); 
            	
            	var obj = $('#dvTreeStructure p');
            	
            	
            	alert(obj.length);
           	
    			obj.each( function(){
     				alert($(this).text());
    			});
    			
            	//$("ol").append("<li>"+jsfields+"</li>");                   	
            	
             	for (var i=0;i<jsfields.length;i++) {
             		if (jsfields[i].length>2){
            			$("#dvTreeStructure").append("<p id='#"+jsfields[i]+"'>"+jsfields[i]+" <a onclick=del('"+jsfields[i]+"')>삭제</a></p>");
             		}
            	}  

            	$('#SimpleJSTree').jstree(true).deselect_all();
            		
 			}); 
             
             $("#allsee").click(function(){           	 
            	 if ($('#allsee').text() == '[조직도펼치기]'){      
            		$('#SimpleJSTree').jstree('open_all');					
					$('#allsee').text('[조직도접기]');             	 	
            	 }else{       
            		$('#SimpleJSTree').jstree('close_all');    
            		$('#allsee').text('[조직도펼치기]');
            	 }
            	 
            	 
             });
             

        }
        
        function del(a){
       	 alert("삭제해줘:"+a);
       		$("p").remove(":contains("+a+")");
        }        
    </script>
	
</head>

<body>
	<!-- ToolBar Start /////////////////////////////////////-->
	<jsp:include page="/layout/toolbar.jsp" />
   	<!-- ToolBar End /////////////////////////////////////-->
	<br>
	<br>
	<br>
	<br>
	<div class="container">
	    <div id="allsee">[조직도펼치기]</div>
	    <div id="SimpleJSTree"></div>   
		<div id="dvTreeStructure"> 
		</div>		
	</div>
	<!-- <button id="btn1">결재자</button> 
	<button id="btn2">참조인</button>   	 -->
	
</body>

</html>