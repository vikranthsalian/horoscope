import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class MetaLocalizationConfig {

  Locale english = const Locale('en', 'US');
  Locale korean = const Locale('ko', 'KR');

  ensureInitialized()async{
  await EasyLocalization.ensureInitialized();
  }
  
  addLocalization(getChild,{required assetPath}){
    return EasyLocalization(
        supportedLocales: [
          english,
          korean
        ],
        path: assetPath,
        fallbackLocale: english,
        child: getChild
    );
  }
}