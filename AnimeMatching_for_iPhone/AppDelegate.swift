//
//  AppDelegate.swift
//  AnimeMatching_for_iPhone
//
//  Created by 川上智樹 on 2016/11/26.
//  Copyright © 2016 yatuhasiumai. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {

        // NIFTY
        NCMB.setApplicationKey("007aded69126a2552ed4897b7e999cef478eda473803b204dc1396092a4201a7", clientKey: "6d1fcc5c163b174398fbcb7c297a3fd114c93c3f4fd8514a88b61e45d3d199f1")
        
//        let pointer = NCMBObject(className: "child")
//        pointer?.setObject("value", forKey : "key")
//        pointer?.save(nil)
//        // objectクラスを作成
//        let object = NCMBObject(className: "object")
//        // ポインターの設定
//        object?.setObject(pointer, forKey: "pointer")
//        object?.saveInBackground({(error) in
//            if (error != nil) {
//                // 保存に失敗した場合の処理
//                
//            }else{
//                // 保存に成功した場合の処理
//                
//            }
//        })
        
        return true
    }
    
    func applicationWillResignActive(_ application: UIApplication) {}
    
    func applicationDidEnterBackground(_ application: UIApplication) {}
    
    func applicationWillEnterForeground(_ application: UIApplication) {}
    
    func applicationDidBecomeActive(_ application: UIApplication) {}
    
    func applicationWillTerminate(_ application: UIApplication) {}
    
    
}
