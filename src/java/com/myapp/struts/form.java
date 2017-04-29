/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.myapp.struts;

import org.apache.struts.action.ActionForm;

/**
 *
 * @author jyu43
 */
public class form extends ActionForm{
    String customerEmail;
    String customerPassword;
    String customerFirstName;
    String customerLastName;
    String adminEmail;
    String adminPassword;
    String adminFirstName;
    String adminLastName;
    String filmId;
    String category;
    String actor;
    String store;
    String title;
    String customerId;
    String wishListId;
    String checkOutId;
    String rentalId;
    String name;
    String number;
    String year;
    String month;
    
    String errorNumber;
    String errorName;
    String errorYear;
    String errorMonth;
    String errorPassword;
    String errorEmail;
    String errorCaptcha;


    public String getErrorCaptcha() {
        return errorCaptcha;
    }

    public void setErrorCaptcha(String errorCaptcha) {
        this.errorCaptcha = 
                "<span style='color:red'>Wrong Answer</span>";
    }
    public String getCaptcha() {
        return captcha;
    }

    public void setCaptcha(String captcha) {
        this.captcha = captcha;
    }

    public String getAnswer() {
        return answer;
    }

    public void setAnswer(String answer) {
        this.answer = answer;
    }
    String captcha;
    String answer;

    public String getErrorPassword() {
        return errorPassword;
    }

    public void setErrorPassword(String errorPassword) {
        this.errorPassword = 
                "<span style='color:red'>You can not leave password blank</span>";
    }

    public String getErrorEmail() {
        return errorEmail;
    }

    public void setErrorEmail(String errorEmail) {
        this.errorEmail = 
                "<span style='color:red'>Please provide an authorized email</span>";
    }

    public String getErrorName() {
        return errorName;
    }

    public void setErrorName() {
        this.errorName = 
                "<span style='color:red'>Please provide valid name</span>";
    }

    public String getErrorNumber() {
        return errorNumber;
    }

    public void setErrorNumber() {
        this.errorNumber = 
                "<span style='color:red'>Please provide valid card number</span>";
    }

    public String getErrorYear() {
        return errorYear;
    }

    public void setErrorYear( ) {
        this.errorYear = 
                "<span style='color:red'>Please provide valid expiration date</span>";
    }

    public String getErrorMonth() {
        return errorMonth;
    }

    public void setErrorMonth() {
        this.errorMonth = 
                "<span style='color:red'>Please provide valid month</span>";
    }

    

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getNumber() {
        return number;
    }

    public void setNumber(String number) {
        this.number = number;
    }

    public String getYear() {
        return year;
    }

    public void setYear(String year) {
        this.year = year;
    }

    public String getMonth() {
        return month;
    }

    public void setMonth(String month) {
        this.month = month;
    }

    public String getRentalId() {
        return rentalId;
    }

    public void setRentalId(String rentalId) {
        this.rentalId = rentalId;
    }

    public String getCheckOutId() {
        return checkOutId;
    }

    public void setCheckOutId(String checkOutId) {
        this.checkOutId = checkOutId;
    }

    public String getWishListId() {
        return wishListId;
    }

    public void setWishListId(String wishListId) {
        this.wishListId = wishListId;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getCustomerFirstName() {
        return customerFirstName;
    }

    public void setCustomerFirstName(String customerFirstName) {
        this.customerFirstName = customerFirstName;
    }

    public String getCustomerLastName() {
        return customerLastName;
    }

    public void setCustomerLastName(String customerLastName) {
        this.customerLastName = customerLastName;
    }

    public String getCustomerId() {
        return customerId;
    }

    public void setCustomerId(String customerId) {
        this.customerId = customerId;
    }

    public String getFilmId() {
        return filmId;
    }

    public void setFilmId(String filmId) {
        this.filmId = filmId;
    }

    public String getCategory() {
        return category;
    }

    public void setCategory(String category) {
        this.category = category;
    }

    public String getActor() {
        return actor;
    }

    public void setActor(String actor) {
        this.actor = actor;
    }

    public String getStore() {
        return store;
    }

    public void setStore(String store) {
        this.store = store;
    }

    public String getAdminFirstName() {
        return adminFirstName;
    }

    public void setAdminFirstName(String adminFirstName) {
        this.adminFirstName = adminFirstName;
    }

    public String getAdminLastName() {
        return adminLastName;
    }

    public void setAdminLastName(String adminLastName) {
        this.adminLastName = adminLastName;
    }

    public String getCustomerEmail() {
        return customerEmail;
    }

    public void setCustomerEmail(String customerEmail) {
        this.customerEmail = customerEmail;
    }

    public String getCustomerPassword() {
        return customerPassword;
    }

    public void setCustomerPassword(String customerPassword) {
        this.customerPassword = customerPassword;
    }

    public String getAdminEmail() {
        return adminEmail;
    }

    public void setAdminEmail(String adminEmail) {
        this.adminEmail = adminEmail;
    }

    public String getAdminPassword() {
        return adminPassword;
    }

    public void setAdminPassword(String adminPassword) {
        this.adminPassword = adminPassword;
    }
}
