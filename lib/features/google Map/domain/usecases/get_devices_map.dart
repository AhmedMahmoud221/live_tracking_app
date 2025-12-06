import 'package:live_tracking/features/google%20Map/data/repostories/device_repository_impl.dart';
import 'package:live_tracking/features/google%20Map/domain/entities/device_map.dart';

class GetDevices {
  final DeviceRepository repository;

  GetDevices(this.repository);

  Future<List<Device>> call() {
    return repository.getAllDevices();
  }
}
