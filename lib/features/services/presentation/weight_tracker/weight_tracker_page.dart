// ignore_for_file: type=lint
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

import '../../../../core/theme/app_theme.dart';
import '../../../../core/widgets/index.dart';
import '../../../../core/database/database.dart';
import '../../../../core/extensions/extensions.dart';
import '../../../pets/presentation/providers/pet_state_providers.dart';
import '../weight_tracker/weight_tracker_service.dart';

/// Weight tracker page with chart
class WeightTrackerPage extends ConsumerWidget {
  const WeightTrackerPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colors = Theme.of(context).extension<PawPalColors>()!;
    final selectedPetId = ref.watch(selectedPetIdProvider);

    if (selectedPetId == null) {
      return _buildNoPetSelected(context);
    }

    return Scaffold(
      backgroundColor: colors.background,
      appBar: AppBar(
        title: Text(
          'Weight Tracker',
          style: GoogleFonts.baloo2(
            fontSize: 20,
            fontWeight: FontWeight.w600,
            color: colors.bodyTextColor,
          ),
        ),
        backgroundColor: colors.background,
        elevation: 0,
      ),
      body: SafeArea(
        child: StreamBuilder<List<WeightEntry>>(
          stream: ref.watch(weightTrackerServiceProvider).watchWeightEntries(selectedPetId),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return _buildLoadingState(context);
            }
            if (snapshot.hasError) {
              return _buildErrorState(context, ref, snapshot.error.toString());
            }
            final entries = snapshot.data ?? [];
            if (entries.isEmpty) {
              return _buildEmptyState(context);
            }

            final latestEntry = List<WeightEntry>.from(entries)
              ..sort((a, b) => b.date.compareTo(a.date));
            final latest = latestEntry.first;

            final trend = ref.read(weightTrackerServiceProvider).calculateTrend(entries);
            final chartData = ref.read(weightTrackerServiceProvider).getChartData(entries);

            return SingleChildScrollView(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Current weight card
                  _buildCurrentWeightCard(context, latest, trend),
                  const SizedBox(height: 24),
                  // Chart
                  _buildChartCard(context, chartData),
                  const SizedBox(height: 24),
                  // Weight history
                  _buildHistorySection(context, entries),
                  const SizedBox(height: 100),
                ],
              ),
            );
          },
        ),
      ),
      floatingActionButton: PawlyFloatingActionButton(
        onPressed: () => context.push('/services/weight_tracker/add'),
        icon: Icons.add_rounded,
      ),
    );
  }

  // Helper to get trend display properties
  _TrendDisplay _getTrendDisplay(BuildContext context, WeightTrend trend) {
    final colors = Theme.of(context).extension<PawPalColors>()!;

    if (trend == WeightTrend.increasing) {
      return _TrendDisplay(
        color: colors.error,
        icon: Icons.trending_up_rounded,
        text: 'Gaining',
      );
    } else if (trend == WeightTrend.decreasing) {
      return _TrendDisplay(
        color: colors.success,
        icon: Icons.trending_down_rounded,
        text: 'Losing',
      );
    } else {
      return _TrendDisplay(
        color: colors.accent,
        icon: Icons.trending_flat_rounded,
        text: 'Stable',
      );
    }
  }

  Widget _buildCurrentWeightCard(BuildContext context, WeightEntry latest, WeightTrend trend) {
    final colors = Theme.of(context).extension<PawPalColors>()!;
    final display = _getTrendDisplay(context, trend);

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [colors.primary, colors.primaryDark],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Current Weight',
                      style: GoogleFonts.nunito(
                        fontSize: 14,
                        color: colors.onPrimary.withValues(alpha: 0.8),
                      ),
                    ),
                    Text(
                      '${latest.weight.toStringAsFixed(1)} ${latest.unit}',
                      style: GoogleFonts.baloo2(
                        fontSize: 32,
                        fontWeight: FontWeight.w700,
                        color: colors.onPrimary,
                      ),
                    ),
                    Text(
                      'Recorded ${latest.date.formatDate()}',
                      style: GoogleFonts.nunito(
                        fontSize: 12,
                        color: colors.onPrimary.withValues(alpha: 0.7),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                decoration: BoxDecoration(
                  color: display.color.withValues(alpha: 0.2),
                  borderRadius: BorderRadius.circular(999),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(display.icon, color: display.color, size: 18),
                    const SizedBox(width: 6),
                    Text(
                      display.text,
                      style: GoogleFonts.nunito(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: display.color,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildChartCard(BuildContext context, List<FlSpot> chartData) {
    final colors = Theme.of(context).extension<PawPalColors>()!;

    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: colors.surface,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Weight Trend',
            style: GoogleFonts.baloo2(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: colors.bodyTextColor,
            ),
          ),
          const SizedBox(height: 20),
          SizedBox(
            height: 200,
            child: chartData.isEmpty
                ? Center(
                    child: Text('No data for chart', style: GoogleFonts.nunito(color: colors.secondaryTextColor)),
                  )
                : LineChart(
                    LineChartData(
                      gridData: FlGridData(
                        show: true,
                        drawVerticalLine: false,
                        horizontalInterval: 1,
                        getDrawingHorizontalLine: (value) => FlLine(
                          color: colors.divider,
                          strokeWidth: 1,
                        ),
                      ),
                      titlesData: FlTitlesData(
                        show: true,
                        rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
                        topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
                        bottomTitles: AxisTitles(
                          sideTitles: SideTitles(
                            showTitles: true,
                            interval: 1,
                            getTitlesWidget: (value, meta) {
                              if (value.toInt() >= chartData.length) return const Text('');
                              return Padding(
                                padding: const EdgeInsets.only(top: 8),
                                child: Text(
                                  chartData[value.toInt()].x.toInt().toString(),
                                  style: GoogleFonts.nunito(fontSize: 10, color: colors.secondaryTextColor),
                                ),
                              );
                            },
                            reservedSize: 30,
                          ),
                        ),
                        leftTitles: AxisTitles(
                          sideTitles: SideTitles(
                            showTitles: true,
                            interval: 1,
                            getTitlesWidget: (value, meta) {
                              return Text(
                                value.toStringAsFixed(1),
                                style: GoogleFonts.nunito(fontSize: 10, color: colors.secondaryTextColor),
                              );
                            },
                            reservedSize: 40,
                          ),
                        ),
                      ),
                      borderData: FlBorderData(show: false),
                      minX: 0,
                      maxX: (chartData.length - 1).toDouble(),
                      minY: chartData.map((e) => e.y).reduce((a, b) => a < b ? a : b) - 1,
                      maxY: chartData.map((e) => e.y).reduce((a, b) => a > b ? a : b) + 1,
                      lineBarsData: [
                        LineChartBarData(
                          spots: chartData,
                          isCurved: true,
                          gradient: LinearGradient(
                            colors: [colors.primary, colors.accent],
                          ),
                          barWidth: 3,
                          isStrokeCapRound: true,
                          dotData: FlDotData(
                            show: true,
                            getDotPainter: (spot, percent, barData, index) => FlDotCirclePainter(
                              radius: 4,
                              color: colors.primary,
                              strokeWidth: 2,
                              strokeColor: colors.background,
                            ),
                          ),
                          belowBarData: BarAreaData(
                            show: true,
                            gradient: LinearGradient(
                              colors: [
                                colors.primary.withValues(alpha: 0.3),
                                colors.accent.withValues(alpha: 0.1),
                              ],
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
          ),
        ],
      ),
    );
  }

  Widget _buildHistorySection(BuildContext context, List<WeightEntry> entries) {
    final colors = Theme.of(context).extension<PawPalColors>()!;
    final sorted = List<WeightEntry>.from(entries)
      ..sort((a, b) => b.date.compareTo(a.date));

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Weight History',
              style: GoogleFonts.baloo2(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: colors.bodyTextColor,
              ),
            ),
            TextButton(
              onPressed: () => context.push('/services/weight_tracker/history'),
              child: Text(
                'See all',
                style: GoogleFonts.nunito(
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                  color: colors.primary,
                  decoration: TextDecoration.underline,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 12),
        ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: entries.length > 5 ? 5 : entries.length,
          itemBuilder: (context, index) {
            final entry = sorted[index];
            return _buildHistoryItem(context, entry);
          },
        ),
      ],
    );
  }

  Widget _buildHistoryItem(BuildContext context, WeightEntry entry) {
    final colors = Theme.of(context).extension<PawPalColors>()!;

    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: colors.surface,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(
              color: colors.primary.withValues(alpha: 0.15),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Icon(Icons.monitor_weight_rounded, color: colors.primary, size: 24),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '${entry.weight.toStringAsFixed(1)} ${entry.unit}',
                  style: GoogleFonts.nunito(
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    color: colors.bodyTextColor,
                  ),
                ),
                Text(
                  DateFormat('EEE, MMM d, yyyy').format(entry.date),
                  style: GoogleFonts.nunito(fontSize: 13, color: colors.secondaryTextColor),
                ),
              ],
            ),
          ),
          if (entry.notes != null && entry.notes!.isNotEmpty)
            Text(
              entry.notes!,
              style: GoogleFonts.nunito(fontSize: 12, color: colors.secondaryTextColor),
            ),
        ],
      ),
    );
  }

  Widget _buildEmptyState(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(32),
        child: PawlyEmptyState(
          title: 'No Weight Entries Yet',
          message: 'Track your pet\'s weight to monitor their health',
          actionLabel: 'Add Weight Entry',
          onAction: () => context.push('/services/weight_tracker/add'),
          icon: Icons.monitor_weight_rounded,
        ),
      ),
    );
  }

  Widget _buildNoPetSelected(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(32),
        child: PawlyEmptyState(
          title: 'Select a Pet',
          message: 'Choose a pet from the home screen to track their weight',
          actionLabel: 'Go to Pets',
          onAction: () => context.push('/pets'),
          icon: Icons.monitor_weight_rounded,
        ),
      ),
    );
  }

  Widget _buildLoadingState(BuildContext context) {
    final colors = Theme.of(context).extension<PawPalColors>()!;

    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          CircularProgressIndicator(color: colors.primary),
          const SizedBox(height: 16),
          Text('Loading weight data...', style: GoogleFonts.nunito(fontSize: 14, color: colors.secondaryTextColor)),
        ],
      ),
    );
  }

  Widget _buildErrorState(BuildContext context, WidgetRef ref, String error) {
    return Center(
      child: PawlyEmptyState(
        title: 'Error Loading Weight Data',
        message: error,
        actionLabel: 'Retry',
        onAction: () => ref.invalidate(weightTrackerServiceProvider),
        icon: Icons.error_outline_rounded,
      ),
    );
  }
}

class _TrendDisplay {
  final Color color;
  final IconData icon;
  final String text;

  _TrendDisplay({
    required this.color,
    required this.icon,
    required this.text,
  });
}