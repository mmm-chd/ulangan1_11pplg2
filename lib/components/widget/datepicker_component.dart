import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DatepickerComponent extends StatelessWidget {
  final String label;
  final Color outlineColor;
  final double borderRadius;

  final DateTime? selectedDate; 
  final Function(DateTime) onDateSelected;

  const DatepickerComponent({
    super.key,
    required this.label,
    required this.outlineColor,
    this.borderRadius = 16,
    required this.selectedDate,
    required this.onDateSelected,
    });

  Future<void> _pickDate(BuildContext context) async{

    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate ?? DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );
    if (picked != null) {
      onDateSelected(picked);
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => _pickDate(context),
      child: InputDecorator(
        decoration: InputDecoration(
          labelText: label,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(borderRadius)
            ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(borderRadius),
            borderSide: BorderSide(color: outlineColor, width: 2),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(borderRadius),
            borderSide: BorderSide(color: outlineColor, width: 2),
          ),
          suffixIcon: Icon(Icons.calendar_today),
        ),
        child: Text(
          selectedDate == null
              ? "Select Date"
              : DateFormat("dd/MM/yyyy").format(selectedDate!),
            style: TextStyle(fontSize: 16),
        ),
        ),
    );
  }
}