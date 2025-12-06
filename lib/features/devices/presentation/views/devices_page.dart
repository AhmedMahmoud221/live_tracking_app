import 'package:flutter/material.dart';
import 'package:live_tracking/features/devices/domain/repo/devices_repo_impl.dart';
import 'package:live_tracking/features/devices/presentation/widgets/device_card.dart';
import '../../domain/entities/device_entity.dart';

class DevicesPage extends StatefulWidget {
  const DevicesPage({super.key});

  @override
  State<DevicesPage> createState() => _DevicesPageState();
}

class _DevicesPageState extends State<DevicesPage> {
  List<DeviceEntity> devices = [];
  List<DeviceEntity> filteredDevices = [];
  bool loading = true;
  final TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    loadDevices();
  }

  void loadDevices() async {
    final repo = DevicesRepoImpl();
    devices = await repo.getDevices();
    filteredDevices = devices;

    // Add markers to map
    // for (var d in devices) {
    //   mapController.addDeviceMarker(d);
    // }

    setState(() => loading = false);
  }

  void searchDevice(String query) {
    final results = devices.where((device) {
      final name = device.name.toLowerCase();
      final model = device.model.toLowerCase();
      final input = query.toLowerCase();
      return name.contains(input) || model.contains(input);
    }).toList();

    setState(() {
      filteredDevices = results;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: loading
          ? const Center(child: CircularProgressIndicator())
          : Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                children: [
                  // Search Bar
                  TextField(
                    controller: searchController,
                    onChanged: searchDevice,
                    decoration: InputDecoration(
                      hintText: "Search devices...",
                      prefixIcon: const Icon(Icons.search),
                      filled: true,
                      fillColor: const Color.fromARGB(255, 240, 238, 238),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                  const SizedBox(height: 12),

                  // List of Device Cards
                  Expanded(
                    child: ListView.builder(
                      itemCount: filteredDevices.length,
                      itemBuilder: (context, index) {
                        final device = filteredDevices[index];
                        return DeviceCard(device: device);
                      },
                    ),
                  ),
                ],
              ),
            ),
    );
  }
}
