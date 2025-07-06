# 🛍️ ShopyWell


This project was developed by **Shahanas**, a self-taught Flutter developer, to showcase proficiency in **Flutter**, **Riverpod**, **Firebase**, and clean architecture using **MVVM**.

---

## 📱 Features

- 🚀 Splash and Onboarding Screens (first-time launch only)
- 👤 Firebase Email Authentication with Forgot Password
- 🏷️ Product Listing with Details Page
- 🛒 Add to Cart and Buy Now Functionality
- 🧭 Custom Bottom Navigation Bar
- 🎨 Visually Appealing Custom Widgets
- 🔐 Secure Token Handling and Storage
- 🗂️ Clean MVVM Project Structure
- 💳 Stripe Payment Integration (Buy Now)

---

## 🧑‍💻 Technologies Used

- Flutter & Dart
- Firebase Auth & Firestore Database
- Riverpod (State Management)
- MVVM Architecture Pattern
- Shared Preferences (for Onboarding)
- Stripe API for Payments
- Google Fonts & Introduction Screen Package
- Custom Widgets and Theming

---

## 🔁 Navigation Flow

```text
[Splash / Launch Screen]
        |
        v
[Onboarding Screen]
        |
        |--- If already completed ➜ Skip to ➜ Sign In
        |
        v
[Sign In Screen]
        |
        |--- "Forgot Password?" ➜ [Reset Password Screen]
        |
        v
[Home Screen] 🏠 (with Bottom Navigation)
        |
        |--- [Home Tab]
        |       
        |       
        |
        |--- [Cart Tab]
        |       |
        |       v
        |   View added items ➜ Checkout via **Buy Now**
        |
        |--- [Profile Tab]
                
