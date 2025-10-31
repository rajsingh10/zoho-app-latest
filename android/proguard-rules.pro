# ===============================
# ✅ Flutter App ProGuard Rules
# ===============================

# Kotlin Parcelize
-dontwarn kotlinx.parcelize.Parcelize

# Suppress desugared Java util warnings
-dontwarn j$.util.**
-keepclassmembers class j$.util.concurrent.** { *; }
-keepclassmembers class j$.util.*Statistics { *; }

# Flutter engine and plugins
-keep class io.flutter.app.** { *; }
-keep class io.flutter.plugins.** { *; }
-keep class io.flutter.embedding.** { *; }

# Firebase & Play Services
-keep class com.google.firebase.** { *; }
-dontwarn com.google.firebase.**
-keep class com.google.android.gms.** { *; }
-dontwarn com.google.android.gms.**

# flutter_local_notifications
-keep class com.dexterous.** { *; }
-dontwarn com.dexterous.**

# Zoho SalesIQ / Mobilisten
-keep class com.zohosalesiq.** { *; }
-dontwarn com.zohosalesiq.**

# Gson serialization
-keepclassmembers class * {
    @com.google.gson.annotations.SerializedName <fields>;
}

# Glide (if used)
-keep public class * implements com.bumptech.glide.module.AppGlideModule
-keep class com.bumptech.glide.** { *; }
-dontwarn com.bumptech.glide.**
