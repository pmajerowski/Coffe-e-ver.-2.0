<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="input" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
    <head>
        <meta charset="utf-8">
        <title>Coffe-e</title>
        <link rel="stylesheet" href="<c:url value="/resources/css/style.css"/>"/>
        <input type="hidden" id="coffeeId" value="${coffee.id}">
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
                        <span style="font-size: x-large">
                            Brew <strong style="font-size: x-large">${coffee.nameOrigin}</strong> with <strong >${brewMethod.name} method </strong>
                        </span>
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
        <div class="container">
            <div class="rectangle_2">
                <table>
                    <tbody>
                    <tr>
                        <td>Water temperature:</td>
                        <td style="text-align: end">${brewMethod.waterTemperature}℃</td>
                    </tr>
                    <tr>
                        <td>Coffee grounds:</td>
                        <td style="text-align: end" id="coffeeGrounds">${brewDTO.coffeeGrounds}g</td>
                    </tr>
                    <tr>
                        <td>Grind size:</td>
                        <td style="text-align: end">${brewMethod.grindSize.name}</td>
                    </tr>
                    <tr>
                        <td>Brew time:</td>
                        <td id="brew_time" style="text-align: end">${brewMethod.brewTime}</td>
                    </tr>
                    <tr>
                        <td class="timer"><button id="timer_button" class="timer_button">Start timer </button></td>
                        <td class="timer" style="text-align: end" id="timer">00:00</td>
                    </tr>
                    </tbody>
                </table>
            </div>
            <div class="rectangle_2">

                <br><p><span>Recipe: </span><br><br><a style="white-space: break-spaces; line-height: 1.6"><c:out value="${brewMethod.recipe}" /></a></p>
            </div>
        </div>
    </body>
    <script src="<c:url value="/resources/js/script.js"/>"></script>
</html>
