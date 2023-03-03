<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="input" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
    <head>
        <meta charset="utf-8">
        <title>Brew methods</title>
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
                         <strong style="font-size: xx-large">Brewing methods</strong>
                    </div>
                    <a href="/method/new">
                        <img class="link" src="<c:url value="/resources/images/plus.png"/>" style="width: 40px; padding-right: 7px" />
                    </a>
                    <div>
                         add <strong style="font-size: x-large">method</strong>
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

        <table class="blueTable" >
            <thead>
                <tr>
                    <th><a href="/method/list/sortByName"> Method </a></th>
                    <th><a href="/method/list/sortByBrewType"> Brewing type</a> </th>
                    <th><a href="/method/list/sortByBrewTime"> Brew time</a> </th>
                    <th><a href="/method/list/sortByRatio"> Coffee:water ratio </a></th>
                    <th><a href="/method/list/sortByGrindSize"> Grind size </a></th>
                    <th><a href="/method/list/sortByWaterTemperature"> Water temperature </a></th>
                    <th>Recipe</th>
                    <th>Edit</th>
                    <th>Delete</th>
                </tr>
            </thead>

            <tbody>
                <c:forEach items="${methods}" var="method">
                    <tr>
                        <td>${method.name}</td>
                        <td><c:out value="${method.brewType.name}" /></td>
                        <td><c:out value="${method.brewTime}"/></td>
                        <td><c:out value="1:${method.ratio}"/></td>
                        <td><c:out value="${method.grindSize.name}"/></td>
                        <td><c:out value="${method.waterTemperature}"/>℃</td>

                        <td>
                            <a href="/method/recipe?methodId=${method.id}" >
                                <img class="link" src="<c:url value="/resources/images/recipe.png"/>" width="16px"/>
                            </a>
                        </td>
                        <td>
                            <a href="/method/edit/${method.id}" >
                                <img class="link" src="<c:url value="/resources/images/edit.png"/>" width="18px"/>
                            </a>
                        </td>
                        <td>
                            <a href="/method/confirm/${method.id}" >
                                <img class="link" src="<c:url value="/resources/images/delete.png"/>" width="14px"/>
                            </a>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </body>
</html>
