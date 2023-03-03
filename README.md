# Coffe-e

<img width="170" alt="coffe-e" src="https://user-images.githubusercontent.com/105345146/221573845-682c2d45-245a-428f-9323-8853ebd644c5.png">

<h2>Overview</h2>
</hr>
<strong>Coffe-e</strong> is a prototype web application that combines specialty coffees and alternative brewing methods in a simple structure. Based on editable coffee brewing types selected for a chosen coffee you are provided with a particular method recipe and details. <br>
The application lets you keep track of your coffee usage, allows rating, and calculates recipe details and ingredients needed to obtain a desired amount of delicious beverage.
<br>
The application is designed following Model-View-Controller architecture separating services and repositories from controllers and views.
<br>
As timing is extremely important in alternative coffee brewing methods, the last view also provides a simple timer to improve the brewing process.
After you're done with Your coffee, the application updates the amount of used coffee. As the user runs out of one - it will no longer be available for brewing.
<br>
The visual layout written from scratch is kept in the idea of simplicity, giving the user a clear and easy-to-use interface. The most complicated views consist of tables, but despite complex data content, they are kept in an aesthetic and understandable fashion.
<br>
VERSION 2.0 -> migrated to Spring boot
<br>
<br>

<h2>Technologies used</h2>
 </hr>
<ul>
  <li>Java</li>
  <li>Spring boot (since ver. 2.0)</li>
  <li>Hibernate / JPA</li>
  <li>JSP</li>
  <li>MySQL</li>
  <li>CSS</li>
  <li>A bit of JavaScript</li>
  <li>Deployed locally on a Tomcat server</li>
</ul>
<br>

<h2>Building and running</h2>
</hr>
To run Coffe-e locally you can use IntelliJ.
<ul>
  <li>Clone this repository and open the project.</li>
 <li>Built project with Maven</li>
  
  <li>To set up the database - add a Docker run configuration and in 'Run' set the 'Compose files' to './docker/docker-compose.yml; ':<br>
  <img width="400" alt="image" src="https://user-images.githubusercontent.com/105345146/222211296-8baff503-564f-42a1-a4f0-bbd5daf735dc.png">
  
  <li>Next, run the Docker desktop application and then, in IntelliJ - run the docker-compose:</li>
  <img width="400" alt="image" src="https://user-images.githubusercontent.com/105345146/222211773-38c3fedb-71ab-4d0c-9093-ac17627f9321.png">
  
  <li>In project tree go to src/main/java/pl/majerowski/coffe_e/Coffe_e_Application.java</li>
  
  <li>Run the application by clicking the green 'run' button</li>
  <img width="400" alt="image" src="https://user-images.githubusercontent.com/105345146/222765143-164008b2-b810-44c3-9aa8-76da00c885d1.png">
  
  <li>Now, as it's deployed you may enter the application at <a href="http://localhost:8080" target="_blank">http://localhost:8080</a></li>
  
  <li>To use the main part of the application it is necessary to log in. You can register and create new account or use this working login and password:<br>
  <strong>email: user@coffee.com</strong><br><strong>password: coffee123</strong></li>
  <img width="360" alt="image" src="https://user-images.githubusercontent.com/105345146/222218832-8636eead-0d00-4313-ae59-40e41994f333.png">
  <br><br> Enjoy!

  </ul> 

<br> 

<h2>Visual scope</h2>
<strong>Dashboard screen: </strong>
<img width="390" alt="image" src="https://user-images.githubusercontent.com/105345146/221577660-c3758908-ad7a-4d69-a6d4-443a9279a091.png">
<br>
<strong>Coffes list: </strong>
<img width="390" alt="image" src="https://user-images.githubusercontent.com/105345146/221578136-8b01f2db-c18e-4972-ac5e-31fb07db2e79.png">
<br>
<strong>Brewing details select screen: </strong>
<img width="390" alt="image" src="https://user-images.githubusercontent.com/105345146/221578493-0d3bb1f7-8bc6-4e55-a7e3-99fa9c4f5943.png">
<br>
<strong>Brewing recipe screen: </strong>
<img width="390" alt="image" src="https://user-images.githubusercontent.com/105345146/221578712-78a05525-6072-4846-bcbe-776f0f77029e.png">

<br>
