// ignore_for_file: type=lint
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../theme/app_theme.dart';

/// Health summary card per Pawly spec: red gradient, pet name top-left, cut-out photo top-right, white inner panel with 3 columns
class PawlyHealthSummaryCard extends StatelessWidget {
  final String petName;
  final String? petImageUrl;
  final String? petLocalPath;
  final String weight;
  final String healthStatus;
  final String lastVetVisit;
  final VoidCallback? onTap;

  const PawlyHealthSummaryCard({
    super.key,
    required this.petName,
    this.petImageUrl,
    this.petLocalPath,
    required this.weight,
    required this.healthStatus,
    required this.lastVetVisit,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).extension<PawPalColors>()!;

    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(20),
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.fromLTRB(20, 120, 20, 20),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            gradient: LinearGradient(
              colors: [colors.healthCardGradientStart, colors.healthCardGradientEnd],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              // Pet photo overlapping top-right
              Positioned(
                top: -60,
                right: 20,
                child: Container(
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withValues(alpha: 0.2),
                        blurRadius: 12,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: _buildPetImage(context, colors),
                  ),
                ),
              ),
              // Content
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    petName,
                    style: GoogleFonts.baloo2(
                      fontSize: 22,
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 24),
                  Row(
                    children: [
                      _SummaryColumn(label: 'Weight', value: weight, colors: colors),
                      _SummaryColumn(label: 'Health Status', value: healthStatus, colors: colors),
                      _SummaryColumn(label: 'Last Vet Visit', value: lastVetVisit, colors: colors),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildPetImage(BuildContext context, PawPalColors colors) {
    if (petLocalPath != null) {
      return Image.asset(petLocalPath!, fit: BoxFit.cover, width: 100, height: 100);
    }

    if (petImageUrl != null && petImageUrl!.isNotEmpty) {
      return CachedNetworkImage(
        imageUrl: petImageUrl!,
        fit: BoxFit.cover,
        width: 100,
        height: 100,
        placeholder: (context, url) => _placeholder(colors),
        errorWidget: (context, url, error) => _placeholder(colors),
      );
    }

    return _placeholder(colors);
  }

  Widget _placeholder(PawPalColors colors) {
    return Container(
      width: 100,
      height: 100,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [colors.surfaceSoft, colors.primary.withValues(alpha: 0.1)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Center(
        child: Text(
          petName.isNotEmpty ? petName[0].toUpperCase() : '🐾',
          style: GoogleFonts.baloo2(
            fontSize: 36,
            fontWeight: FontWeight.w600,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}

class _SummaryColumn extends StatelessWidget {
  final String label;
  final String value;
  final PawPalColors colors;

  const _SummaryColumn({
    required this.label,
    required this.value,
    required this.colors,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: GoogleFonts.nunito(
              fontSize: 11,
              color: Colors.white.withValues(alpha: 0.7),
            ),
          ),
          const SizedBox(height: 4),
          Text(
            value,
            style: GoogleFonts.nunito(
              fontSize: 16,
              fontWeight: FontWeight.w700,
              color: Colors.white,
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}