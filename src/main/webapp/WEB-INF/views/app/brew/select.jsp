<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="input" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
    <head>
        <title>Select brew components</title>
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
                        <strong style="font-size: xx-large">Brew </strong>
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
                        <a href="/about" class="link"><strong>${sessionScope.user.name}</strong> </a>
                    </div>
                    <div>
                        <img src="<c:url value="/resources/images/profile.png"/>" width="60px"/>
                    </div>

                </div>
            </div>
        </header>
        <br>
        <h4 style="text-align: center; padding-top: 20px; padding-bottom: 25px">Brew <strong style="font-size: x-large">select</strong></h4>
        <form:form method="get" action="/brew/recipe" modelAttribute="brewDTO">
            <p style="text-align: center">
                <span>Coffee</span><br>
                <select class="list_2" name="coffeeId">
                    <c:forEach items="${coffees}" var="coffee">
                        <c:if test="${coffee.id == coffeeId}">
                            <option selected value="${coffee.id}">
                                    ${coffee.nameOrigin}
                            </option>
                        </c:if>
                        <c:if test="${coffee.id != coffeeId}">
                            <option value="${coffee.id}">
                                    ${coffee.nameOrigin}
                            </option>
                        </c:if>
                    </c:forEach>
                </select>
            </p>
            <p style="text-align: center">
                <span>Brewing type</span><br>
                <span class="list_2"><form:select cssClass="list_2" itemValue="id" itemLabel="name" path="brewTypeId" multiple="false"/></span>
            </p>
            <p style="text-align: center">
                <span>Brewing method</span><br>
                <span class="list_2"><form:select cssClass="list_2" itemValue="id" itemLabel="name" path="brewMethodId" multiple="false"/></span>
            </p>
            <p style="text-align: center">
                <span>Desired Amount (ml)</span><br>
                <span> <form:input type="number" min="0" cssClass="list_2" path="desiredAmount"/></span>
                <form:errors path="desiredAmount" cssClass="error" /><br><br>
                <c:if test="${not empty brewDTO.message}">
                    <span class="error">
                            ${brewDTO.message}
                    </span>
                </c:if>
            </p>

            <p style="text-align: center; padding-top: 20px">
                <input type="submit" value="Confirm" class="btn_2 list_2" />
            </p>
            <input type="hidden" id="selectedBrewTypeId" value="${param.brewTypeId}"/>
            <input type="hidden" id="selectedBrewMethodId" value="${param.brewMethodId}"/>
        </form:form>

        <script src="<c:url value="/resources/js/select.js"/>"></script>
    </body>
</html>
