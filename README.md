# SDP-ShreddedGeeks
ENDURANCE: Fitness App

[![CircleCI](https://dl.circleci.com/status-badge/img/gh/SalmaanSuli/Endurance/tree/Master.svg?style=svg)](https://dl.circleci.com/status-badge/redirect/gh/SalmaanSuli/Endurance/tree/Master)


[![CircleCI](https://dl.circleci.com/status-badge/img/gh/SalmaanSuli/Endurance/tree/Smukello-patch-1.svg?style=shield)](https://dl.circleci.com/status-badge/redirect/gh/SalmaanSuli/Endurance/tree/Smukello-patch-1)   [![codecov](https://codecov.io/gh/SalmaanSuli/Endurance/branch/Master/graph/badge.svg?token=PXDM8HIGKO)](https://codecov.io/gh/SalmaanSuli/Endurance)

[![CircleCI](https://dl.circleci.com/insights-snapshot/gh/SalmaanSuli/Endurance/Master/workflow/badge.svg?window=24h)](https://app.circleci.com/insights/github/SalmaanSuli/Endurance/workflows/workflow/overview?branch=Master&reporting-window=last-24-hours&insights-snapshot=true)



![codecov](https://codecov.io/gh/SalmaanSuli/Endurance/branch/Master/graphs/sunburst.svg?token=PXDM8HIGKO)
![codecov](https://codecov.io/gh/SalmaanSuli/Endurance/branch/Master/graphs/tree.svg?token=PXDM8HIGKO)
![codecov](https://codecov.io/gh/SalmaanSuli/Endurance/branch/Master/graphs/icicle.svg?token=PXDM8HIGKO)

**Setting up the environment**

For this project Android studio, Git , Flutter, Django and VS code are required in order to run the application.
Android studios download link : https://developer.android.com/studio
Git download link : https://git-scm.com/downloads
Flutter download link : https://docs.flutter.dev/get-started/install
VS code download link : https://code.visualstudio.com/
You also have to install the extensions required to run dart.
Python will be required in order to use Django, and can be downloaded in this link : https://www.python.org/downloads/ , to set up python you can watch this video : https://www.youtube.com/watch?v=ZRbirvsDQ-I

**Running the application**

We used Flutter within VS Code to run the application, It can also be ran as an sdk file - essentially an app from your phone.

**Multi-Tier Architecture**
Multi-Tier architecture is a client–server architecture in which presentation, application processing and data management functions are physically separated.

The fitness app implements the Multi-tier client-server architectural style which consists of the presentation tier, application tier and the Data tier.
The user will interact with the software using a mobile device or android app by browsing through workouts and diet recommendations, all user inputs will be collected by the presentation tier and process them to the application tier.
On the application tier, the fitness app make use of Django as servers run time and to facilitate the communication to with the database.
Due restricted communication between the user interface and the server via an API, the data tier is separated from the clients for security purpose.

**Wiki**
**Endurance System Architecture**


Endurance is the implementation of an app that tracks custom fitness goals - particular to workouts and weight-loss (including a custom dieting plan). The main functionality of the app allows the user to create their custom fitness and dieting program and track their progress over time.

**Functional Requirements**

Users can view workout and diet plan
Users can browse exercises or setup goals
Users can create profile
Users can track progress
Users can share the progress with each other.
Non-Functional Requirements

Highly scalable
Highly consistency
High availability
High reliability
User data should be durable (Any uploaded photos should never be lost)


**Logical View**
The logical view is concerned with the functionality that the system provides to end-users.

The application will provide the user with a login form.
The user will required to enter the relevant credentials to login to the app or sign up if the user don't have an account.
When the user is logged in successfully, they will be directed to the homepage of the application

**Process View**
The process view deals with the dynamic aspects of the system, explains the system processes and how they communicate, and focuses on the run time behavior of the system.

User opens the app and required to enters the credentials to login the app
If the user doesn't have an account, they can register then login
If the user enter correct credentials they will be directed to the homepage, else back to login 

**Development View**
The development view illustrates a system from a programmer's perspective and is concerned with software management.

The user interact with App through android device.
The application make use of Django database for the back end.
The front end uses flutter because Custom, Animated UI of any Complexity Available.
When the user enters the user name and password in the application, the json strings are passed through the application user interface to the database.

**Physical View**

Physical view is concerned with the topology of software components on the physical layer as well as the physical connections between these components.

The device type used is Android mobile application
The application consist of different pages linked to dart server provided by flutter.
The application is back-ended with Django database server.

**Scenarios**

The description of an architecture is illustrated using a small set of use cases, or scenarios

Both user and admin can register and login to be verified and authorized to use the app.
Both  the user and the admin can creates or update their profile.
Admin can add or remove the workouts and diets.
User can view workouts and diets recommendations.
User can set a reminder so that they can be notified.
