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
public class adminRegistrationAction extends Action {

    @Override
    public ActionForward execute(ActionMapping mapping, ActionForm form,
            HttpServletRequest request, HttpServletResponse response)
            throws Exception {
        HttpSession ses = request.getSession(true);

        form adminRegistration = (form) form;
        String email = adminRegistration.getAdminEmail();
        String password = adminRegistration.getAdminPassword();
        String firstName = adminRegistration.getAdminFirstName();
        String lastName = adminRegistration.getAdminLastName();
        int errorIndicator = 0;

        if (firstName == null || firstName.equals("")
                || lastName == null || lastName.equals("")) {
            adminRegistration.setErrorName();
            errorIndicator = 1;
        }
        if (password == null || password.equals("")) {
            adminRegistration.setErrorPassword(password);
            errorIndicator = 1;
        }
        if (email == null || email.equals("") || email.length() <= 16 || !"@sakilastaff.com".equals(email.substring(email.length() - 16))) {
            adminRegistration.setErrorEmail(email);
            errorIndicator = 1;
        }

        if (errorIndicator == 1) {
            return mapping.findForward("failure");
        } else {
            DAO dao = new DAO();
            dao.adminRegistration(email, password, firstName, lastName);
            return mapping.findForward("success");
        }
    }
}
