<%-- 
    Document   : list
    Created on : Mar 22, 2015, 10:04:15 PM
    Author     : programmercore
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8"/>
        <link rel="stylesheet" href="list.css"/>
        <link rel="stylesheet" href="reset.css"/>
        <title>Not Decided</title>
    </head>

    <body>
        <div class="header">
            <div class="header_contents">
                <ul>
                    <li><a href="" >Home</li></a>
                    <li class="logout_anchor"><a href="" >Logout</li></a>
                </ul>
            </div>

        </div>

        <div class="container">

            <h1>Serials List</h1><br>
            <table width="100%">
                <tr class="search_space">
                    <th class="normal_header" >Title</td>
                    <th class="normal_header" width="10%">Score</td>
                    <th class="normal_header" width="10%" nowrap="">Type</td>
                    <th class="normal_header" width="10%" nowrap="">Progress</td>
                    <th class="normal_header" width="10%" nowrap="">Status</td>
                </tr>
                <tr>
                    <td class="show_info" align="center"><a href="">Lelouch of the Rebellion</a></td>
                    <td class="show_info extra" align="center">9.00</td>
                    <td class="show_info extra" align="center">TV</td>
                    <td class="show_info extra" align="center">25</td>
                    <td class="show_info extra" align="center">watched</td>
                </tr>
            </table>

        </div>
    </body>

</html>
