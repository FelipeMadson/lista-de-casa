import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'apresentacao/rotas.dart';
import 'config/identidade.dart';

class AppCompras extends ConsumerWidget {
  const AppCompras({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp.router(
      title: Identidade.nomeDoApp,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Identidade.corSemente,
          dynamicSchemeVariant: DynamicSchemeVariant.monochrome,
        ),
        scaffoldBackgroundColor: const Color(0xFFF6F6F4),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFFF6F6F4),
          titleTextStyle: TextStyle(color: Color(0xFF181818), fontSize: 21, fontWeight: FontWeight.w700),
        ),
        cardTheme: CardThemeData(
          color: Colors.white,
          elevation: 0,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
        ),
      ),
      darkTheme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Identidade.corSemente,
          brightness: Brightness.dark,
          dynamicSchemeVariant: DynamicSchemeVariant.monochrome,
        ),
      ),
      routerConfig: ref.watch(roteadorProvider),
    );
  }
}
