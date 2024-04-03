import "package:flutter/material.dart";

class MaterialTheme {
  final TextTheme textTheme;

  const MaterialTheme(this.textTheme);

  static MaterialScheme lightScheme() {
    return const MaterialScheme(
      brightness: Brightness.light,
      primary: Color(4278190080),
      surfaceTint: Color(4284243557),
      onPrimary: Color(4294967295),
      primaryContainer: Color(4280493611),
      onPrimaryContainer: Color(4289704376),
      secondary: Color(4284309343),
      onSecondary: Color(4294967295),
      secondaryContainer: Color(4294967295),
      onSecondaryContainer: Color(4283914329),
      tertiary: Color(4279507232),
      onTertiary: Color(4294967295),
      tertiaryContainer: Color(4281546816),
      onTertiaryContainer: Color(4291086803),
      error: Color(4290386458),
      onError: Color(4294967295),
      errorContainer: Color(4294957782),
      onErrorContainer: Color(4282449922),
      background: Color.fromARGB(255, 255, 255, 255),
      onBackground: Color(4280032028),
      surface: Color(4294768888),
      onSurface: Color(4280032028),
      surfaceVariant: Color(4293059303),
      onSurfaceVariant: Color(4282730315),
      outline: Color(4285953915),
      outlineVariant: Color(4291217099),
      shadow: Color(4278190080),
      scrim: Color(4278190080),
      inverseSurface: Color(4281413681),
      inverseOnSurface: Color(4294177008),
      inversePrimary: Color(4291086029),
      primaryFixed: Color(4292993770),
      onPrimaryFixed: Color(4279835681),
      primaryFixedDim: Color(4291086029),
      onPrimaryFixedVariant: Color(4282664781),
      secondaryFixed: Color(4293059298),
      onSecondaryFixed: Color(4279901212),
      secondaryFixedDim: Color(4291217095),
      onSecondaryFixedVariant: Color(4282730311),
      tertiaryFixed: Color(4292797165),
      onTertiaryFixed: Color(4279704611),
      tertiaryFixedDim: Color(4290954961),
      onTertiaryFixedVariant: Color(4282533712),
      surfaceDim: Color(4292663769),
      surfaceBright: Color(4294768888),
      surfaceContainerLowest: Color(4294967295),
      surfaceContainerLow: Color(4294374387),
      surfaceContainer: Color(4294045165),
      surfaceContainerHigh: Color(4293650407),
      surfaceContainerHighest: Color(4293255906),
    );
  }

  ThemeData light() {
    return theme(lightScheme().toColorScheme());
  }

  static MaterialScheme lightMediumContrastScheme() {
    return const MaterialScheme(
      brightness: Brightness.light,
      primary: Color(4278190080),
      surfaceTint: Color(4284243557),
      onPrimary: Color(4294967295),
      primaryContainer: Color(4280493611),
      onPrimaryContainer: Color(4292599012),
      secondary: Color(4282467139),
      onSecondary: Color(4294967295),
      secondaryContainer: Color(4285756789),
      onSecondaryContainer: Color(4294967295),
      tertiary: Color(4279507232),
      onTertiary: Color(4294967295),
      tertiaryContainer: Color(4281546816),
      onTertiaryContainer: Color(4294375679),
      error: Color(4287365129),
      onError: Color(4294967295),
      errorContainer: Color(4292490286),
      onErrorContainer: Color(4294967295),
      background: Color(4294768888),
      onBackground: Color(4280032028),
      surface: Color(4294768888),
      onSurface: Color(4280032028),
      surfaceVariant: Color(4293059303),
      onSurfaceVariant: Color(4282467143),
      outline: Color(4284374883),
      outlineVariant: Color(4286151295),
      shadow: Color(4278190080),
      scrim: Color(4278190080),
      inverseSurface: Color(4281413681),
      inverseOnSurface: Color(4294177008),
      inversePrimary: Color(4291086029),
      primaryFixed: Color(4285691003),
      onPrimaryFixed: Color(4294967295),
      primaryFixedDim: Color(4284046434),
      onPrimaryFixedVariant: Color(4294967295),
      secondaryFixed: Color(4285756789),
      onSecondaryFixed: Color(4294967295),
      secondaryFixedDim: Color(4284111964),
      onSecondaryFixedVariant: Color(4294967295),
      tertiaryFixed: Color(4285560190),
      onTertiaryFixed: Color(4294967295),
      tertiaryFixedDim: Color(4283915365),
      onTertiaryFixedVariant: Color(4294967295),
      surfaceDim: Color(4292663769),
      surfaceBright: Color(4294768888),
      surfaceContainerLowest: Color(4294967295),
      surfaceContainerLow: Color(4294374387),
      surfaceContainer: Color(4294045165),
      surfaceContainerHigh: Color(4293650407),
      surfaceContainerHighest: Color(4293255906),
    );
  }

