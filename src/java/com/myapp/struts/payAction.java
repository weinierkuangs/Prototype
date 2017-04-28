/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.myapp.struts;

import java.util.Calendar;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

/**
 *
 * @author rjena
 */
public class payAction extends org.apache.struts.action.Action {

    /* forward name="success" path="" */
    private static final String SUCCESS = "success";
    private final static String FAILURE = "failure";

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
    public ActionForward execute(ActionMapping mapping, ActionForm form,
            HttpServletRequest request, HttpServletResponse response)
            throws Exception {

        // extract user data
        form payForm = (form) form;
        String name = payForm.getName();
        String year = payForm.getYear();
        String month = payForm.getMonth();
        String number = payForm.getNumber();
        int errorIndicator = 0;

        // perform validation
        if (name == null || name.equals("")) {
            payForm.setErrorName();
            errorIndicator = 1;
        }
        if (month == null || month.equals("")) {
            payForm.setErrorMonth();
            errorIndicator = 1;
        }
        try {
            int y = Integer.parseInt(year);
            try {
                int m = Integer.parseInt(month);
                if ((y < Calendar.getInstance().get(Calendar.YEAR))
                        || ((y == Calendar.getInstance().get(Calendar.YEAR)) && (m <= Calendar.getInstance().get(Calendar.MONTH)))
                        || m <= 0 || y <= 0 || y >= 9999) {
                    payForm.setErrorMonth();
                    payForm.setErrorYear();
                    errorIndicator = 1;
                }

            } catch (NumberFormatException e) {
                payForm.setErrorYear();
                payForm.setErrorMonth();
                errorIndicator = 1;
            }
        } catch (NumberFormatException e) {
            payForm.setErrorYear();
            errorIndicator = 1;
        }

        if (String.valueOf(number).length() < 15) {
            payForm.setErrorNumber();
            errorIndicator = 1;
        }
        if (number.matches("[-+]?\\d*\\.?\\d+") == false) {
            payForm.setErrorNumber();
            errorIndicator = 1;
        }

        if (errorIndicator == 1) {
            return mapping.findForward(FAILURE);
        } else {
            return mapping.findForward(SUCCESS);
        }
    }
}
