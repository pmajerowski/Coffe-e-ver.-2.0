<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="input" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
    <head>
        <meta charset="utf-8">
        <title>${sessionScope.user.name}</title>
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
                        <strong style="font-size: xx-large">Your profile</strong>
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
                        <img src="<c:url value="/resources/images/profile.png"/>" width="60px"/>
                    </div>

                </div>
            </div>
        </header>
        <div class="center">
            <div class="column">
                <strong>Edit name, e-mail or password:</strong><br>
                <span>(You will have to log in again.)</span>
            </div>

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
                <form:hidden path="id"></form:hidden>
                <div style="margin-top: 20px; justify-content: center">
                    <div>
                        <input type="submit" style="cursor:pointer;" class="btn_2" value="Confirm">

                        <a href="/user/confirm/${user.id}" class="btn_2">Delete account</a>
                    </div>
                </div>
            </form:form>
        </div>
    </body>
</html>
