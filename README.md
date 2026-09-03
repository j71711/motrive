# 🚗 Motrive

**Motrive** is a Flutter mobile application designed to help drivers manage their vehicles, stay prepared for emergencies, and keep important vehicle-related information organized in one place.

The app focuses on providing a simple and reliable experience for **vehicle management, emergency assistance, and user safety**.

## ✨ Features

* 🔐 **Authentication**

  * User registration and login
  * Google Sign-In
  * Secure authentication with Supabase

* 🚨 **SOS Emergency System**

  * Quickly trigger an emergency alert
  * Send emergency notifications
  * Access emergency services
  * Location-based emergency assistance

* 👥 **Emergency Contacts**

  * Add and manage emergency contacts
  * View saved emergency contacts
  * Use contacts during emergency situations

* 📍 **Location Services**

  * Retrieve the user's current location
  * Support location-based emergency functionality

* 🌐 **Arabic & English**

  * Full localization support
  * Arabic 🇸🇦 and English 🇬🇧 interfaces

* 👤 **Profile & User Agreement**

  * Manage user information
  * Agreement and consent flow
  * User profile management

## 🛠️ Technologies

| Technology            | Usage                               |
| --------------------- | ----------------------------------- |
| **Flutter**           | Cross-platform mobile development   |
| **Dart**              | Programming language                |
| **BLoC / Cubit**      | State management                    |
| **Supabase**          | Authentication and backend services |
| **Google Sign-In**    | User authentication                 |
| **Geolocator**        | Location services                   |
| **Dio**               | API/network requests                |
| **GetIt**             | Dependency injection                |
| **Injectable**        | Dependency injection configuration  |
| **GoRouter**          | Navigation                          |
| **Freezed**           | Data models and code generation     |
| **Easy Localization** | Arabic & English localization       |

## 🏗️ Architecture

Motrive follows a **clean, feature-based architecture** to keep the codebase scalable and maintainable.

```text
lib/
├── core/
│   ├── config/
│   ├── constants/
│   ├── services/
│   └── ...
│
├── features/
│   ├── auth/
│   ├── home/
│   │   └── sub/
│   │       └── sos/
│   │
│   └── profile/
│       └── sub/
│           └── emergency_contact/
│
└── ...
```

The application separates responsibilities into:

* **Presentation** — Screens, widgets, Cubits
* **Domain** — Entities, repositories, use cases
* **Data** — Data sources, models, repository implementations
* **Core** — Shared services, configuration, constants, and utilities

## 🔐 Security

Sensitive configuration files are intentionally excluded from the repository.

For example:

```text
lib/core/config/env.g.dart
```

is excluded through `.gitignore` and should be configured locally.

> **Never commit API keys, passwords, private tokens, or other sensitive credentials to GitHub.**

## 🚀 Getting Started

### 1. Clone the repository

```bash
git clone https://github.com/j71711/motrive.git
```

### 2. Navigate to the project

```bash
cd motrive
```

### 3. Install dependencies

```bash
flutter pub get
```

### 4. Configure environment variables

Create/configure the required environment file locally.

Do **not** commit sensitive credentials to GitHub.

### 5. Run the application

```bash
flutter run
```

## 📱 Supported Platforms

* Android
* iOS

## 🧪 Development

Generate required files when needed:

```bash
dart run build_runner build --delete-conflicting-outputs
```

## 📂 Project Highlights

Some of the main areas implemented in Motrive include:

* Authentication and Google Sign-In
* SOS emergency workflow
* Emergency contact management
* Location services
* Supabase integration
* Arabic/English localization
* Clean architecture
* BLoC/Cubit state management
* Dependency injection
* Repository and use-case patterns

## 👩🏻‍💻 Developer

**Jalnar Alharthi ·  Hattem Batayah · Dalal faleh**


### Tech Interests

* Flutter & Dart
* Mobile Application Development
* Clean Architecture
* BLoC State Management
* Backend Integration
* Supabase
* UI/UX


### 📸 Screenshots

## 📸 Screenshots



<p align="center">
  <img src="https://github.com/user-attachments/assets/ed923b3a-19c8-4566-88c8-cd473fe852b8" width="150" />
  <img src="https://github.com/user-attachments/assets/d7216ac0-f712-44eb-9d5e-b666bad509c9" width="150" />
  <img src="https://github.com/user-attachments/assets/9f8705f4-1fe3-4f5c-89f3-c2135063e5c3" width="150" />
  <img src="https://github.com/user-attachments/assets/cf5cec6e-2f49-4dde-942b-124c6417eae1" width="150" />
  <img src="https://github.com/user-attachments/assets/0ed9ae80-b6cf-4204-b559-f696dede667d" width="150" />
</p>

<p align="center">
  <img src="https://github.com/user-attachments/assets/981b4781-b4a2-41bc-a045-2a8d6d82a1fa" width="150" />
  <img src="https://github.com/user-attachments/assets/df9ec92b-30b2-45b9-a144-6b4b14e8dfe4" width="150" />
  <img src="https://github.com/user-attachments/assets/093ba7c3-93b2-45f2-a075-eb29661ff5db" width="150" />
  <img src="https://github.com/user-attachments/assets/5152fdaa-e22b-458b-8ce4-35fd5e59ba9f" width="150" />
  <img src="https://github.com/user-attachments/assets/5c98a50b-d62c-46ef-8d55-a5536451559d" width="150" />
</p>


