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
                        <strong style="font-size: xx-large">Edit coffee</strong>
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
            <form:form method="post" action="/coffee/edit/save" modelAttribute="coffee">

                <p>
                    <span><form:label path="name">Coffee name</form:label></span>
                    <br>
                    <span><form:input path="name" maxlength="50"/></span>
                    <form:errors path="name" cssClass="error"/>
                </p>
                <p>
                    <span><form:label path="origin">Origin</form:label></span>
                    <br>
                    <span><form:input path="origin" maxlength="50"/></span>
                    <form:errors path="origin" cssClass="error"/>
                </p>
                <p>
                    <span><form:label path="processing">Processing</form:label></span>
                    <br>
                    <span class="list">
                        <form:select cssClass="list" itemValue="id" itemLabel="name"
                                     items="${processingList}" path="processing" multiple="false"/>
                    </span>
                    <form:errors path="processing" cssClass="error"/>
                </p>
                <p>
                    <form:label path="brewTypes">Brew types</form:label>
                    <br>
                    <span>
                        <form:checkboxes cssStyle="width: auto; align-items: flex-end"
                                         itemValue="id" itemLabel="name" path="brewTypes"
                                         items="${brewingTypesList}" multiple="true"/>
                    </span>
                    <br>
                    <form:errors path="brewTypes" cssClass="error"/>
                </p>
                <p>
                    <span><form:label path="flavourNotes">Flavour notes</form:label></span>
                    <br>
                    <span> <form:input path="flavourNotes" maxlength="50"/></span>
                    <form:errors path="flavourNotes" cssClass="error"/>
                </p>
                <p>
                    <span><form:label path="quantity">Quantity (in grams)</form:label></span>
                    <br>
                    <span> <form:input path="quantity" min="0" max="5000" type="number"/></span>
                    <form:errors path="quantity" cssClass="error"/>
                </p>
                <p>
                    <span><form:label path="rating">Rating</form:label></span>
                    <br>
                    <span class="list"> <form:select cssClass="list" path="rating">
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
                    </form:select></span>
                    <form:errors path="quantity" cssClass="error"/>
                </p>
                    <form:hidden path="id"/>
                <p>
                    <input type="submit" style="cursor: pointer" class="btn_2" value="Confirm">
                </p>
                <p>
                    <a href="/coffee/list" class="btn_2">Cancel</a>
                </p>
            </form:form>
        </div>
    </body>
</html>
