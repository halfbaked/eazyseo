
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <title>eazyseo - stem - ${stem.value}</title>
    </head>
    <body>
    	
    	
        <div class="body">
        	<div id="top" style="margin-bottom:30px">        		
	            <span onclick="toggleDisplay(document.getElementById('rename'));toggleDisplay(this);">${stem.value}</span>	            
	            <div id="rename" style="float:left;display:none">
	            <form action="/site/${stem.site.key.id}/stem/${stem.key.id}" method="post" >
	                <input type="hidden" name="id" value="${stem?.id}" />
	                <input type="hidden" name="version" value="${stem?.version}" />
	                <input type="text" id="value" name="value" value="${fieldValue(bean:stem,field:'value')}"/>
	                <input class="save" type="submit" value="Save" />
	                 <!--<span class="button"><g:actionSubmit class="delete" onclick="return confirm('Are you sure?');" value="Delete" /></span>
	                    -->
	            </form>
	            </div>
	        </div>
	        <div id="left" style="float:left;margin:5px;">
	        	<ul>
		        	<g:each var="s" in="${stem.site.stems}">
		        		<li><a href="/site/${stem.site.key.id}/stem/${s.key.id}">${s.value}</a></li>
		        	</g:each>
	        	</ul>
	        </div>
	        <div id="center" style="float:left;margin:5px;">
	            <div class="dialog">
	                
	                <table>
	                    <thead>
	                        <tr>
	                        
	                   	        <g:sortableColumn property="cusps" title="Cusp" />
	                        	<g:sortableColumn property="demand" title="Demand" />
	                        	<g:sortableColumn property="rawSupply" title="Raw Supply" />
	                        	<g:sortableColumn property="fineSupply" title="Fine Supply" />
	                        	<g:sortableColumn property="kei" title="KEI" />
	                        	<g:sortableColumn property="koi" title="KOI" />
	                        </tr>
	                    </thead>
	                    <tbody>
	                    <g:each in="${stem.cusps}" status="i" var="cusp">
	                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
	                        	                        		 
	                            <td>
	                            	<a href="/site/${stem.site.key.id}/stem/${stem.key.id}/cusp/${cusp.key.id}">
	                            	${fieldValue(bean:cusp, field:'value')}
	                            	</a>
	                            </td>
	                            
	                        	<td>
	                        		${fieldValue(bean:cusp, field:'averageDemand')}
	                        	</td>
	                        	<td>
	                        		${fieldValue(bean:cusp, field:'averageRawSupply')}
	                        	</td>
	                        	<td>
	                        		${fieldValue(bean:cusp, field:'averageFineSupply')}
	                        	</td>
	                        	<td>
	                        		${fieldValue(bean:cusp, field:'averageKei')}
	                        	</td>
	                        	<td>
	                        		${fieldValue(bean:cusp, field:'averageKoi')}
	                        	</td>                            
	                        </tr>
	                    </g:each>
	                    </tbody>
	                </table>               
	            </div>  
	            <a  href="/site/${stem.site.key.id}/stem/${stem.key.id}/cusps">Add</a>    
	        </div>
	        
	                 
        </div>
    </body>
</html>
