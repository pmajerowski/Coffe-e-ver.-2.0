<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="input" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
    <head>
        <meta charset="utf-8">
        <title>Log in</title>
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
                        <strong style="font-size: xx-large">Login</strong>
                    </div>
                </div>
                <div class="navbar-right">
                    <div>
                        <a href="/login" class="link"><strong style="color: darkorange">Log in</strong></a>
                    </div>
                    <div>
                        <a href="/register" class="link"><strong>Sign up</strong></a>
                    </div>
                    <div>
                        <a href="/about" class="link"><strong>About</strong></a>
                    </div>
                </div>
            </div>
        </header>
        <div class="center">

            <form:form method="post" modelAttribute="user">
                <p>
                    <span><label for="email">E-mail</label> </span><br>
                    <span><form:input cssClass="list_2" path="email" type="email"></form:input> </span>
                </p>
                <p>
                    <span><label for="password">Password</label> </span><br>
                    <span> <form:input cssClass="list_2" path="password" type="password"></form:input> </span>
                </p>
                <c:if test="${not empty sessionScope.message}">
                    <p class="error">
                        ${sessionScope.message}
                    </p>
                </c:if>
                <div class="columns"><input type="submit" style="cursor:pointer;" class="btn_2" value="Login"/></div>
            </form:form>
        </div>
    </body>
</html>
