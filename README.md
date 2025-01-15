# 🎥 Naai - Anime Explorer App

Naai is a Flutter-based application that allows users to explore, discover, and learn more about their favorite anime series. Naai is the perfect tool for anime enthusiasts with features like dynamic API integration, offline storage, and a sleek user interface.

---

## 📱 **Features**

- **Anime Details**: Browse detailed information about anime, including synopses, ratings, trailers, and genres.
- **Dynamic Content**: Fetch real-time anime data from a remote API.
- **Offline Support**: Save and access data offline using `Hive`.
- **State Management**: Manage UI state seamlessly with the `provider` package.
- **Trailer Viewing**: Launch YouTube trailers directly from the app using `url_launcher`.

---

## 🛠 **Tech Stack**

- **Flutter**: Cross-platform framework for app development.
- **Dio**: HTTP client for efficient API calls.
- **Hive**: Lightweight database for local data storage.
- **Provider**: State management solution for dynamic UI updates.
- **Url Launcher**: Open links and external apps.

---

## 📂 **Project Structure**

```plaintext
lib/
├── main.dart                 # App entry point
├── api.json                  # Sample API data file
├── models/                   # Data models
│   ├── anime_model.dart      # Anime data structure
├── providers/                # State management
│   ├── anime_provider.dart   # Logic for anime data
├── services/                 # API services
│   └── api_service.dart      # Handles API calls
├── screens/                  # App screens
│   ├── anime_list_screen.dart  # Displays the list of anime
│   ├── anime_detail_screen.dart # Anime details screen
├── widgets/                  # UI components
│   ├── anime_card.dart       # Anime display card widget
└── assets/                   # App assets
    └── images/               # Images and other static assets
