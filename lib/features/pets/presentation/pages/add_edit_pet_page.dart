// ignore_for_file: type=lint
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../core/theme/app_theme.dart';
import '../../../../core/widgets/index.dart';
import '../../domain/entities/pet.dart';
import '../providers/pet_providers.dart';
import '../providers/pet_state_providers.dart';
import '../../../auth/presentation/providers/auth_provider.dart';
import 'package:pawpal/core/extensions/extensions.dart';

/// Add/Edit pet page with real database integration
class AddEditPetPage extends ConsumerStatefulWidget {
  final int? petId;

  const AddEditPetPage({super.key, this.petId});

  @override
  ConsumerState<AddEditPetPage> createState() => _AddEditPetPageState();
}

class _AddEditPetPageState extends ConsumerState<AddEditPetPage> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _breedController = TextEditingController();
  final _weightController = TextEditingController();
  final _microchipController = TextEditingController();
  final _notesController = TextEditingController();

  String _selectedSpecies = 'dog';
  String _selectedSex = 'male';
  DateTime? _birthDate;
  String _weightUnit = 'kg';
  String? _photoUrl;
  String? _localPhotoPath;
  bool _isLoading = false;
  bool _isEditing = false;

  @override
  void initState() {
    super.initState();
    _isEditing = widget.petId != null;
    if (_isEditing) {
      _loadPet();
    }
  }

  Future<void> _loadPet() async {
    final pet = await ref.read(getPetUseCaseProvider)(widget.petId!);
    pet.fold(
      (error) => ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(error.toString()))),
      (pet) {
        if (pet != null) {
          setState(() {
            _nameController.text = pet.name;
            _selectedSpecies = pet.species;
            _breedController.text = pet.breed ?? '';
            _selectedSex = pet.sex ?? 'unknown';
            _birthDate = pet.birthDate;
            _weightController.text = pet.weight?.toString() ?? '';
            _weightUnit = pet.weightUnit;
            _microchipController.text = pet.microchipNumber ?? '';
            _notesController.text = pet.notes ?? '';
            _photoUrl = pet.photoUrl;
            _localPhotoPath = pet.localPhotoPath;
          });
        }
      },
    );
  }

  @override
  void dispose() {
    _nameController.dispose();
    _breedController.dispose();
    _weightController.dispose();
    _microchipController.dispose();
    _notesController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).extension<PawPalColors>()!;

    return Scaffold(
      backgroundColor: colors.background,
      appBar: AppBar(
        title: Text(
          _isEditing ? 'Edit Pet' : 'Add Pet',
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
          onPressed: () {
            if (context.canPop()) {
              context.pop();
            } else {
              context.go('/');
            }
          },
        ),
      ),
      body: SafeArea(
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const SizedBox(height: 16),
                // Photo picker
                Center(
                  child: GestureDetector(
                    onTap: _pickPhoto,
                    child: Stack(
                      children: [
                        Container(
                          width: 100,
                          height: 100,
                          decoration: BoxDecoration(
                            color: colors.surfaceSoft,
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(color: colors.divider, width: 1.5),
                          ),
                          child: _buildPhotoPreview(),
                        ),
                        Positioned(
                          bottom: 0,
                          right: 0,
                          child: Container(
                            width: 32,
                            height: 32,
                            decoration: BoxDecoration(
                              color: colors.primary,
                              shape: BoxShape.circle,
                              border: Border.all(color: colors.background, width: 2),
                            ),
                            child: Icon(
                              Icons.camera_alt_rounded,
                              color: colors.onPrimary,
                              size: 16,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 24),
                // Name
                PawlyTextField(
                  controller: _nameController,
                  labelText: 'Name *',
                  hintText: 'Bella',
                  validator: (v) => v?.isEmpty == true ? 'Name is required' : null,
                ),
                const SizedBox(height: 16),
                // Species
                _buildDropdown(
                  label: 'Species *',
                  value: _selectedSpecies,
                  items: ['dog', 'cat', 'rabbit', 'hamster', 'bird', 'other'],
                  onChanged: (v) => setState(() => _selectedSpecies = v!),
                ),
                const SizedBox(height: 16),
                // Breed
                PawlyTextField(
                  controller: _breedController,
                  labelText: 'Breed',
                  hintText: 'Golden Retriever',
                ),
                const SizedBox(height: 16),
                // Sex
                _buildDropdown(
                  label: 'Sex',
                  value: _selectedSex,
                  items: ['male', 'female', 'unknown'],
                  onChanged: (v) => setState(() => _selectedSex = v!),
                ),
                const SizedBox(height: 16),
                // Birth date
                _buildDatePicker(),
                const SizedBox(height: 16),
                // Weight
                Row(
                  children: [
                    Expanded(
                      flex: 3,
                      child: PawlyTextField(
                        controller: _weightController,
                        labelText: 'Weight',
                        hintText: '12.8',
                        keyboardType: TextInputType.number,
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: _buildDropdown(
                        label: 'Unit',
                        value: _weightUnit,
                        items: ['kg', 'lb'],
                        onChanged: (v) => setState(() => _weightUnit = v!),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                // Microchip
                PawlyTextField(
                  controller: _microchipController,
                  labelText: 'Microchip Number',
                  hintText: '123456789012345',
                ),
                const SizedBox(height: 16),
                // Notes
                PawlyTextField(
                  controller: _notesController,
                  labelText: 'Notes',
                  hintText: 'Allergies, special needs, etc.',
                  maxLines: 3,
                ),
                const SizedBox(height: 32),
                // Save button
                PawlyButton(
                  label: _isEditing ? 'Save Changes' : 'Add Pet',
                  onPressed: _isLoading ? null : _savePet,
                  isLoading: _isLoading,
                ),
                const SizedBox(height: 40),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildPhotoPreview() {
    final colors = Theme.of(context).extension<PawPalColors>()!;

    if (_localPhotoPath != null) {
      return ClipRRect(
        borderRadius: BorderRadius.circular(18),
        child: Image.asset(_localPhotoPath!, fit: BoxFit.cover, width: 100, height: 100),
      );
    }

    if (_photoUrl != null && _photoUrl!.isNotEmpty) {
      return ClipRRect(
        borderRadius: BorderRadius.circular(18),
        child: Image.network(_photoUrl!, fit: BoxFit.cover, width: 100, height: 100),
      );
    }

    return Center(
      child: Icon(
        Icons.pets_rounded,
        size: 40,
        color: colors.primary.withValues(alpha: 0.5),
      ),
    );
  }

  Widget _buildDropdown({
    required String label,
    required String value,
    required List<String> items,
    required ValueChanged<String?> onChanged,
  }) {
    final colors = Theme.of(context).extension<PawPalColors>()!;

    return DropdownButtonFormField<String>(
      initialValue: value,
      decoration: InputDecoration(
        labelText: label,
        filled: true,
        fillColor: colors.searchField,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide.none,
        ),
      ),
      style: GoogleFonts.nunito(fontSize: 16, color: colors.bodyTextColor),
      dropdownColor: colors.surface,
      items: items.map((item) => DropdownMenuItem(
        value: item,
        child: Text(item.capitalize(), style: GoogleFonts.nunito(fontSize: 16, color: colors.bodyTextColor)),
      )).toList(),
      onChanged: onChanged,
    );
  }

  Widget _buildDatePicker() {
    final colors = Theme.of(context).extension<PawPalColors>()!;

    return InkWell(
      onTap: _pickBirthDate,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        decoration: BoxDecoration(
          color: colors.searchField,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Row(
          children: [
            Icon(Icons.cake_rounded, color: colors.secondaryTextColor),
            const SizedBox(width: 12),
            Expanded(
              child: Text(
                _birthDate != null
                    ? 'Birth Date: ${_birthDate!.formatDate()}'
                    : 'Select Birth Date (optional)',
                style: GoogleFonts.nunito(
                  fontSize: 16,
                  color: _birthDate != null ? colors.bodyTextColor : colors.secondaryTextColor,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _pickBirthDate() async {
    final date = await showDatePicker(
      context: context,
      initialDate: _birthDate ?? DateTime.now().subtract(const Duration(days: 365)),
      firstDate: DateTime(2000),
      lastDate: DateTime.now(),
    );
    if (date != null) setState(() => _birthDate = date);
  }

  Future<void> _pickPhoto() async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(
      source: ImageSource.gallery,
      maxWidth: 800,
      maxHeight: 800,
      imageQuality: 80,
    );
    if (image != null) {
      setState(() => _localPhotoPath = image.path);
      // TODO: Upload to Firebase Storage and get URL
    }
  }

  Future<void> _savePet() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() => _isLoading = true);

    try {
      final authState = ref.read(authProvider);
      final user = authState.value;
      final userId = user != null ? (int.tryParse(user.id) ?? 0) : 0;

      final weight = double.tryParse(_weightController.text);
      final pet = Pet(
        id: widget.petId ?? 0,
        userId: userId,
        name: _nameController.text.trim(),
        species: _selectedSpecies,
        breed: _breedController.text.trim().isEmpty ? null : _breedController.text.trim(),
        sex: _selectedSex,
        birthDate: _birthDate,
        approximateAge: _birthDate == null ? null : 'Calculated from birth date',
        weight: weight,
        weightUnit: _weightUnit,
        microchipNumber: _microchipController.text.trim().isEmpty ? null : _microchipController.text.trim(),
        photoUrl: _photoUrl,
        localPhotoPath: _localPhotoPath,
        notes: _notesController.text.trim().isEmpty ? null : _notesController.text.trim(),
        isArchived: false,
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
      );

      if (_isEditing) {
        await ref.read(updatePetUseCaseProvider)(pet.copyWith(id: widget.petId!));
      } else {
        final createResult = await ref.read(createPetUseCaseProvider)(pet);
        createResult.fold(
          (error) => throw Exception(error.toString()),
          (createdPet) {
            ref.read(selectedPetIdProvider.notifier).select(createdPet.id);
          },
        );
      }

      if (mounted) {
        setState(() => _isLoading = false);
        ref.invalidate(petsListProvider);
        if (context.canPop()) {
          context.pop(true);
        } else {
          context.go('/');
        }
      }
    } catch (e) {
      if (mounted) {
        setState(() => _isLoading = false);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Failed to save pet: $e')),
        );
      }
    }
  }
}
