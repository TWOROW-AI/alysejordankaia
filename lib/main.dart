import 'package:alysejordan/admin.dart';
import 'package:alysejordan/firebase_options.dart';
import 'package:alysejordan/segments/first.dart';
import 'package:alysejordan/segments/second.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:go_router/go_router.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(MyApp());
}

final GoRouter _router = GoRouter(
  initialLocation: "/",
  routes: [
    GoRoute(path: '/', builder: (context, state) => const MyHomePage()),
    GoRoute(
      path: '/admin',
      name: 'admin',
      builder: (context, state) => const AdminPage(),
    ),
  ],
);

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: _router,
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final ScrollController _scrollController = ScrollController();

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0x00f3f2f1),
      body: SingleChildScrollView(
        controller: _scrollController,
        child: Column(
          children: <Widget>[
            FirstSegment()
                .animate()
                .fadeIn(duration: 800.ms)
                .slideY(begin: 0.5),
            SecondSegment()
                .animate()
                .fadeIn(duration: 800.ms)
                .slideY(begin: 0.5),
          ],
        ),
      ),
    );
  }
}
