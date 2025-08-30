import 'dart:io' as io;

import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:salesiq_mobilisten/salesiq_mobilisten.dart';
import 'package:sizer/sizer.dart';
import 'package:zohosystem/ui/welcomeScreen/view/welcomeScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    initMobilisten();
  }

  Future<void> initMobilisten() async {
    if (io.Platform.isIOS || io.Platform.isAndroid) {
      String appKey;
      String accessKey;

      if (io.Platform.isIOS) {
        appKey =
            "Y18FyOPEKwH9qLH6AN6BJY5cZ7aRvstiPpQitpCUSe1gQpI81qLcz6XWGzv1mdjN0N2IxLEMcjIPbzwIr3gPau4IBnCIgMXVxL0eBJyQj3g8U58w6cAKMg%3D%3D_eu";
        accessKey =
            "Z8m6sGDVrZSyhGVPLMQblFvJVta91N8s3L7TfKUZF3ALV9vuYrk7zvSkhsjCDyJVzs0kpTHr%2BNL4EywBDGjLLq%2BNBSL5S6EIYo7qaRZ%2BUtqvw0sQwAc8%2FVItA1uTffRQDFsjkD%2BrRRjiqP8rJ0kE%2F84wko8u5PhNE8IA0L0udBo%3D";
      } else {
        appKey =
            "Y18FyOPEKwH9qLH6AN6BJY5cZ7aRvstiPpQitpCUSe1gQpI81qLcz6XWGzv1mdjN0N2IxLEMcjIPbzwIr3gPau4IBnCIgMXVxL0eBJyQj3g8U58w6cAKMg%3D%3D_eu";
        accessKey =
            "eMWfJMMaw4S%2BmOFdVlYcPQxaGAaPqICx4NOPeXfDBL1iYyRj7P8wr7XsIeecrPLmV9Q7WCf1H2hpgaTyq8g2Gew%2BBQnAx7jRGANkOeCzQclDrqeiLmkU%2BTvagdVJsTq17%2F3zPFz1ZAInV%2F%2BNfM5htGasAerateoQ";
      }

      try {
        await ZohoSalesIQ.init(appKey, accessKey);
        debugPrint("✅ ZohoSalesIQ initialized successfully");
        ZohoSalesIQ.launcher.show(VisibilityMode.never);
      } catch (error) {
        debugPrint("❌ ZohoSalesIQ Init Error: $error");
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, orientation, deviceType) {
      return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Zoho System',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: Welcomescreen(),
      );
    });
  }
}
