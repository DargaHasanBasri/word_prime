import 'package:flutter/material.dart';

final class CustomColorScheme {
  CustomColorScheme._();

  static const lightColorScheme = ColorScheme(
    brightness: Brightness.light,
    primary: Color(0xffFFFFFF), ///
    surfaceTint: Color(0xffFFFFFF), /// splash logo arka plan
    onPrimary: Color(0xff699CF4), /// splash background
    primaryContainer: Color(0xffFFFFFF), ///
    onPrimaryContainer: Color(0xffEEEFF2), ///
    secondary: Color(0xff111827), ///
    onSecondary: Color(4294967295),
    secondaryContainer: Color(0xffF9FAFB), ///
    onSecondaryContainer: Color(0xffE88B8C), ///
    tertiary: Color(0xff6B7280), ///
    onTertiary: Color(0xff9CA3AF), ///
    tertiaryContainer: Color(0xff9BBDF8),
    onTertiaryContainer: Color(0xff5B6C8C), ///
    error: Color(4290386458),
    onError: Color(4294967295),
    errorContainer: Color(4294957782),
    onErrorContainer: Color(4282449922),
    surface: Color(0xff2C3658), ///
    onSurface: Color(4280490263),
    onSurfaceVariant: Color(4283646783),
    outline: Color(0xff2C3658), ///
    outlineVariant: Color(4292395708),
    shadow: Color(4278190080),
    scrim: Color(4278190080),
    inverseSurface: Color(4281937451),
    inversePrimary: Color(4294948256),
    primaryFixed: Color(4294958033),
    onPrimaryFixed: Color(4281993985),
    primaryFixedDim: Color(4294948256),
    onPrimaryFixedVariant: Color(4285674787),
    secondaryFixed: Color(4294958033),
    onSecondaryFixed: Color(4281079055),
    secondaryFixedDim: Color(4293377458),
    onSecondaryFixedVariant: Color(4284301367),
    tertiaryFixed: Color(4294304167),
    onTertiaryFixed: Color(4280490752),
    tertiaryFixedDim: Color(4292396429),
    onTertiaryFixedVariant: Color(4283647513),
    surfaceDim: Color(4293449426),
    surfaceBright: Color(4294965494),
    surfaceContainerLowest: Color(4294967295),
    surfaceContainerLow: Color(0xff2C3658), ///
    surfaceContainer: Color(0xffffffff), ///
    surfaceContainerHigh: Color(0xff1E293B), ///
    surfaceContainerHighest: Color(0xff475569), ///
  );

  static const darkColorScheme = ColorScheme(
    brightness: Brightness.dark,
    primary: Color(0xff111827), ///
    surfaceTint: Color(0XFF1F2937), /// splash logo arka plan
    onPrimary: Color(0xff111827), ///
    primaryContainer: Color(0xff374151), ///
    onPrimaryContainer: Color(0xff374151), ///
    secondary: Color(0xffFFFFFF), ///
    onSecondary: Color(4282657314),
    secondaryContainer: Color(0xff1F2937), ///
    onSecondaryContainer: Color(0xff1F2937), ///
    tertiary: Color(0xff6B7280), ///
    onTertiary: Color(0xff6B7280), ///
    tertiaryContainer: Color(0xff6B7280), ///
    onTertiaryContainer: Color(0XFF1F2937), ///
    error: Color(0xff699CF4),
    onError: Color(4285071365),
    errorContainer: Color(4287823882),
    onErrorContainer: Color(4294957782),
    surface: Color(4279898383), ///
    onSurface: Color(4294041562),
    onSurfaceVariant: Color(4292395708),
    outline: Color(0xff374151), ///
    outlineVariant: Color(4283646783),
    shadow: Color(4278190080),
    scrim: Color(4278190080),
    inverseSurface: Color(4294041562),
    inversePrimary: Color(4287581240),
    primaryFixed: Color(4294958033),
    onPrimaryFixed: Color(4281993985),
    primaryFixedDim: Color(4294948256),
    onPrimaryFixedVariant: Color(4285674787),
    secondaryFixed: Color(4294958033), ///
    onSecondaryFixed: Color(0xffFFFFFF),
    secondaryFixedDim: Color(4293377458),
    onSecondaryFixedVariant: Color(4284301367),
    tertiaryFixed: Color(4294304167),
    onTertiaryFixed: Color(4280490752),
    tertiaryFixedDim: Color(4292396429),
    onTertiaryFixedVariant: Color(4283647513),
    surfaceDim: Color(4279898383),
    surfaceBright: Color(4282529588),
    surfaceContainerLowest: Color(4279503882),
    surfaceContainerLow: Color(0xff111827),  ///
    surfaceContainer: Color(0xff1F2937), ///
    surfaceContainerHigh: Color(0xffFFFFFF), ///
    surfaceContainerHighest: Color(0xffFFFFFF), ///
  );
}
