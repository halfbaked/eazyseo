
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <title>Edit Competitor</title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${resource(dir:'')}">Home</a></span>
            <span class="menuButton"><g:link class="list" action="list">Competitor List</g:link></span>
            <span class="menuButton"><g:link class="create" action="create">New Competitor</g:link></span>
        </div>
        <div class="body">
            <h1>Edit Competitor</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${competitorInstance}">
            <div class="errors">
                <g:renderErrors bean="${competitorInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form method="post" >
                <input type="hidden" name="id" value="${competitorInstance?.id}" />
                <input type="hidden" name="version" value="${competitorInstance?.version}" />
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="property1">Property1:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:competitorInstance,field:'property1','errors')}">
                                    <input type="text" id="property1" name="property1" value="${fieldValue(bean:competitorInstance,field:'property1')}"/>
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
