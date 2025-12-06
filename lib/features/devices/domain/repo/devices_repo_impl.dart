import 'package:live_tracking/features/devices/domain/repo/device_repo.dart';

import '../../domain/entities/device_entity.dart';

class DevicesRepoImpl implements DevicesRepo {
  @override
  Future<List<DeviceEntity>> getDevices() async {
    await Future.delayed(Duration(milliseconds: 600));

    return List.generate(20, (i) {
      return DeviceEntity(
        id: "DEV-$i",
        name: "Device $i",
        model: "Model ${i + 2020}", // مثال على الموديل
        imagePath: "assets/car.png", // نفس الصورة لكل جهاز مؤقتًا
        status: i % 2 == 0 ? "online" : "offline",
        speed: (5 + i).toDouble(),
        lat: 30.05 + i * 0.001,
        lng: 31.20 + i * 0.001,
      );
    });
  }
}
