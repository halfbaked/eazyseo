
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <title>Competitor List</title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${resource(dir:'')}">Home</a></span>
            <span class="menuButton"><g:link class="create" action="create">New Competitor</g:link></span>
        </div>
        <div class="body">
            <h1>Competitor List</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="list">
                <table>
                    <thead>
                        <tr>
                        
                   	        <g:sortableColumn property="id" title="Id" />                       
                   	        <g:sortableColumn property="webUrl" title="Web URL" />
                   	        <g:sortableColumn property="competitiveDirectness" title="pageRank" />
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${competitorInstanceList}" status="i" var="competitorInstance">

                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${competitorInstance.id}">${fieldValue(bean:competitorInstance, field:'id')}</g:link></td>                        
                            <td>${fieldValue(bean:competitorInstance, field:'webUrl')}</td>
                            <td>${fieldValue(bean:competitorInstance, field:'competitiveDirectness')}</td>
                            <td>${fieldValue(bean:competitorInstance, field:'pageRank')}</td>
                        
                        </tr>

                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${competitorInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
