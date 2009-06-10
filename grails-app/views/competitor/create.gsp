
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <title>Create Competitor</title>         
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${resource(dir:'')}">Home</a></span>
            <span class="menuButton"><g:link class="list" action="list">Competitor List</g:link></span>
        </div>
        <div class="body">
            <h1>Create Competitor</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${competitorInstance}">
            <div class="errors">
                <g:renderErrors bean="${competitorInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form action="save" method="post" >
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="webUrl">Web URL:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:competitorInstance,field:'webUrl','errors')}">
                                    <input type="text" id="webUrl" name="webUrl" value="${fieldValue(bean:competitorInstance,field:'webUrl')}"/>
                                </td>
                            </tr> 

                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="description">Description:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:competitorInstance,field:'description','errors')}">
                                    <input type="text" id="description" name="description" value="${fieldValue(bean:competitorInstance,field:'description')}"/>
                                </td>
                            </tr> 

                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="keywords">Keywords:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:competitorInstance,field:'keywords','errors')}">
                                    <input type="text" id="keywords" name="keywords" value="${fieldValue(bean:competitorInstance,field:'keywords')}"/>
                                </td>
                            </tr> 

                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="property1">Competitive Directness:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:competitorInstance,field:'competitiveDirectness','errors')}">
                                    <input type="text" id="competitiveDirectness" name="competitiveDirectness" value="${fieldValue(bean:competitorInstance,field:'competitiveDirectness')}"/>
                                </td>
                            </tr> 

                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="property1">Page Rank:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:competitorInstance,field:'pageRank','errors')}">
                                    <input type="text" id="pageRank" name="pageRank" value="${fieldValue(bean:competitorInstance,field:'pageRank')}"/>
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
