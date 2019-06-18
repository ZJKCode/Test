//
//  SwiftPro.swift
//  TEST
//
//  Created by zhangjikuan on 2019/6/17.
//  Copyright © 2019 winchannel. All rights reserved.
//

import UIKit

class SwiftOperation: NSObject ,OperationProtocol{
    func operations() -> [String] {
        return ["swift"]
    }

    func operationTitle() -> String {
        return "Swift"
    }


    private func operationTarget(_ target: UIViewController, withIndex index: Int) {

        print(index)

        let viewController = ListViewController()

        target.navigationController?.pushViewController(viewController, animated: true)

    }

    @objc
    func operationTarget(_ target: UIViewController, WithIndex index:Int) {
        operationTarget(target, withIndex: index)
    }
}
