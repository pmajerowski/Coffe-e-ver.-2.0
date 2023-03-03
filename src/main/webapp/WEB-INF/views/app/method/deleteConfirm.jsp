<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="input" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
    <head>
        <meta charset="utf-8">
        <title>Delete coffee</title>
        <link rel="stylesheet" href="<c:url value="/resources/css/style.css"/>"/>
    </head>
    <body>
        <header>
            <div class="navbar">
                <div class="navbar-left">
                    <div>
                        <a href="/dashboard" style="font-size: x-large">
                            <img src="<c:url value="/resources/images/logo1.png"/>" style="width: 100px" />
                        </a>
                    </div>
                    <div>
                        <strong style="font-size: xx-large">Delete coffee</strong>
                    </div>

                </div>
                <div class="navbar-right">
                    <div>
                        <a href="/dashboard" class="link"><strong>Home</strong></a>
                    </div>
                    <div>
                        <a href="/logout" class="link"><strong>Log out</strong></a>
                    </div>
                    <div>
                        <a href="/user" class="link"><strong>${sessionScope.user.name}</strong> </a>
                    </div>
                    <div>
                        <img src="<c:url value="/resources/images/profile.png"/>" width="60px"/>
                    </div>

                </div>
            </div>
        </header>
        <div style="padding-top: 100px">
            <h3 style="text-align: center">Are you sure you want to delete this method?</h3>
            <h4 style="text-align: center">This is irreversible.</h4>
            <p style="text-align: center">
                <a href="/method/delete/${id}" class="btn_2" >DELETE</a>
            </p>
            <p style="text-align: center">
                <a href="/method/list" class="btn_2">CANCEL</a>
            </p>
        </div>
    </body>
</html>