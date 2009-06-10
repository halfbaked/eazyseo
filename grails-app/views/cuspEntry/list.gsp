
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <title>CuspEntry List</title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${resource(dir:'')}">Home</a></span>
            <span class="menuButton"><g:link class="create" action="create">New CuspEntry</g:link></span>
        </div>
        <div class="body">
            <h1>CuspEntry List</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${cuspEntry}">
            <div class="errors">
                <g:renderErrors bean="${cuspEntry}" as="list" />
            </div>
            </g:hasErrors>
            <form action="/site/${cusp.stem.site.key.id}/stem/${cusp.stem.key.id}/cusp/${cusp.key.id}/cuspEntrys" method="post" >
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="demand">Demand:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:cuspEntry,field:'demand','errors')}">
                                    <input type="text" id="demand" name="demand" value="${fieldValue(bean:cuspEntry,field:'demand')}" />
                                </td>
                            </tr> 
                        
                        	<tr class="prop">
                                <td valign="top" class="name">
                                    <label for="rawSupply">Raw Supply:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:cuspEntry,field:'rawSupply','errors')}">
                                    <input type="text" id="rawSupply" name="rawSupply" value="${fieldValue(bean:cuspEntry,field:'rawSupply')}" />
                                </td>
                            </tr> 
                            
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="fineSupply">Fine Supply:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:cuspEntry,field:'fineSupply','errors')}">
                                    <input type="text" id="fineSupply" name="fineSupply" value="${fieldValue(bean:cuspEntry,field:'fineSupply')}" />
                                </td>
                            </tr> 
                        
                        </tbody>
                    </table>
                </div>
                <div class="buttons">
                    <span class="button"><input class="save" type="submit" value="Create" /></span>
                </div>
            </form>
            
            <div class="list">
                <table>
                    <thead>
                        <tr>
                        
                   	        <g:sortableColumn property="date" title="Date" />
                   	        <g:sortableColumn property="demand" title="Demand" />
                        	<g:sortableColumn property="rawSupply" title="Raw Supply" />
                   	        <g:sortableColumn property="fineSupply" title="Fine Supply" />
                   	        <g:sortableColumn property="kei" title="Kei" />
                   	        <g:sortableColumn property="koi" title="Koi" />
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${cuspEntryList}" status="i" var="cuspEntry">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><a href="/site/${cuspEntry.cusp.stem.site.key.id}/stem/${cuspEntry.cusp.stem.key.id}/cusp/${cuspEntry.cusp.key.id}/cuspEntry/${cuspEntry.key.id}">${fieldValue(bean:cuspEntry, field:'date')}</a></td>
                        
                            <td>${fieldValue(bean:cuspEntry, field:'demand')}</td>
                        	<td>${fieldValue(bean:cuspEntry, field:'rawSupply')}</td>
                            <td>${fieldValue(bean:cuspEntry, field:'fineSupply')}</td>
                            <td>${fieldValue(bean:cuspEntry, field:'kei')}</td>
                            <td>${fieldValue(bean:cuspEntry, field:'koi')}</td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${cuspEntryTotal}" />
            </div>
            
            
        </div>
    </body>
</html>
