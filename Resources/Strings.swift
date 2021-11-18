// swiftlint:disable all
// Generated using SwiftGen — https://github.com/SwiftGen/SwiftGen

import Foundation

// swiftlint:disable superfluous_disable_command file_length implicit_return

// MARK: - Strings

// swiftlint:disable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:disable nesting type_body_length type_name vertical_whitespace_opening_braces
internal enum L10n {
  /// Apply
  internal static let apply = L10n.tr("Localizable", "apply")
  /// Characters
  internal static let characters = L10n.tr("Localizable", "characters")
  /// Episodes
  internal static let episodes = L10n.tr("Localizable", "episodes")
  /// Filters
  internal static let filters = L10n.tr("Localizable", "filters")
  /// Locations
  internal static let locations = L10n.tr("Localizable", "locations")
  /// Reset all
  internal static let resetlAll = L10n.tr("Localizable", "resetlAll")
  /// Search
  internal static let search = L10n.tr("Localizable", "search")
}
// swiftlint:enable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:enable nesting type_body_length type_name vertical_whitespace_opening_braces

// MARK: - Implementation Details

extension L10n {
  private static func tr(_ table: String, _ key: String, _ args: CVarArg...) -> String {
    let format = BundleToken.bundle.localizedString(forKey: key, value: nil, table: table)
    return String(format: format, locale: Locale.current, arguments: args)
  }
}

// swiftlint:disable convenience_type
private final class BundleToken {
  static let bundle: Bundle = {
    #if SWIFT_PACKAGE
    return Bundle.module
    #else
    return Bundle(for: BundleToken.self)
    #endif
  }()
}
// swiftlint:enable convenience_type
