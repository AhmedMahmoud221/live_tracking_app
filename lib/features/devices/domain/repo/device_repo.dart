import '../entities/device_entity.dart';

abstract class DevicesRepo {
  Future<List<DeviceEntity>> getDevices();
}
