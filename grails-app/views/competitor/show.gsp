
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <title>Show Competitor</title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${resource(dir:'')}">Home</a></span>
            <span class="menuButton"><g:link class="list" action="list">Competitor List</g:link></span>
            <span class="menuButton"><g:link class="create" action="create">New Competitor</g:link></span>
        </div>
        <div class="body">
            <h1>Show Competitor</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="dialog">
                <table>
                    <tbody>

                    
                        <tr class="prop">
                            <td valign="top" class="name">Id:</td>
                            
                            <td valign="top" class="value">${fieldValue(bean:competitorInstance, field:'id')}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">Web URL:</td>
                            
                            <td valign="top" class="value">${fieldValue(bean:competitorInstance, field:'webUrl')}</td>
                            
                        </tr>

                        <tr class="prop">
                            <td valign="top" class="name">Description:</td>
                            
                            <td valign="top" class="value">${fieldValue(bean:competitorInstance, field:'description')}</td>
                            
                        </tr>

                        <tr class="prop">
                            <td valign="top" class="name">Keywords:</td>
                            
                            <td valign="top" class="value">${fieldValue(bean:competitorInstance, field:'keywords')}</td>
                            
                        </tr>

                        <tr class="prop">
                            <td valign="top" class="name">Competitive Directness:</td>
                            
                            <td valign="top" class="value">${fieldValue(bean:competitorInstance, field:'competitiveDirectness')}</td>
                            
                        </tr>

                        <tr class="prop">
                            <td valign="top" class="name">Page Rank:</td>
                            
                            <td valign="top" class="value">${fieldValue(bean:competitorInstance, field:'pageRank')}</td>                            
                        </tr>
                    
                    </tbody>
                </table>
            </div>
            <div class="buttons">
                <g:form>
                    <input type="hidden" name="id" value="${competitorInstance?.id}" />
                    <span class="button"><g:actionSubmit class="edit" value="Edit" /></span>
                    <span class="button"><g:actionSubmit class="delete" onclick="return confirm('Are you sure?');" value="Delete" /></span>
                </g:form>
            </div>
        </div>
    </body>
</html>
