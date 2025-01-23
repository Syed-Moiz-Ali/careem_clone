import 'read_provider_helper.dart';
import 'value_listenable_builder_helper.dart';
import 'watch_provider_helper.dart';
import 'consumer_provider_helper.dart';
import 'selector_provider_helper.dart';

class ProviderHelper {
  // Read-only provider access
  static ReadProviderHelper read = ReadProviderHelper();

  // Watched provider access
  static WatchProviderHelper watch = WatchProviderHelper();
  static ConsumerProviderHelper consumer = ConsumerProviderHelper();

  // Selector provider access
  static SelectorProviderHelper selector = SelectorProviderHelper();
  static ValueListenableBuilderHelper valueBuilder =
      ValueListenableBuilderHelper();
}
