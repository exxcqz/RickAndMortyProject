// swiftlint:disable all
// Generated using SwiftGen — https://github.com/SwiftGen/SwiftGen

import Foundation

// swiftlint:disable superfluous_disable_command file_length implicit_return

// MARK: - Strings

// swiftlint:disable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:disable nesting type_body_length type_name vertical_whitespace_opening_braces
internal enum L10n {

  internal enum Characters {
    /// Characters
    internal static let title = L10n.tr("Localizable", "characters.title")
  }

  internal enum Episodes {
    /// Episodes
    internal static let title = L10n.tr("Localizable", "episodes.title")
    internal enum SeasonCode {
      /// Episode
      internal static let episode = L10n.tr("Localizable", "episodes.seasonCode.episode")
      /// Season
      internal static let season = L10n.tr("Localizable", "episodes.seasonCode.season")
      /// Unknown episode code
      internal static let unknown = L10n.tr("Localizable", "episodes.seasonCode.unknown")
    }
  }

  internal enum Filters {
    /// All
    internal static let all = L10n.tr("Localizable", "filters.all")
    /// Filters
    internal static let title = L10n.tr("Localizable", "filters.title")
    internal enum Action {
      /// Apply
      internal static let apply = L10n.tr("Localizable", "filters.action.apply")
      /// Reset all
      internal static let resetAll = L10n.tr("Localizable", "filters.action.reset_all")
    }
  }

  internal enum Locations {
    /// Locations
    internal static let title = L10n.tr("Localizable", "locations.title")
  }

  internal enum Placeholder {
    /// Search
    internal static let search = L10n.tr("Localizable", "placeholder.search")
  }
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
