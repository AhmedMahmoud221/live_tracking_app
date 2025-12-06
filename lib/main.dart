import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:live_tracking/core/constants/theme_provider.dart';
import 'package:live_tracking/core/utils/app_router.dart';
import 'package:live_tracking/features/google%20Map/data/data_sources/device_remote_data_source.dart';
import 'package:live_tracking/features/google%20Map/data/repostories/device_repository_impl.dart';
import 'package:live_tracking/features/google%20Map/domain/usecases/get_devices_map.dart';
import 'package:live_tracking/features/google%20Map/presentation/bloc/map_cubit.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // instantiate dependencies
    final remote = DeviceRemoteDataSource();
    final repo = DeviceRepositoryImpl(remote);
    final getDevices = GetDevices(repo);

    return BlocProvider(
      create: (_) => MapCubit(getDevices: getDevices),
      child: ValueListenableBuilder<ThemeMode>(
        valueListenable: ThemeProvider.themeNotifier,
        builder: (context, currentTheme, _) {
          return MaterialApp.router(
            debugShowCheckedModeBanner: false,
            title: 'Live Tracking App',
            theme: ThemeData.light(),
            darkTheme: ThemeData.dark(),
            themeMode: currentTheme,
            routerConfig: AppRouter.router,
          );
        },
      ),
    );
  }
}
