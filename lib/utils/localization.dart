import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class Localization {
  static late BuildContext _context;
  static BuildContext get context => _context;
  Localization.init(context) {
    _context = context;
  }
  static AppLocalizations get locale {
    return AppLocalizations.of(context)!;
  }
}
