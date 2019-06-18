//
//  Gloable.swift
//  TEST
//
//  Created by zhangjikuan on 2019/6/18.
//  Copyright © 2019 winchannel. All rights reserved.
//

import UIKit

var topVC: UIViewController? {
    var resultVC:UIViewController?
    resultVC = _topVC(UIApplication.shared.keyWindow?.rootViewController)
    while resultVC?.presentedViewController != nil {
        resultVC = _topVC(resultVC?.presentedViewController)
    }
    return resultVC;
}

private func _topVC(_ vc: UIViewController?) -> UIViewController? {
    if vc is UINavigationController {
        return _topVC((vc as? UINavigationController)?.topViewController)
    } else if vc is UITabBarController {
        return _topVC((vc as? UITabBarController)?.selectedViewController)
    } else {
        return vc
    }
}

func showAlert(_ message: String) {
    let alert = UIAlertController(title: "提示", message: message, preferredStyle: .alert)
    let alertAction = UIAlertAction(title: "OK", style: .cancel) { (UIAlertAction) -> Void in
        alert.dismiss(animated: true, completion: nil
        )}
    alert.addAction(alertAction)
    topVC!.present(alert, animated: true, completion: nil)
}

let screenWidth = UIScreen.main.bounds.size.width
let screenHeight = UIScreen.main.bounds.size.height



class Global: NSObject {

}
