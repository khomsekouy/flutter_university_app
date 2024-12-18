import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_university_app/core/theme/app_theme.dart';
import 'package:flutter_university_app/environment/logic/environment_cubit.dart';
import 'package:flutter_university_app/environment/model/environment_model.dart';
import 'package:flutter_university_app/l10n/l10n.dart';
import 'package:flutter_university_app/shared/widgets/global_loader_widget.dart';

import 'router.dart';

class App extends StatelessWidget {
  const App({
    required EnvironmentModel environment,
    super.key,
  }) : _environment = environment;

  final EnvironmentModel _environment;

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider.value(value: _environment),
      ],
      child: MultiBlocProviders(
        environment: _environment,
      ),
    );
  }
}

/// The Default App [Widget]. This is the main entry point for the app.
class MultiBlocProviders extends StatelessWidget {
  const MultiBlocProviders({
    required EnvironmentModel environment,
    super.key,
  }) : _environment = environment;

  final EnvironmentModel _environment;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<EnvironmentCubit>(
          create: (context) =>
              EnvironmentCubit()..loadEnvironment(_environment),
        ),
      ],
      child: const MaterialRouterApp(),
    );
  }
}

/// The Default App [Widget].
class MaterialRouterApp extends StatelessWidget {
  const MaterialRouterApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.light,
      theme: const AppTheme().themeData,
      darkTheme: const AppDarkTheme().themeData,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      routerConfig: RouteConfigure.router,
      builder: (context, child) {
        return buildGlobalLoaderOverlyWidget(child);
      },
    );
  }

  GlobalLoaderOverlyWidget buildGlobalLoaderOverlyWidget(Widget? child) {
    return GlobalLoaderOverlyWidget(
      child: child!,
    );
  }
}
