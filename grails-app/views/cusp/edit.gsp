
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <title>Edit Cusp</title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${resource(dir:'')}">Home</a></span>
            <span class="menuButton"><g:link class="list" action="list">Cusp List</g:link></span>
            <span class="menuButton"><g:link class="create" action="create">New Cusp</g:link></span>
        </div>
        <div class="body">
            <h1>Edit Cusp</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${cuspInstance}">
            <div class="errors">
                <g:renderErrors bean="${cuspInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form method="post" >
                <input type="hidden" name="id" value="${cuspInstance?.id}" />
                <input type="hidden" name="version" value="${cuspInstance?.version}" />
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="stem">Stem:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:cuspInstance,field:'stem','errors')}">
                                    <g:select optionKey="id" from="${Stem.list()}" name="stem.id" value="${cuspInstance?.stem?.id}" ></g:select>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="value">Value:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:cuspInstance,field:'value','errors')}">
                                    <input type="text" id="value" name="value" value="${fieldValue(bean:cuspInstance,field:'value')}"/>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="entries">Entries:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:cuspInstance,field:'entries','errors')}">
                                    
                                </td>
                            </tr> 
                        
                        </tbody>
                    </table>
                </div>
                <div class="buttons">
                    <span class="button"><g:actionSubmit class="save" value="Update" /></span>
                    <span class="button"><g:actionSubmit class="delete" onclick="return confirm('Are you sure?');" value="Delete" /></span>
                </div>
            </g:form>
        </div>
    </body>
</html>
