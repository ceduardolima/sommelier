import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class AppLocalization {
  static AppLocalization of(BuildContext context) {
    return Localizations.of(context, AppLocalization);
  }

  static const _strings = <String, String>{
    'appSplashTitle': 'Somm\nlier',
    'onBoardingTitle': "Deguste\nExperimente\nRegistre",
    'onBoardingBody':
        "Explore novos rótulos, registre suas experiências e construa seu diário de degustação.",
    'startLabel': "Começar",
    'login': "Login",
    'register': "Cadastro",
    'email': 'E-mail',
    'password': "Senha",
    'fieldRequired': 'Campo obrigatório',
    'invalidEmail': 'E-mail inválido',
    'rememberPassword': "Lembrar senha",
    'signIn': 'Entrar',
    'forgetPassword': "Esqueceu a senha?",
    'dontHaveAccount': "Não tem uma conta?",
    'signup': "Cadastre-se",
    'chooseProfileImage': "Escolher foto de perfil",
  };

  String get(String label) => _strings[label] ?? '[${label.toUpperCase()}]';
}

class AppLocalizationDelegate extends LocalizationsDelegate<AppLocalization> {
  @override
  bool isSupported(Locale locale) => locale.languageCode == 'pt';

  @override
  Future<AppLocalization> load(Locale locale) {
    return SynchronousFuture(AppLocalization());
  }

  @override
  bool shouldReload(covariant LocalizationsDelegate<AppLocalization> old) =>
      false;
}
