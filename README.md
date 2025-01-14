# Cinema

Description

The Cinema app is a movie and TV series discovery application built using Flutter. The app allows users to explore the latest movies, TV series, and trending content, all in one place. With this app, you can watch trailers, read reviews, view ratings, and save your favorite films and series. It also provides detailed descriptions, similar recommendations, and various sections like "Trending", "Popular", "Top-rated", and "Upcoming" movies and series.


# Key Features:

Watch Trailers: Watch trailers for the latest movies and TV series.
Search: Search for any movie or TV series by title.
Detailed Information: View complete descriptions, ratings, reviews, revenue, and short stories for every movie and series.
Favorites: Add movies and series to your favorites for easy access.
Recommendations: Get similar movie and series recommendations from the description page.
Trending Content: Stay updated with the trending movies and series (weekly/daily).
Popular Now: Explore the most popular content at the moment.
Top-rated: Discover the highest-rated movies and series.
Upcoming Section: Get a sneak peek of upcoming movies and series.


# Technologies Used

Flutter: Dart-based framework for building cross-platform mobile applications.
Cubit: A state management library used in the app.
MVVM (Model-View-ViewModel): Architecture pattern used for organizing the app.
The Movie Database (TMDb) API: External API for fetching and displaying movie data such as ratings, trailers, and reviews.

 # Project Structure
 The app is organized into core and feature modules.

Core:
The core module contains essential components that are used throughout the application, such as:

DI (Dependency Injection): Setup for managing dependencies.
Networking: API communication and data fetching.
Resources: Resources such as images, strings, and other assets.
Routing: Navigation management within the app.
Widgets: Reusable widgets for UI components.
Utils: Utility functions to assist various app functionalities.
Features:
The features module contains the following main sections:

Splash: Launch screen when the app starts.
Auth: User authentication and login.
Home: The main screen where users explore movies and series.
Data:
Models: Data models for movies and series.
Repository: Logic for fetching data from the API.
Presentation:
Manager: Manages UI state and logic.
Views: The UI components that display data to users.

## App Screenshot
![singup png](https://github.com/user-attachments/assets/2b885a54-52c4-4307-8be8-dfb3085e2c7c)

<img src="https://github.com/user-attachments/assets/c012f645-a425-43ca-9b3e-0667551a7f32" alt="Splash Screen" width="300" height="450">
<img src="https://github.com/user-attachments/assets/91c7016e-a6d6-4855-8304-a2c678affecc" alt="Splash Screen" width="300" height="450">
<img src="https://github.com/user-attachments/assets/0b357596-2a99-4e36-a97f-247f6b55f424" alt="Onboarding Screen" width="300" height="450">
<img src="https://github.com/user-attachments/assets/456bffe3-7125-4b38-880c-5f9919104daa" alt="Authentication Screen" width="300" height="450">
<img src="https://github.com/user-attachments/assets/9e19f12e-99aa-4c3e-8114-023f17b093ea" alt="Home Screen" width="300" height="450">
<img src="https://github.com/user-attachments/assets/f95936a4-bc21-407c-bb31-73a8d46e203b" alt="Sermons Screen" width="300" height="450">
<img src="https://github.com/user-attachments/assets/e0e64b71-1a23-4e81-9c4c-5ee4ab69f26a" alt="Qur'an Recitation Screen" width="300" height="450">
<img src="https://github.com/user-attachments/assets/75428da9-2786-40d6-add6-ae11c668adc8" alt="Hadith Screen" width="300" height="450">
<img src="https://github.com/user-attachments/assets/8984035f-d332-425c-9317-c6f3dd1b142e" alt="Book Library Screen" width="300" height="450">


## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
