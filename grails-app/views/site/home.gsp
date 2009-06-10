<html>
    <head>
        <title>eazyseo - easy keyword management</title>
		<meta name="layout" content="main" />
    </head>
    <body>
        <h1 style="margin-left:20px;">Welcome to Grails</h1>
        <p style="margin-left:20px;width:80%">Congratulations, you have successfully started your first Grails application! At the moment
        this is the default page, feel free to modify it to either redirect to a controller or display whatever
        content you may choose. Below is a list of controllers that are currently deployed in this application,
        click on each to execute its default action:</p>
        <div class="dialog" style="margin-left:20px;width:60%;">
            <ul>
              <g:each var="c" in="${grailsApplication.controllerClasses}">
                    <li class="controller"><g:link controller="${c.logicalPropertyName}">${c.fullName}</g:link></li>
              </g:each>
            </ul>
        </div>
        
        <div class="leftSideBar" id="stemSideBar">
        	<ul>
        	<g:each var="stem" in="${site.stems}">
        		<li><g:link controller="stem" action="show">${stem.value}</g:link></li>
        	</g:each>
        	</ul>
        	<g:link controller="stem" action="list">Edit stems</g:link>
        </div>
        
        <div class="mainPanel" id="cuspTable">
        	<table>
                    <thead>
                        <tr>                        
                   	        <g:sortableColumn property="value" title="CUSP" />                        
                   	    <%!--
                   	        <g:sortableColumn property="demand" title="Demand" />                        
                   	        <g:sortableColumn property="rawSupply" title="Raw Supply" />                   	        
                   	        <g:sortableColumn property="fineSupply" title="Fine Supply" />                 	        
                   	        <g:sortableColumn property="kei" title="KEI" />
                   	        <g:sortableColumn property="koi" title="KOI" />      
                   	    --%>                  
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${siteInstanceList}" status="i" var="siteInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">                        
                            <td><g:link action="show" id="${siteInstance.id}">${fieldValue(bean:siteInstance, field:'id')}</g:link></td>
                        
                            <td>${fieldValue(bean:siteInstance, field:'name')}</td>
                        
                            <td>${fieldValue(bean:siteInstance, field:'stems')}</td>                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
        </div>
    </body>
</html>