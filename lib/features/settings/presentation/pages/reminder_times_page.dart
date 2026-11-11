// ignore_for_file: type=lint
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/theme/app_theme.dart';
import '../../../../core/widgets/index.dart';

/// Reminder times settings page
class ReminderTimesPage extends ConsumerStatefulWidget {
  const ReminderTimesPage({super.key});

  @override
  ConsumerState<ReminderTimesPage> createState() => _ReminderTimesPageState();
}

class _ReminderTimesPageState extends ConsumerState<ReminderTimesPage> {
  final Map<String, TimeOfDay> _reminderTimes = {};
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _loadDefaults();
  }

  void _loadDefaults() {
    // Default reminder times
    _reminderTimes['morning'] = const TimeOfDay(hour: 8, minute: 0);
    _reminderTimes['midday'] = const TimeOfDay(hour: 12, minute: 0);
    _reminderTimes['evening'] = const TimeOfDay(hour: 18, minute: 0);
    _reminderTimes['bedtime'] = const TimeOfDay(hour: 21, minute: 0);
  }

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).extension<PawPalColors>()!;

    return Scaffold(
      backgroundColor: colors.background,
      appBar: AppBar(
        title: Text(
          'Reminder Times',
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
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Default Reminder Times',
                style: GoogleFonts.baloo2(fontSize: 18, fontWeight: FontWeight.w600, color: colors.primaryDark),
              ),
              const SizedBox(height: 8),
              Text(
                'Set default times for new medication reminders. Individual medications can override these.',
                style: GoogleFonts.nunito(fontSize: 13, color: colors.secondaryTextColor),
              ),
              const SizedBox(height: 24),
              // Reminder time slots
              _buildTimeSlot(
                context,
                label: 'Morning',
                key: 'morning',
                icon: Icons.wb_sunny_rounded,
              ),
              const SizedBox(height: 12),
              _buildTimeSlot(
                context,
                label: 'Midday',
                key: 'midday',
                icon: Icons.wb_sunny_outlined,
              ),
              const SizedBox(height: 12),
              _buildTimeSlot(
                context,
                label: 'Evening',
                key: 'evening',
                icon: Icons.nights_stay_rounded,
              ),
              const SizedBox(height: 12),
              _buildTimeSlot(
                context,
                label: 'Bedtime',
                key: 'bedtime',
                icon: Icons.bedtime_rounded,
              ),
              const Spacer(),
              // Add custom time
              PawlyGhostButton(
                label: 'Add Custom Time',
                onPressed: _addCustomTime,
                leadingIcon: Icons.add_rounded,
              ),
              const SizedBox(height: 16),
              // Save button
              PawlyButton(
                label: 'Save Reminder Times',
                onPressed: _isLoading ? null : _saveTimes,
                isLoading: _isLoading,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTimeSlot(
    BuildContext context, {
    required String label,
    required String key,
    required IconData icon,
  }) {
    final colors = Theme.of(context).extension<PawPalColors>()!;
    final time = _reminderTimes[key];

    return Material(
      color: colors.surface,
      borderRadius: BorderRadius.circular(16),
      child: InkWell(
        onTap: () => _pickTime(key),
        borderRadius: BorderRadius.circular(16),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              Container(
                width: 48,
                height: 48,
                decoration: BoxDecoration(
                  color: colors.surfaceSoft,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(icon, color: colors.primary, size: 24),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      label,
                      style: GoogleFonts.nunito(fontSize: 16, fontWeight: FontWeight.w600, color: colors.bodyTextColor),
                    ),
                    Text(
                      time != null ? time.format(context) : 'Not set',
                      style: GoogleFonts.nunito(
                        fontSize: 14,
                        color: time != null ? colors.bodyTextColor : colors.secondaryTextColor,
                      ),
                    ),
                  ],
                ),
              ),
              if (time != null)
                Icon(Icons.check_circle_rounded, color: colors.success, size: 20),
              Icon(Icons.chevron_right_rounded, color: colors.secondaryTextColor, size: 20),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _pickTime(String key) async {
    final time = await showTimePicker(
      context: context,
      initialTime: _reminderTimes[key] ?? TimeOfDay.now(),
    );
    if (time != null) {
      setState(() => _reminderTimes[key] = time);
    }
  }

  Future<void> _addCustomTime() async {
    // TODO: Show dialog to add custom time slot
  }

  Future<void> _saveTimes() async {
    setState(() => _isLoading = true);
    // TODO: Save to user preferences
    await Future.delayed(const Duration(milliseconds: 500));
    if (mounted) {
      setState(() => _isLoading = false);
      context.pop();
    }
  }
}