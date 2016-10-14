//
//  RealmManager.swift
//  XLProjectName
//
//  Created by XLAuthorName ( XLAuthorWebsite )
//  Copyright © 2016 XLOrganizationName. All rights reserved.
//

import Crashlytics
import Foundation
import RealmSwift

class RealmManager: AnyObject {

    static let shared = RealmManager()

    private(set) var defaultRealm: Realm!

    private var config = Realm.Configuration()

    private init() {
        config.schemaVersion = 1

        // TODO: delete if migration is required
//        config.deleteRealmIfMigrationNeeded = true

        // TODO: delete if no migration is required
//        config.migrationBlock = { migration, oldSchemaVersion in
//             Perform migrations when needed
//            if oldSchemaVersion == 1 {
//                 ...
//            }
//        }

        do {
            defaultRealm = try Realm(configuration: config)
        } catch {
            let nserror = error as NSError
            Crashlytics.sharedInstance().recordError(nserror)
        }
    }

    func eraseAll() {
        do {
            let realm = try createRealm()
            try realm.write {
                realm.deleteAll()
            }
        } catch {
            let nserror = error as NSError
            Crashlytics.sharedInstance().recordError(nserror)
        }
    }

    func createRealm() throws -> Realm {
        return try Realm(configuration: config)
    }

}

extension Object {

    private func realmInst() -> Realm {
        return self.realm ?? RealmManager.shared.defaultRealm
    }

    /** Must be called from main thread */
    func save(update: Bool = true) throws {
        let realm = self.realmInst()
        try realm.write() {
            realm.add(self, update: update)
        }
    }

    /** Must be called from main thread */
    static func save(objects: [Object], update: Bool = true) throws {
        guard let first = objects.first else {
            return
        }
        let realm = first.realmInst()
        try realm.write() {
            objects.forEach() { realm.add($0, update: update) }
        }
    }

}
