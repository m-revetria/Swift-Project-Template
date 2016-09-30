//
//  AppDelegate+XLProjectName.swift
//  XLProjectName
//
//  Created by XLAuthorName ( XLAuthorWebsite )
//  Copyright © 2016 'XLOrganizationName'. All rights reserved.
//

import Alamofire
import Crashlytics
import Eureka
import Fabric
import Foundation

// MARK: - 3rd party framework setup

extension AppDelegate {

    func setupCrashlytics() {
        Fabric.with([Crashlytics.self])
        #if STAGING
        Fabric.sharedSDK().debug = true
        #endif
    }

}

// MARK: - Networking

extension AppDelegate {

    func setupNetworking() {
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(AppDelegate.requestDidComplete(notification:)),
            name: Alamofire.Notification.Name.Task.DidComplete,
            object: nil)
    }

    func requestDidComplete(notification: NSNotification) {
        guard let task = notification.userInfo?[Alamofire.Notification.Key.Task] as? URLSessionTask,
            let response = task.response as? HTTPURLResponse else {
            return
        }

        if Constants.Network.successRange ~= response.statusCode {
            // TODO: Get the authentication token from the response
            if let token = response.allHeaderFields[Constants.Network.authorizationHeader] as? String {
                SessionController.default.token = token
            }
        } else if response.statusCode == Constants.Network.unauthorized && SessionController.default.isLoggedIn() {
            SessionController.default.clearSession()
            DispatchQueue.main.async {
                // TODO: Take the user to the welcome screen
            }
        }
    }

}

// MARK: - UI customizations

extension AppDelegate {

    func stylizeApp() {
        stylizeEurekaRows()
    }

    /** Set up your Eureka default row customization here */
    private func stylizeEurekaRows() {
        let genericHorizontalMargin = CGFloat(50)
        BaseRow.estimatedRowHeight = 58

        EmailRow.defaultRowInitializer = {
            $0.placeholder = NSLocalizedString("E-mail Address", comment: "")
            $0.placeholderColor = .gray
        }

        EmailRow.defaultCellSetup = { cell, _ in
            cell.layoutMargins = .zero
            cell.contentView.layoutMargins.left = genericHorizontalMargin
            cell.height = { 58 }
        }
    }

}
