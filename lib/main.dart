import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:push_notification/next.dart';
import 'package:push_notification/util.dart';

import 'firebase_options.dart';

@pragma('vm:entry-point')
Future<void> _firebaseMessagingHandler(RemoteMessage message) async {
  await Firebase.initializeApp();
  print("Message id is :- ${message.messageId}");
  print("Message id is :- ${message.data["type"]}");
}

void main() async {
  runApp(const MyApp());
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  final fcmToken = await FirebaseMessaging.instance.getToken();
  print(fcmToken);
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingHandler);
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.red),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    super.initState();
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      print("Message received: ${message.notification?.body}");
      if (message.notification?.title != null &&
          message.notification?.body != null)
        materialBanner(context, "${message.notification?.title}",
            "${message.notification?.body}");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: SingleChildScrollView(
        child: Container(
          width: 390,
          height: 844,
          padding: const EdgeInsets.only(
            top: 20,
            left: 26,
            right: 26,
            bottom: 353.50,
          ),
          clipBehavior: Clip.antiAlias,
          decoration: BoxDecoration(color: Colors.white),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 338,
                height: 150.50,
                child: Stack(
                  children: [
                    Positioned(
                      left: 0,
                      top: 0,
                      child: InkWell(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => NextScreen()));
                        },
                        child: Container(
                          width: 338,
                          height: 150,
                          decoration: ShapeDecoration(
                            color: Color(0xFFF4F4F4),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      left: 33,
                      top: 13,
                      child: Container(
                        width: 288,
                        height: 123,
                        child: Stack(
                          children: [
                            Positioned(
                              left: 1,
                              top: 44,
                              child: Text(
                                'Business Type',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 12,
                                  fontFamily: 'Inter',
                                  fontWeight: FontWeight.w400,
                                  height: 0,
                                ),
                              ),
                            ),
                            Positioned(
                              left: 0,
                              top: 0,
                              child: Text(
                                'Company Name',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 18,
                                  fontFamily: 'Inter',
                                  fontWeight: FontWeight.w400,
                                  height: 0,
                                ),
                              ),
                            ),
                            Positioned(
                              left: 1,
                              top: 25,
                              child: Text(
                                '08AAAJM0351L1Z6',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 13,
                                  fontFamily: 'Inter',
                                  fontWeight: FontWeight.w400,
                                  height: 0,
                                ),
                              ),
                            ),
                            Positioned(
                              left: 21,
                              top: 88,
                              child: Text(
                                'mailhjlkjjsnenk@gmail.com',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 12,
                                  fontFamily: 'Inter',
                                  fontWeight: FontWeight.w400,
                                  height: 0,
                                ),
                              ),
                            ),
                            Positioned(
                              left: 1,
                              top: 108,
                              child: Container(
                                width: 15,
                                height: 15,
                                child: Stack(children: []),
                              ),
                            ),
                            Positioned(
                              left: 1,
                              top: 88,
                              child: Container(
                                width: 15,
                                height: 15,
                                child: Stack(
                                  children: [
                                    Positioned(
                                      left: 1.25,
                                      top: 1.25,
                                      child: Container(
                                        width: 12.50,
                                        height: 11.88,
                                        child: Stack(children: []),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Positioned(
                              left: 273,
                              top: 0,
                              child: Container(
                                width: 15,
                                height: 15,
                                child: Stack(
                                  children: [
                                    Positioned(
                                      left: 1.88,
                                      top: 1.88,
                                      child: Container(
                                        width: 11.25,
                                        height: 11.25,
                                        child: Stack(children: []),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Positioned(
                              left: 21,
                              top: 108,
                              child: Text(
                                '+910123456789',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 12,
                                  fontFamily: 'Inter',
                                  fontWeight: FontWeight.w400,
                                  height: 0,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 9.50),
              Container(
                width: 338,
                height: 150.50,
                child: Stack(
                  children: [
                    Positioned(
                      left: 0,
                      top: 0,
                      child: Container(
                        width: 338,
                        height: 150,
                        decoration: ShapeDecoration(
                          color: Color(0xFFF4F4F4),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      left: 33,
                      top: 13,
                      child: Container(
                        width: 288,
                        height: 123,
                        child: Stack(
                          children: [
                            Positioned(
                              left: 1,
                              top: 44,
                              child: Text(
                                'Business Type',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 12,
                                  fontFamily: 'Inter',
                                  fontWeight: FontWeight.w400,
                                  height: 0,
                                ),
                              ),
                            ),
                            Positioned(
                              left: 0,
                              top: 0,
                              child: Text(
                                'Company Name',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 18,
                                  fontFamily: 'Inter',
                                  fontWeight: FontWeight.w400,
                                  height: 0,
                                ),
                              ),
                            ),
                            Positioned(
                              left: 1,
                              top: 25,
                              child: Text(
                                '08AAAJM0351L1Z6',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 13,
                                  fontFamily: 'Inter',
                                  fontWeight: FontWeight.w400,
                                  height: 0,
                                ),
                              ),
                            ),
                            Positioned(
                              left: 21,
                              top: 88,
                              child: Text(
                                'mailhjlkjjsnenk@gmail.com',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 12,
                                  fontFamily: 'Inter',
                                  fontWeight: FontWeight.w400,
                                  height: 0,
                                ),
                              ),
                            ),
                            Positioned(
                              left: 1,
                              top: 108,
                              child: Container(
                                width: 15,
                                height: 15,
                                child: Stack(children: []),
                              ),
                            ),
                            Positioned(
                              left: 1,
                              top: 88,
                              child: Container(
                                width: 15,
                                height: 15,
                                child: Stack(
                                  children: [
                                    Positioned(
                                      left: 1.25,
                                      top: 1.25,
                                      child: Container(
                                        width: 12.50,
                                        height: 11.88,
                                        child: Stack(children: []),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Positioned(
                              left: 273,
                              top: 0,
                              child: Container(
                                width: 15,
                                height: 15,
                                child: Stack(
                                  children: [
                                    Positioned(
                                      left: 1.88,
                                      top: 1.88,
                                      child: Container(
                                        width: 11.25,
                                        height: 11.25,
                                        child: Stack(children: []),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Positioned(
                              left: 21,
                              top: 108,
                              child: Text(
                                '+910123456789',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 12,
                                  fontFamily: 'Inter',
                                  fontWeight: FontWeight.w400,
                                  height: 0,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 9.50),
              Container(
                width: 338,
                height: 150.50,
                child: Stack(
                  children: [
                    Positioned(
                      left: 0,
                      top: 0,
                      child: Container(
                        width: 338,
                        height: 150,
                        decoration: ShapeDecoration(
                          color: Color(0xFFF4F4F4),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      left: 33,
                      top: 13,
                      child: Container(
                        width: 288,
                        height: 123,
                        child: Stack(
                          children: [
                            Positioned(
                              left: 1,
                              top: 44,
                              child: Text(
                                'Business Type',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 12,
                                  fontFamily: 'Inter',
                                  fontWeight: FontWeight.w400,
                                  height: 0,
                                ),
                              ),
                            ),
                            Positioned(
                              left: 0,
                              top: 0,
                              child: Text(
                                'Company Name',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 18,
                                  fontFamily: 'Inter',
                                  fontWeight: FontWeight.w400,
                                  height: 0,
                                ),
                              ),
                            ),
                            Positioned(
                              left: 1,
                              top: 25,
                              child: Text(
                                '08AAAJM0351L1Z6',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 13,
                                  fontFamily: 'Inter',
                                  fontWeight: FontWeight.w400,
                                  height: 0,
                                ),
                              ),
                            ),
                            Positioned(
                              left: 21,
                              top: 88,
                              child: Text(
                                'mailhjlkjjsnenk@gmail.com',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 12,
                                  fontFamily: 'Inter',
                                  fontWeight: FontWeight.w400,
                                  height: 0,
                                ),
                              ),
                            ),
                            Positioned(
                              left: 1,
                              top: 108,
                              child: Container(
                                width: 15,
                                height: 15,
                                child: Stack(children: []),
                              ),
                            ),
                            Positioned(
                              left: 1,
                              top: 88,
                              child: Container(
                                width: 15,
                                height: 15,
                                child: Stack(
                                  children: [
                                    Positioned(
                                      left: 1.25,
                                      top: 1.25,
                                      child: Container(
                                        width: 12.50,
                                        height: 11.88,
                                        child: Stack(children: []),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Positioned(
                              left: 273,
                              top: 0,
                              child: Container(
                                width: 15,
                                height: 15,
                                child: Stack(
                                  children: [
                                    Positioned(
                                      left: 1.88,
                                      top: 1.88,
                                      child: Container(
                                        width: 11.25,
                                        height: 11.25,
                                        child: Stack(children: []),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Positioned(
                              left: 21,
                              top: 108,
                              child: Text(
                                '+910123456789',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 12,
                                  fontFamily: 'Inter',
                                  fontWeight: FontWeight.w400,
                                  height: 0,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
