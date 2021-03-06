<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html" %>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic" %>
    <script>
	    function doSubmit() {
		  //$('#sex').val($('#sexSelect').text());
	      $( "#newForm" ).submit();
	      return false;
	    }
    </script>
    <!-- Menú principal (final)-->
    <div class="gris1">
      <div class="container">
        <!-- Encabezado-->
        <div class="encabezado">
          <h1><bean:message key="menu.users"/> <strong>— <bean:message key="label.patients"/></strong></h1>
        </div>
        <hr>
        <!-- Encabezado fin-->
      </div>
    </div>
    <div class="menuizqlayout gris1 recentlayout">
      <div class="container">
        <div class="bloqueizq">
          <div class="recentbox">
            <h4><bean:message key="label.recent"/>...</h4>
          </div>
        </div>
        <div class="content">
	      <html:form styleId="newForm" action="/caseNewAction">
          <div class="contentconbotoneslaterales">
            <h2 class="clinician"><bean:message key="label.caseNew"/></h2>
			<html:messages id="msg2" property="general">
			    <div>
	            <span style='color:red'><bean:write name="msg2" /></span>
		        </div>
	        </html:messages>
	        <logic:messagesNotPresent property="general">
		        <html:messages id="msg3">
			    <div>
		            <span style='color:red'><bean:write name="msg3" /></span>
		        </div>
		        </html:messages>
		    </logic:messagesNotPresent>
            <div class="dataform">
              <h3><bean:message key="label.personalData"/></h3>
              <div class="fields-row">
                <div class="smallfield">
                  <label for="cip"><bean:message key="label.cip"/></label>
                  <html:text styleId="cip" property="cip" />
                </div>
                <div class="smallfield">
                  <label for="nif"><bean:message key="label.nif"/></label>
                  <html:text styleId="nif" property="nif" />
                </div>
              </div>
              <div class="fields-row">
                <div class="smallfield">
                  <label for="nie"><bean:message key="label.nie"/></label>
                  <html:text styleId="nie" property="nie" />
                </div>
                <div class="smallfield">
                  <label for="pas"><bean:message key="label.pas"/></label>
                  <html:text styleId="pas" property="pas" />
                </div>
              </div>
              <div class="fields-row">
                <div class="smallfield">
                  <label for="givenName"><bean:message key="label.name"/></label>
                  <html:text styleId="givenName" property="givenName" />
                </div>
                <div class="smallfield">
                  <label for="middleName"><bean:message key="label.middleName"/></label>
                  <html:text styleId="middleName" property="middleName" />
                </div>
              </div>
              <div class="fields-row">
                <div class="smallfield">
                  <label for="familyName"><bean:message key="label.familyName"/></label>
                  <html:text styleId="familyName" property="familyName" />
                </div>
                <div class="smallfield">
                  <label for="familyName2"><bean:message key="label.familyName2"/></label>
                  <html:text styleId="familyName2" property="familyName2" />
                </div>
              </div>
              <div class="fields-row">
                <div class="smallfield">
                  <label for="birthday"><bean:message key="label.birthday"/></label>
                  <html:text styleId="birthday" property="birthday" styleClass="form-control date" />
                </div>
                <div class="smallfield">
                  <label for="sex"><bean:message key="label.sex"/></label>
                  <div class="btn-group">
                    <html:hidden property="sex" styleId="sex" />
                    <button data-toggle="dropdown" data-targetinput="sex" class="btn btn-large dropdown-toggle"><bean:message key="label.defaultOption"/><span class="caret triangulo"></span></button>
                    <ul class="dropdown-menu">
                      <li><a data-value="<%=org.bdigital.ocd.utils.Constants.LINKCARE_CASEGENDER_FEMININE%>" href="#" ><bean:message key="label.sex.dona"/></a></li>
                      <li><a data-value="<%=org.bdigital.ocd.utils.Constants.LINKCARE_CASEGENDER_MASCULINE%>" href="#"><bean:message key="label.sex.home"/></a></li>
                    </ul>
                  </div>
                </div>
              </div>
              <h3><bean:message key="label.contactData"/></h3>
              <div class="fields-row">
                <div class="smallfield">
                  <label for="streetName"><bean:message key="label.street"/></label>
                  <html:text styleId="streetName" property="streetName" />
                </div>
                <div class="smallfield">
                  <label for="number"><bean:message key="label.number"/></label>
                  <html:text styleId="number" property="number" />
                </div>
              </div>
              <div class="fields-row">
                <div class="smallfield">
                  <label for="floor"><bean:message key="label.floor"/></label>
                  <html:text styleId="floor" property="floor" />
                </div>
                <div class="smallfield">
                  <label for="suite"><bean:message key="label.suite"/></label>
                  <html:text styleId="suite" property="suite" />
                </div>
              </div>
              <div class="fields-row">
                <div class="smallfield">
                  <label for="postcode"><bean:message key="label.postcode"/></label>
                  <html:text styleId="postcode" property="postcode" />
                </div>
                <div class="smallfield">
                  <label for="city"><bean:message key="label.city"/></label>
                  <html:text styleId="city" property="city" />
                </div>
              </div>
              <div class="fields-row">
                <div class="smallfield">
                  <label for="country"><bean:message key="label.country"/></label>
                  <html:text styleId="country" property="country" />
                </div>
                <div class="smallfield">
                  <label for="phoneNumber"><bean:message key="label.phoneNumber"/></label>
                  <html:text styleId="phoneNumber" property="phoneNumber" />
                </div>
              </div>
            </div>
          </div>
          <div class="botoneslaterales">
            <div class="botoneslateralescontainer">
              <div>
              <html:link href="#" styleClass="btn-primary btn savedataform" onclick="return doSubmit();"><bean:message key="label.save"/></html:link>
              <html:link action="/caseSearchPg.do" styleClass="btn-warning btn canceldataform"><bean:message key="label.cancel.abrev"/></html:link>
              </div>
            </div>
          </div>
          </html:form>
        </div>
      </div>
      <!-- Contenido fin-->
    </div>
    <logic:present name="errorCaseNew">
	    <script type="text/javascript">
	    $(document).ready(function() {
	    	$('#loadsessionModal').modal('show');
	    });
	    function doFinish(){
	    	window.location='<html:rewrite action="/formCloseAction?idCase=${CaseTaskDetailsForm.idCase}&idAdmission=${admissionBean.idAdmission}&idForm=${formItem.ref}&idTask=${taskItem.id}&accept=true"/>';
	    }
	    function doFinishAndNewTask(){
	    	window.location='<html:rewrite action="/formCloseAction?idCase=${CaseTaskDetailsForm.idCase}&idAdmission=${admissionBean.idAdmission}&idForm=${formItem.ref}&idTask=${taskItem.id}&accept=true&createTask=true"/>';
	    }
	    </script>
    <!-- Lightbox-->
    <bean:define id="caseItem" name="foundCaseBean" type="org.bdigital.ocd.model.form.CaseAf"/>
    <bean:define id="dataItem" name="caseItem" property="data" type="org.bdigital.ocd.model.form.DataAf"/>
    <div id="loadsessionModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" class="modal loadsession hide fade">
      <div class="modal-header">
        <button type="button" data-dismiss="modal" aria-hidden="true" class="close"><bean:message key="label.window.close"/></button>
        <h3><bean:message key="errors.caseNewExists"/></h3>
      </div>
      <div class="modal-body table">
        <table>
          <tr>
            <th><bean:message key="label.name"/></th>
            <th><bean:message key="label.personalData"/></th>
            <th></th>
          </tr>
          <tr>
            <td><bean:write name="dataItem" property="fullname"/></td>
            <td>
              <span><strong><bean:message key="label.age"/>:</strong> <bean:write name="dataItem" property="age"/></span><br/>
              <span><strong><bean:message key="label.sex"/>:</strong> <bean:write name="dataItem" property="gender"/></span><br/>
              <span><strong><bean:write name="caseItem" property="cip"/>:</strong> <bean:write name="caseItem" property="cip"/></span><br/>
              <span><strong><bean:write name="caseItem" property="nif"/>:</strong> <bean:write name="caseItem" property="nif"/></span>
            </td>
            <td>
            <html:link action="/caseTaskDetailsAction?idCase=${caseItem.ref}&idAdmission=${admissionBean.idAdmission}" styleClass="btn btn-primary custom-btn"><bean:message key="label.load"/></html:link>
            </td>
          </tr>
        </table>
      </div>
    </div>
    </logic:present>