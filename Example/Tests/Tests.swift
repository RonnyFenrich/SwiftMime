//
//  SwiftMimeTests.swift
//  SwiftMimeTests
//
//  Created by di wu on 2/9/15.
//  Copyright (c) 2015 di wu. All rights reserved.
//

import UIKit
import XCTest
import SwiftMime

class SwiftMimeTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testLookupType() {
        XCTAssertEqual(SwiftMime.sharedManager.lookupType(path: "txt"), "text/plain", "pass")
    }
    
    func testLookupExtension() {
        XCTAssertEqual(SwiftMime.sharedManager.lookupExtension(mimeType: "application/atom+xml"), "atom", "pass")
    }
    
    func testDefine() {
        SwiftMime.sharedManager.define(extensionsForType: [
            "text/x-some-format": ["x-sf", "x-sft", "x-sfml"],
            "application/x-my-type": ["x-mt", "x-mtt"]
            ])
        XCTAssertEqual(SwiftMime.sharedManager.lookupExtension(mimeType: "application/x-my-type"), "x-mt", "pass")
        XCTAssertEqual(SwiftMime.sharedManager.lookupType(path: "x-mtt"), "application/x-my-type", "pass")
    }
    
    
    func testUnknownLookupType() {
        XCTAssertEqual(SwiftMime.sharedManager.lookupType(path: "unknown"), nil, "pass")
    }
}
