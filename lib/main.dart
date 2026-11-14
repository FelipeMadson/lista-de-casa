import 'package:material_ui/material_ui.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'app.dart';

void main() {
  // ProviderScope guarda o estado de todos os providers do aplicativo.
  runApp(const ProviderScope(child: AppCompras()));
}
