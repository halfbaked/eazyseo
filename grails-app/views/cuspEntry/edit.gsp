
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <title>Edit CuspEntry</title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${resource(dir:'')}">Home</a></span>
            <span class="menuButton"><g:link class="list" action="list">CuspEntry List</g:link></span>
            <span class="menuButton"><g:link class="create" action="create">New CuspEntry</g:link></span>
        </div>
        <div class="body">
            <h1>Edit CuspEntry</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${cuspEntryInstance}">
            <div class="errors">
                <g:renderErrors bean="${cuspEntryInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form method="post" >
                <input type="hidden" name="id" value="${cuspEntryInstance?.id}" />
                <input type="hidden" name="version" value="${cuspEntryInstance?.version}" />
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="cusp">Cusp:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:cuspEntryInstance,field:'cusp','errors')}">
                                    <g:select optionKey="id" from="${Cusp.list()}" name="cusp.id" value="${cuspEntryInstance?.cusp?.id}" ></g:select>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="date">Date:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:cuspEntryInstance,field:'date','errors')}">
                                    <g:datePicker name="date" value="${cuspEntryInstance?.date}" precision="minute" ></g:datePicker>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="demand">Demand:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:cuspEntryInstance,field:'demand','errors')}">
                                    <input type="text" id="demand" name="demand" value="${fieldValue(bean:cuspEntryInstance,field:'demand')}" />
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="fineSupply">Fine Supply:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:cuspEntryInstance,field:'fineSupply','errors')}">
                                    <input type="text" id="fineSupply" name="fineSupply" value="${fieldValue(bean:cuspEntryInstance,field:'fineSupply')}" />
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="kei">Kei:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:cuspEntryInstance,field:'kei','errors')}">
                                    <input type="text" id="kei" name="kei" value="${fieldValue(bean:cuspEntryInstance,field:'kei')}" />
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="koi">Koi:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:cuspEntryInstance,field:'koi','errors')}">
                                    <input type="text" id="koi" name="koi" value="${fieldValue(bean:cuspEntryInstance,field:'koi')}" />
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="rawSupply">Raw Supply:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:cuspEntryInstance,field:'rawSupply','errors')}">
                                    <input type="text" id="rawSupply" name="rawSupply" value="${fieldValue(bean:cuspEntryInstance,field:'rawSupply')}" />
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