  ThemeData lightMediumContrast() {
    return theme(lightMediumContrastScheme().toColorScheme());
  }

  static MaterialScheme lightHighContrastScheme() {
    return const MaterialScheme(
      brightness: Brightness.light,
      primary: Color(4278190080),
      surfaceTint: Color(4284243557),
      onPrimary: Color(4294967295),
      primaryContainer: Color(4280493611),
      onPrimaryContainer: Color(4294967295),
      secondary: Color(4280296227),
      onSecondary: Color(4294967295),
      secondaryContainer: Color(4282467139),
      onSecondaryContainer: Color(4294967295),
      tertiary: Color(4279507232),
      onTertiary: Color(4294967295),
      tertiaryContainer: Color(4281546816),
      onTertiaryContainer: Color(4294967295),
      error: Color(4283301890),
      onError: Color(4294967295),
      errorContainer: Color(4287365129),
      onErrorContainer: Color(4294967295),
      background: Color(4294768888),
      onBackground: Color(4280032028),
      surface: Color(4294768888),
      onSurface: Color(4278190080),
      surfaceVariant: Color(4293059303),
      onSurfaceVariant: Color(4280427560),
      outline: Color(4282467143),
      outlineVariant: Color(4282467143),
      shadow: Color(4278190080),
      scrim: Color(4278190080),
      inverseSurface: Color(4281413681),
      inverseOnSurface: Color(4294967295),
      inversePrimary: Color(4293586163),
      primaryFixed: Color(4282401609),
      onPrimaryFixed: Color(4294967295),
      primaryFixedDim: Color(4280954162),
      onPrimaryFixedVariant: Color(4294967295),
      secondaryFixed: Color(4282467139),
      onSecondaryFixed: Color(4294967295),
      secondaryFixedDim: Color(4281019693),
      onSecondaryFixedVariant: Color(4294967295),
      tertiaryFixed: Color(4282270540),
      onTertiaryFixed: Color(4294967295),
      tertiaryFixedDim: Color(4280823093),
      onTertiaryFixedVariant: Color(4294967295),
      surfaceDim: Color(4292663769),
      surfaceBright: Color(4294768888),
      surfaceContainerLowest: Color(4294967295),
      surfaceContainerLow: Color(4294374387),
      surfaceContainer: Color(4294045165),
      surfaceContainerHigh: Color(4293650407),
      surfaceContainerHighest: Color(4293255906),
    );
  }

  ThemeData lightHighContrast() {
    return theme(lightHighContrastScheme().toColorScheme());
  }

