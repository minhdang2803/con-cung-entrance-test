import 'package:concung_entrance_test/data/database/database.dart';

import 'package:get_it/get_it.dart';

// import '../view/routes/route_name.dart';

final getItInstance = GetIt.instance;

Future<void> initServices() async {

  _initDatabase();
}

void _initDatabase() {
  getItInstance.registerLazySingleton<MyDatabase>(() => MyDatabase());
}
