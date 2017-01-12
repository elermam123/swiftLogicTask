//
//  AppDelegate.swift
//  swiftLogicTask
//
//  Created by Elerman on 12.01.17.
//  Copyright © 2017 Elerman. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        /**************************
         Забавная реализация логической задачи:
         У вас есть три блина и две сковороды. Каждая сторона блина жарится одну минуту. На одну
         сковороду одновременно помещается лишь один блин. За какое наименьшее время можно
         пожарить все блины с обеих сторон?
         
         Решение:
         На обе сковородки наливаем блины "1" и "2" - жарим -- 1 мин.
         
         На одной переворачиваем блин "1", с другой снимаем блин "2" (прожаренный с одной стороны) и наливаем блин "3". -- 2 мин.
         
         С первой снимаем готовый блин "1" и кладем на нее дожариваться блин "2". На второй переворачиваем блин "3". -- 3 мин.
         
         
         **********************/
        
        var blinchikiArray  = [0,0,0];
        var minutesCount = 0
        
        while(!blinchikiArray.isEmpty){
            var countBlins = blinchikiArray.count
            for blin in 0 ..< countBlins {
                
                if(countBlins > blinchikiArray.count){
                    countBlins = blinchikiArray.count
                    break
                }
                
                
                if(blinchikiArray[blin] <= 1 ){
                    blinchikiArray = skovorodka(blArray: blinchikiArray)
                    
                }
                
                if( blinchikiArray[blin] == 2 ){
                    blinchikiArray.remove(at: blin)
                }
                
            }
            
            minutesCount+=1
            
        }
        
        
        
        if(blinchikiArray.isEmpty){
            print("Блины пожарены за ", minutesCount, " минуты")
        }

        
        
        return true
    }
    
    func skovorodka( blArray: Array<Int>)->Array<Int>{
        
        var blArray = blArray
        for i in 0...blArray.count-1 {
            if(blArray[i]<2){
                blArray[i] += 1
                
            }
            if(blArray[i] == 1){
                blArray.append(blArray[i])
                blArray.remove(at: i)
            }
        }
        return blArray
    }


    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

