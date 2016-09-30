//
//  RouteType.swift
//  XLProjectName
//
//  Created by XLAuthorName ( XLAuthorWebsite )
//  Copyright © 2016 XLOrganizationName. All rights reserved.
//

import Alamofire
import Foundation
import Opera
import RxSwift

extension RouteType {

    var baseURL: URL {
        return Constants.Network.baseUrl
    }

    var manager: ManagerType {
        return NetworkManager.default
    }

    var retryCount: Int {
        return 0
    }

}

extension RouteType {

    func rx_response() -> Observable<OperaResult> {
        //swiftlint:disable force_cast
        return (manager as! RxManager).rx_response(self)
        //swiftlint:enable force_cast
    }

}

protocol GetType: RouteType {
}

extension GetType {
    var method: Alamofire.HTTPMethod { return .get }
}

protocol PostType: RouteType {
}

extension PostType {
    var method: Alamofire.HTTPMethod { return .post }
}

protocol PutType: RouteType {
}

extension PutType {
    var method: Alamofire.HTTPMethod { return .put }
}

protocol DeleteType: RouteType {
}

extension DeleteType {
    var method: Alamofire.HTTPMethod { return .delete }
}
