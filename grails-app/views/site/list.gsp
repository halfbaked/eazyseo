
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <title>Your Site List</title>
    </head>
    <body>
        <div class="body">
            <h1>Your Sites</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="list">
                <table>
                    
                    <tbody>
                    <g:each in="${siteList}" status="i" var="site">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                            <td><a href="/site/${site.key.id}">${fieldValue(bean:site, field:'name')}</a></td>
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${siteTotal}" />
            </div>
            <g:form action="/sites" method="post" >
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="name">Name:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:site,field:'name','errors')}">
                                    <input type="text" id="name" name="name" value="${fieldValue(bean:site,field:'name')}"/>
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
