/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package org.bdigital.ocd.cases;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.xml.rpc.holders.StringHolder;

import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.action.ActionMessage;
import org.apache.struts.action.ActionMessages;
import org.bdigital.ocd.base.BaseAction;
import org.bdigital.ocd.model.Admission;
import org.bdigital.ocd.model.AdmissionData;
import org.bdigital.ocd.model.AdmissionProgram;
import org.bdigital.ocd.model.AdmissionProtocol;
import org.bdigital.ocd.model.Admissions;
import org.bdigital.ocd.model.Case;
import org.bdigital.ocd.utils.UtilsWs;

/**
 *
 * @author jroda
 */
public class CaseJoinAction extends BaseAction {

    /**
     * This is the action called from the Struts framework.
     *
     * @param mapping The ActionMapping used to select this instance.
     * @param form The optional ActionForm bean for this request.
     * @param request The HTTP Request we are processing.
     * @param response The HTTP Response we are processing.
     * @throws java.lang.Exception
     * @return
     */
    @Override
    public ActionForward doExecute(ActionMapping mapping, ActionForm form,
            HttpServletRequest request, HttpServletResponse response)
            throws Exception {
        // extract user data
    	CaseJoinForm formBean = (CaseJoinForm)form;
    	
    	String tokenLK = (String)request.getSession().getAttribute("tokenLK");
    	
    	String caseId=(String)request.getAttribute("parameterIdCase")!=null?(String)request.getAttribute("parameterIdCase"):formBean.getIdCase();
    	
    	StringHolder errorMsg = new StringHolder("");
    	StringHolder result = new StringHolder("");
    	proxy.admission_list_case(tokenLK,caseId, "true", result, errorMsg);
    	if (!"".equals(errorMsg.value)) {

            ActionMessages errors = new ActionMessages();
            errors.add("general",new ActionMessage("errors.detail",errorMsg.value));
            saveErrors(request, errors);
            return mapping.findForward(FAILURE);
        }else{
        	List<Admission> admissions = new ArrayList<Admission>();
        	Admissions admissionListCase = (Admissions)UtilsWs.xmlToObject(result.value,
        			Admissions.class, Admission.class, Case.class, 
        			AdmissionData.class, AdmissionProgram.class, AdmissionProtocol.class);
    		if(admissionListCase.getAdmissions()!=null){
        		for(int i=0;i<admissionListCase.getAdmissions().size();i++){
        			Admission adm = admissionListCase.getAdmissions().get(i);
        			if(adm.getData()!=null && adm.getData().getProgram()!=null && 
        					"5".equals(adm.getData().getProgram().getId()) &&
        					!"DISCHARGED".equals(adm.getData().getStatus()) &&
        					!"REJECTED".equals(adm.getData().getStatus())){
        				admissions.add(adm);
        			}
        		}
        	}
    		if(admissions.isEmpty()){
    			//TODO: enlloc de passar el parametre "5", obtenir la action_list disponible per current_date, i si esta el #ENROL:5 , passar aquest idProgram
    			request.setAttribute("parameterIdCase",caseId);
    			request.setAttribute("parameterIdProgram","#XENROLL:5");
    			return mapping.findForward("admission");
    		}else{
    			request.setAttribute("case_id",caseId);
    			return mapping.findForward(SUCCESS);
    		}
        }
    }
}
