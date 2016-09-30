//
//  SessionController.swift
//  XLProjectName
//
//  Created by XLAuthorName ( XLAuthorWebsite )
//  Copyright © 2016 XLOrganizationName. All rights reserved.
//

import Alamofire
import Crashlytics
import Foundation
import KeychainAccess
import Opera
import RxSwift

class SessionController {

    static let `default` = SessionController()

    fileprivate let keychain = Keychain(service: Constants.Keychain.serviceIdentifier)

    fileprivate init() { }

    // MARK: - Session variables

    var token: String? {
        get { return keychain[Constants.Keychain.sessionToken] }
        set { keychain[Constants.Keychain.sessionToken] = newValue }
    }

    // MARK: - Session handling

    func logOut() {
        clearSession()
        // TODO: Logout: App should transition to login / onboarding screen
    }

    func clearSession() {
        token = nil
        Crashlytics.sharedInstance().setUserEmail(nil)
        Crashlytics.sharedInstance().setUserIdentifier(nil)
        Crashlytics.sharedInstance().setUserName(nil)
    }

    func isLoggedIn() -> Bool {
        return token != nil
    }

    func refreshToken() -> Observable<String?> {
        // TODO: refresh session token if possible
        return Observable.error(XLProjectNameError.unsuported(function: #function))
    }

}
