import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mind_grid/src/models/setting.dart';

class SettingNotifier extends StateNotifier<Setting> {
  SettingNotifier() : super(Setting(gridWidth: 8, gridHeight: 8));

  void setGridWidth(int width) {
    state = Setting(gridWidth: width, gridHeight: state.gridHeight);
  }

  void setGridHeight(int height) {
    state = Setting(gridWidth: state.gridWidth, gridHeight: height);
  }
}

final settingProvider = StateNotifierProvider<SettingNotifier, Setting>((ref) {
  return SettingNotifier();
});
