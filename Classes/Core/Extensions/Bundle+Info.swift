//
//  Created by Anton Dityativ on 15/11/2021
//  Copyright © 2021 Ronas IT. All rights reserved.
//

import Foundation

extension Bundle {
    // swiftlint:disable force_cast
    var appIdentifier: String {
        return infoDictionary![kCFBundleIdentifierKey as String] as! String
    }

    var appName: String {
        return infoDictionary![kCFBundleNameKey as String] as! String
    }

    var appDisplayName: String {
        return infoDictionary!["CFBundleDisplayName" as String] as! String
    }

    var appVersion: String {
        return infoDictionary!["CFBundleShortVersionString" as String] as! String
    }

    var bundleVersion: String {
        return infoDictionary!["CFBundleVersion" as String] as! String
    }
    // swiftlint:enable force_cast
}
