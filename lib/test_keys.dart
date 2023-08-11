import 'package:flutter/widgets.dart';

abstract class AppKeys {
  static const Key avatar_btn = Key('avatar_btn');
  static const Key remove_avatar_btn = Key('remove_avatar_btn');
  static const Key increment_btn = Key('increment_btn');
  static const Key decrement_btn = Key('decrement_btn');

}

abstract class FavoritesTestKeys {
  /// кнопка удаления товара из избранного по индексу
  static Key removeItem(int index) => Key('remove_icon_$index');
}