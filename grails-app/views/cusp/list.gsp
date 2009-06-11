
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <title>Cusp List</title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${resource(dir:'')}">Home</a></span>
            <span class="menuButton"><g:link class="create" action="create">New Stem</g:link></span>
        </div>
        <div class="body">
            <h1>Cusp List</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="list">
                <table>
                    <thead>
                        <tr>
                           
                   	        <g:sortableColumn property="value" title="Value" />
                        
                        </tr>
                    </thead>
                    <tbody>
                    
                    <g:each in="${cuspList}" status="i" var="cusp">
                    	
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><a href="/site/${cusp.stem.site.key.id}/stem/${cusp.stem.key.id}/cusp/${cusp.key.id}">${fieldValue(bean:cusp, field:'value')}</a></td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${cuspTotal}" />
            </div>
            
            <form action="/site/${stem.site.key.id}/stem/${stem.key.id}/cusps" method="post" >
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="value">Value:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:cusp,field:'value','errors')}">
                                    <input type="text" id="value" name="value" value="${fieldValue(bean:cusp,field:'value')}"/>
                                </td>
                            </tr> 
                        
                        </tbody>
                    </table>
                </div>
                <div class="buttons">
                    <span class="button"><input class="save" type="submit" value="Create" /></span>
                </div>
            <form>
        </div>
    </body>
</html>
