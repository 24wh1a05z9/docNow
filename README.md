# DocNow – Health Appointment Booking Application

**Your Health, Just a Tap Away.**

## 1. Introduction

DocNow is a Flutter-based Health Appointment Booking Application designed to make healthcare services more accessible and convenient. It allows users to explore available doctors, view their details, select appointment dates and time slots, and manage their appointments through a simple and user-friendly interface.

The application aims to reduce the effort involved in finding doctors and scheduling medical consultations.

## 2. Objectives

- To provide an easy platform for finding doctors.
- To allow users to search doctors by name and specialization.
- To simplify the appointment booking process.
- To enable users to view and manage their appointments.
- To provide an option to view and update personal profile details.
- To create a simple, responsive and user-friendly healthcare application.

## 3. Technologies Used

| Technology | Purpose |
|---|---|
| Flutter | Application development framework |
| Dart | Programming language |
| Material Design | User interface components |
| GitHub | Source code management |
| GitHub Actions | Automated web application build and deployment |
| GitHub Pages | Web application hosting |

## 4. Modules of the Application

### 4.1 Home Module
- Displays a welcome screen.
- Provides a search option to find doctors.
- Displays available doctors.
- Provides navigation to other sections.

### 4.2 Doctor Module
- Displays a list of available doctors.
- Shows doctor names and specializations.
- Provides search functionality.
- Allows users to view individual doctor details.

### 4.3 Doctor Details Module
- Displays the doctor's name and specialization.
- Shows years of experience.
- Displays consultation fees.
- Provides information about the doctor.
- Includes a Book Appointment option.

### 4.4 Appointment Booking Module
- Allows users to select an appointment date.
- Provides available time slots.
- Allows users to confirm their appointment.
- Displays a confirmation message after successful booking.

### 4.5 My Appointments Module
- Displays booked appointments.
- Shows doctor details, appointment date and time.
- Allows users to cancel appointments.
- Displays a message when no appointments are available.

### 4.6 Profile Module
- Displays user information.
- Shows name, student ID, email address, phone number and age.
- Allows users to edit and update their profile details.

## 5. Application Workflow

1. The user opens the DocNow application.
2. The home page displays available doctors.
3. The user searches for a doctor by name or specialization.
4. The user selects a doctor and views the details.
5. The user chooses an appointment date and time.
6. The user confirms the appointment.
7. The booking is displayed in the My Appointments section.
8. The user can also update personal information through the Profile section.

## 6. Key Features

- Simple and user-friendly interface.
- Doctor search functionality.
- Doctor information and consultation fee display.
- Appointment date selection.
- Multiple time-slot selection.
- Appointment confirmation.
- Appointment cancellation.
- Editable user profile.
- Bottom navigation for easy access to application modules.

## 7. Project Structure

```text
docNow/
│
├── lib/
│   └── main.dart
│
├── web/
│   └── index.html
│
├── .github/
│   └── workflows/
│       └── deploy.yml
│
├── pubspec.yaml
└── README.md
```

## 8. Working of the Application

The application uses Flutter widgets to create its user interface. Dart is used to implement the application logic, including doctor searching, navigation, appointment selection, booking confirmation and profile editing.

The current prototype stores doctor information, appointments and profile details in in-memory data structures. Therefore, the information is available while the application is running but is not permanently stored after restarting the application.

## 9. Future Enhancements

- User registration and login.
- Database integration for permanent data storage.
- Doctor registration and management.
- Real-time doctor availability.
- Online appointment payments.
- Appointment reminders and notifications.
- Video consultation functionality.
- Patient medical history management.

## 10. Conclusion

DocNow provides a simple and convenient approach to doctor discovery and appointment booking. It brings essential healthcare appointment features together in one application. The project demonstrates the use of Flutter and Dart for developing a structured, interactive and user-friendly application.

The application can be further enhanced with database integration, authentication and real-time healthcare services.

---

**Project Name:** DocNow – Health Appointment Booking Application

**Developed Using:** Flutter and Dart

**Repository:** GitHub – DocNow
