//
//  NSDate.swift
//  XLProjectName
//
//  Created by XLAuthorName ( XLAuthorWebsite )
//  Copyright (c) 2016 XLOrganizationName. All rights reserved.
//

import Foundation
import UIKit

public extension Date {

    public func dblog() -> String {
        return Constants.Formatters.debugConsoleDateFormatter.string(from: self)
    }

}
