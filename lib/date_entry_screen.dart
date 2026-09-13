import 'package:flutter/material.dart';

/// A screen that lets the user pick a date and confirm it.
///
/// Pops with the selected [DateTime] when the user saves, or with `null`
/// if they cancel without picking anything.
class DateEntryScreen extends StatefulWidget {
  const DateEntryScreen({super.key, this.initialDate});

  /// An optional date to pre-populate the picker with.
  final DateTime? initialDate;

  @override
  State<DateEntryScreen> createState() => _DateEntryScreenState();
}

class _DateEntryScreenState extends State<DateEntryScreen> {
  DateTime? _selectedDate;

  @override
  void initState() {
    super.initState();
    _selectedDate = widget.initialDate;
  }

  Future<void> _pickDate() async {
    final DateTime now = DateTime.now();
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate ?? now,
      firstDate: DateTime(now.year - 100),
      lastDate: DateTime(now.year + 100),
    );

    if (picked != null) {
      setState(() {
        _selectedDate = picked;
      });
    }
  }

  String _formatDate(DateTime date) {
    return '${date.year}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Select a Date'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                _selectedDate == null
                    ? 'No date selected'
                    : _formatDate(_selectedDate!),
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              const SizedBox(height: 24),
              OutlinedButton.icon(
                onPressed: _pickDate,
                icon: const Icon(Icons.calendar_today),
                label: const Text('Choose Date'),
              ),
              const SizedBox(height: 32),
              ElevatedButton(
                onPressed: _selectedDate == null
                    ? null
                    : () => Navigator.of(context).pop(_selectedDate),
                child: const Text('Save'),
              ),
              const SizedBox(height: 12),
              TextButton(
                onPressed: () => Navigator.of(context).pop(),
                child: const Text('Cancel'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
