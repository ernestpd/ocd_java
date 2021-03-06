/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package org.bdigital.ocd.login;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.xml.rpc.holders.StringHolder;

import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.action.ActionMessage;
import org.apache.struts.action.ActionMessages;
import org.bdigital.ocd.base.BaseAction;
import org.bdigital.ocd.utils.Constants;
import org.bdigital.ocd.ws.LINKCAREException;

/**
 *
 * @author jroda
 */
public class LoginAction extends BaseAction {

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
        LoginForm formBean = (LoginForm)form;
        String username = formBean.getUsername();
        String password = formBean.getPassword();
        
        StringHolder errorMsg = new StringHolder("");
    	StringHolder token = new StringHolder("");
    	StringHolder user = new StringHolder(username);
    	StringHolder language = new StringHolder("");
    	StringHolder role = new StringHolder("");
    	StringHolder center = new StringHolder("");
    	StringHolder name = new StringHolder("");
    	String ip=java.net.InetAddress.getLocalHost().getHostAddress();
    	String host=request.getServerName();
    	try{
    		proxy.session_init(user, password, ip, 
    				host, language, token, 
                    "", role, center, name, 
                    errorMsg);
        }catch(LINKCAREException e){
        	
            if (Constants.LINKCARE_ERRORMSG_LOGININVALID.equals(e.getMessage())) {
            	
            	ActionMessages errors = new ActionMessages();
                errors.add("error",
                           new ActionMessage("label.logininvalid"));
                saveErrors(request, errors);
                
                return mapping.findForward(FAILURE);
            }else{
            	throw e;
            }
        }
    	
    	request.getSession().setAttribute("tokenLK", token.value);
    	request.getSession().setAttribute("userFullName", name.value);
    	request.getSession().setAttribute("userCenter", center.value);
    	request.getSession().setAttribute("caseBean",null);
    	request.getSession().setAttribute("admissions",null);
    	request.getSession().setAttribute("admissionsAll",null);
    	request.getSession().setAttribute("admissionBean",null);
    	request.getSession().setAttribute("actions",null);
    	request.getSession().setAttribute("actionsTransfer",null);
    	return mapping.findForward(SUCCESS);
    }
}
