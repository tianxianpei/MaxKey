
<script type="text/javascript">	
	
	function iconFormatter(value, options, rData){
				return "<img width='30' height='30'  border='0px'  src='<s:Base/>/image/"+value+"'/>";
	};
   	
	$(function () {
		$("#addGroupAppsBtn").on("click",function(){
			var settings={
					url		:	"<s:Base/>/groupApp/addGroupAppsList/"+$("#groupId").val(),//window url
					title	:	"New",//title
					width	:	"700",//width
					height	:	"500"//height
				};
			$.window(settings);//open window
		});
		
		$("#deleteGroupAppsBtn").on("click",function(){
			var selectIds = $("#list").jqGrid("getGridParam", "selarrrow");
			if(selectIds == null || selectIds == "") {
				$.alert({content:$.platform.messages.select.alertText});
				return false;
			}
			$("#appId").val(selectIds);
			$("#submitBtn").click();
		});
		
		$("#appSearchBtn").on("click",function(){
			var postData=$("#advanced_search_app_form").serializeObject();
			$("#list").jqGrid('setGridParam',{postData: postData}).trigger("reloadGrid");
		});
	});
</script>

<div style="display:none">
	<form id="actionForm" method="post" action="<s:Base/>/groupApp/delete">
		<table>
			<tr><td></td><td><input type="text" class="groupId" id="groupId" name="groupId" value=""/></td></tr>
			<tr><td></td><td><input type="text" id="appId" name="appId" value=""/></td></tr>
			<tr><td colspan="2"><input id="submitBtn" type="button" value="submit"></input></td></tr>
		</table>
	</form>
</div>

	<div id="tool_box">
	 		<table   class="datatable">
 				<tr>
		 			<td width="120px"><s:Locale code="group.name"/>:</td>
		 			<td width="374px">
		 				<form id="basic_search_form">
				 			<input class="groupId" id="groupId" name="groupId" type="hidden" >
				 			<input class="groupName"   style="width:200px"   id="groupName" name="groupName" type="text" >
				 			<s:Dialog text="button.text.select" title="Groups" url="/groups/selectGroupsList"  width="700" height="500"  />
				 			
				 			<input class="button primary"  id="searchBtn" type="button" size="50" value="<s:Locale code="button.text.search"/>">
				 			
				 		</form>
		 			</td>
				 	<td colspan="2"> <div id="tool_box_right">
				 		<input class="button"  id="advancedSearchExpandBtn" type="button" size="50"  value="<s:Locale code="button.text.expandsearch"/>" expandValue="<s:Locale code="button.text.expandsearch"/>"  collapseValue="<s:Locale code="button.text.collapsesearch"/>">
						<input class="button" id="addGroupAppsBtn" type="button" value="<s:Locale code="button.text.add.member"/>">
						<input class="button"  id="deleteGroupAppsBtn" type="button" value="<s:Locale code="button.text.delete.member"/>">
				 	</div>
				 	</td>
				</tr>
			
			</table>
 	</div>
 	

 	<div id="advanced_search">
 		<form id="advanced_search_app_form">
	 		<table   class="datatable">
	 			<tr>
		 			<td width="120px"><s:Locale code="apps.name"/></td>
		 			<td width="360px">
		 				<input type="text" name="name" style ="width:150px">
		 			</td>
		 			<td width="120px"><s:Locale code="apps.protocol"/></td>
		 			<td width="360px">
		 				<select name="protocol" class="select_protocol">
		 					<option value=""  selected>Select</option>
		 					<option value="<%=PROTOCOLS.FORMBASED%>"><%=PROTOCOLS.FORMBASED%></option>
		 					<option value="<%=PROTOCOLS.OPEN_ID_CONNECT%>"><%=PROTOCOLS.OPEN_ID_CONNECT%></option>
		 					<option value="<%=PROTOCOLS.OAUTH10A%>"><%=PROTOCOLS.OAUTH10A%></option>
		 					<option value="<%=PROTOCOLS.OAUTH20%>"><%=PROTOCOLS.OAUTH20%></option>
		 					<option value="<%=PROTOCOLS.SAML11%>"><%=PROTOCOLS.SAML11%></option>
		 					<option value="<%=PROTOCOLS.SAML20%>"><%=PROTOCOLS.SAML20%></option>
		 					<option value="<%=PROTOCOLS.COOKIEBASED%>"><%=PROTOCOLS.COOKIEBASED%></option>
		 					<option value="<%=PROTOCOLS.TOKENBASED%>"><%=PROTOCOLS.TOKENBASED%></option>
		 					<option value="<%=PROTOCOLS.DESKTOP%>"><%=PROTOCOLS.DESKTOP%></option>
		 					<option value="<%=PROTOCOLS.BASIC%>"><%=PROTOCOLS.BASIC%></option>
		 					
		 				</select>
		 			</td>
	 			</tr>
	 		</table>
	 	</form>
 	</div>
	<div class="mainwrap" id="main">
			<s:Grid id="list" url="/groupApp/gridAppsInGroup" multiselect="true" resize="true">	
				<s:Column width="0" field="id" title="id" hidden="true"/>
				<s:Column width="100" field="id" title="apps.icon" formatter="iconFormatter"/>
				<s:Column width="300" field="name" title="apps.name"/>
				<s:Column width="250" field="protocol" title="apps.protocol"/>
			</s:Grid>
	</div>