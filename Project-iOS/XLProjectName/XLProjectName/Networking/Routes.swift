//
//  Routes.swift
//  XLProjectName
//
//  Created by Miguel Revetria on 30/9/16.
//  Copyright © 2016 'XLOrganizationName'. All rights reserved.
//

import Foundation

struct XLProjectNameApi {

    struct Test { }

}

extension XLProjectNameApi.Test {

    struct Fail: GetType {

        var path: String = "shifts"

    }

    struct Refresh: GetType {

        var path: String = Constants.Network.refreshTokenPath!

    }

}
