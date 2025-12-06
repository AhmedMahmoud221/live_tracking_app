import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:live_tracking/features/google%20Map/domain/entities/device_map.dart';
import 'package:live_tracking/features/google%20Map/presentation/wigets/custom_bottom_sheet.dart';
import '../bloc/map_cubit.dart';

class GoogleMapPage extends StatefulWidget {
  const GoogleMapPage({super.key});

  @override
  State<GoogleMapPage> createState() => _GoogleMapPageState();
}

class _GoogleMapPageState extends State<GoogleMapPage> {
  late final Completer<GoogleMapController> _controllerCompleter;
  GoogleMapController? _mapController;
  Set<Marker> _markers = {};

  @override
  void initState() {
    super.initState();
    _controllerCompleter = Completer<GoogleMapController>();
    // load devices via cubit
    final cubit = context.read<MapCubit>();
    cubit.loadDevices();
  }

  void _buildMarkers(List<Device> devices) {
    _markers = devices.map((d) {
      return Marker(
        markerId: MarkerId(d.id.toString()),
        position: LatLng(d.lat, d.lng),
        infoWindow: InfoWindow(title: d.name),
      );
    }).toSet();
  }

  Future<void> _moveCameraTo(Device device) async {
    final ctrl = _mapController;
    if (ctrl == null) return;
    await ctrl.animateCamera(
      CameraUpdate.newCameraPosition(
        CameraPosition(target: LatLng(device.lat, device.lng), zoom: 17),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<MapCubit, MapState>(
      listener: (context, state) async {
        // when a device is selected -> animate camera
        if (state.selected != null) {
          await _moveCameraTo(state.selected!);
        }
      },
      child: Scaffold(
        body: SafeArea(
          child: BlocBuilder<MapCubit, MapState>(
            builder: (context, state) {
              if (state.loading && state.devices.isEmpty) {
                return const Center(child: CircularProgressIndicator());
              }

              _buildMarkers(state.devices);

              return Stack(
                children: [
                  GoogleMap(
                    initialCameraPosition: const CameraPosition(
                      target: LatLng(30.0, 31.0),
                      zoom: 12,
                    ),
                    markers: _markers,
                    onMapCreated: (controller) {
                      if (!_controllerCompleter.isCompleted) {
                        _controllerCompleter.complete(controller);
                      }
                      _mapController = controller;
                    },
                  ),

                  Positioned(
                    bottom: 20,
                    left: 20,
                    child: CustomBottomSheet(
                      devices: state.devices,
                      onSelect: (device) {
                        // update cubit -> this triggers BlocListener -> animate
                        context.read<MapCubit>().selectDevice(device);
                      },
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
