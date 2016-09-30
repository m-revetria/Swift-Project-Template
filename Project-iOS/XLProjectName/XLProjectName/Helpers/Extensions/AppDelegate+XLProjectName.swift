//
//  AppDelegate+XLProjectName.swift
//  XLProjectName
//
//  Created by XLAuthorName ( XLAuthorWebsite )
//  Copyright © 2016 'XLOrganizationName'. All rights reserved.
//

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
