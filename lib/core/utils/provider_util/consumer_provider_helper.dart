import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../providers/auth_provider.dart';
import '../../../providers/loading_provider.dart';
import '../../../providers/sliding_container_provider.dart';
import '../../../providers/theme_provider.dart';

class ConsumerProviderHelper {
  // Generalized Consumer method for any provider type
  Widget consumerProvider<T>({
    required Widget Function(BuildContext context, T provider, Widget? child)
        builder,
  }) {
    return Consumer<T>(
      builder: builder,
    );
  }

  // Specific provider usage for AuthProvider
  Widget authProvider({
    required Widget Function(
            BuildContext context, AuthProvider authProvider, Widget? child)
        builder,
  }) {
    return consumerProvider<AuthProvider>(builder: builder);
  }

  // Specific provider usage for ThemeProvider
  Widget themeProvider({
    required Widget Function(
            BuildContext context, ThemeProvider themeProvider, Widget? child)
        builder,
  }) {
    return consumerProvider<ThemeProvider>(builder: builder);
  }

  Widget loadingProvider({
    required Widget Function(
            BuildContext context, LoaderProvider themeProvider, Widget? child)
        builder,
  }) {
    return consumerProvider<LoaderProvider>(builder: builder);
  }

  Widget slidingContainerProvider({
    required Widget Function(BuildContext context,
            SlidingContainerProvider themeProvider, Widget? child)
        builder,
  }) {
    return consumerProvider<SlidingContainerProvider>(builder: builder);
  }
}
