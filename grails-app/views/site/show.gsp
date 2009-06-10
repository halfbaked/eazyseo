
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <title>eazyseo - site - ${site.key.id}</title>
    </head>
    <body>
        
        <div class="body">
        	<div id="top" style="margin-bottom:30px">        		
	            <span onclick="toggleDisplay(document.getElementById('rename'));toggleDisplay(this);">${site.name}</span>	            
	            <div id="rename" style="float:left;display:none">
	            <form action="/site/${site.key.id}" method="post" >
	                <input type="hidden" name="id" value="${stem?.id}" />
	                <input type="hidden" name="version" value="${stem?.version}" />
	                <input type="text" id="name" name="name" value="${fieldValue(bean:site,field:'name')}"/>
	                <input class="save" type="submit" value="Save" />
	            </form>
	            </div>
	        </div>
	        <div id="left" style="float:left;margin:5px;">
	        	<ul>
		        	<li>logout</li>
	        	</ul>
	        </div>
	        
	        <div id="center" style="float:left;margin:5px;">
            	<div class="dialog">
	                <table>
	                    <thead>
	                        <tr>
	                   	        <g:sortableColumn property="stems" title="Stem" />
	                        </tr>
	                    </thead>
	                    <tbody>
	                    <g:each in="${site.stems}" status="i" var="stem">
	                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
	                            <td>
	                            	<a href="/site/${site.key.id}/stem/${stem.key.id}">
	                            	${fieldValue(bean:stem, field:'value')}
	                            	</a>
	                            </td>
                            </tr>
	                    </g:each>
	                    </tbody>
	                </table>               
	            </div>  
	            <a  href="/site/${site.key.id}/stems">Add</a>    
	        </div>
        </div>
        
    </body>
</html>
