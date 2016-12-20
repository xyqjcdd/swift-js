//
//  JSObjectMethods.swift
//  swift-js
//
//  Created by XYQ on 2016/12/16.
//  Copyright © 2016年 XYQ. All rights reserved.
//

import UIKit
import JavaScriptCore

@objc protocol JSObjectMethods: JSExport
{
    func upAction(_ username:String);
    func test();
}