  static MaterialScheme darkScheme() {
    return const MaterialScheme(
      brightness: Brightness.dark,
      primary: Color(4291086029),
      surfaceTint: Color(4291086029),
      onPrimary: Color(4281217078),
      primaryContainer: Color(4278585614),
      onPrimaryContainer: Color(4288191137),
      secondary: Color(4294967295),
      onSecondary: Color(4281282865),
      secondaryContainer: Color(4292138196),
      onSecondaryContainer: Color(4282269760),
      tertiary: Color(4290954961),
      onTertiary: Color(4281086265),
      tertiaryContainer: Color(4280099370),
      onTertiaryContainer: Color(4289244599),
      error: Color(4294948011),
      onError: Color(4285071365),
      errorContainer: Color(4287823882),
      onErrorContainer: Color(4294957782),
      background: Color(4279440148),
      onBackground: Color(4293255906),
      surface: Color(4279440148),
      onSurface: Color(4293255906),
      surfaceVariant: Color(4282730315),
      onSurfaceVariant: Color(4291217099),
      outline: Color(4287664277),
      outlineVariant: Color(4282730315),
      shadow: Color(4278190080),
      scrim: Color(4278190080),
      inverseSurface: Color(4293255906),
      inverseOnSurface: Color(4281413681),
      inversePrimary: Color(4284243557),
      primaryFixed: Color(4292993770),
      onPrimaryFixed: Color(4279835681),
      primaryFixedDim: Color(4291086029),
      onPrimaryFixedVariant: Color(4282664781),
      secondaryFixed: Color(4293059298),
      onSecondaryFixed: Color(4279901212),
      secondaryFixedDim: Color(4291217095),
      onSecondaryFixedVariant: Color(4282730311),
      tertiaryFixed: Color(4292797165),
      onTertiaryFixed: Color(4279704611),
      tertiaryFixedDim: Color(4290954961),
      onTertiaryFixedVariant: Color(4282533712),
      surfaceDim: Color(4279440148),
      surfaceBright: Color(4282005817),
      surfaceContainerLowest: Color(4279111182),
      surfaceContainerLow: Color(4280032028),
      surfaceContainer: Color(4280295200),
      surfaceContainerHigh: Color(4280953386),
      surfaceContainerHighest: Color(4281676853),
    );
  }

  ThemeData dark() {
    return theme(darkScheme().toColorScheme());
  }

  static MaterialScheme darkMediumContrastScheme() {
    return const MaterialScheme(
      brightness: Brightness.dark,
      primary: Color(4291414738),
      surfaceTint: Color(4291086029),
      onPrimary: Color(4279440924),
      primaryContainer: Color(4287533463),
      onPrimaryContainer: Color(4278190080),
      secondary: Color(4294967295),
      onSecondary: Color(4281282865),
      secondaryContainer: Color(4292138196),
      onSecondaryContainer: Color(4280164384),
      tertiary: Color(4291218389),
      onTertiary: Color(4279375646),
      tertiaryContainer: Color(4287402395),
      onTertiaryContainer: Color(4278190080),
      error: Color(4294949553),
      onError: Color(4281794561),
      errorContainer: Color(4294923337),
      onErrorContainer: Color(4278190080),
      background: Color(4279440148),
      onBackground: Color(4293255906),
      surface: Color(4279440148),
      onSurface: Color(4294900474),
      surfaceVariant: Color(4282730315),
      onSurfaceVariant: Color(4291480271),
      outline: Color(4288848551),
      outlineVariant: Color(4286743431),
      shadow: Color(4278190080),
      scrim: Color(4278190080),
      inverseSurface: Color(4293255906),
      inverseOnSurface: Color(4280953386),
      inversePrimary: Color(4282730574),
      primaryFixed: Color(4292993770),
      onPrimaryFixed: Color(4279111958),
      primaryFixedDim: Color(4291086029),
      onPrimaryFixedVariant: Color(4281546300),
      secondaryFixed: Color(4293059298),
      onSecondaryFixed: Color(4279177490),
      secondaryFixedDim: Color(4291217095),
      onSecondaryFixedVariant: Color(4281611831),
      tertiaryFixed: Color(4292797165),
      onTertiaryFixed: Color(4278980889),
      tertiaryFixedDim: Color(4290954961),
      onTertiaryFixedVariant: Color(4281415231),
      surfaceDim: Color(4279440148),
      surfaceBright: Color(4282005817),
      surfaceContainerLowest: Color(4279111182),
      surfaceContainerLow: Color(4280032028),
      surfaceContainer: Color(4280295200),
      surfaceContainerHigh: Color(4280953386),
      surfaceContainerHighest: Color(4281676853),
    );
  }

  ThemeData darkMediumContrast() {
    return theme(darkMediumContrastScheme().toColorScheme());
  }

