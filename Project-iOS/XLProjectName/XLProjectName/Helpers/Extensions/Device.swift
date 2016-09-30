//
//  UIDevice.swift
//  XLProjectName
//
//  Created by XLAuthorName ( XLAuthorWebsite )
//  Copyright (c) 2016 XLOrganizationName. All rights reserved.
//

import Foundation
import UIKit
import KeychainAccess

extension UIDevice {

    private static let keychainKey = "device_id"
    private static let keychain = Keychain(service: UIApplication.bundleIdentifier)

    //swiftlint:disable force_try
    static var uniqueId: String {
        if try! keychain.contains(keychainKey) {
            return try! keychain.get(keychainKey)!
        }
        let newDeviceId = UIDevice.current.identifierForVendor!.uuidString
        try! keychain.set(newDeviceId, key: keychainKey)
        return newDeviceId
    }
    //swiftlint:enable force_try

}
