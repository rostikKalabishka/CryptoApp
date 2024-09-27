# CryptoApp

This Flutter-based cryptocurrency portfolio application allows users to manage their digital assets, view live data from the CoinGecko API, and store their portfolio securely in Firebase. The app supports Google authorization for easy user login and profile management.

## Features

- **User Authentication**: Google sign-in powered by Firebase.
- **Portfolio Management**: Store and track your cryptocurrency portfolio with Firebase Firestore.
- **Avatar Customization**: Users can upload their avatars using Firebase Storage.
- **Live Cryptocurrency Data**: Real-time data fetched from the CoinGecko API.
- **Charts**: Visualize portfolio trends using Syncfusion Flutter Charts.
- **Persistent Storage**: User preferences are stored locally using Shared Preferences.

## Tech Stack

- **Firebase**: Used for user authentication (Google Sign-In), storing the user portfolio in Firestore, and managing avatars with Firebase Storage.
- **CoinGecko API**: Provides real-time cryptocurrency market data.
- **Bloc**: Manages the app's state efficiently using the Bloc pattern.
- **AutoRouter**: Handles route management and navigation.
- **Shared Preferences**: Used for storing small amounts of user data locally.
- **Syncfusion Flutter Charts**: Displays charts and graphs for portfolio analysis.
- **Dio**: Makes API requests to fetch live cryptocurrency data.
- **GetIt**: Provides dependency injection for better project structure.
- **Image Picker**: Allows users to select images from their gallery for their profile avatars.
