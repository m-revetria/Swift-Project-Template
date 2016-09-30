//
//  UITests.swift
//  UITests
//
//  Created by Xmartlabs SRL ( http://xmartlabs.com )
//  Copyright (c) 2016 XLOrganizationName. All rights reserved.
//

import XCTest

import Nimble
import Quick

class UITests: QuickSpec {

    override func spec() {
        describe("The 'Sanity' spec") {
            it("should pass") {
                expect(true).to(beTrue())
            }
        }
    }

}
