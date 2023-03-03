<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="input" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
    <head>
        <meta charset="utf-8">
        <title>Log in</title>
<%--        <link rel="stylesheet" href="${pageContext.request.contextPath}../css/style.css" />--%>
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
                        <strong style="font-size: xx-large">Register</strong>
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

            <form:form method="post" action="" modelAttribute="user">
                <p>
                    <span><form:label path="name">Name</form:label></span><br>
                    <span><form:input path="name" cssClass="list_2" /></span>
                    <span><form:errors path="name" cssClass="error"/></span>
                </p>
                <p>
                    <span><form:label path="email">Email</form:label></span><br>
                    <span><form:input path="email" cssClass="list_2" /></span>
                    <span><form:errors path="email" cssClass="error"/></span>
                </p>
                <p>
                    <span><form:label path="password">Password</form:label></span><br>
                    <span><form:password path="password" cssClass="list_2" /></span>
                    <span><form:errors path="password" cssClass="error"/></span>
                </p>
                <div class="columns"><input type="submit" style="cursor:pointer;" class="btn_2" value="Register"></div>
            </form:form>
        </div>
    </body>
</html>
