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
  <li>Database deployed in a Docker container</li>
</ul>
<br>

<h2>Building and running</h2>
<hr>

<h3>Prerequisites</h3>

Before you can build and run this application, you need to have the following software installed on your machine:
<br>
 <ul>
  <li><a href="https://www.oracle.com/pl/java/technologies/downloads/">Java</a> JDK version 11 or later</li>
  <li><a href="https://maven.apache.org/download.cgi">Maven</a> version 3.6 or later</li>
  <li><a href="https://www.docker.com/products/docker-desktop/">Docker</a> version 20.10 or later</li>
  <li><a href="https://docs.docker.com/compose/install/">Docker Compose</a> version 2.12 or later</li>
 </ul>
 
<h3>Building the Application</h3>
To build the application, run the following command from the root directory of the project:
<li>
$ <code>mvn clean package</code>
  </li>
 

This will compile the Java code and produce a JAR file containing the application.
<br>

<h3>Runnung the Database</h3>
<ol>
  <li>Stay in the same root directory of the project.</li>
  <li>Run the following command to start the database - remember that Docker desktop must be up and running:</li>
  $ <code>docker-compose up -d</code> <br>
This will download and start the necessary Docker images for the database, and create a Docker network for them to communicate on.
</ol>

<h3>Running the Application</h3>

  <li>In terminal, from the same location, run the application with command:</li>
  $ <code>java -jar target/charity-0.0.1-SNAPSHOT.jar</code> <br>
  
  This will start the Tomcat server embedded within Spring Boot.
  
  <li>Open a web browser and navigate to  <strong>http://localhost:8080</strong> . You should see the home page of the application.</li>
 
 </ol>
    
 <h3> Stopping the Application</h3>
 To stop the application and the database, press <kbd>control+C</kbd> in the terminal.
 
 <h2>Usage</h2>
 <hr>
 
 <p>Apart from the landing page, the main application is available for logged users only. In order to proceed you can either register, creating a new account, or log in using below credentials:<br>
 <ul>
  <li><strong>email:</strong> user@coffee.com</li>
  <li><strong>password:</strong> coffee123</li><br>
  <img width="250" alt="image" src="https://user-images.githubusercontent.com/105345146/222218832-8636eead-0d00-4313-ae59-40e41994f333.png">
  <br><br> Enjoy!
  
  </p>

<h2>Acknowledgments</h2>

The purpose of the Coffe-e project is strictly educational. It was established and coded as a final project of Coders Lab - School of IT bootcamp. Althought the supervision of the mentors, all code and ideas were independent.

<h2>Visual scope</h2>
<strong>Dashboard screen: </strong><br>
<img width="390" alt="image" src="https://user-images.githubusercontent.com/105345146/221577660-c3758908-ad7a-4d69-a6d4-443a9279a091.png">
<br>
<strong>Coffes list: </strong><br>
<img width="390" alt="image" src="https://user-images.githubusercontent.com/105345146/221578136-8b01f2db-c18e-4972-ac5e-31fb07db2e79.png">
<br>
<strong>Brewing details select screen: </strong><br>
<img width="390" alt="image" src="https://user-images.githubusercontent.com/105345146/221578493-0d3bb1f7-8bc6-4e55-a7e3-99fa9c4f5943.png">
<br>
<strong>Brewing recipe screen: </strong><br>
<img width="390" alt="image" src="https://user-images.githubusercontent.com/105345146/221578712-78a05525-6072-4846-bcbe-776f0f77029e.png">

<br>
