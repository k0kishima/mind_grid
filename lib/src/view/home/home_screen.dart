import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:mind_grid/src/providers/setting.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final settings = ref.watch(settingProvider);
    final gridWidth = settings.gridWidth;
    final gridHeight = settings.gridHeight;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Screen'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            SettingsSliderWidget(
              value: gridWidth.toInt(),
              min: 4,
              max: 10,
              divisions: 8,
              label: 'Grid Width',
              onChanged: (value) {
                ref.read(settingProvider.notifier).setGridWidth(value.toInt());
              },
            ),
            SettingsSliderWidget(
              value: gridHeight.toInt(),
              min: 4,
              max: 10,
              divisions: 8,
              label: 'Grid Height',
              onChanged: (value) {
                ref.read(settingProvider.notifier).setGridHeight(value.toInt());
              },
            ),
            ElevatedButton(
              onPressed: () {
                context.go('/play/question');
              },
              child: const Text('Go to Question Screen'),
            ),
          ],
        ),
      ),
    );
  }
}

class SettingsSliderWidget extends ConsumerWidget {
  final int value;
  final int min;
  final int max;
  final int divisions;
  final String label;
  final void Function(int) onChanged;

  const SettingsSliderWidget({
    super.key,
    required this.value,
    required this.min,
    required this.max,
    required this.divisions,
    required this.label,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(fontSize: 18),
        ),
        const SizedBox(height: 20),
        Slider(
          value: value.toDouble(),
          min: min.toDouble(),
          max: max.toDouble(),
          divisions: divisions,
          label: value.toString(),
          onChanged: (double newValue) {
            onChanged(newValue.round());
          },
          activeColor: theme.primaryColor,
          inactiveColor: theme.disabledColor,
        ),
      ],
    );
  }
}
