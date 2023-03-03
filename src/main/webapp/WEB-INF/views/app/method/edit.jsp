<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="input" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <title>Add coffee</title>
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
                <strong style="font-size: xx-large"> Edit method</strong>
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
            <div class="blueTable container" >
                <form:form style="display: inline-flex" method="post" action="/method/edit/save" modelAttribute="brewMethod">
                    <div>
                        <p>
                            <span><form:label path="name">Method name</form:label></span><br>
                            <span><form:input path="name"/></span>
                            <form:errors path="name" cssClass="error"/>
                        </p>
                        <p>
                            <span><form:label path="brewType">Brewing type</form:label></span><br>
                            <span class="list">
                                <form:select cssClass="list" itemValue="id" itemLabel="name"
                                             items="${brewingTypesList}" path="brewType" multiple="false"/>
                            </span>
                            <form:errors path="brewType" cssClass="error"/>
                        </p>
                        <p>
                            <span><form:label path="grindSize">Grind size</form:label></span><br>
                            <span class="list">
                                <form:select cssClass="list" itemValue="id" itemLabel="name"
                                             items="${grindSizes}" path="grindSize" multiple="false"/>
                            </span>
                            <form:errors path="grindSize" cssClass="error"/>
                        </p>
                        <p>
                            <span><form:label path="ratio"> Coffee : water ratio</form:label></span><br>
                            <span> <strong> 1 : </strong><form:input path="ratio" cssStyle="width: 15%"/></span>
                            <form:errors path="ratio" cssClass="error"/>
                        </p>
                        <p>
                            <span><form:label path="waterTemperature">Water temperature</form:label></span><br>
                            <span>
                                <form:input cssStyle="width: 14%" path="waterTemperature"/><strong>℃</strong>
                            </span>
                            <form:errors path="waterTemperature" cssClass="error"/>
                        </p>
                        <p>
                            <span><form:label path="brewTime">Brew time (mm:ss)</form:label></span><br>
                            <span> <form:input path="brewTime"/></span>
                            <form:errors path="brewTime" cssClass="error"/>
                        </p>
                        <p>
                            <input type="submit" style="cursor:pointer;" class="btn_2" value="Confirm">
                        </p>
                        <p>
                            <a href="/method/list" style="cursor:pointer;" class="btn_2">Cancel</a>
                        </p>
                    </div>
                    <div style="margin-left: 40px">
                        <p>
                            <form:label path="recipe">Recipe</form:label><br>
                            <form:textarea path="recipe" cssStyle="width: 500px; height: 317px" cssClass="list" />
                            <br>
                            <form:errors path="recipe" cssClass="error"/>
                        </p>
                    </div>
                    <form:hidden path="id"/>
                </form:form>
            </div>
        </div>
    </body>
</html>
