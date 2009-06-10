
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <title>Edit Stem</title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${resource(dir:'')}">Home</a></span>
            <span class="menuButton"><g:link class="list" action="list">Stem List</g:link></span>
            <span class="menuButton"><g:link class="create" action="create">New Stem</g:link></span>
        </div>
        <div class="body">
            <h1>Edit Stem</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${stemInstance}">
            <div class="errors">
                <g:renderErrors bean="${stemInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form method="post" >
                <input type="hidden" name="id" value="${stemInstance?.id}" />
                <input type="hidden" name="version" value="${stemInstance?.version}" />
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="org">Org:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:stemInstance,field:'org','errors')}">
                                    <g:select optionKey="id" from="${Org.list()}" name="org.key.id" value="${stemInstance?.org?.id}" ></g:select>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="value">Value:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:stemInstance,field:'value','errors')}">
                                    <input type="text" id="value" name="value" value="${fieldValue(bean:stemInstance,field:'value')}"/>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="cusps">Cusps:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:stemInstance,field:'cusps','errors')}">
                                    
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
