# Cinema

Description

The Cinema app is a movie and TV series discovery application built using Flutter. The app allows users to explore the latest movies, TV series, and trending content, all in one place. With this app, you can watch trailers, read reviews, view ratings, and save your favorite films and series. It also provides detailed descriptions, similar recommendations, and various sections like "Trending", "Popular", "Top-rated", and "Upcoming" movies and series.


# Key Features:

- Watch Trailers: Watch trailers for the latest movies and TV series.
- Search: Search for any movie or TV series by title.
- Detailed Information: View complete descriptions, ratings, reviews, revenue, and short stories for every movie and series.
- Favorites: Add movies and series to your favorites for easy access.
- Recommendations: Get similar movie and series recommendations from the description page.
- Trending Content: Stay updated with the trending movies and series (weekly/daily).
- Popular Now: Explore the most popular content at the moment.
- Top-rated: Discover the highest-rated movies and series.
- Upcoming Section: Get a sneak peek of upcoming movies and series.


# Technologies Used

- Flutter: Dart-based framework for building cross-platform mobile applications.
- Cubit: A state management library used in the app.
- MVVM (Model-View-ViewModel): Architecture pattern used for organizing the app.
- The Movie Database (TMDb) API: External API for fetching and displaying movie data such as ratings, trailers, and reviews.

 # Project Structure
 The app is organized into core and feature modules.

Core:
The core module contains essential components that are used throughout the application, such as:

- DI (Dependency Injection): Setup for managing dependencies.
- Networking: API communication and data fetching.
- Resources: Resources such as images, strings, and other assets.
- Routing: Navigation management within the app.
- Widgets: Reusable widgets for UI components.
- Utils: Utility functions to assist various app functionalities.
- Features:
- The features module contains the following main sections:

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

<img src="https://github.com/user-attachments/assets/2b885a54-52c4-4307-8be8-dfb3085e2c7c" alt="singip" width="300" height="450">
<img src="https://github.com/user-attachments/assets/78989dbe-b82c-470e-ac7c-c4cbe7502802" alt="forget_pass" width="300" height="450">
<img src="https://github.com/user-attachments/assets/41971c4b-332b-4ac9-8f29-d2ab7e17e4e7" alt="singup" width="300" height="450">
<img src="https://github.com/user-attachments/assets/6f8f4b67-a945-4c77-9ca2-a26e0e45c1e0" alt="home" width="300" height="450">
<img src="https://github.com/user-attachments/assets/6229dcc5-c506-4d7e-8337-940cc81bf24a" alt="Home2" width="300" height="450">
<img src="https://github.com/user-attachments/assets/2bd7f42a-1377-42ac-b5ac-51fd3875b4a4" alt="search" width="300" height="450">
<img src="https://github.com/user-attachments/assets/21f148c7-c6b8-4a13-af3a-637d52bd79a3" alt="saved" width="300" height="450">
<img src="https://github.com/user-attachments/assets/2da65ee8-639d-470f-8967-508be07006fe" alt="details" width="300" height="450">
<img src="https://github.com/user-attachments/assets/855b4f1c-dfe7-4715-a0cf-5e4f50c38a4f" alt="details2" width="300" height="450">
<img src="https://github.com/user-attachments/assets/1f00a694-2dc5-417b-9ddb-f31b140c3e4e" alt="reviews" width="300" height="450">


## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
