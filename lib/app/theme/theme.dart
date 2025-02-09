
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
// ignore: depend_on_referenced_packages
import 'package:material_color_utilities/material_color_utilities.dart';

@immutable
class BasilTheme extends ThemeExtension<BasilTheme> { 
  const BasilTheme({
    this.primaryColor = const Color(0xFF0EBE7F),
    this.tertiaryColor = const Color(0xFF34C759),
    this.neutralColor = const Color(0xFFFFFFFF),
  });

  final Color primaryColor;
  final Color tertiaryColor;
  final Color neutralColor;

  Scheme _scheme() {
    final base = CorePalette.of(primaryColor.value);
    final primary = base.primary;
    final tertiary = CorePalette.of(tertiaryColor.value).primary;
    final neutral = CorePalette.of(neutralColor.value).neutral;
    return Scheme(
      primary: primary.get(40),
      onPrimary: primary.get(100),
      primaryContainer: primary.get(90),
      onPrimaryContainer: primary.get(10),
      secondary: base.secondary.get(40),
      onSecondary: base.secondary.get(100),
      secondaryContainer: base.secondary.get(90),
      onSecondaryContainer: base.secondary.get(10),
      tertiary: tertiary.get(40),
      onTertiary: tertiary.get(100),
      tertiaryContainer: tertiary.get(90),
      onTertiaryContainer: tertiary.get(10),
      error: base.error.get(40),
      onError: base.error.get(100),
      errorContainer: base.error.get(90),
      onErrorContainer: base.error.get(10),
      background: neutral.get(99),
      onBackground: neutral.get(10),
      surface: neutral.get(99),
      onSurface: neutral.get(10),
      outline: base.neutralVariant.get(50),
      outlineVariant: base.neutralVariant.get(80),
      surfaceVariant: base.neutralVariant.get(90),
      onSurfaceVariant: base.neutralVariant.get(30),
      shadow: neutral.get(0),
      scrim: neutral.get(0),
      inverseSurface: neutral.get(20),
      inverseOnSurface: neutral.get(95),
      inversePrimary: primary.get(80),
    );
  }

  ThemeData _base(final ColorScheme colorScheme) {
    final primaryTextTheme = GoogleFonts.rubikTextTheme ();
    final secondaryTextTheme = GoogleFonts.rubikTextTheme();
    final textTheme = primaryTextTheme.copyWith(
      displaySmall: secondaryTextTheme.displaySmall,
      displayMedium: secondaryTextTheme.displayMedium,
      displayLarge: secondaryTextTheme.displayLarge,
      headlineSmall: secondaryTextTheme.headlineSmall,
      headlineMedium: secondaryTextTheme.headlineMedium,
      headlineLarge: secondaryTextTheme.headlineLarge,
    );
    final isLight = colorScheme.brightness == Brightness.light;
    return ThemeData(
      useMaterial3: true,
      extensions: [this],
      colorScheme: colorScheme,
      visualDensity: VisualDensity.adaptivePlatformDensity,
      scaffoldBackgroundColor: isLight ? neutralColor : colorScheme.background,
      textTheme: textTheme,
      tabBarTheme: TabBarTheme(
          labelColor: colorScheme.onSurface,
          unselectedLabelColor: colorScheme.onSurface,
          indicator: BoxDecoration(
              border: Border(
                  bottom: BorderSide(color: colorScheme.primary, width: 2)))),
      floatingActionButtonTheme: FloatingActionButtonThemeData(
          backgroundColor: colorScheme.secondaryContainer,
          foregroundColor: colorScheme.onSecondaryContainer),
      navigationRailTheme: NavigationRailThemeData(
          backgroundColor: isLight ? neutralColor : colorScheme.surface,
          selectedIconTheme:
              IconThemeData(color: colorScheme.onSecondaryContainer),
          indicatorColor: colorScheme.secondaryContainer),
      appBarTheme: AppBarTheme(
          backgroundColor: isLight ? neutralColor : colorScheme.surface),
      chipTheme: ChipThemeData(
          backgroundColor: isLight ? neutralColor : colorScheme.surface),
    );
  }

  ThemeData toThemeData() {
    final colorScheme = _scheme().toColorScheme(Brightness.light);
    return _base(colorScheme).copyWith(brightness: colorScheme.brightness);
  }

  @override
  ThemeExtension<BasilTheme> copyWith({
    Color? primaryColor,
    Color? tertiaryColor,
    Color? neutralColor,
  }) =>
      BasilTheme(
        primaryColor: primaryColor ?? this.primaryColor,
        tertiaryColor: tertiaryColor ?? this.tertiaryColor,
        neutralColor: neutralColor ?? this.neutralColor,
      );

