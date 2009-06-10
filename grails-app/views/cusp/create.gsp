
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <title>Create Cusp</title>         
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${resource(dir:'')}">Home</a></span>
            <span class="menuButton"><g:link class="list" action="list">Cusp List</g:link></span>
        </div>
        <div class="body">
            <h1>Create Cusp</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${cuspInstance}">
            <div class="errors">
                <g:renderErrors bean="${cuspInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form action="save" method="post" >
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="stem">Stem:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:cuspInstance,field:'stem','errors')}">
                                    <g:select optionValue="value" optionKey="key.id" from="${stems}" name="stem.key.id" value="${cuspInstance?.stem?.id}" ></g:select>
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
                        
                        </tbody>
                    </table>
                </div>
                <div class="buttons">
                    <span class="button"><input class="save" type="submit" value="Create" /></span>
                </div>
            </g:form>
        </div>
    </body>
</html>
