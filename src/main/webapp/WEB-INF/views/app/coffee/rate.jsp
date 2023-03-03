<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="input" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
    <head>
        <meta charset="utf-8">
        <title>Edit coffee</title>
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
                        <strong style="font-size: xx-large">Rate coffee</strong>
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
        <div class="center" >
            <div class="blueTable " >
                <h3 style="text-align: center">Enjoy Your coffee!</h3>
                <h2> You've brewed ${param.coffeeGrounds} of ${coffee.nameOrigin}. <br> You can now change the rating of the coffee:</h2>
                <br>

                <form:form method="post" action="/coffee/rate/save" modelAttribute="coffee" cssStyle="text-align: center">
                    <form:hidden path="id"/>
                    <form:hidden path="quantity"/>
                    <input type="hidden" name="usedCoffeeGrounds" value="${param.coffeeGrounds}"/>

                    <span>
                        <form:label path="rating">Rating</form:label>
                    </span>
                    <br>
                    <span class="list">
                        <form:select cssClass="list" path="rating">
                            <form:option value="1"/>
                            <form:option value="2"/>
                            <form:option value="3"/>
                            <form:option value="4"/>
                            <form:option value="5"/>
                            <form:option value="6"/>
                            <form:option value="7"/>
                            <form:option value="8"/>
                            <form:option value="9"/>
                            <form:option value="10"/>
                        </form:select>
                    </span>
                    <form:errors path="quantity" cssClass="error"/>

                    <p>
                        <input type="submit" style="cursor: pointer" class="btn_2" value="Confirm">
                    </p>
                    <p>
                        <a href="/coffee/list" class="btn_2">Cancel</a>
                    </p>
                </form:form>
            </div>
            <br>
            <br>
            <br>
        </div>
    </body>
</html>