  static MaterialScheme darkHighContrastScheme() {
    return const MaterialScheme(
      brightness: Brightness.dark,
      primary: Color(4294703871),
      surfaceTint: Color(4291086029),
      onPrimary: Color(4278190080),
      primaryContainer: Color(4291414738),
      onPrimaryContainer: Color(4278190080),
      secondary: Color(4294967295),
      onSecondary: Color(4278190080),
      secondaryContainer: Color(4292138196),
      onSecondaryContainer: Color(4278190080),
      tertiary: Color(4294703871),
      onTertiary: Color(4278190080),
      tertiaryContainer: Color(4291218389),
      onTertiaryContainer: Color(4278190080),
      error: Color(4294965753),
      onError: Color(4278190080),
      errorContainer: Color(4294949553),
      onErrorContainer: Color(4278190080),
      background: Color(4279440148),
      onBackground: Color(4293255906),
      surface: Color(4279440148),
      onSurface: Color(4294967295),
      surfaceVariant: Color(4282730315),
      onSurfaceVariant: Color(4294703871),
      outline: Color(4291480271),
      outlineVariant: Color(4291480271),
      shadow: Color(4278190080),
      scrim: Color(4278190080),
      inverseSurface: Color(4293255906),
      inverseOnSurface: Color(4278190080),
      inversePrimary: Color(4280756784),
      primaryFixed: Color(4293256942),
      onPrimaryFixed: Color(4278190080),
      primaryFixedDim: Color(4291414738),
      onPrimaryFixedVariant: Color(4279440924),
      secondaryFixed: Color(4293322727),
      onSecondaryFixed: Color(4278190080),
      secondaryFixedDim: Color(4291480523),
      onSecondaryFixedVariant: Color(4279506711),
      tertiaryFixed: Color(4293126130),
      onTertiaryFixed: Color(4278190080),
      tertiaryFixedDim: Color(4291218389),
      onTertiaryFixedVariant: Color(4279375646),
      surfaceDim: Color(4279440148),
      surfaceBright: Color(4282005817),
      surfaceContainerLowest: Color(4279111182),
      surfaceContainerLow: Color(4280032028),
      surfaceContainer: Color(4280295200),
      surfaceContainerHigh: Color(4280953386),
      surfaceContainerHighest: Color(4281676853),
    );
  }

  ThemeData darkHighContrast() {
    return theme(darkHighContrastScheme().toColorScheme());
  }

  ThemeData theme(ColorScheme colorScheme) => ThemeData(
        useMaterial3: true,
        brightness: colorScheme.brightness,
        colorScheme: colorScheme,
        textTheme: textTheme.apply(
          bodyColor: colorScheme.onSurface,
          displayColor: colorScheme.onSurface,
        ),
        scaffoldBackgroundColor: colorScheme.background,
        canvasColor: colorScheme.surface,
      );

  List<ExtendedColor> get extendedColors => [];
}

class MaterialScheme {
  const MaterialScheme({
    required this.brightness,
    required this.primary,
    required this.surfaceTint,
    required this.onPrimary,
    required this.primaryContainer,
    required this.onPrimaryContainer,
    required this.secondary,
    required this.onSecondary,
    required this.secondaryContainer,
    required this.onSecondaryContainer,
    required this.tertiary,
    required this.onTertiary,
    required this.tertiaryContainer,
    required this.onTertiaryContainer,
    required this.error,
    required this.onError,
    required this.errorContainer,
    required this.onErrorContainer,
    required this.background,
    required this.onBackground,
    required this.surface,
    required this.onSurface,
    required this.surfaceVariant,
    required this.onSurfaceVariant,
    required this.outline,
    required this.outlineVariant,
    required this.shadow,
    required this.scrim,
    required this.inverseSurface,
    required this.inverseOnSurface,
    required this.inversePrimary,
    required this.primaryFixed,
    required this.onPrimaryFixed,
    required this.primaryFixedDim,
    required this.onPrimaryFixedVariant,
    required this.secondaryFixed,
    required this.onSecondaryFixed,
    required this.secondaryFixedDim,
    required this.onSecondaryFixedVariant,
    required this.tertiaryFixed,
    required this.onTertiaryFixed,
    required this.tertiaryFixedDim,
    required this.onTertiaryFixedVariant,
    required this.surfaceDim,
    required this.surfaceBright,
    required this.surfaceContainerLowest,
    required this.surfaceContainerLow,
    required this.surfaceContainer,
    required this.surfaceContainerHigh,
    required this.surfaceContainerHighest,
  });

