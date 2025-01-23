import 'package:provider/provider.dart';

import '../../../providers/auth_provider.dart';
import '../../../providers/loading_provider.dart';
import '../../../providers/sliding_container_provider.dart';
import '../../../providers/theme_provider.dart';
import '../../global/global.dart';

class WatchProviderHelper {
  AuthProvider authProvider() {
    return Aio.navigationKey.currentContext!.watch<AuthProvider>();
  }

  ThemeProvider themeProvider() {
    return Aio.navigationKey.currentContext!.watch<ThemeProvider>();
  }

  LoaderProvider loadingProvider() {
    return Aio.navigationKey.currentContext!.watch<LoaderProvider>();
  }

  SlidingContainerProvider slidingContainerProvider() {
    return Aio.navigationKey.currentContext!.watch<SlidingContainerProvider>();
  }
}
