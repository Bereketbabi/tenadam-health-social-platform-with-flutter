# Tenadam - Health-Focused Social Platform for Ethiopia

## Overview
Tenadam is a health-focused social platform designed specifically for Ethiopian users, built using Flutter and Firebase. The app creates a dedicated space for health-related discussions, information sharing, and community support.

## Features

- **Health Communities**: Users can create or join communities focused on specific health topics like nutrition, mental health, or chronic conditions. Each community serves as a dedicated space for specialized discussions.

- **Content Sharing**: Users can create posts in three formats:
  - Text-only health questions or information
  - Images with captions (e.g., health infographics)
  - External links to health resources with descriptions

- **Engagement System**: A comprehensive interaction system including:
  - Upvote/downvote mechanisms to highlight quality content
  - Comment threads for discussion on health topics
  - Health points (karma) earned through positive contributions
  - Awards that users can give to especially helpful posts

- **User Authentication**: 
  - Google Sign-In integration for quick, secure account creation
  - Guest browsing mode allowing users to view content without signing up
  - Profile customization with health interests and privacy settings

- **Moderation System**: Tools to maintain content quality including post review, reporting options, and community guideline enforcement.

- **Credibility Rating**: System that scores and displays user reliability based on community feedback and contribution quality.


- **Authentication**  
  - Google Authentication  
  - Guest Authentication  

- **Community Features**  
  - Create Community  
  - Join Community  
  - Community Profile (Avatar, Banner, Members)  
  - Edit Community Description and Avatar  

- **Post Features**  
  - Create Post (Link only, Photo, Text only)  
  - Display Posts from Communities User is Part of  
  - Upvote, Downvote  
  - Comment on Posts  
  - Award a Post  
  - Update Karma  

- **Moderation Features**  
  - Add Moderators  
  - Moderator - Remove Post  
  - Delete Post  

- **User Profile**  
  - Profile Avatar and Banner  

- **UI & Experience**  
  - Theme Switch (Light/Dark Mode)  
  - Responsive UI

## Technologies Used
- **Frontend**: Flutter & Dart
- **Backend**: Firebase (Authentication, Firestore, Storage)
- **State Management**: Provider
- **Design**: Custom UI components following Material Design principles



## Installation

FIRST CREATE A FIREBASE ACCOUNT 
ENABLE AUTHENTICATION
```bash
# Clone this repository
git clone https://github.com/yourusername/tenadam.git

# Navigate to the project folder
cd tenadam

# Install dependencies
flutter pub get

# Run the app
flutter run
```

## Project Structure
```
lib/
├── models/         # Data models
├── screens/        # App screens
├── services/       # Firebase and other services
├── utils/          # Helper functions
├── widgets/        # Reusable UI components
└── main.dart       # App entry point
```

## Current Status
Tenadam has been successfully developed as a project with all core functionalities implemented and working. The app is believed it addresses the need for a dedicated health discussion platform in Ethiopia.

## Future Improvements
- Implement local language support for all Ethiopian languages
- Add offline functionality with data syncing
- Integrate with local health resources and emergency services
- Develop a verification system for health professionals

