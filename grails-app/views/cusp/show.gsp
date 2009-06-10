
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <title>Show Cusp</title>
    </head>
    <body>
       
        <div class="body">
        
        	<div id="top" style="margin-bottom:30px;font-size:14;">        		
	            <span onclick="toggleDisplay(document.getElementById('rename'));toggleDisplay(this);">${cusp.value}</span>	            
	            <div id="rename" style="float:left;display:none">
		            <form action="/site/${cusp.stem.site.key.id}/stem/${cusp.stem.key.id}/cusp/${cusp.key.id}" method="post" >
		                <input type="hidden" name="id" value="${cusp?.id}" />
		                <input type="hidden" name="version" value="${cusp?.version}" />
		                <input type="text" id="value" name="value" value="${fieldValue(bean:cusp,field:'value')}"/>
		                <span class="button"><input class="save" type="submit" value="Save" /></span>
	           		</form>
	            </div>
	        </div>
        
            <div id="left" style="float:left;margin:5px;">
	        	<ul style="list-style: none;">
		        	<g:each var="c" in="${cusp.stem.cusps}">
		        		<g:if test="${c.key.id == cusp.key.id}">		        					        	
		        			<li style="background-color: blue;font-color:white"><a href="/site/${cusp.stem.site.key.id}/stem/${cusp.stem.key.id}/cusp/${c.key.id}">${c.value}</a></li>
		        		</g:if>
		        		<g:else>
		        			<li><a href="/site/${cusp.stem.site.key.id}/stem/${cusp.stem.key.id}/cusp/${c.key.id}">${c.value}</a></li>
		        		</g:else>
		        	</g:each>
	        	</ul>
	        </div>
	        
	        <div id="center" style="float:left;margin:5px;">
	            <div class="dialog">
	                
            	<table>
	                    <thead>
	                        <tr>
	                        
	                   	        <g:sortableColumn property="cusps" title="Cusp Entry" />
	                        	<g:sortableColumn property="demand" title="Demand" />
	                        	<g:sortableColumn property="rawSupply" title="Raw Supply" />
	                        	<g:sortableColumn property="fineSupply" title="Fine Supply" />
	                        	<g:sortableColumn property="kei" title="KEI" />
	                        	<g:sortableColumn property="koi" title="KOI" />
	                        </tr>
	                    </thead>
	                    <tbody>
                
 						<g:each in="${cusp.cuspEntrys}" status="i" var="cuspEntry">
	                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
	                        	                        		 
	                            <td>
	                            	<a href="/site/${cusp.stem.site.key.id}/stem/${cusp.stem.key.id}/cusp/${cusp.key.id}/cuspEntry/${cuspEntry.key.id}">
	                            	${fieldValue(bean:cuspEntry, field:'date')}
	                            	</a>
	                            </td>
	                            
	                        	<td>
	                        		${fieldValue(bean:cuspEntry, field:'demand')}
	                        	</td>
	                        	<td>
	                        		${fieldValue(bean:cuspEntry, field:'rawSupply')}
	                        	</td>
	                        	<td>
	                        		${fieldValue(bean:cuspEntry, field:'fineSupply')}
	                        	</td>
	                        	<td>
	                        		${fieldValue(bean:cuspEntry, field:'kei')}
	                        	</td>
	                        	<td>
	                        		${fieldValue(bean:cuspEntry, field:'koi')}	                        			                        	
	                        	</td>                            
	                        </tr>
	                    </g:each>
	                    </tbody>                    
                    </tbody>
                </table>
            </div>
            <a  href="/site/${cusp.stem.site.key.id}/stem/${cusp.stem.key.id}/cusp/${cusp.key.id}/cuspEntrys">Add</a>
           </div>  
        </div>
    </body>
</html>
