import 'package:careem/providers/sliding_container_provider.dart';
import 'package:provider/provider.dart';

import '../../../providers/auth_provider.dart';
import '../../../providers/loading_provider.dart';
import '../../../providers/theme_provider.dart';
import '../../global/global.dart';

class ReadProviderHelper {
  // Read-only provider access (does not listen to changes)

  AuthProvider authProvider() {
    return Aio.navigationKey.currentContext!.read<AuthProvider>();
  }

  ThemeProvider themeProvider() {
    return Aio.navigationKey.currentContext!.read<ThemeProvider>();
  }

  LoaderProvider loadingProvider() {
    return Aio.navigationKey.currentContext!.read<LoaderProvider>();
  }

  SlidingContainerProvider slidingContainerProvider() {
    return Aio.navigationKey.currentContext!.read<SlidingContainerProvider>();
  }
}
