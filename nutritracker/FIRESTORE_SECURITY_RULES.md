# 🔒 Firestore Security Rules for Account Deletion

## Recommended Security Rules

Add these rules to your Firestore Database to ensure proper data isolation and deletion permissions:

```javascript
rules_version = '2';
service cloud.firestore {
  match /databases/{database}/documents {
    
    // User Activities Collection
    match /user_activities/{document} {
      // Users can read, write, and delete their own activities
      allow read, write, delete: if request.auth != null && 
        request.auth.uid == resource.data.userId;
      
      // Allow creation if the userId matches the authenticated user
      allow create: if request.auth != null && 
        request.auth.uid == request.resource.data.userId;
    }
    
    // Nutrition Entries Collection
    match /nutrition_entries/{document} {
      // Users can read, write, and delete their own nutrition entries
      allow read, write, delete: if request.auth != null && 
        request.auth.uid == resource.data.userId;
      
      // Allow creation if the userId matches the authenticated user
      allow create: if request.auth != null && 
        request.auth.uid == request.resource.data.userId;
    }
  }
}
```

## How to Apply These Rules

1. **Go to Firebase Console**
2. **Select your project**
3. **Navigate to Firestore Database**
4. **Click on "Rules" tab**
5. **Replace the existing rules with the above code**
6. **Click "Publish"**

## What These Rules Do

### Security Features:
- ✅ **User Isolation**: Users can only access their own data
- ✅ **Delete Permission**: Users can delete their own data during account deletion
- ✅ **Create Permission**: Users can only create data with their own userId
- ✅ **Authentication Required**: All operations require valid Firebase Auth

### Account Deletion Support:
- ✅ **Batch Deletion**: Allows the app to delete user's data in batches
- ✅ **Complete Cleanup**: Ensures all user data can be removed
- ✅ **Privacy Compliance**: Supports GDPR "right to be forgotten"

## Testing the Rules

You can test these rules in the Firebase Console:

```javascript
// Test reading own data (should succeed)
auth.uid == "user123"
get(/databases/$(database)/documents/nutrition_entries/doc1)
// where doc1.userId == "user123"

// Test reading other user's data (should fail)
auth.uid == "user123"
get(/databases/$(database)/documents/nutrition_entries/doc2)
// where doc2.userId == "user456"
```

These rules ensure that account deletion works properly while maintaining security!