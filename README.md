# openCX-SMS Development Report

Welcome to the documentation pages of the Seat Management Service of **openCX**!

You can find here detailed about the (sub)product, hereby mentioned as module, from a high-level vision to low-level implementation decisions, a kind of Software Development Report (see [template](https://github.com/softeng-feup/open-cx/blob/master/docs/templates/Development-Report.md)), organized by discipline (as of RUP):

* Business modeling
  * [Product Vision](#Product-Vision)
  * [Elevator Pitch](#Elevator-Pitch)
* Requirements
  * [Use Case Diagram](#Use-case-diagram)
  * [User stories](#User-stories)
  * [Domain model](#Domain-model)
* Architecture and Design
  * [Logical architecture](#Logical-architecture)
  * [Physical architecture](#Physical-architecture)
  * [Prototype](#Prototype)
* [Implementation](#Implementation)
* [Test](#Test)
* [Configuration and change management](#Configuration-and-change-management)
* [Project management](#Project-management)

So far, contributions are exclusively made by the initial team, but we hope to open them to the community, in all areas and topics: requirements, technologies, development, experimentation, testing, etc.

Please contact us!

Thank you!

Inês Quarteu (up201806279) <br/>
Francisca Almeida (up201806398) <br/>
João Gonçalves (up201806796) <br/>
Nuno Resende (up201806825) <br/>

---

## Product Vision

**A safe, self distanced, conference seat for everyone.**

## Elevator Pitch

Nowadays, due to COVID-19, everyone is afraid of attending conferences because we don't know who is sitting beside us. SMS has the solution for you. Our app can reserve your seat and immediately make it unavailable, alongside the seats immediatly next to yours. This way it's possible to keep a secure distance between all participants and confortably watch the session.

### Use case diagram

![Use Case Diagram](https://github.com/FEUP-ESOF-2020-21/open-cx-t6g2-sms/blob/master/docs/ESOF.png)

<p>

**Login**<br>
**Actor:** User.<br>
**Description:** This use case exists so that the user can login into their account, when they enter a correct username and password.<br>
**Preconditions and Postconditions:** After doing login the user can access the account's information.<br>
**Normal Flow:**<br>
1. The user enters an username and a password in the correspondent boxes.
2. The user the presses the button 'Log In'.
3. If the username and password are associated to an account with administration clearence, the application opens the administration area, otherwise it enters the atendee area.

**Alternative Flows and Exceptions:**<br>
1. The user enters an username and a password in the correspondent boxes.
2. The user the presses the button 'Log In'.
3. If the username and password don't match any account in the database, a message of error appears on the screen.
4. The user may press the button 'Ok' and return to the login screen.
</p>

<p>

**Logout**<br>
**Actor:** User.<br>
**Description:** This use case exists so that the user can logout of their account.<br>
**Preconditions and Postconditions:** After doing logout the user can no longer access the account's information.<br>
**Normal Flow:**<br>
1. The user presses the perfil icon in the upper bar.
2. The user presses the button 'Log Out'.
3. The user returns to the login screen.
</p>

<p>

**Register**<br>
**Actor:** Atendee.<br>
**Description:** This use case exists so that the atendees can create an account with an username and a password of their choice.<br>
**Preconditions and Postconditions:** To be redirected to the register page, the atendee must be logged out and in the initial screen (login) and click the phrase 'Register Here' bellow the button 'Log in'. After the atendee registers, the login is automatically done. <br>
**Normal Flow:**<br>
1. If the atendee doesn't have an account, they may press the 'Register' button.
2. A page will appear where the atendee inserts his account's information.
3. The atendee presses the button 'Register'.
4. The app redirects the atendee to their new account, and opens the folder 'All Conferences', where all events are shown.
**Alternative Flows and Exceptions:**<br>
1. If the atendee doesn't have an account, they may press the 'Register' button.
2. A page will appear where the atendee inserts his account's information.
3. The atendee presses the button 'Register'.
4. If a field does not have any information, or if the password and confirm password are not the same, a message of error appears on the screen.
5. The user may press the button 'Ok' and return to the register screen.
</p>

<p>

**Make a Reservation**<br>
**Actor:** Atendee.<br>
**Description:** An atendee must be able to make a reservation for a conference if there still are seats available for the session.<br>
**Preconditions and Postconditions:** To be able to make a reservation, the atendee has to first select a conference and an available seat. After the reservation is made, the conference must be added in the atendee's 'My Conferences' and the seat must be shown as occupied for other users.<br>
**Normal Flow:**<br>
1. The atendee must first select a conference in the folder 'All Conferences', shown as still having available seats, that is, associated to the color green.
2. The atendee chooses a seat that is shown as available, also colored green.
3. The atendee presses the button 'Reserve the seat'.
4. The application returns to the folder "All Conferences", where the now reserved event is painted yellow.
</p>

<p>

**Cancel Reservation**<br>
**Actor:** Atendee.<br>
**Description:** An atendee must be able to cancel a reservation for a conference they had made a reservation on.<br>
**Preconditions and Postconditions:** To be able to cancel a reservation, the atendee has to have made a reservation to the conference. After the reservation is cancelled, the conference must not appear in the atendee's 'My Conferences' and the seat must be shown as free for other users.<br>
**Normal Flow:**<br>
1. The atendee must first select a conference in which they already have a reserved seat, that is, associated to the color yellow.
1. The atendee presses the button 'Cancel the reservation'.
2. The application returns to the folder "All Conferences", where the event now appears in a green background.
</p>

**See conferences atendee is going to**<br>
**Actor:** Atendee.<br>
**Description:** An atendee must be able to see all the conferences for which the have made a reservation.<br>
**Normal Flow:**<br>
1. The atendee presses the folder 'My Conferences' in the bottom of the page.
2. The information from all the conferences that the atendee has reserved is shown on the screen.
**Alternative Flows and Exceptions:**<br>
1. The atendee presses the folder 'My Conferences' in the bottom of the page.
2. If the atendde does not have any reservation, the folder with be empty.
</p>

<p>

**Create Conference**<br>
**Actor:** Administration.<br>
**Description:** This use case exists so that the administration can create new conferences.<br>
**Preconditions and Postconditions:** After being created, the conference must appear in the list of conferences.<br>
**Normal Flow:**<br>
1. The administration presses the floating button in the bottom of the screen.
2. The name, location, and both dates and hours that define the conference must be introduced.
3. The administration presses the button 'Add Conference'.
4. The application shows the list of conferences where the new conference is now present.

**Alternative Flows and Exceptions:**<br>
1. The administration presses the floating button in the bottom of the screen.
2. The name, location, and both dates and hours that define the conference must be introduced.
3. The administration presses the button 'Add Conference'.
4. If the first date is after the second date, a message of error appears on the screen. The same will happen if nothing is introduced in the fields name and location.
5. The administration must press the button 'Ok' and return to the creation of a new conference.
</p>

**Delete Conference**<br>
**Actor:** Administration.<br>
**Description:** This use case exists so that the administration can delete an already existing conference.<br>
**Preconditions and Postconditions:** The conference must exist to be deleted. After being deleted, the conference should disapear from the conference list.<br>
**Normal Flow:**<br>
1. The administration chooses a conference from the list presented to them.
2. A page with the conferences information will appear o screen. The administration clicks the floating button in the bottom os the screen.
3. The administration presses the button 'Remove Conference'.
4. The application shows the list of conferences where the conference is no longer present.
</p>

**Edit Conference**<br>
**Actor:** Administration.<br>
**Description:** This use case exists so that the administration can edit the details of an already existing conference.<br>
**Preconditions and Postconditions:** The conference must exist , for it to be edited. After being edited, the conference must appear in the list of conferences with the altered information.<br>
**Normal Flow:**<br>
1. The administration chooses a conference from the list presented to them.
2. A page with the conferences information will appear o screen. The administration clicks the floating button in the bottom os the screen.
3. The name, location, and both dates and hours that define the conference may be altered.
4. The administration presses the button 'Edit Conference'.
5. The application shows the list of conferences where the conference is now present with the new information.

**Alternative Flows and Exceptions:**<br>
1. The administration presses the floating button in the bottom of the screen.
2. The name, location, and both dates and hours that define the conference must be may be altered.
3. The administration presses the button 'Edit Conference'.
4. If the first date is after the second date defined previously, a message of error appears on the screen. The same will happen if either the field name or location is left without any information.
5. The administration must press the button 'Ok' and return to the creation of a new conference.
</p>

<p>

**Manage Conference Room Layout**<br>
**Actor:** Administration.<br>
**Description:** This use case exists so that the administration can change a room layout, increasing or decreasing the number of seats.<br>

</p>

<p>

**See seats that need to be sanitized**<br>
**Actor:** Administration.<br>
**Description:** The administration must be able to know which seats have been used by atendees and, therefore, will need to be sanitized.<br>
**Normal Flow:**<br>
1. The administration chooses a conference from the list presented to them.
2. A page with the conferences information will appear o screen. The seat arrangement appears on screen. 
</p>

### User stories
![User Story Map](https://github.com/FEUP-ESOF-2020-21/open-cx-t6g2-sms/blob/master/docs/user_story_map.png)
<p> 

As an atendee, I want to be to cancel a reservation once I've made one, so that I'm free to back away from that commitment.<br>
**Value:** Must-Have<br>
**Effort:** L<br>
**Acceptance Tests:**<br>

**Scenario**: Checking seat availability.

* **Given** that I am an user and I want to check the seat availability of a conference.
**When** I select a specific conference, **then** I should be shown the layout of the conference room, showing all available and unavailable seats.

**User interface mockups:** <br>

![User Story Mockup](https://github.com/FEUP-ESOF-2020-21/open-cx-t6g2-sms/blob/master/docs/Mocks/ReserveSeat.PNG)
</p>
<p>
 
As an atendee, I want to be able to reserve a seat, so that I can safely attend the event.<br>
**Value:** Must-Have<br>
**Effort:** M<br>
**Acceptance Tests:** <br>

**Scenario**: Reserving a seat.

* **Given** that I am an user and I want to reserve a seat.
**When** I select a seat that is available, **then** I should be able to make a reservation.

* **Given** that I am an user and I want to reserve a seat.
**When** I press the button to make a reservation, **then** the seat I reserved must be shown as unavailable in the "My Conferences" section.

* **Given** that I am an user and I want to reserve a seat.
**When** I select a seat that is not available, **then** nothing will happen.

**User interface mockups:** <br>

![User Story Mockup](https://github.com/FEUP-ESOF-2020-21/open-cx-t6g2-sms/blob/master/docs/Mocks/ReserveSeat.PNG)
</p>
<p>

As an atendee, I want to be able to cancel a reservation once I've made one, so that I'm free to back away from that commitment.<br>
**Value:** Should-Have<br>
**Effort:** M<br>
**Acceptance Tests:** <br>

**Scenario**: Cancelling a reservation.

* **Given** that I am an user and I want to cancel a reservation.
**When** I select the button to cancel a reservation, **then** the seat previously shown as unavailable is available again.

**User interface mockups:** <br>

![User Story Mockup](https://github.com/FEUP-ESOF-2020-21/open-cx-t6g2-sms/blob/master/docs/Mocks/CancelReservation.PNG)

</p>
<p>
 
As part of the administration, I want to be able to change the layout of each conference room, so that the seats can be correctly booked.<br>
**Value:** Could-Have<br>
**Effort:** L<br>
**Acceptance Tests:**<br>

**Scenario**: Changing the layout of a conference room.
</p>
<p>
 
As part of the administration, I want to be able to see the seats that need to be sanitized, so that I can send a team to clean them later.<br>
**Value:** Could-Have<br>
**Effort:** L<br>
**Acceptance Tests:**<br>

**Scenario**: Cleaning seats that need to be sanitized.
</p>
<p>
 
As the administration, I want to be able to manage the conferences, so that I organize the timetable and location for the events.<br>
**Value:** Should-Have<br>
**Effort:** L<br>
**Acceptance Tests:**<br>

**Scenario**: Managing conferences.

* **Given** that I am part of the administration and I want to create or edit a conference
  **When** when I insert a date to the end of the conference that is smaller than the date to the begin of the conference, **then** the program prints an error message.

* **Given** that I am part of the administration and I want to create or edit a conference
  **When** when I don't define a name or location for the conference, **then** the program prints an error message..

**User interface mockups:** <br>


![User Story Mockup](https://github.com/FEUP-ESOF-2020-21/open-cx-t6g2-sms/blob/master/docs/Mocks/AddConference.PNG)
![User Story Mockup](https://github.com/FEUP-ESOF-2020-21/open-cx-t6g2-sms/blob/master/docs/Mocks/EditConference.PNG)

</p>
<p>
 
As an user, I want to be able to register and log in, so that I can access the main page of the application.<br>
**Value:** Must-Have<br>
**Effort:** M<br>
**Acceptance Tests**:<br>

**Scenario**: Logging in/Registering.
 
* **Given** that I am an user, I am prompted to log in.
  **When** I don't have an account and press the "register" button, **then** I should go to the register page.

* **Given** that I am an user, I am prompted to log in.
  **When** I already have a valid account, **then** I should go to the home page.
  
* **Given** that I am an user, and I want to log in.
  **When** I input invalid data, **then** I should be warned with a message of "Invalid Information".

* **Given** that I am an user, and I want to register.
  **When** I input valid data, **then** I should go to the home page.

* **Given** that I am an user, and I am prompted to register.
  **When** I already have an account and press the "login" button, **then** I should go to the login page.

* **Given** that I am an user, and I want to register.
  **When** I input invalid data, **then** I should be warned with a message of "Invalid Information".

**User interface mockups:** <br>

![User Story Mockup](https://github.com/FEUP-ESOF-2020-21/open-cx-t6g2-sms/blob/master/docs/Mockups/mockup_1.png)
![User Story Mockup](https://github.com/FEUP-ESOF-2020-21/open-cx-t6g2-sms/blob/master/docs/Mockups/mockup_2.png)
</p>
<p>
 

As an user, I want to be able to log out of my account, so that I can switch users.<br>
**Value:** Must-Have<br>
**Effort:** S<br>
**Acceptance Tests:**<br>

**Scenario**: Logging Out.

* **Given** that I am an user, and I want to log out.
  **When** I click on my profile in the top-right corner and choose to log out, **then** I should go back to the login page.

![User Story Mockup](https://github.com/FEUP-ESOF-2020-21/open-cx-t6g2-sms/blob/master/docs/Mocks/Logout.PNG)


</p>

As an user, I want to search for a conference, so that I can easily find the event I want to.<br>
**Value:** Should-Have<br>
**Effort:** M<br>
**Acceptance Tests:**<br>

**Scenario**: Searching for a conference by its name or location.

* **Given** that I am an user, and I want to search for a conference.
  **When** I input a text on the search bar with a location or a name, **then** I should be shown conferences with those properties.


![User Story Mockup](https://github.com/FEUP-ESOF-2020-21/open-cx-t6g2-sms/blob/master/docs/Mocks/Search.PNG)


As an user, I want to be able to choose a conference, so that I can see its information.<br>
**Value** Must-Have<br>
**Effort** L<br>
**Acceptance Tests:**<br>

**Scenario**: Choosing a conference.

* **Given** that I am an user, and I want to look for a conference.
  **When** I log in, **then** I can see all conferences available.


![User Story Mockup](https://github.com/FEUP-ESOF-2020-21/open-cx-t6g2-sms/blob/master/docs/Mocks/AllConferences.PNG)


### Domain model

![Domain Model](https://github.com/FEUP-ESOF-2020-21/open-cx-t6g2-sms/blob/master/docs/problem_domain.png)

## Architecture and Design

### Logical architecture

![Logical Architecture](https://github.com/FEUP-ESOF-2020-21/open-cx-t6g2-sms/blob/master/docs/Logic.png)

Our project is organized in an MVC-like structure. The Model package contains components for the objects present: conference, user and date. All of these are informations that need to be stored and manipulated throught the product's usage. In the View package, the conference_view component describes how a conference is presented to the screen and handles the user interactability. The Controller package contains information on the various pages of our project, pages to handle the registry and sign in processes, the main page, the page for the administration, pages for seat reservation. etc. These are the components that tie together all of the program's pieces.

### Physical architecture

![Physical Architecture](https://github.com/FEUP-ESOF-2020-21/open-cx-t6g2-sms/blob/master/docs/Physical.png)

The only thing needed to run the project is a smartphone. The user interacts with the application directly by touching specific buttons whenever they are prompted. Since we have some handling of the user's inputs, we called it "hidden processing", as these are changes in the database, prompts for the user at an adequate time, alert dialogs on invalid inputs, and all other unpredictable actions that need to be taken in consideration.

The technology used is Flutter, a Dart framework that allows the app to run both on Android and iOS operating systems.


---
## Test

---
## Configuration and change management

## Project management


## Evolution - contributions to open-cx