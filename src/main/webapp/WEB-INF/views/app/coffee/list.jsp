<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="input" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
    <head>
        <meta charset="utf-8">
        <title>Your coffees</title>
        <link rel="stylesheet" href="<c:url value="/resources/css/style.css"/>"/>
    </head>
    <body>
        <header>
            <div class="navbar">
                <div class="navbar-left">
                    <div>
                        <a href="/dashboard" style="font-size: x-large"><img src="<c:url value="/resources/images/logo1.png"/>" style="width: 100px" /></a>
                    </div>
                    <div>
                        <strong style="font-size: xx-large">Your coffees</strong>
                    </div>
                    <a href="/coffee/new"><img class="link" src="<c:url value="/resources/images/plus.png"/>" style="width: 40px; padding-right: 7px" /></a>
                    <div>
                         add <strong style="font-size: x-large">coffee</strong>
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
        <div>
            <table class="blueTable">
                <thead>
                    <tr>
                        <th><a href="/coffee/list/sortByName" > Coffee </a></th>
                        <th><a href="/coffee/list/sortByOrigin" > Origin </a></th>
                        <th><a href="/coffee/list/sortByProcessing" > Processing </a></th>
                        <th><a href="/coffee/list/sortByBrewType" > Brewing Type </a></th>
                        <th><a href="/coffee/list/sortByFlavourNotes" > Flavour notes </a></th>
                        <th><a href="/coffee/list/sortByRating" > Rating </a></th>
                        <th><a href="/coffee/list/sortByQuantity" > Quantity </a></th>
                        <th>Brew!</th>
                        <th>Edit</th>
                        <th>Delete</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach items="${coffees}" var="coffee">
                        <tr>
                            <td>${coffee.name}</td>
                            <td><c:out value="${coffee.origin}" /></td>
                            <td><c:out value="${coffee.processing.name}"/></td>
                            <td><c:forEach var="brewType" items="${coffee.brewTypes}">
                                ${brewType.name}<br></c:forEach></td>
                            <td><c:out value="${coffee.flavourNotes}"/></td>
                            <td><c:out value="${coffee.rating}"/></td>
                            <td><c:out value="${coffee.quantity}"/> g</td>

                            <c:if test="${coffee.quantity > 0.0}">
                                <td>
                                    <a href="/brew/select?coffeeId=${coffee.id}" >
                                        <img class="link" src="<c:url value="/resources/images/brew.png"/>" width="27px"/>
                                    </a>
                                </td>
                            </c:if>
                            <c:if test="${coffee.quantity <= 0.0}">
                                <td>
                                    <strong>X</strong>
                                </td>
                            </c:if>
                            <td>
                                <a href="/coffee/edit/${coffee.id}" >
                                    <img class="link" src="<c:url value="/resources/images/edit.png"/>" width="18px"/>
                                </a>
                            </td>
                            <td>
                                <a href="/coffee/confirm/${coffee.id}" >
                                    <img class="link" src="<c:url value="/resources/images/delete.png"/>" width="14px"/>
                                </a>
                            </td>
                        </tr>
                    </c:forEach></td>
                </tbody>
            </table>
        </div>
    </body>
</html>
