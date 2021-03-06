/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.myapp.struts;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

/**
 *
 * @author jyu43
 */
public class customerRegistrationAction extends Action {

    @Override
    public ActionForward execute(ActionMapping mapping, ActionForm form,
            HttpServletRequest request, HttpServletResponse response)
            throws Exception {
        HttpSession ses = request.getSession(true);

        form customerRegistration = (form) form;
        String email = customerRegistration.getCustomerEmail();
        String password = customerRegistration.getCustomerPassword();
        String firstName = customerRegistration.getCustomerFirstName();
        String lastName = customerRegistration.getCustomerLastName();

        DAO dao = new DAO();
        dao.customerRegistration(email, password, firstName, lastName);
        
        return mapping.findForward("success");
    }
}
