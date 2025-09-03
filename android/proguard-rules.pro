# Kotlin Parcelize
-dontwarn kotlinx.parcelize.Parcelize

# Suppress desugared Java util warnings
-dontwarn j$.util.**

# Don't warn about deprecated methods
-keepclassmembers class j$.util.concurrent.ConcurrentHashMap$TreeBin {
  int lockState;
}

-keepclassmembers class j$.util.concurrent.ConcurrentHashMap {
  int sizeCtl;
  int transferIndex;
  long baseCount;
  int cellsBusy;
}

-keepclassmembers class j$.util.concurrent.ConcurrentHashMap$CounterCell {
  long value;
}

-keepclassmembers class j$.util.IntSummaryStatistics {
  long count;
  long sum;
  int min;
  int max;
}

-keepclassmembers class j$.util.LongSummaryStatistics {
  long count;
  long sum;
  long min;
  long max;
}

-keepclassmembers class j$.util.DoubleSummaryStatistics {
  long count;
  double sum;
  double min;
  double max;
}

# Flutter related
-keep class io.flutter.app.** { *; }
-keep class io.flutter.plugins.** { *; }
-keep class io.flutter.embedding.** { *; }

# Keep Firebase
-keep class com.google.firebase.** { *; }
-dontwarn com.google.firebase.**

# Keep Google Play Services
-keep class com.google.android.gms.** { *; }
-dontwarn com.google.android.gms.**

# Keep flutter_local_notifications
-keep class com.dexterous.** { *; }
-dontwarn com.dexterous.**

# Keep models (Gson serialization)
-keepclassmembers class * {
    @com.google.gson.annotations.SerializedName <fields>;
}
