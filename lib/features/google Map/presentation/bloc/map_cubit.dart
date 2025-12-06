import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:live_tracking/features/google%20Map/domain/entities/device_map.dart';
import 'package:live_tracking/features/google%20Map/domain/usecases/get_devices_map.dart';

class MapState {
  final List<Device> devices;
  final Device? selected;
  final bool loading;
  final String? error;

  MapState({
    required this.devices,
    this.selected,
    this.loading = false,
    this.error,
  });

  MapState copyWith({
    List<Device>? devices,
    Device? selected,
    bool? loading,
    String? error,
  }) {
    return MapState(
      devices: devices ?? this.devices,
      selected: selected ?? this.selected,
      loading: loading ?? this.loading,
      error: error,
    );
  }
}

class MapCubit extends Cubit<MapState> {
  final GetDevices getDevices;

  MapCubit({required this.getDevices})
    : super(MapState(devices: [], loading: false));

  Future<void> loadDevices() async {
    emit(state.copyWith(loading: true, error: null));
    try {
      final list = await getDevices();
      emit(state.copyWith(devices: list, loading: false));
    } catch (e) {
      emit(state.copyWith(loading: false, error: e.toString()));
    }
  }

  void selectDevice(Device device) {
    emit(state.copyWith(selected: device));
  }

  void clearSelection() {
    emit(state.copyWith(selected: null));
  }
}
