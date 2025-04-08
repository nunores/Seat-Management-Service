# Seat Management Service

**A safe, self distanced, conference seat for everyone.**

​Seat Management Service is a mobile application developed using **Flutter**, developed with the **SCRUM methodology** in mind, and aimed at facilitating safe and socially distanced seating arrangements for conferences. The application allows attendees to reserve seats while automatically ensuring adjacent seats are marked unavailable to maintain appropriate distancing, improving safety during physical events.

This project was developed as part of the **Software Engineering** ([ESOF](https://sigarra.up.pt/feup/pt/ucurr_geral.ficha_uc_view?pv_ocorrencia_id=272705)) course at [FEUP](http://fe.up.pt/) with the dual goal of contributing to the **openCX** suite and deepening our understanding of agile development pratices.

## Features

- **User Authentication**: Attendees can register, log in, and manage their accounts.​
- **Seat Reservation**: Users can view available conferences, select seats, and make reservations. The system automatically disables adjacent seats to uphold social distancing protocols.​
- **Reservation Management**: Attendees have the option to cancel reservations, providing flexibility in commitment.​
- **Conference Management**: Administrators can create, edit, and delete conference details, including managing room layouts and seating capacities.​
- **Sanitation Tracking**: The system identifies seats that have been used and require sanitation, assisting in maintaining hygiene standards.

## Technologies
- **Language**: Dart
- **Framework**: Flutter
- **Development Methodology**: SCRUM (Agile)
- **Design Tools**: Figma (for UI mockups)

## Use case diagram

![Use Case Diagram](https://github.com/FEUP-ESOF-2020-21/open-cx-t6g2-sms/blob/master/docs/ESOF.png)

## Domain model

![Domain Model](https://github.com/FEUP-ESOF-2020-21/open-cx-t6g2-sms/blob/master/docs/problem_domain.png)

## Architecture and Design

### Logical architecture (MVC Pattern)

![Logical Architecture](https://github.com/FEUP-ESOF-2020-21/open-cx-t6g2-sms/blob/master/docs/Logic.png)

The project follows an MVC-like architecture, adapted for Flutter’s reactive framework.

- **Model**: Encapsulates the core data structures such as Conference, User, and Date. These represent the domain entities that are stored, manipulated, and shared across the application.

- **View**: Handles the user interface and interaction logic. For example, conference_view is responsible for rendering conference information on screen and managing how users interact with it. All visual components are built using Flutter’s widget system, ensuring a responsive and interactive UI.

- **Controller**: Manages the application's logic and ties the View and Model layers together. It includes the navigation between screens and handles user actions such as logging in, registering, reserving or cancelling seats, and accessing admin functionalities. Pages are organized around specific features, including user authentication, conference listing, seat reservation, and administration dashboards.

### Physical architecture

![Physical Architecture](https://github.com/FEUP-ESOF-2020-21/open-cx-t6g2-sms/blob/master/docs/Physical.png)

The application is designed to run on any modern smartphone, requiring no external dependencies beyond the device itself.

Users interact with the app through a **touch-based interface**, using the buttons to navigate and perform actions. While most interactions are direct, the system also includes background processing — such as **database updates**, **contextual prompts**, and **validation alerts** — which ensure smooth and consistent user experience. These background processes handle **input validation**, seat availability updates, and **real-time UI feedback** without requiring explicit user intervention.


## Contributors

Nuno Resende

João Gonçalves

Inês Quarteu

Francisca Almeida

## License

This project is licensed under the MIT License.
