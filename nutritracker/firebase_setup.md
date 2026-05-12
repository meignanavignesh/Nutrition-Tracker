# Firebase Setup Guide for NutriTracker

## Step 1: Create Firebase Project

1. Go to [Firebase Console](https://console.firebase.google.com/)
2. Click "Create a project"
3. Enter project name: "nutritracker-app" (or your preferred name)
4. Enable Google Analytics (optional)
5. Click "Create project"

## Step 2: Add Android App to Firebase

1. In Firebase Console, click "Add app" → Android icon
2. Enter package name: `com.example.nutritracker`
3. Enter app nickname: "NutriTracker"
4. Click "Register app"

## Step 3: Download Configuration File

1. Download `google-services.json`
2. Replace the existing `app/google-services.json` file with your downloaded file
3. Click "Next" and "Continue to console"

## Step 4: Enable Authentication

1. In Firebase Console, go to "Authentication"
2. Click "Get started"
3. Go to "Sign-in method" tab
4. Enable "Email/Password" provider
5. Click "Save"

## Step 5: Set up Firestore Database

1. In Firebase Console, go to "Firestore Database"
2. Click "Create database"
3. Choose "Start in test mode" (for development)
4. Select a location (choose closest to your users)
5. Click "Done"

## Step 6: Configure Firestore Rules (Optional - for production)

```javascript
rules_version = '2';
service cloud.firestore {
  match /databases/{database}/documents {
    // Users can only access their own activities
    match /user_activities/{document} {
      allow read, write: if request.auth != null && request.auth.uid == resource.data.userId;
    }
  }
}
```

## Step 7: Test the Setup

1. Build and run your app
2. Create a new account with email/password
3. Check Firebase Console:
   - Authentication → Users (should show your new user)
   - Firestore → Data (should show user_activities collection after using the app)

## Important Notes

- The current `google-services.json` is a template - replace it with your real configuration
- Enable "Email/Password" authentication in Firebase Console
- Firestore is set to test mode - configure proper security rules for production
- All user activities are automatically stored in Firestore when users interact with the app

## Features Implemented

### Authentication
- Email/password registration
- Email/password login
- Automatic login state persistence
- Logout functionality

### Activity Tracking
- Login/logout events
- App open events
- Food search events
- Food addition events
- All activities stored with timestamps in Firestore

### Database Structure
```
user_activities (collection)
├── document_id (auto-generated)
    ├── userId: string (Firebase Auth UID)
    ├── activityType: string ("LOGIN", "LOGOUT", "APP_OPEN", "FOOD_SEARCH", "ADD_FOOD")
    ├── activityDetails: string (description of the activity)
    └── timestamp: Timestamp (when the activity occurred)
```