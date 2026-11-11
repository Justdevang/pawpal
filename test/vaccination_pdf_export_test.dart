// ignore_for_file: type=lint
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import 'package:pawpal/features/vaccinations/presentation/pages/vaccination_pdf_export.dart';
import 'package:pawpal/features/vaccinations/domain/entities/vaccination_record.dart';
import 'package:pawpal/features/pets/domain/entities/pet.dart';

class MockPet extends Mock implements Pet {}
class MockVaccinationRecord extends Mock implements VaccinationRecord {}

void main() {
  group('VaccinationPDFExport', () {
    late Pet pet;
    late List<VaccinationRecord> records;

    setUp(() {
      pet = MockPet();
      when(() => pet.name).thenReturn('Bella');
      when(() => pet.species).thenReturn('dog');
      when(() => pet.breed).thenReturn('Golden Retriever');
      when(() => pet.formattedAge).thenReturn('3 years');
      when(() => pet.formattedWeight).thenReturn('12.8 kg');
      when(() => pet.microchipNumber).thenReturn('123456789012345');
      when(() => pet.speciesDisplayName).thenReturn('Dog');

      final record1 = MockVaccinationRecord();
      when(() => record1.vaccineName).thenReturn('Rabies');
      when(() => record1.dateGiven).thenReturn(DateTime(2026, 1, 10));
      when(() => record1.nextDueDate).thenReturn(DateTime(2027, 1, 10));
      when(() => record1.vetClinic).thenReturn('City Animal Hospital');
      when(() => record1.batchNumber).thenReturn('BATCH-001');

      final record2 = MockVaccinationRecord();
      when(() => record2.vaccineName).thenReturn('DHPP');
      when(() => record2.dateGiven).thenReturn(DateTime(2025, 3, 1));
      when(() => record2.nextDueDate).thenReturn(DateTime(2026, 3, 1));
      when(() => record2.vetClinic).thenReturn('City Animal Hospital');
      when(() => record2.batchNumber).thenReturn('BATCH-002');

      records = [record1, record2];
    });

    test('generateVaccinationRecordPDF returns valid PDF bytes', () async {
      final pdfBytes = await VaccinationPDFExport.generateVaccinationRecordPDF(
        pet: pet,
        records: records,
        vetClinic: 'City Animal Hospital',
      );

      expect(pdfBytes, isNotNull);
      expect(pdfBytes.length, greaterThan(0));
      // PDF magic number
      expect(pdfBytes[0], equals(0x25)); // %
      expect(pdfBytes[1], equals(0x50)); // P
      expect(pdfBytes[2], equals(0x44)); // D
      expect(pdfBytes[3], equals(0x46)); // F
    });
  });
}
