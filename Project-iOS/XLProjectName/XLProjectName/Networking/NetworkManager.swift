//
//  NetworkManager.swift
//  XLProjectName
//
//  Created by XLAuthorName ( XLAuthorWebsite )
//  Copyright © 2016 XLOrganizationName. All rights reserved.
//

import Alamofire
import Foundation
import KeychainAccess
import Opera
import RxSwift

class NetworkManager: RxManager {

    static let `default`: NetworkManager = {
        return NetworkManager(manager: Alamofire.SessionManager.default)
    }()

    fileprivate let disposeBag = DisposeBag()

    private override init(manager: Alamofire.SessionManager) {
        super.init(manager: manager)
        manager.adapter = RequestAdapter()
        manager.retrier = RequestRetrier()
        observers = [Logger()]
    }

}

class RequestAdapter: Alamofire.RequestAdapter {

    func adapt(_ urlRequest: URLRequest) throws -> URLRequest {
        var request = urlRequest

        if let token = SessionController.default.token, let requestHost = urlRequest.url?.host, requestHost == Constants.Network.baseUrl.host {
            // Add authentication header just to calls to the app's backend
            request.setValue("Bearer \(token)", forHTTPHeaderField: Constants.Network.authorizationHeader)
        }

        return request
    }

}

class RequestRetrier: Alamofire.RequestRetrier {

    func should(_ manager: SessionManager, retry request: Request, with error: Error, completion: @escaping RequestRetryCompletion) {
        guard let response = request.task?.response as? HTTPURLResponse, response.statusCode == Constants.Network.unauthorized, SessionController.default.isLoggedIn() else {
            // Only retries for token expired issues
            completion(false, 0.0)
            return
        }

        guard let url = response.url, url.lastPathComponent != Constants.Network.refreshTokenPath else {
            completion(false, 0.0)
            return
        }

        SessionController.default.refreshToken()
            .subscribe(
                onError: { _ in
                    completion(false, 0.0)
                },
                onCompleted: {
                    completion(true, 0.5)
                })
            .addDisposableTo(NetworkManager.default.disposeBag)
    }

}

struct Logger: Opera.ObserverType {

    func willSendRequest(_ alamoRequest: Alamofire.Request, requestConvertible: URLRequestConvertible) {
        debugPrint(alamoRequest)
    }

}
