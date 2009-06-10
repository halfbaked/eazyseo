
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <title>Edit Org</title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${resource(dir:'')}">Home</a></span>
            <span class="menuButton"><g:link class="list" action="list">Org List</g:link></span>
            <span class="menuButton"><g:link class="create" action="create">New Org</g:link></span>
        </div>
        <div class="body">
            <h1>Edit Org</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${orgInstance}">
            <div class="errors">
                <g:renderErrors bean="${orgInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form method="put" action="/org/${orgInstance.id}">
                <input type="hidden" name="id" value="${orgInstance?.id}" />
                <input type="hidden" name="version" value="${orgInstance?.version}" />
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="name">Name:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:orgInstance,field:'name','errors')}">
                                    <input type="text" id="name" name="name" value="${fieldValue(bean:orgInstance,field:'name')}"/>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="stems">Stems:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:orgInstance,field:'stems','errors')}">
                                    
                                </td>
                            </tr> 
                        
                        </tbody>
                    </table>
                </div>
                <div class="buttons">
                	
                    <span class="button"><input class="save" type="submit" value="Save" /></span>                	                    
                    <span class="button"><g:actionSubmit class="delete" onclick="return confirm('Are you sure?');" value="Delete" /></span>
                </div>
            </g:form>
        </div>
    </body>
</html>
