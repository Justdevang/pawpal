// ignore_for_file: type=lint
import 'dart:typed_data';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';
import 'package:intl/intl.dart';

import '../../domain/entities/vaccination_record.dart';
import '../../../pets/domain/entities/pet.dart';

/// PDF export service for vaccination records
class VaccinationPDFExport {
  static Future<Uint8List> generateVaccinationRecordPDF({
    required Pet pet,
    required List<VaccinationRecord> records,
    String? vetClinic,
  }) async {
    final pdf = pw.Document();
    final dateFormat = DateFormat('MMM d, yyyy');

    pdf.addPage(
      pw.MultiPage(
        pageFormat: PdfPageFormat.a4,
        margin: const pw.EdgeInsets.all(32),
        build: (context) => [
          // Header
          _buildHeader(pet, vetClinic),
          pw.SizedBox(height: 24),
          // Vaccination table
          _buildVaccinationTable(records, dateFormat),
          pw.SizedBox(height: 24),
          // Footer
          _buildFooter(),
        ],
      ),
    );

    return pdf.save();
  }

  static pw.Widget _buildHeader(Pet pet, String? vetClinic) {
    return pw.Column(
      crossAxisAlignment: pw.CrossAxisAlignment.start,
      children: [
        pw.Row(
          mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
          children: [
            pw.Column(
              crossAxisAlignment: pw.CrossAxisAlignment.start,
              children: [
                pw.Text(
                  'PawPal Vaccination Record',
                  style: pw.TextStyle(fontSize: 28, fontWeight: pw.FontWeight.bold, color: PdfColors.indigo900),
                ),
                pw.SizedBox(height: 8),
                pw.Text(
                  pet.name,
                  style: pw.TextStyle(fontSize: 22, fontWeight: pw.FontWeight.bold, color: PdfColors.grey800),
                ),
                pw.Text(
                  '${pet.speciesDisplayName} ${pet.breed != null ? '• ${pet.breed}' : ''}',
                  style: pw.TextStyle(fontSize: 14, color: PdfColors.grey600),
                ),
                pw.Text(
                  'Age: ${pet.formattedAge}  •  Weight: ${pet.formattedWeight}',
                  style: pw.TextStyle(fontSize: 14, color: PdfColors.grey600),
                ),
                if (pet.microchipNumber != null)
                  pw.Text(
                    'Microchip: ${pet.microchipNumber}',
                    style: pw.TextStyle(fontSize: 14, color: PdfColors.grey600),
                  ),
              ],
            ),
            pw.Column(
              crossAxisAlignment: pw.CrossAxisAlignment.end,
              children: [
                pw.Text(
                  'Generated: ${DateFormat('MMM d, yyyy').format(DateTime.now())}',
                  style: pw.TextStyle(fontSize: 12, color: PdfColors.grey500),
                ),
                if (vetClinic != null)
                  pw.Text(
                    'Clinic: $vetClinic',
                    style: pw.TextStyle(fontSize: 12, color: PdfColors.grey500),
                  ),
              ],
            ),
          ],
        ),
        pw.Divider(thickness: 2, color: PdfColors.indigo900),
      ],
    );
  }

