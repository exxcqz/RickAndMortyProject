// swiftlint:disable all
// Generated using SwiftGen — https://github.com/SwiftGen/SwiftGen

#if os(macOS)
  import AppKit
#elseif os(iOS)
  import UIKit
#elseif os(tvOS) || os(watchOS)
  import UIKit
#endif

// Deprecated typealiases
@available(*, deprecated, renamed: "ColorAsset.Color", message: "This typealias will be removed in SwiftGen 7.0")
internal typealias AssetColorTypeAlias = ColorAsset.Color
@available(*, deprecated, renamed: "ImageAsset.Image", message: "This typealias will be removed in SwiftGen 7.0")
internal typealias AssetImageTypeAlias = ImageAsset.Image

// swiftlint:disable superfluous_disable_command file_length implicit_return

// MARK: - Asset Catalogs

// swiftlint:disable identifier_name line_length nesting type_body_length type_name
internal enum Asset {
  internal enum Colors {
    internal static let blackBG = ColorAsset(name: "Colors/blackBG")
    internal static let blackCard = ColorAsset(name: "Colors/blackCard")
    internal static let blackElements = ColorAsset(name: "Colors/blackElements")
    internal static let grayDark = ColorAsset(name: "Colors/grayDark")
    internal static let grayLight = ColorAsset(name: "Colors/grayLight")
    internal static let grayNormal = ColorAsset(name: "Colors/grayNormal")
    internal static let primary = ColorAsset(name: "Colors/primary")
    internal static let primaryTap = ColorAsset(name: "Colors/primaryTap")
  }
  internal enum Icons {
    internal static let icBack = ImageAsset(name: "Icons/icBack")
    internal static let icCluster = ImageAsset(name: "Icons/icCluster")
    internal static let icDream = ImageAsset(name: "Icons/icDream")
    internal static let icFantasyTown = ImageAsset(name: "Icons/icFantasyTown")
    internal static let icFilter = ImageAsset(name: "Icons/icFilter")
    internal static let icMicroverse = ImageAsset(name: "Icons/icMicroverse")
    internal static let icPlanet = ImageAsset(name: "Icons/icPlanet")
    internal static let icResort = ImageAsset(name: "Icons/icResort")
    internal static let icSearch = ImageAsset(name: "Icons/icSearch")
    internal static let icSearchSmall = ImageAsset(name: "Icons/icSearchSmall")
    internal static let icSpaceStation = ImageAsset(name: "Icons/icSpaceStation")
    internal static let icTV = ImageAsset(name: "Icons/icTV")
  }
  internal enum Illustrations {
    internal enum SplashIllustrations {
      internal static let splashPortal = ImageAsset(name: "Illustrations/SplashIllustrations/splashPortal")
      internal static let splashStars = ImageAsset(name: "Illustrations/SplashIllustrations/splashStars")
      internal static let splashTitle = ImageAsset(name: "Illustrations/SplashIllustrations/splashTitle")
    }
    internal static let characters = ImageAsset(name: "Illustrations/characters")
    internal static let dummyCharacterIllustration = ImageAsset(name: "Illustrations/dummyCharacterIllustration")
    internal static let episodes = ImageAsset(name: "Illustrations/episodes")
    internal static let locations = ImageAsset(name: "Illustrations/locations")
  }
  internal enum TabBarIcons {
    internal static let icCharactersIsActive = ImageAsset(name: "TabBarIcons/icCharactersIsActive")
    internal static let icCharactersNotActive = ImageAsset(name: "TabBarIcons/icCharactersNotActive")
    internal static let icEpisodesIsActive = ImageAsset(name: "TabBarIcons/icEpisodesIsActive")
    internal static let icEpisodesNotActive = ImageAsset(name: "TabBarIcons/icEpisodesNotActive")
    internal static let icLocationsIsActive = ImageAsset(name: "TabBarIcons/icLocationsIsActive")
    internal static let icLocationsNotActive = ImageAsset(name: "TabBarIcons/icLocationsNotActive")
  }
}
// swiftlint:enable identifier_name line_length nesting type_body_length type_name

// MARK: - Implementation Details

internal final class ColorAsset {
  internal fileprivate(set) var name: String

  #if os(macOS)
  internal typealias Color = NSColor
  #elseif os(iOS) || os(tvOS) || os(watchOS)
  internal typealias Color = UIColor
  #endif

  @available(iOS 11.0, tvOS 11.0, watchOS 4.0, macOS 10.13, *)
  internal private(set) lazy var color: Color = {
    guard let color = Color(asset: self) else {
      fatalError("Unable to load color asset named \(name).")
    }
    return color
  }()

  #if os(iOS) || os(tvOS)
  @available(iOS 11.0, tvOS 11.0, *)
  internal func color(compatibleWith traitCollection: UITraitCollection) -> Color {
    let bundle = BundleToken.bundle
    guard let color = Color(named: name, in: bundle, compatibleWith: traitCollection) else {
      fatalError("Unable to load color asset named \(name).")
    }
    return color
  }
  #endif

  fileprivate init(name: String) {
    self.name = name
  }
}

internal extension ColorAsset.Color {
  @available(iOS 11.0, tvOS 11.0, watchOS 4.0, macOS 10.13, *)
  convenience init?(asset: ColorAsset) {
    let bundle = BundleToken.bundle
    #if os(iOS) || os(tvOS)
    self.init(named: asset.name, in: bundle, compatibleWith: nil)
    #elseif os(macOS)
    self.init(named: NSColor.Name(asset.name), bundle: bundle)
    #elseif os(watchOS)
    self.init(named: asset.name)
    #endif
  }
}

internal struct ImageAsset {
  internal fileprivate(set) var name: String

  #if os(macOS)
  internal typealias Image = NSImage
  #elseif os(iOS) || os(tvOS) || os(watchOS)
  internal typealias Image = UIImage
  #endif

  @available(iOS 8.0, tvOS 9.0, watchOS 2.0, macOS 10.7, *)
  internal var image: Image {
    let bundle = BundleToken.bundle
    #if os(iOS) || os(tvOS)
    let image = Image(named: name, in: bundle, compatibleWith: nil)
    #elseif os(macOS)
    let name = NSImage.Name(self.name)
    let image = (bundle == .main) ? NSImage(named: name) : bundle.image(forResource: name)
    #elseif os(watchOS)
    let image = Image(named: name)
    #endif
    guard let result = image else {
      fatalError("Unable to load image asset named \(name).")
    }
    return result
  }

  #if os(iOS) || os(tvOS)
  @available(iOS 8.0, tvOS 9.0, *)
  internal func image(compatibleWith traitCollection: UITraitCollection) -> Image {
    let bundle = BundleToken.bundle
    guard let result = Image(named: name, in: bundle, compatibleWith: traitCollection) else {
      fatalError("Unable to load image asset named \(name).")
    }
    return result
  }
  #endif
}

internal extension ImageAsset.Image {
  @available(iOS 8.0, tvOS 9.0, watchOS 2.0, *)
  @available(macOS, deprecated,
    message: "This initializer is unsafe on macOS, please use the ImageAsset.image property")
  convenience init?(asset: ImageAsset) {
    #if os(iOS) || os(tvOS)
    let bundle = BundleToken.bundle
    self.init(named: asset.name, in: bundle, compatibleWith: nil)
    #elseif os(macOS)
    self.init(named: NSImage.Name(asset.name))
    #elseif os(watchOS)
    self.init(named: asset.name)
    #endif
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
