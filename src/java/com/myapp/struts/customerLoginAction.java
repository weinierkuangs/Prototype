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
public class customerLoginAction extends Action {

    @Override
    public ActionForward execute(ActionMapping mapping, ActionForm form,
            HttpServletRequest request, HttpServletResponse response)
            throws Exception {
        HttpSession ses = request.getSession(true);

        form customerLoginForm = (form) form;
        String email = customerLoginForm.getCustomerEmail();
        String password = customerLoginForm.getCustomerPassword();

        DAO dao = new DAO();

        if (dao.customerLoginValidation(email, password) != 0) {
            ses.setAttribute("customerId", dao.customerLoginValidation(email, password));
            return mapping.findForward("success");
        } else {
            return mapping.findForward("failure");
        }

    }
}
