<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="input" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
    <head>
        <meta charset="utf-8">
        <title>Coffe-e</title>
        <link rel="stylesheet" href="<c:url value="resources/css/style.css"/>"/>
    </head>
    <body>
        <header>
            <div class="navbar">
                <div class="navbar-left">
                    <div>
                        <a href="/dashboard" style="font-size: x-large"><img src="<c:url value="resources/images/logo1.png"/>" style="width: 100px" /></a>
                    </div>
                    <div>
                        <strong style="font-size: xx-large;">Coffe-e</strong>
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
                        <a href="/user" class="link"><strong>${sessionScope.user.name}</strong></a>
                    </div>
                    <div>
                        <img src="<c:url value="resources/images/profile.png"/>" width="60px"/>
                    </div>

                </div>
            </div>
        </header>

        <div class="container">
            <div onclick="location.href='coffee/list';" style="cursor:pointer;" class="rectangle">
                Your<strong style="font-size: 150%"> coffees</strong>
            </div>
            <div onclick="location.href='brew/select';" style="cursor:pointer;" class="rectangle">
                <strong style="font-size: 170%">Brew!</strong>
            </div>
            <div onclick="location.href='method/list';" style="cursor:pointer;" class="rectangle">
                Brew<strong style="font-size: 150%"> methods</strong>
            </div>
        </div>
    </body>
</html>