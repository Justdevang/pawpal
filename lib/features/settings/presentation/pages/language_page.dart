// ignore_for_file: type=lint
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/theme/app_theme.dart';
import '../../../../features/auth/presentation/providers/auth_provider.dart';

/// Language settings page
class LanguagePage extends ConsumerWidget {
  const LanguagePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colors = Theme.of(context).extension<PawPalColors>()!;
    final authState = ref.watch(authProvider);
    final user = authState.value;
    final currentLanguage = user?.preferredLanguage ?? 'en';

    final languages = [
      _LanguageOption(code: 'en', name: 'English', nativeName: 'English', flag: '🇺🇸'),
      _LanguageOption(code: 'es', name: 'Spanish', nativeName: 'Español', flag: '🇪🇸'),
      _LanguageOption(code: 'fr', name: 'French', nativeName: 'Français', flag: '🇫🇷'),
      _LanguageOption(code: 'de', name: 'German', nativeName: 'Deutsch', flag: '🇩🇪'),
      _LanguageOption(code: 'ar', name: 'Arabic', nativeName: 'العربية', flag: '🇸🇦', isRTL: true),
      _LanguageOption(code: 'zh', name: 'Chinese', nativeName: '中文', flag: '🇨🇳'),
      _LanguageOption(code: 'ja', name: 'Japanese', nativeName: '日本語', flag: '🇯🇵'),
      _LanguageOption(code: 'ko', name: 'Korean', nativeName: '한국어', flag: '🇰🇷'),
      _LanguageOption(code: 'pt', name: 'Portuguese', nativeName: 'Português', flag: '🇧🇷'),
      _LanguageOption(code: 'hi', name: 'Hindi', nativeName: 'हिन्दी', flag: '🇮🇳'),
    ];

    return Scaffold(
      backgroundColor: colors.background,
      appBar: AppBar(
        title: Text(
          'Language',
          style: GoogleFonts.baloo2(
            fontSize: 20,
            fontWeight: FontWeight.w600,
            color: colors.bodyTextColor,
          ),
        ),
        backgroundColor: colors.background,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.close_rounded, color: colors.bodyTextColor),
          onPressed: () => context.pop(),
        ),
      ),
      body: SafeArea(
        child: ListView.builder(
          padding: const EdgeInsets.all(20),
          itemCount: languages.length,
          itemBuilder: (context, index) {
            final lang = languages[index];
            final isSelected = lang.code == currentLanguage;

            return Material(
              color: colors.surface,
              borderRadius: BorderRadius.circular(16),
              child: InkWell(
                onTap: () => _changeLanguage(context, ref, lang.code),
                borderRadius: BorderRadius.circular(16),
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Row(
                    children: [
                      Text(lang.flag, style: const TextStyle(fontSize: 28)),
                      const SizedBox(width: 16),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              lang.name,
                              style: GoogleFonts.nunito(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: colors.bodyTextColor,
                              ),
                            ),
                            Text(
                              lang.nativeName,
                              style: GoogleFonts.nunito(
                                fontSize: 13,
                                color: colors.secondaryTextColor,
                              ),
                            ),
                          ],
                        ),
                      ),
                      if (isSelected)
                        Icon(Icons.check_circle_rounded, color: colors.primary, size: 24),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  void _changeLanguage(BuildContext context, WidgetRef ref, String languageCode) {
    // TODO: Update user preference and reload app with new locale
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Language changed to $languageCode')),
    );
  }
}

class _LanguageOption {
  final String code;
  final String name;
  final String nativeName;
  final String flag;
  final bool isRTL;

  _LanguageOption({
    required this.code,
    required this.name,
    required this.nativeName,
    required this.flag,
    this.isRTL = false,
  });
}