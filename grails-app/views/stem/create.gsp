<%@ page import="com.eazyseo.Org" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <title>Create Stem</title>         
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${resource(dir:'')}">Home</a></span>
            <span class="menuButton"><g:link class="list" action="list">Stem List</g:link></span>
        </div>
        <div class="body">
            <h1>Create Stem</h1>          
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${stemInstance}">
            <div class="errors">
                <g:renderErrors bean="${stemInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form action="/orgs/$org.id/" method="post" >
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="org">Org:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:stemInstance,field:'org','errors')}">
                                    <g:select optionValue="name" optionKey="id" from="${orgs}" name="org.id" value="${stemInstance?.org?.id}" ></g:select>
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
