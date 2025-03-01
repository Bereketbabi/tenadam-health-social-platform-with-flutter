import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:routemaster/routemaster.dart';
import 'package:tenadam/core/common/error_text.dart';
import 'package:tenadam/core/common/loader.dart';
import 'package:tenadam/features/auth/controller/auth_controller.dart';
import 'package:tenadam/models/user_model.dart';
import 'package:tenadam/router.dart';
import 'package:tenadam/theme/pallete.dart';

import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends ConsumerStatefulWidget {
  const MyApp({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _MyAppState();
}

class _MyAppState extends ConsumerState<MyApp> {
  Future<void> getData(WidgetRef ref, User data) async {
    final userModel = await ref
        .watch(authControllerProvider.notifier)
        .getUserData(data.uid)
        .first;
    ref.read(userProvider.notifier).update((state) => userModel);
  }

  @override
  Widget build(BuildContext context) {
    return ref.watch(authStateChangeProvider).when(
          data: (data) {
            if (data != null) {
              return FutureBuilder<void>(
                future: getData(ref, data),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Loader();
                  }
                  if (snapshot.hasError) {
                    return ErrorText(error: snapshot.error.toString());
                  }
                  final userModel = ref.read(userProvider);
                  return MaterialApp.router(
                    debugShowCheckedModeBanner: false,
                    title: 'tenadam',
                    theme: ref.watch(themeNotifierProvider),
                    routerDelegate: RoutemasterDelegate(
                      routesBuilder: (context) =>
                          userModel != null ? loggedInRoute : loggedOutRoute,
                    ),
                    routeInformationParser: const RoutemasterParser(),
                  );
                },
              );
            }
            return MaterialApp.router(
              debugShowCheckedModeBanner: false,
              title: 'tenadam',
              theme: ref.watch(themeNotifierProvider),
              routerDelegate: RoutemasterDelegate(
                routesBuilder: (context) => loggedOutRoute,
              ),
              routeInformationParser: const RoutemasterParser(),
            );
          },
          error: (error, stackTrace) => ErrorText(error: error.toString()),
          loading: () => const Loader(),
        );
  }
}
