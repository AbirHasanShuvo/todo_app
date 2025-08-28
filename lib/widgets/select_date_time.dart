import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:todo_app/widgets/common_textfield.dart';
import '../providers/providers.dart';

class SelectDateTime extends ConsumerWidget {
  const SelectDateTime({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final date = ref.watch(dateProvider);
    final time = ref.watch(timeProvider);
    return Row(
      children: [
        Expanded(
          child: CommonTextfield(
            readOnly: true,
            suffixIcon: IconButton(
              onPressed: () => _selectDate(context, ref),
              icon: FaIcon(FontAwesomeIcons.calendar),
            ),
            title: 'Date',
            hintText: date.toString().split(' ')[0],
          ),
        ),
        SizedBox(width: 10),
        Expanded(
          child: CommonTextfield(
            readOnly: true,
            title: 'Time',
            hintText: time.format(context),
            suffixIcon: IconButton(
              onPressed: () => _selectTime(context, ref),
              icon: FaIcon(FontAwesomeIcons.clock),
            ),
          ),
        ),
      ],
    );
  }

  void _selectTime(BuildContext context, WidgetRef ref) async {
    final time = ref.watch(timeProvider);

    TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    if (pickedTime != null) {
      ref.read(timeProvider.notifier).update((state) => pickedTime);
    }
  }

  void _selectDate(BuildContext context, WidgetRef ref) async {
    final date = ref.watch(dateProvider);
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: date,
      firstDate: DateTime(2019),
      lastDate: DateTime(2090),
    );
    if (pickedDate != null) {
      ref.read(dateProvider.notifier).update((state) => pickedDate);
    }
  }
}
