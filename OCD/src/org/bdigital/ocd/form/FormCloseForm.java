/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package org.bdigital.ocd.form;



/**
 *
 * @author jroda
 */
public class FormCloseForm extends org.apache.struts.action.ActionForm {

	private static final long serialVersionUID = 1L;
	private String idForm;
	private String idTask;
	public String getIdForm() {
		return idForm;
	}
	public void setIdForm(String idForm) {
		this.idForm = idForm;
	}
	public String getIdTask() {
		return idTask;
	}
	public void setIdTask(String idTask) {
		this.idTask = idTask;
	}
	
}
