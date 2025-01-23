import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../providers/auth_provider.dart';
import '../../../providers/loading_provider.dart';
import '../../../providers/sliding_container_provider.dart';
import '../../../providers/theme_provider.dart';

class SelectorProviderHelper {
  // Generalized Selector method for any provider type
  Widget _selectorProvider<P, T>({
    required T Function(BuildContext context, P provider) selector,
    required Widget Function(BuildContext context, T value, Widget? child)
        builder,
  }) {
    return Selector<P, T>(
      selector: selector,
      builder: builder,
    );
  }

  // Common method to pass the selector and builder for any provider
  Widget providerSelector<P, T>({
    required T Function(BuildContext context, P provider) selector,
    required Widget Function(BuildContext context, T value, Widget? child)
        builder,
  }) {
    return _selectorProvider<P, T>(selector: selector, builder: builder);
  }

  // Specific provider usage for AuthProvider
  Widget authProvider<T>({
    required T Function(BuildContext context, AuthProvider provider) selector,
    required Widget Function(BuildContext context, T value, Widget? child)
        builder,
  }) {
    return providerSelector<AuthProvider, T>(
        selector: selector, builder: builder);
  }

  // Specific provider usage for ThemeProvider
  Widget themeProvider<T>({
    required T Function(BuildContext context, ThemeProvider provider) selector,
    required Widget Function(BuildContext context, T value, Widget? child)
        builder,
  }) {
    return providerSelector<ThemeProvider, T>(
        selector: selector, builder: builder);
  }

  Widget loadingProvider<T>({
    required T Function(BuildContext context, LoaderProvider provider) selector,
    required Widget Function(BuildContext context, T value, Widget? child)
        builder,
  }) {
    return providerSelector<LoaderProvider, T>(
        selector: selector, builder: builder);
  }

  Widget slidingContainerProvider<T>({
    required T Function(BuildContext context, SlidingContainerProvider provider)
        selector,
    required Widget Function(BuildContext context, T value, Widget? child)
        builder,
  }) {
    return providerSelector<SlidingContainerProvider, T>(
        selector: selector, builder: builder);
  }
}
