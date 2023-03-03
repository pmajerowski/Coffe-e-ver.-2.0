<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <title>Landing Page</title>
        <link rel="stylesheet" href="<c:url value="resources/css/style.css"/>"/>
    </head>
    <body>
        <header>
            <br>
              <div class="navbar">
                <div></div>
                <div></div>
                <div class="navbar-right">
                    <div>
                        <a href="/login" class="link_2"><strong class="link_2">Log in</strong></a>
                    </div>
                    <div>
                        <a href="/register" class="link"><strong>Sign up</strong></a>
                    </div>
                    <div style="margin-right: 60px">
                        <a href="/about" class="link"><strong>About</strong></a>
                    </div>
                </div>
              </div>
        </header>
        <p style="text-align: center; margin-top: 60px; margin-bottom: 2px">
            <img style="text-align: center; width: 300px" src="<c:url value="resources/images/kofie.png"/>">
        </p>
        <img class="logo" width="300" src="<c:url value="resources/images/logo22.png" />" alt="coffee Logo">

        <div class="columns">
          <div class="column">
              <hr>
              <p><strong>Welcome to Coffe-e!</strong> Our platform is dedicated to helping coffee lovers around the world
                  discover and master <strong>the art of manual brewing.</strong>
                At our portal, we're passionate about sharing the best brewing methods, coffee recipes, and tips and tricks
                  to help you create the perfect cup of coffee. Our database is constantly growing and is curated by our
                  team of coffee experts, who are always on the lookout for the latest and greatest coffee beans and brewing
                  techniques.
                  Whether you're a beginner or a seasoned coffee pro, <strong>our portal has something for everyone.
                  </strong> Join our community today and start exploring the world of alternative coffee brewing. With our
                  extensive database, detailed recipes, and helpful resources, you'll be well on your way to brewing
                  <strong>the perfect cup of coffee every time.</strong>
              </p>
          </div>
          <div class="column">
              <hr class="reverse">
              <p>
                  One of the unique features of <strong>Coffe-e</strong> is the ability to add your own coffee and brewing
                  methods to our database. This means that if you've found a <strong>great coffee</strong> or brewing method
                  that you want to share with other coffee lovers, you can add it to our platform for everyone to see and
                  try out. We believe in community and collaboration, and we want our portal to be a <strong>hub for coffee
                      enthusiasts</strong> to share and learn from one another.
                  In addition to our community-driven database, we also provide detailed recipes for a variety of brewing
                  methods, including the <strong>V60, Chemex, Aeropress and more.</strong> Our recipes are designed to help
                  you get the most out of your coffee beans and brewing equipment, and our team of experts has spent countless
                  hours perfecting each recipe to ensure the best possible results.
              </p>
          </div>
        </div>
    </body>
</html>
