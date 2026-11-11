// ignore_for_file: type=lint
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/theme/app_theme.dart';
import '../../../../core/widgets/index.dart';
import '../../../../features/auth/presentation/providers/auth_provider.dart';

/// Quiet hours settings page
class QuietHoursPage extends ConsumerStatefulWidget {
  const QuietHoursPage({super.key});

  @override
  ConsumerState<QuietHoursPage> createState() => _QuietHoursPageState();
}

class _QuietHoursPageState extends ConsumerState<QuietHoursPage> {
  TimeOfDay? _startTime;
  TimeOfDay? _endTime;
  bool _enabled = false;
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _loadSettings();
  }

  Future<void> _loadSettings() async {
    final authState = ref.read(authProvider);
    final user = authState.value;
    if (user != null) {
      _enabled = user.quietHoursStart != null && user.quietHoursEnd != null;
      if (user.quietHoursStart != null) {
        _startTime = TimeOfDay(hour: user.quietHoursStart!.hour, minute: user.quietHoursStart!.minute);
      }
      if (user.quietHoursEnd != null) {
        _endTime = TimeOfDay(hour: user.quietHoursEnd!.hour, minute: user.quietHoursEnd!.minute);
      }
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).extension<PawPalColors>()!;

    return Scaffold(
      backgroundColor: colors.background,
      appBar: AppBar(
        title: Text(
          'Quiet Hours',
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
                'Notification Schedule',
                style: GoogleFonts.baloo2(fontSize: 18, fontWeight: FontWeight.w600, color: colors.primaryDark),
              ),
              const SizedBox(height: 16),
              // Enabled toggle
              Material(
                color: colors.surface,
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
                        child: Icon(Icons.schedule_rounded, color: colors.primary, size: 24),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Quiet Hours',
                              style: GoogleFonts.nunito(fontSize: 16, fontWeight: FontWeight.w600, color: colors.bodyTextColor),
                            ),
                            Text(
                              'Suppress notifications during this time',
                              style: GoogleFonts.nunito(fontSize: 13, color: colors.secondaryTextColor),
                            ),
                          ],
                        ),
                      ),
                      Switch(
                        value: _enabled,
                        onChanged: (v) => setState(() => _enabled = v),
                        activeThumbColor: colors.primary,
                        activeTrackColor: colors.primary.withValues(alpha: 0.3),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 16),
              if (_enabled) ...[
                // Start time
                _buildTimePicker(
                  context,
                  label: 'Start Time',
                  time: _startTime,
                  onTap: () => _pickTime(isStart: true),
                ),
                const SizedBox(height: 12),
                // End time
                _buildTimePicker(
                  context,
                  label: 'End Time',
                  time: _endTime,
                  onTap: () => _pickTime(isStart: false),
                ),
                const SizedBox(height: 24),
                // Preview
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: colors.surfaceSoft,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Notifications will be silenced',
                        style: GoogleFonts.nunito(fontSize: 14, fontWeight: FontWeight.w600, color: colors.bodyTextColor),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        'From ${_formatTime(_startTime)} to ${_formatTime(_endTime)}',
                        style: GoogleFonts.nunito(fontSize: 13, color: colors.secondaryTextColor),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        'Emergency reminders (overdue medications) will still notify',
                        style: GoogleFonts.nunito(fontSize: 12, color: colors.warning),
                      ),
                    ],
                  ),
                ),
              ],
              const Spacer(),
              // Save button
              PawlyButton(
                label: 'Save Quiet Hours',
                onPressed: _isLoading ? null : _saveSettings,
                isLoading: _isLoading,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTimePicker(
    BuildContext context, {
    required String label,
    required TimeOfDay? time,
    required VoidCallback onTap,
  }) {
    final colors = Theme.of(context).extension<PawPalColors>()!;

    return Material(
      color: colors.surface,
      borderRadius: BorderRadius.circular(16),
      child: InkWell(
        onTap: onTap,
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
                child: Icon(Icons.access_time_rounded, color: colors.primary, size: 24),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      label,
                      style: GoogleFonts.nunito(fontSize: 14, color: colors.secondaryTextColor),
                    ),
                    Text(
                      time != null ? time.format(context) : 'Select time',
                      style: GoogleFonts.nunito(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: time != null ? colors.bodyTextColor : colors.secondaryTextColor,
                      ),
                    ),
                  ],
                ),
              ),
              Icon(Icons.chevron_right_rounded, color: colors.secondaryTextColor, size: 20),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _pickTime({required bool isStart}) async {
    final time = await showTimePicker(
      context: context,
      initialTime: isStart ? (_startTime ?? const TimeOfDay(hour: 22, minute: 0)) : (_endTime ?? const TimeOfDay(hour: 7, minute: 0)),
    );
    if (time != null) {
      setState(() {
        if (isStart) {
          _startTime = time;
        } else {
          _endTime = time;
        }
      });
    }
  }

  String _formatTime(TimeOfDay? time) {
    if (time == null) return '--:--';
    final hour = time.hour % 12 == 0 ? 12 : time.hour % 12;
    final period = time.hour >= 12 ? 'PM' : 'AM';
    return '$hour:${time.minute.toString().padLeft(2, '0')} $period';
  }

  Future<void> _saveSettings() async {
    if (!_enabled || _startTime == null || _endTime == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Please select both start and end times')),
      );
      return;
    }

    setState(() => _isLoading = true);
    // TODO: Save to user preferences
    await Future.delayed(const Duration(milliseconds: 500));
    if (mounted) {
      setState(() => _isLoading = false);
      context.pop();
    }
  }
}