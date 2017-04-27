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
public class addToCheckOutAction extends Action {

    @Override
    public ActionForward execute(ActionMapping mapping, ActionForm form,
            HttpServletRequest request, HttpServletResponse response)
            throws Exception {
        HttpSession ses = request.getSession(true);

        form addToCheckOut = (form) form;
        String filmId = addToCheckOut.getFilmId();
        String customerId = addToCheckOut.getCustomerId();

        DAO dao = new DAO();

        if (dao.checkOutValidation(filmId) < 5) {
            if (dao.addToCheckOut(filmId, customerId) != 0) {
                return mapping.findForward("success");
            } else {
                return mapping.findForward("failure");
            }
        } else {
            return mapping.findForward("failure");
        }
    }
}
