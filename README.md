# 🛒 Grocery App

A modern Flutter-based Grocery Shopping application that provides users with a smooth and intuitive shopping experience. The app uses **Firebase Authentication** for secure user login/signup and **Cloud Firestore** to store user information.

---

## 📱 Features

- 🔐 User Authentication
  - Sign Up
  - Login
  - Logout
  - Password validation
  - Show/Hide password

- 👤 User Profile
  - Display logged-in user's information
  - Fetch user details from Cloud Firestore
  - Personalized account screen

- 🛍 Shopping
  - Browse grocery products
  - Product categories
  - Product details
  - Shopping cart

- ❤️ Favorites
  - Save favorite products
  - View favorite items

- 📦 Orders
  - Order history
  - Order details

- 🎁 Promo Codes
  - View available promotions
  - Discount vouchers

- ⚙ Settings
  - Notifications toggle
  - Dark mode toggle
  - Help & Support
  - Logout confirmation dialog

---

## 🚀 Technologies Used

- Flutter
- Dart
- Firebase Authentication
- Cloud Firestore
- Material Design

---

## 📂 Project Structure

```
lib/
│
├── screens/
│   ├── onboarding_screen.dart
│   ├── signup_screen.dart
│   ├── login_screen.dart
│   ├── home_screen.dart
│   ├── account_screen.dart
│   ├── cart_screen.dart
│   ├── favourite_screen.dart
│   └── ...
│
├── widgets/
│
├── models/
│
├── services/
│
├── firebase_options.dart
│
└── main.dart
```

---

## 🔥 Firebase Integration

This project uses Firebase for authentication and user management.

### Authentication

- Email & Password Sign Up
- Email & Password Login
- Logout

### Cloud Firestore

Each registered user is stored inside the **users** collection.

Example:

```
users
   |
   |-- UID
         |
         |-- name
         |-- email
         |-- phone
         |-- createdAt
```

---

## ⚙ Installation

### Clone the repository

```bash
git clone https://github.com/yourusername/grocery-app.git
```

### Navigate to the project

```bash
cd grocery-app
```

### Install dependencies

```bash
flutter pub get
```

### Configure Firebase

1. Create a Firebase project.
2. Enable **Email/Password Authentication**.
3. Add Android/Web/iOS apps.
4. Run:

```bash
flutterfire configure
```

### Run the application

```bash
flutter run
```

---

## 📸 Screens

- Splash Screen
- Onboarding Screen
- Login
- Signup
- Home
- Categories
- Product Details
- Cart
- Favourite
- Account

---

## 🎯 Future Improvements

- Product search
- Wishlist synchronization
- Payment Gateway
- Order Tracking
- Push Notifications
- Profile Editing
- Address Management
- Product Reviews
- Admin Dashboard

---

## 👨‍💻 Developer

**Abdul Basit**

Junior Flutter Developer

GitHub: https://github.com/yourusername

LinkedIn: https://linkedin.com/in/yourprofile

---

## 📄 License

This project is developed for learning purposes and portfolio demonstration.
