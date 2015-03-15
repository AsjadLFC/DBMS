<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%-- 
    Document   : showstemplate
    Created on : Mar 15, 2015, 8:01:41 PM
    Author     : programmercore
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>
    <head>
        <meta charset="utf-8"/>
        <link rel="stylesheet" href="showstemplate.css"/>
        <link rel="stylesheet" href="reset.css"/>
        <title>{Put the name of show here}</title>
    </head>

    <body>
        <div class="container">
            <div class="top_bar">
                <h1>Not Decided</h1>
                <ul id="menu">
                    <li><a href="" >options</a>
                        <ul class="sub_menu">
                            <li><a href="" >Home</a></li>
                            <li><a href="" >Profile</a></li>
                            <li><a href="" >Series list</a></li>
                            <li><a href="" >Logout</a></li>
                        </ul>
                    </li>
                </ul>

            </div>

            <div class="series_description">
                <div class="series_image"></div>
                <div class="description"></div>
            </div>
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
