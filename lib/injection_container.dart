import 'package:kendamanomics_mobile/services/appearance_service.dart';
import 'package:kendamanomics_mobile/services/connectivity_service.dart';
import 'package:kendamanomics_mobile/services/environment_service.dart';
import 'package:kendamanomics_mobile/services/router_service.dart';
import 'package:kendamanomics_mobile/services/supabase_service.dart';
import 'package:kiwi/kiwi.dart';

void initKiwi() {
  KiwiContainer().registerSingleton((container) => ConnectivityService());
  KiwiContainer().registerSingleton((container) => RouterService());
  KiwiContainer().registerSingleton((container) => AppearanceService());
  KiwiContainer().registerSingleton((container) => EnvironmentService());
  KiwiContainer().registerSingleton((container) => SupabaseService());
}
