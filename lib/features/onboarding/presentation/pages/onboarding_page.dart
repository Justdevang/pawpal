// ignore_for_file: type=lint
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/theme/app_theme.dart';
import '../../../../core/widgets/index.dart';

/// Onboarding / Welcome screen per Pawly spec
class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> with TickerProviderStateMixin {
  late AnimationController _heroController;
  late Animation<double> _heroAnimation;

  @override
  void initState() {
    super.initState();
    _heroController = AnimationController(
      duration: const Duration(milliseconds: 800),
      vsync: this,
    );
    _heroAnimation = CurvedAnimation(
      parent: _heroController,
      curve: Curves.easeOutCubic,
    );
    _heroController.forward();
  }

  @override
  void dispose() {
    _heroController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).extension<PawPalColors>()!;
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: colors.background,
      body: SafeArea(
        child: Stack(
          children: [
            // Paw watermark
            Positioned(
              top: size.height * 0.05,
              left: size.width * 0.1,
              child: Opacity(
                opacity: 0.08,
                child: SvgPicture.asset(
                  'assets/icons/paw_watermark.svg',
                  width: size.width * 0.8,
                  height: size.width * 0.8,
                  colorFilter: ColorFilter.mode(colors.primary, BlendMode.srcIn),
                ),
              ),
            ),
            // Main content
            SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    const SizedBox(height: 40),
                    // Logo
                    _buildLogo(colors).animate().fadeIn(duration: 600.ms).slideY(begin: -0.2),
                    const SizedBox(height: 32),
                    // Hero image
                    _buildHeroImage(size, colors),
                    const SizedBox(height: 40),
                    // Headline
                    _buildHeadline(colors).animate().fadeIn(duration: 600.ms, delay: 200.ms).slideY(begin: 0.2),
                    const SizedBox(height: 16),
                    // Subtext
                    _buildSubtext(colors).animate().fadeIn(duration: 600.ms, delay: 300.ms).slideY(begin: 0.2),
                    const SizedBox(height: 48),
                    // CTA
                    _buildCta(context, colors).animate().fadeIn(duration: 600.ms, delay: 400.ms).slideY(begin: 0.2),
                    const SizedBox(height: 40),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildLogo(PawPalColors colors) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // Orange paw icon
        Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            color: colors.accent,
            shape: BoxShape.circle,
          ),
          child: Center(
            child: SvgPicture.asset(
              'assets/icons/paw_logo.svg',
              width: 24,
              height: 24,
              colorFilter: const ColorFilter.mode(Colors.white, BlendMode.srcIn),
            ),
          ),
        ),
        const SizedBox(width: 12),
        // "PawPal" wordmark
        Text(
          'PawPal',
          style: GoogleFonts.baloo2(
            fontSize: 28,
            fontWeight: FontWeight.w700,
            color: colors.primaryDark,
            letterSpacing: -0.5,
          ),
        ),
      ],
    );
  }

  Widget _buildHeroImage(Size size, PawPalColors colors) {
    final heroHeight = size.height * 0.45;

    return AnimatedBuilder(
      animation: _heroAnimation,
      builder: (context, child) {
        return Transform.scale(
          scale: 0.95 + (0.05 * _heroAnimation.value),
          child: Opacity(
            opacity: _heroAnimation.value,
            child: Container(
              width: size.width - 40,
              height: heroHeight,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(24),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(24),
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    // Dog photo
                    Image.asset(
                      'assets/images/onboarding_dog.png',
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) => _placeholderHero(colors),
                    ),
                    // Fade to background at bottom
                    Positioned(
                      bottom: 0,
                      left: 0,
                      right: 0,
                      height: heroHeight * 0.4,
                      child: DecoratedBox(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              Colors.transparent,
                              colors.background,
                            ],
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _placeholderHero(PawPalColors colors) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [colors.surfaceSoft, colors.primary.withValues(alpha: 0.1)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Center(
        child: Text(
          '🐕',
          style: GoogleFonts.baloo2(fontSize: 80),
        ),
      ),
    );
  }

  Widget _buildHeadline(PawPalColors colors) {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        children: [
          TextSpan(
            text: 'Care For All Your\n',
            style: GoogleFonts.baloo2(
              fontSize: 28,
              height: 34 / 28,
              fontWeight: FontWeight.w700,
              color: colors.primaryDark,
              letterSpacing: -0.5,
            ),
          ),
          TextSpan(
            text: 'Pets In One Place',
            style: GoogleFonts.baloo2(
              fontSize: 28,
              height: 34 / 28,
              fontWeight: FontWeight.w700,
              color: colors.accent,
              letterSpacing: -0.5,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSubtext(PawPalColors colors) {
    return Text(
      'Track health, manage daily tasks, & keep every pet happy with simple and organized dashboard',
      textAlign: TextAlign.center,
      style: GoogleFonts.nunito(
        fontSize: 14,
        height: 20 / 14,
        color: colors.secondaryTextColor,
      ),
    );
  }

  Widget _buildCta(BuildContext context, PawPalColors colors) {
    return PawlyButton(
      label: 'Get Started',
      onPressed: () => context.go('/login'),
      showChevron: true,
    );
  }
}