
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <title>Show CuspEntry</title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${resource(dir:'')}">Home</a></span>
            <span class="menuButton"><g:link class="list" action="list">CuspEntry List</g:link></span>
            <span class="menuButton"><g:link class="create" action="create">New CuspEntry</g:link></span>
        </div>
        <div class="body">
            <h1>Show CuspEntry</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="dialog">
                <table>
                    <tbody>

                    
                        <tr class="prop">
                            <td valign="top" class="name">Id:</td>
                            
                            <td valign="top" class="value">${fieldValue(bean:cuspEntry, field:'id')}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">Cusp:</td>
                            
                            <td valign="top" class="value"><g:link controller="cusp" action="show" id="${cuspEntry?.cusp?.id}">${cuspEntry?.cusp?.encodeAsHTML()}</g:link></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">Date:</td>
                            
                            <td valign="top" class="value">${fieldValue(bean:cuspEntry, field:'date')}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">Demand:</td>
                            
                            <td valign="top" class="value">${fieldValue(bean:cuspEntry, field:'demand')}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">Fine Supply:</td>
                            
                            <td valign="top" class="value">${fieldValue(bean:cuspEntry, field:'fineSupply')}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">Kei:</td>
                            
                            <td valign="top" class="value">${fieldValue(bean:cuspEntry, field:'kei')}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">Koi:</td>
                            
                            <td valign="top" class="value">${fieldValue(bean:cuspEntry, field:'koi')}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">Raw Supply:</td>
                            
                            <td valign="top" class="value">${fieldValue(bean:cuspEntry, field:'rawSupply')}</td>
                            
                        </tr>
                    
                    </tbody>
                </table>
            </div>
            <div class="buttons">
                <form action="/site/${cuspEntry.cusp.stem.site.key.id}/stem/${cuspEntry.cusp.stem.key.id}/cusp/${cuspEntry.cusp.key.id}/cuspEntry/${cuspEntry.key.id}" method="post">
                    <input type="hidden" name="id" value="${cuspEntry?.id}" />                    
                    <span class="button"><g:actionSubmit class="delete" onclick="return confirm('Are you sure?');" value="Delete" /></span>
                </form>
            </div>
        </div>
    </body>
</html>
