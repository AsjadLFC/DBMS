<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%-- 
    Document   : profile
    Created on : Mar 15, 2015, 7:56:47 PM
    Author     : programmercore
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>
    <head>
        <meta charset="utf-8"/>
        <link rel="stylesheet" href="profile.css"/>
        <link rel="stylesheet" href="reset.css"/>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Edit Profile</title>
    </head>
    <body>
        <%@include file="loginchecker.jsp" %>
        <div class="container">
            <div class="heading">
                <h1>Not Decided</h1>
            </div>
            <form class="form" method="get" action="profileupdate.jsp">
                <div class="form_header">
                    <h1 class="form-heading">Profile</h1>
                    <p class="profile_description">Control your profile information, both what it says and what other people see. User profiles are shown to other users.</p>
                </div>
                <div class="form_content">
                    <div class="fieldset"><label>Avatar</label><input name="pr_image" class="profile_input" data-role="avatar-file-upload" type="file"></div>
                    <div class="fieldset"><label>First Name</label><input name="pr_Fname" class="profile_input" placeholder="First Name" type="text"></div>
                    <div class="fieldset"><label>Last Name</label><input name="pr_Lname" class="profile_input" placeholder="Last Name" type="text"></div>
                    <div class="fieldset"><label>Country</label><input name="pr_country" class="profile_input" placeholder="e.g Germany" type="text"></div>
                    <div class="fieldset"><label>Gender</label><select name="pr_gender" class="gender"><option value="Male">Male</option><option value="Female">Female</option></select></div>
                    <div class="fieldset"><label>About Me</label><input name="pr_about" class="profile_input" placeholder="Max Characters: 450" maxlength="450" type="text"></div>
                    <div class="fieldset"><label>Type</label><select name="pr_type" class="gender"><option value="Normal User">Normal User</option><option value="Admin">Admin</option></select></div>
                    <div class="fieldset"><input value="Save" type="submit"></div>
                </div>
            </form>
            <div id="footer">
                <div class="footer">
                    <a target = "_blank" href="https://www.twitter.com/asjadsohail" >Twitter</a>
                    <a target = "_blank" href="#" >Facebook</a>
                    <a target = "_blank" href="/terms" >Terms</a>
                    <a target = "_blank" href="/terms" >Privacy Policy</a>
                    <a target = "_top" href="mailto:asjadsohail@gmail.com" >Contact</a>
                </div>
            </div>
        </div>
    </body>
</html>