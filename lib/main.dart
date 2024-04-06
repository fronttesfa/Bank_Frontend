import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:front_end/firebase_options.dart';
import 'package:front_end/globals/theme/color_schemes.g.dart';
import 'package:front_end/screens/transaction/send/send.dart';
import 'package:front_end/screens/transaction/send/send_details.dart';
import 'package:front_end/screens/transaction/send/send_success.dart';
import 'provider/shared_utility.dart';
import 'package:front_end/screens/Password%20Reset/password_reset.dart';
import 'package:front_end/screens/auth/Auth.dart';
import 'package:front_end/screens/deposit/deposit_camera.dart';
import 'package:front_end/screens/deposit/deposit_display.dart';
import 'package:front_end/screens/deposit/deposit_main.dart';
import 'package:front_end/screens/deposit/deposit_second.dart';
import 'package:front_end/screens/home/home.dart';
import 'package:front_end/screens/auth/login.dart';
import 'package:front_end/screens/intro/onboarding.dart';
import 'package:front_end/screens/signup/signup_address.dart';
import 'package:front_end/screens/signup/signup_personal.dart';
import 'package:front_end/screens/signup/signup_stepper.dart';
import 'package:camera/camera.dart';

import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

bool shouldUseFirebaseEmulator = false;

late final FirebaseApp app;
late final FirebaseAuth auth;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // initializing camera
  final cameraList = await availableCameras();

// We store the app and auth to make testing with a named instance easier.
  app = await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  final sharedPreferences = await SharedPreferences.getInstance();
  runApp(ProviderScope(
      overrides: [
        // override the previous value with the new object
        sharedPreferencesProvider.overrideWithValue(sharedPreferences),
      ],
      child: MyApp(
        cameraList: cameraList,
      )));
}

class MyApp extends ConsumerStatefulWidget {
  const MyApp({super.key, required this.cameraList});

  final List<CameraDescription> cameraList;

  @override
  MyAppState createState() => MyAppState();
}

class MyAppState extends ConsumerState<MyApp> {
  late Widget screen;

  @override
  Widget build(BuildContext context) {
    // To cahnge the color of the status bar

    // SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    //   statusBarColor: Colors.white,
    //   statusBarBrightness: Brightness.dark,
    // )
    // );
    return MaterialApp.router(
      themeMode: ThemeMode.light,
      theme: ThemeData(useMaterial3: true, colorScheme: lightColorScheme),
      darkTheme: ThemeData(useMaterial3: true, colorScheme: darkColorScheme),
      debugShowCheckedModeBanner: false,
      routerConfig: GoRouter(
        routes: <RouteBase>[
          GoRoute(
            path: '/',
            builder: (BuildContext context, GoRouterState state) {
              // return ref.watch(sharedUtilityProvider).isFirstTime()
              //     ? const Onboarding()
              //     : const Auth();
              return Home();
            },
          ),
          //    /products
          ///products/1
          GoRoute(
            path: '/login',
            builder: (BuildContext context, GoRouterState state) {
              return const Login();
            },
          ),
          GoRoute(
            path: '/signup',
            builder: (BuildContext context, GoRouterState state) {
              return SignupStepper();
            },
          ),
          GoRoute(
            path: '/auth',
            builder: (BuildContext context, GoRouterState state) {
              return const Auth();
            },
          ),
          //For reset Password
          GoRoute(
            path: '/password_reset',
            builder: (BuildContext context, GoRouterState state) {
              return const PasswordReset();
            },
          ),
          GoRoute(
            path: '/signup_personal',
            builder: (BuildContext context, GoRouterState state) {
              return const SignUpPersonal();
            },
          ),
          GoRoute(
            path: '/signup_address',
            builder: (BuildContext context, GoRouterState state) {
              return const SignUpAddress();
            },
          ),
          GoRoute(
            path: '/dashboard',
            builder: (BuildContext context, GoRouterState state) {
              return const Home();
            },
          ),
          GoRoute(
            path: '/send',
            builder: (BuildContext context, GoRouterState state) {
              return const Send();
            },
          ),
          GoRoute(
            path: '/send_details',
            builder: (BuildContext context, GoRouterState state) {
              return const SendDetails();
            },
          ),
          GoRoute(
            path: '/send_success',
            builder: (BuildContext context, GoRouterState state) {
              return const SendSuccess();
            },
          ),
          GoRoute(
            path: '/onboarding',
            builder: (BuildContext context, GoRouterState state) {
              return const Onboarding();
            },
          ),
          GoRoute(
            path: '/deposit_main',
            builder: (BuildContext context, GoRouterState state) {
              return const DepositMain();
            },
          ),
          GoRoute(
            path: '/deposit_second',
            builder: (BuildContext context, GoRouterState state) {
              return const DepositSecond();
            },
          ),
          GoRoute(
            path: '/deposit_camera',
            builder: (BuildContext context, GoRouterState state) {
              return DepositCamera(
                cameras: widget.cameraList,
              );
            },
          ),
          GoRoute(
            path: '/deposit_display',
            builder: (BuildContext context, GoRouterState state) {
              return const DepositDisplay();
            },
          ),
        ],
      ),
    );
  }
}

// The route configuration.
// final GoRouter _router = GoRouter(
//   routes: <RouteBase>[
//     GoRoute(
//       path: '/',
//       builder: (BuildContext context, GoRouterState state) {
//         return 
//       },
//     ),
//     //    /products
//     ///products/1
//     GoRoute(
//       path: '/login',
//       builder: (BuildContext context, GoRouterState state) {
//         return const Login();
//       },
//     ),
//     GoRoute(
//       path: '/signup',
//       builder: (BuildContext context, GoRouterState state) {
//         return SignupStepper();
//       },
//     ),
//     GoRoute(
//       path: '/signup_personal',
//       builder: (BuildContext context, GoRouterState state) {
//         return const SignUpPersonal();
//       },
//     ),
//     GoRoute(
//       path: '/signup_address',
//       builder: (BuildContext context, GoRouterState state) {
//         return const SignUpAddress();
//       },
//     ),
//     GoRoute(
//       path: '/dashboard',
//       builder: (BuildContext context, GoRouterState state) {
//         return const Home();
//       },
//     ),
//   ],
// );