  static pw.Widget _buildVaccinationTable(List<VaccinationRecord> records, DateFormat dateFormat) {
    if (records.isEmpty) {
      return pw.Center(
        child: pw.Text(
          'No vaccination records found',
          style: pw.TextStyle(fontSize: 16, color: PdfColors.grey600),
        ),
      );
    }

    // Sort by date given (newest first)
    final sortedRecords = List<VaccinationRecord>.from(records)
      ..sort((a, b) => b.dateGiven.compareTo(a.dateGiven));

    return pw.Table(
      border: pw.TableBorder.all(color: PdfColors.grey300, width: 0.5),
      columnWidths: {
        0: const pw.FlexColumnWidth(2), // Vaccine
        1: const pw.FlexColumnWidth(2), // Date Given
        2: const pw.FlexColumnWidth(2), // Next Due
        3: const pw.FlexColumnWidth(2), // Vet/Clinic
        4: const pw.FlexColumnWidth(1.5), // Status
      },
      children: [
        // Header
        pw.TableRow(
          decoration: const pw.BoxDecoration(color: PdfColors.indigo900),
          children: [
            _tableHeader('Vaccine'),
            _tableHeader('Date Given'),
            _tableHeader('Next Due'),
            _tableHeader('Vet/Clinic'),
            _tableHeader('Status'),
          ],
        ),
        // Data rows
        ...sortedRecords.map((record) {
          final isOverdue = record.nextDueDate != null && record.nextDueDate!.isBefore(DateTime.now());
          final isDueSoon = record.nextDueDate != null &&
              record.nextDueDate!.isAfter(DateTime.now()) &&
              record.nextDueDate!.difference(DateTime.now()).inDays <= 7;

          return pw.TableRow(
            decoration: pw.BoxDecoration(
              color: isOverdue ? PdfColors.red50 : (isDueSoon ? PdfColors.orange50 : PdfColors.white),
            ),
            children: [
              _tableCell(record.vaccineName),
              _tableCell(dateFormat.format(record.dateGiven)),
              _tableCell(record.nextDueDate != null ? dateFormat.format(record.nextDueDate!) : 'N/A'),
              _tableCell(record.vetClinic ?? 'N/A'),
              _tableCell(
                isOverdue ? 'OVERDUE' : (isDueSoon ? 'DUE SOON' : 'CURRENT'),
                style: pw.TextStyle(
                  color: isOverdue ? PdfColors.red800 : (isDueSoon ? PdfColors.orange800 : PdfColors.green800),
                  fontWeight: pw.FontWeight.bold,
                ),
              ),
            ],
          );
        }),
      ],
    );
  }

  static pw.Widget _tableHeader(String text) {
    return pw.Padding(
      padding: const pw.EdgeInsets.all(8),
      child: pw.Text(
        text,
        style: pw.TextStyle(
          fontSize: 11,
          fontWeight: pw.FontWeight.bold,
          color: PdfColors.white,
        ),
      ),
    );
  }

  static pw.Widget _tableCell(String text, {pw.TextStyle? style}) {
    return pw.Padding(
      padding: const pw.EdgeInsets.all(8),
      child: pw.Text(
        text,
        style: style ?? pw.TextStyle(fontSize: 10, color: PdfColors.grey800),
      ),
    );
  }

  static pw.Widget _buildFooter() {
    return pw.Column(
      children: [
        pw.Divider(thickness: 1, color: PdfColors.grey300),
        pw.SizedBox(height: 12),
        pw.Text(
          'This document is for informational purposes only. '
          'Please consult your veterinarian for medical advice.',
          style: pw.TextStyle(fontSize: 10, color: PdfColors.grey600),
          textAlign: pw.TextAlign.center,
        ),
        pw.SizedBox(height: 8),
        pw.Text(
          'Generated by PawPal - Your Pet Care Companion',
          style: pw.TextStyle(fontSize: 10, color: PdfColors.grey500),
          textAlign: pw.TextAlign.center,
        ),
      ],
    );
  }

  /// Share/print the PDF
  static Future<void> sharePDF({
    required Pet pet,
    required List<VaccinationRecord> records,
    String? vetClinic,
  }) async {
    final pdfBytes = await generateVaccinationRecordPDF(
      pet: pet,
      records: records,
      vetClinic: vetClinic,
    );

    await Printing.sharePdf(
      bytes: pdfBytes,
      filename: '${pet.name}_Vaccination_Record_${DateFormat('yyyyMMdd').format(DateTime.now())}.pdf',
    );
  }

  /// Print the PDF directly
  static Future<void> printPDF({
    required Pet pet,
    required List<VaccinationRecord> records,
    String? vetClinic,
  }) async {
    final pdfBytes = await generateVaccinationRecordPDF(
      pet: pet,
      records: records,
      vetClinic: vetClinic,
    );

    await Printing.layoutPdf(onLayout: (format) => pdfBytes);
  }
}
