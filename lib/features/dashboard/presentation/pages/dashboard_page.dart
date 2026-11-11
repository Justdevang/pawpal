// ignore_for_file: type=lint
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_animate/flutter_animate.dart';

import '../../../../core/theme/app_theme.dart';
import '../../../../core/widgets/index.dart';
import '../../domain/entities/dashboard_data.dart';
import '../providers/dashboard_providers.dart';
import '../../../pets/presentation/providers/pet_state_providers.dart';
import '../../../../core/extensions/extensions.dart';

/// Home dashboard with real data
class DashboardPage extends ConsumerWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colors = Theme.of(context).extension<PawPalColors>()!;
    final dashboardAsync = ref.watch(dashboardDataProvider);

    return Scaffold(
      backgroundColor: colors.background,
      body: SafeArea(
        child: dashboardAsync.when(
          data: (data) => _buildDashboard(context, ref, data, colors),
          loading: () => _buildLoading(context, colors),
          error: (error, stack) => _buildError(context, ref, error.toString(), colors),
        ),
      ),
    );
  }

  Widget _buildDashboard(BuildContext context, WidgetRef ref, DashboardDataEntity data, PawPalColors colors) {
    return CustomScrollView(
      slivers: [
        // Header with two-tone title
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: "Manage Your Pets'\n",
                        style: GoogleFonts.baloo2(
                          fontSize: 28,
                          height: 34 / 28,
                          fontWeight: FontWeight.w700,
                          color: colors.primaryDark,
                          letterSpacing: -0.5,
                        ),
                      ),
                      TextSpan(
                        text: 'Daily Care Easily',
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
                ),
                PawlyFrostedIconButton(
                  icon: Icons.menu_rounded,
                  onPressed: () => context.push('/settings'),
                  size: 48,
                ),
              ],
            ),
          ),
        ),
        // Search
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: PawlySearchField(
              hintText: 'Search pets, health, vaccines...',
              onTap: () => context.push('/pets'),
            ),
          ),
        ),
        SliverToBoxAdapter(child: SizedBox(height: 16)),
        // My Pets section
        SliverToBoxAdapter(
          child: PawlySectionHeader(
            title: 'My Pets',
            seeAllLabel: 'See all',
            onSeeAll: () => context.push('/pets'),
          ),
        ),
        SliverToBoxAdapter(
          child: data.pets.isEmpty
              ? Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 4),
                  child: InkWell(
                    onTap: () => context.push('/pets/add'),
                    borderRadius: BorderRadius.circular(20),
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                      decoration: BoxDecoration(
                        color: colors.surface,
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(
                          color: colors.accent.withValues(alpha: 0.25),
                          width: 1.5,
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: colors.overlay.withValues(alpha: 0.04),
                            blurRadius: 10,
                            offset: const Offset(0, 3),
                          ),
                        ],
                      ),
                      child: Row(
                        children: [
                          Container(
                            width: 50,
                            height: 50,
                            decoration: BoxDecoration(
                              color: colors.accent.withValues(alpha: 0.12),
                              borderRadius: BorderRadius.circular(16),
                            ),
                            child: Icon(
                              Icons.pets_rounded,
                              color: colors.accent,
                              size: 26,
                            ),
                          ),
                          const SizedBox(width: 14),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Add Your First Pet',
                                  style: GoogleFonts.baloo2(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w700,
                                    color: colors.primaryDark,
                                  ),
                                ),
                                const SizedBox(height: 2),
                                Text(
                                  'Track vaccinations, medications & care',
                                  style: GoogleFonts.nunito(
                                    fontSize: 12,
                                    color: colors.secondaryTextColor,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            width: 36,
                            height: 36,
                            decoration: BoxDecoration(
                              color: colors.primary,
                              shape: BoxShape.circle,
                            ),
                            child: const Icon(
                              Icons.add_rounded,
                              color: Colors.white,
                              size: 20,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                )
              : SizedBox(
                  height: 110,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    itemCount: data.pets.length + 1, // +1 for add button
                    itemBuilder: (context, index) {
                      if (index == data.pets.length) {
                        return PawlyPetAvatar(
                          isAddButton: true,
                          size: 78,
                          onTap: () => context.push('/pets/add'),
                        ).animate().fadeIn(duration: 300.ms, delay: (60 * index).ms);
                      }
                      final pet = data.pets[index];
                      return PawlyPetAvatar(
                        name: pet.name,
                        imageUrl: pet.photoUrl,
                        localPath: pet.localPhotoPath,
                        size: 78,
                        isSelected: pet.isSelected,
                        onTap: () {
                          ref.read(selectedPetIdProvider.notifier).select(pet.id);
                          context.push('/pets/${pet.id}');
                        },
                      ).animate().fadeIn(duration: 300.ms, delay: (60 * index).ms).slideX(begin: 0.1, end: 0);
                    },
                  ),
                ),
        ),
        // Today's Tasks
        SliverToBoxAdapter(
          child: PawlySectionHeader(
            title: "Today's Tasks",
            seeAllLabel: 'See all',
            onSeeAll: () => context.push('/reminders'),
          ),
        ),
        SliverToBoxAdapter(
          child: (data.todaysTasks.isEmpty && data.overdueTasks.isEmpty)
              ? _buildTasksList(context, data.todaysTasks, data.overdueTasks, colors)
              : SizedBox(
                  height: 180,
                  child: _buildTasksList(context, data.todaysTasks, data.overdueTasks, colors),
                ),
        ),
        // Overdue section (if any)
        if (data.overdueTasks.isNotEmpty) ...[
          SliverToBoxAdapter(
            child: PawlySectionHeader(
              title: 'Overdue',
              seeAllLabel: 'See all',
              onSeeAll: () => context.push('/reminders'),
            ),
          ),
          SliverToBoxAdapter(
            child: SizedBox(
              height: 180,
              child: _buildTasksList(context, data.overdueTasks, [], colors),
            ),
          ),
        ],
        // Upcoming section (if any)
        if (data.upcomingTasks.isNotEmpty) ...[
          SliverToBoxAdapter(
            child: PawlySectionHeader(
              title: 'Upcoming (7 days)',
              seeAllLabel: 'See all',
              onSeeAll: () => context.push('/reminders'),
            ),
          ),
          SliverToBoxAdapter(
            child: SizedBox(
              height: 180,
              child: _buildTasksList(context, data.upcomingTasks, [], colors),
            ),
          ),
        ],
        // Health Summary
        if (data.healthSummary != null) ...[
          SliverToBoxAdapter(
            child: PawlySectionHeader(
              title: 'Health Summary',
              seeAllLabel: 'See all',
              onSeeAll: () => context.push('/pets/${ref.watch(selectedPetIdProvider)}'),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: PawlyHealthSummaryCard(
                petName: data.healthSummary!.petName,
                petImageUrl: data.healthSummary!.petImageUrl,
                petLocalPath: data.healthSummary!.petLocalPath,
                weight: data.healthSummary!.weight,
                healthStatus: data.healthSummary!.healthStatus,
                lastVetVisit: data.healthSummary!.lastVetVisit,
                onTap: () => context.push('/pets/${ref.watch(selectedPetIdProvider)}'),
              ),
            ),
          ),
        ],
        SliverToBoxAdapter(child: SizedBox(height: 100)), // Bottom nav space
      ],
    );
  }

  Widget _buildTasksList(BuildContext context, List<TaskSummary> tasks, List<TaskSummary> overdue, PawPalColors colors) {
    final allTasks = [...overdue, ...tasks];
    if (allTasks.isEmpty) {
      return Center(
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
          decoration: BoxDecoration(
            color: colors.surface,
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: colors.divider.withValues(alpha: 0.6)),
          ),
          child: Row(
            children: [
              Container(
                width: 44,
                height: 44,
                decoration: BoxDecoration(
                  color: colors.success.withValues(alpha: 0.12),
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: Icon(Icons.check_circle_rounded, color: colors.success, size: 24),
                ),
              ),
              const SizedBox(width: 14),
              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'All Caught Up!',
                      style: GoogleFonts.baloo2(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        color: colors.bodyTextColor,
                      ),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      'No tasks due today. Enjoy quality time with your pets!',
                      style: GoogleFonts.nunito(
                        fontSize: 12,
                        color: colors.secondaryTextColor,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
    }

    return ListView.builder(
      scrollDirection: Axis.horizontal,
      padding: const EdgeInsets.symmetric(horizontal: 20),
      itemCount: allTasks.length,
      itemBuilder: (context, index) {
        final task = allTasks[index];
        return PawlyTaskCard(
          petName: task.petName.isEmpty ? 'Unknown' : task.petName,
          title: task.title,
          subtitle: task.description ?? _getSubtitleForType(task.type),
          time: task.scheduledTime.formatTime(),
          status: task.isOverdue ? TaskCardStatus.overdue : TaskCardStatus.pending,
          index: index,
          total: allTasks.length,
          onComplete: () => _handleTaskComplete(context, task),
          onSnooze: () => _handleTaskSnooze(context, task),
          onSkip: () => _handleTaskSkip(context, task),
        );
      },
    );
  }

  String _getSubtitleForType(String type) {
    switch (type) {
      case 'medication':
        return 'Medication dose';
      case 'vaccination':
        return 'Vaccination due';
      case 'appointment':
        return 'Vet appointment';
      case 'weight':
        return 'Weight check';
      default:
        return 'Reminder';
    }
  }

  void _handleTaskComplete(BuildContext context, TaskSummary task) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('${task.title} marked complete!')),
    );
  }

  void _handleTaskSnooze(BuildContext context, TaskSummary task) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('${task.title} snoozed 15 min')),
    );
  }

  void _handleTaskSkip(BuildContext context, TaskSummary task) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('${task.title} skipped')),
    );
  }

  Widget _buildLoading(BuildContext context, PawPalColors colors) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          CircularProgressIndicator(color: colors.primary),
          const SizedBox(height: 16),
          Text('Loading dashboard...', style: GoogleFonts.nunito(fontSize: 14, color: colors.secondaryTextColor)),
        ],
      ),
    );
  }

  Widget _buildError(BuildContext context, WidgetRef ref, String error, PawPalColors colors) {
    return Center(
      child: PawlyEmptyState(
        title: 'Error Loading Dashboard',
        message: error,
        actionLabel: 'Retry',
        onAction: () => ref.invalidate(dashboardDataProvider),
        icon: Icons.error_outline_rounded,
      ),
    );
  }
}