  @override
  BasilTheme lerp(
    covariant ThemeExtension<BasilTheme>? other,
    double t,
  ) {
    if (other is! BasilTheme) return this;
    return BasilTheme(
      primaryColor: Color.lerp(primaryColor, other.primaryColor, t)!,
      tertiaryColor: Color.lerp(tertiaryColor, other.tertiaryColor, t)!,
      neutralColor: Color.lerp(neutralColor, other.neutralColor, t)!,
    );
  }

  /// green
  static const green = ExtendedColor(
    value: Color(0xff3ec029),
  );
  static const Dividerclr = ExtendedColor(
    value: Color(0xff5F65C3),
  );
  static const lightgreen = ExtendedColor(
    value: Color(0xffD9F4E0),
  );
  static const lightgray = ExtendedColor(
    value: Color(0xffA790B7),
    
  );
  static const grayofset = ExtendedColor(
    value: Color(0xffECECEC),
    
  );
  
  static const textfildclr = ExtendedColor(
    value: Color(0xFFFEF9F9),
    
  );
  static const black = ExtendedColor(
    value: Colors.black,
  );

  static const gray = ExtendedColor(
    value: Color(0xff494949),
  );
  static const Lightgray = ExtendedColor(
    value: Color(0xffF8F7F7),
  );
  static const Borderclr = ExtendedColor(
    value: Color(0xffFBFBFB),
  );
  static const whait = ExtendedColor(
    value: Color.fromARGB(255, 255, 255, 255),
  );
  static const red = ExtendedColor(value: Color(0xffFE5B52));

  /// light-orange
  static const lightOrange = ExtendedColor(
    value: Color(0xffee9220),
  );

  /// brown
  static const brown = ExtendedColor(
    value: Color(0xff4e0202),
  );

  /// yellow
  static const yellow = ExtendedColor(
    value: Color(0xfffF7BB53),
  );

  /// pink
  static const pink = ExtendedColor(
    value: Color(0xffe523a7),
  );

  /// blue
  static const blue = ExtendedColor(
    value: Color(0xff00335f),
  );

  /// cream
  static const cream = ExtendedColor(
    value: Color(0xffedcca0),
  );

  /// orange
  static const orange = ExtendedColor(
    value: Color(0xffee9220),
  );

  /// dark-orange
  static const darkOrange = ExtendedColor(
    value: Color(0xffd8771e),
  );

  /// bg-katha
  static const bgKatha = ExtendedColor(
    value: Color(0xffFFF5EB),
  );

  /// color-festival
  static const colorFestival = ExtendedColor(
    value: Color(0xffDD531B),
  );
  static const notfactionclr = ExtendedColor(
    value: Color(0xff008489),
  );


  static List<ExtendedColor> get extendedColors => [
        green,
        lightOrange,
        brown,
        yellow,
        pink,
        blue,
        cream,
        orange,
        darkOrange,
      ];
}

extension on Scheme {
  ColorScheme toColorScheme(Brightness brightness) {
    return ColorScheme(
        primary: Color(primary),
        onPrimary: Color(onPrimary),
        primaryContainer: Color(primaryContainer),
        onPrimaryContainer: Color(onPrimaryContainer),
        secondary: Color(secondary),
        onSecondary: Color(onSecondary),
        secondaryContainer: Color(secondaryContainer),
        onSecondaryContainer: Color(onSecondaryContainer),
        tertiary: Color(tertiary),
        onTertiary: Color(onTertiary),
        tertiaryContainer: Color(tertiaryContainer),
        onTertiaryContainer: Color(onTertiaryContainer),
        error: Color(error),
        onError: Color(onError),
        errorContainer: Color(errorContainer),
        onErrorContainer: Color(onErrorContainer),
        outline: Color(outline),
        outlineVariant: Color(outlineVariant),
        surface: Color(surface),
        onSurface: Color(onSurface),
        surfaceContainerHighest: Color(surfaceVariant),
        onSurfaceVariant: Color(onSurfaceVariant),
        inverseSurface: Color(inverseSurface),
        onInverseSurface: Color(inverseOnSurface),
        inversePrimary: Color(inversePrimary),
        shadow: Color(shadow),
        scrim: Color(scrim),
        surfaceTint: Color(primary),
        brightness: brightness);
  }
}

class ExtendedColor {
  final Color value;

  const ExtendedColor({
    required this.value,
  });
}

extension Material3Palette on Color {
  Color tone(int tone) {
    assert(tone >= 0 && tone <= 100);
    final color = Hct.fromInt(value);
    final tonalPalette = TonalPalette.of(color.hue, color.chroma);
    return Color(tonalPalette.get(tone));
  }
}