  final Brightness brightness;
  final Color primary;
  final Color surfaceTint;
  final Color onPrimary;
  final Color primaryContainer;
  final Color onPrimaryContainer;
  final Color secondary;
  final Color onSecondary;
  final Color secondaryContainer;
  final Color onSecondaryContainer;
  final Color tertiary;
  final Color onTertiary;
  final Color tertiaryContainer;
  final Color onTertiaryContainer;
  final Color error;
  final Color onError;
  final Color errorContainer;
  final Color onErrorContainer;
  final Color background;
  final Color onBackground;
  final Color surface;
  final Color onSurface;
  final Color surfaceVariant;
  final Color onSurfaceVariant;
  final Color outline;
  final Color outlineVariant;
  final Color shadow;
  final Color scrim;
  final Color inverseSurface;
  final Color inverseOnSurface;
  final Color inversePrimary;
  final Color primaryFixed;
  final Color onPrimaryFixed;
  final Color primaryFixedDim;
  final Color onPrimaryFixedVariant;
  final Color secondaryFixed;
  final Color onSecondaryFixed;
  final Color secondaryFixedDim;
  final Color onSecondaryFixedVariant;
  final Color tertiaryFixed;
  final Color onTertiaryFixed;
  final Color tertiaryFixedDim;
  final Color onTertiaryFixedVariant;
  final Color surfaceDim;
  final Color surfaceBright;
  final Color surfaceContainerLowest;
  final Color surfaceContainerLow;
  final Color surfaceContainer;
  final Color surfaceContainerHigh;
  final Color surfaceContainerHighest;
}

extension MaterialSchemeUtils on MaterialScheme {
  ColorScheme toColorScheme() {
    return ColorScheme(
      brightness: brightness,
      primary: primary,
      onPrimary: onPrimary,
      primaryContainer: primaryContainer,
      onPrimaryContainer: onPrimaryContainer,
      secondary: secondary,
      onSecondary: onSecondary,
      secondaryContainer: secondaryContainer,
      onSecondaryContainer: onSecondaryContainer,
      tertiary: tertiary,
      onTertiary: onTertiary,
      tertiaryContainer: tertiaryContainer,
      onTertiaryContainer: onTertiaryContainer,
      error: error,
      onError: onError,
      errorContainer: errorContainer,
      onErrorContainer: onErrorContainer,
      background: background,
      onBackground: onBackground,
      surface: surface,
      onSurface: onSurface,
      surfaceVariant: surfaceVariant,
      onSurfaceVariant: onSurfaceVariant,
      outline: outline,
      outlineVariant: outlineVariant,
      shadow: shadow,
      scrim: scrim,
      inverseSurface: inverseSurface,
      onInverseSurface: inverseOnSurface,
      inversePrimary: inversePrimary,
    );
  }
}

class ExtendedColor {
  final Color seed, value;
  final ColorFamily light;
  final ColorFamily lightHighContrast;
  final ColorFamily lightMediumContrast;
  final ColorFamily dark;
  final ColorFamily darkHighContrast;
  final ColorFamily darkMediumContrast;

  const ExtendedColor({
    required this.seed,
    required this.value,
    required this.light,
    required this.lightHighContrast,
    required this.lightMediumContrast,
    required this.dark,
    required this.darkHighContrast,
    required this.darkMediumContrast,
  });
}

class ColorFamily {
  const ColorFamily({
    required this.color,
    required this.onColor,
    required this.colorContainer,
    required this.onColorContainer,
  });

  final Color color;
  final Color onColor;
  final Color colorContainer;
  final Color onColorContainer;
}
