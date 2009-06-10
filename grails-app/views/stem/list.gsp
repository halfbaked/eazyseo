
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <title>Stem List</title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${resource(dir:'')}">Home</a></span>
            <span class="menuButton"><g:link class="create" action="create">New Stem</g:link></span>
        </div>
        <div class="body">
            <h1>Stem List</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="list">
                <table>
                    <thead>
                        <tr>
                           
                   	        <g:sortableColumn property="value" title="Value" />
                        
                   	        <g:sortableColumn property="cusps" title="Cusps" />
                        
                        </tr>
                    </thead>
                    <tbody>
                    
                    <g:each in="${stemList}" status="i" var="stem">
                    	
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><a href="/site/${stem.site.key.id}/stem/${stem.key.id}">${fieldValue(bean:stem, field:'value')}</a></td>
                        
                            <td>${fieldValue(bean:stem, field:'cusps')}</td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${stemTotal}" />
            </div>
            
            <form action="/site/${site.key.id}/stems" method="post" >
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="value">Value:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:stem,field:'value','errors')}">
                                    <input type="text" id="value" name="value" value="${fieldValue(bean:stem,field:'value')}"/>
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
