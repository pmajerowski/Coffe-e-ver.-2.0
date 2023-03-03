<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="input" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
    <head>
        <meta charset="utf-8">
        <title>${brewMethod.name}</title>
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
                        <strong style="font-size: xx-large"> ${brewMethod.name} recipe</strong>
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

        <div class="center">
            <form:form method="post" action="/method/edit/save" modelAttribute="brewMethod">
                <p>
                    <form:label path="recipe">Recipe</form:label><br>
                    <form:textarea path="recipe" cssStyle="width: 650px; height: 420px" cssClass="list"></form:textarea><br>
                    <form:errors path="recipe" cssClass="error"/>
                </p>
                <form:hidden path="name"/>
                <form:hidden path="brewType.id"/>
                <form:hidden path="brewType.name"/>
                <form:hidden path="brewTime" />
                <form:hidden path="id"/>
                <form:hidden path="grindSize.id"/>
                <form:hidden path="grindSize.name"/>
                <form:hidden path="ratio"/>
                <form:hidden path="waterTemperature"/>

                <p style="justify-content: space-between; width: 650px">
                    <input type="submit" style="cursor:pointer;" class="btn_2" value="Edit">
                    <a href="/method/list" style="cursor:pointer;" class="btn_2">Back</a>
                </p>

            </form:form>
        </div>

    </body>
</html>
