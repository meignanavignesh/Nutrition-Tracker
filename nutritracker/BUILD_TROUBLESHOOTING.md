# 🔧 Build Error Troubleshooting Guide

## ✅ Fixed Issues

### 1. **Method getName() Error** - RESOLVED ✅
**Error**: `cannot find symbol method getName()`
**Fix**: Changed `selectedFood.getName()` to `selectedFood.getDescription()`
**Location**: `AddFoodActivity.java` line ~169

## 🛠️ If You Still Have Build Errors

### Step 1: Clean and Rebuild
```
1. Build → Clean Project
2. Build → Rebuild Project
3. File → Sync Project with Gradle Files
```

### Step 2: Check Common Issues

#### Missing Imports
If you see "cannot find symbol" errors, add these imports:

**In HomeActivity.java:**
```java
import com.example.nutritracker.firebase.NutritionEntry;
import java.util.List;
import java.util.Calendar;
import java.text.SimpleDateFormat;
```

**In FirebaseService.java:**
```java
import com.google.firebase.firestore.Query;
import com.google.firebase.firestore.QueryDocumentSnapshot;
```

#### Layout Errors
If you see layout errors, ensure these IDs exist in `activity_home.xml`:
- `tv_current_date`
- `btn_previous_day`
- `btn_next_day`
- `layout_date_navigation`

### Step 3: Gradle Sync Issues
If Gradle sync fails:

1. **Check internet connection** (Firebase dependencies need to download)
2. **Update Gradle** if prompted
3. **Invalidate Caches**: File → Invalidate Caches and Restart

### Step 4: Firebase Configuration
Ensure you have:
- ✅ Valid `google-services.json` in `app/` folder
- ✅ Google Services plugin in both `build.gradle.kts` files
- ✅ Firebase dependencies in `app/build.gradle.kts`

### Step 5: Android SDK Issues
If you see SDK-related errors:
1. **Tools → SDK Manager**
2. **Install missing SDK components**
3. **Update to latest SDK if needed**

## 🚨 Emergency Reset Steps

If nothing works, try this sequence:

1. **File → Invalidate Caches and Restart**
2. **Delete `.gradle` folder** in project root
3. **Build → Clean Project**
4. **File → Sync Project with Gradle Files**
5. **Build → Rebuild Project**

## ✅ Verification Steps

After fixing errors, verify:

1. **Build succeeds** without errors
2. **App installs** on emulator/device
3. **Login works** with Firebase
4. **Date navigation** functions properly
5. **Profile screen** opens correctly

## 📞 Common Error Messages & Solutions

### "Cannot resolve symbol 'NutritionEntry'"
**Solution**: Add import: `import com.example.nutritracker.firebase.NutritionEntry;`

### "Cannot find method getDescription()"
**Solution**: Ensure you're using `selectedFood.getDescription()` not `getName()`

### "Google Services plugin not found"
**Solution**: Check `build.gradle.kts` files have the Google Services plugin

### "Layout file not found"
**Solution**: Ensure all layout files exist and have correct names

The main error has been fixed - the app should build successfully now!