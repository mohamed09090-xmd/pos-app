import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/data/hive_database.dart'; // تأكد من صحة المسار للوصول للـ core

// الأحداث
abstract class ThemeEvent {}
class ToggleTheme extends ThemeEvent {}
class LoadTheme extends ThemeEvent {}

// البلوك
class ThemeBloc extends Bloc<ThemeEvent, ThemeMode> {
  
  ThemeBloc() : super(ThemeMode.light) {
    
    // تحميل الثيم المحفوظ عند فتح التطبيق باستخدام الدالة التي أضفناها في HiveDatabase
    on<LoadTheme>((event, emit) {
      final isDark = HiveDatabase.isDarkMode(); 
      emit(isDark ? ThemeMode.dark : ThemeMode.light);
    });

    // تبديل الثيم وحفظه
    on<ToggleTheme>((event, emit) async {
      final isCurrentlyDark = state == ThemeMode.dark;
      
      // حفظ الحالة الجديدة في Hive
      await HiveDatabase.setDarkMode(!isCurrentlyDark);
      
      // تحديث الواجهة
      emit(isCurrentlyDark ? ThemeMode.light : ThemeMode.dark);
    });
  }
}