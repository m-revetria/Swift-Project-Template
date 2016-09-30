//
//  Constants.swift
//  XLProjectName
//
//  Created by XLAuthorName ( XLAuthorWebsite )
//  Copyright (c) 2016 XLOrganizationName. All rights reserved.
//

import Foundation
import UIKit

struct Constants {

	struct Network {

        static let authorizationHeader = "Authorization"
        // TODO: setup api base URL
        static let baseUrl = URL(string: "https://api-staging.tryfranklin.com")!
        static let refreshTokenPath: String? = nil

        static let successCode = 200
        static let successRange = 200..<300
        static let unauthorized = 401
        static let notFoundCode = 404
        static let serverError = 500

    }

    struct Keychain {

        static let serviceIdentifier = Bundle.main.bundleIdentifier!
        static let sessionToken = "session_token"
        static let deviceToken = "device_token"

    }

    struct Formatters {

        static let debugConsoleDateFormatter: DateFormatter = {
            let formatter = DateFormatter()
            formatter.dateFormat = "yyyy-MM-dd HH:mm:ss.SSS"
            formatter.timeZone = TimeZone(identifier: "UTC")!
            return formatter
        }()

    }

}
