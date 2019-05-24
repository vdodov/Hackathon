//
//  Styles.swift
//  DayByDay
//
//  Created by Chunsu Kim on 23/05/2019.
//  Copyright © 2019 Chunsu Kim. All rights reserved.
//

import Foundation
import UIKit

struct Theme {
    
    static var num = 3
    static var tabBarTint = #colorLiteral(red: 0.4621340632, green: 0.8370614648, blue: 1, alpha: 1)
    static var tabBarBarTint = #colorLiteral(red: 0.1071653441, green: 0.2755028009, blue: 0.3986083865, alpha: 1)
    static var tabBarUnselectedTintColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
    static var writeButton = #colorLiteral(red: 0.4621340632, green: 0.8370614648, blue: 1, alpha: 1)
    static var dateLabel = #colorLiteral(red: 0.176399827, green: 0.4986500144, blue: 0.757831037, alpha: 1)
    static var mainLabel = #colorLiteral(red: 0.4621340632, green: 0.8370614648, blue: 1, alpha: 1)
    static var cardView = #colorLiteral(red: 0.4621340632, green: 0.8370614648, blue: 1, alpha: 1)
    static var cardViewText = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
    
    static public func defaultTheme() {
        self.tabBarTint = #colorLiteral(red: 0.4621340632, green: 0.8370614648, blue: 1, alpha: 1)
        self.tabBarBarTint = #colorLiteral(red: 0.1071653441, green: 0.2755028009, blue: 0.3986083865, alpha: 1)
        self.tabBarUnselectedTintColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        self.writeButton = #colorLiteral(red: 0.4621340632, green: 0.8370614648, blue: 1, alpha: 1)
        self.dateLabel = #colorLiteral(red: 0.176399827, green: 0.4986500144, blue: 0.757831037, alpha: 1)
        self.mainLabel = #colorLiteral(red: 0.4621340632, green: 0.8370614648, blue: 1, alpha: 1)
        self.cardView = #colorLiteral(red: 0.4621340632, green: 0.8370614648, blue: 1, alpha: 1)
        self.cardViewText = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
    }
    
    static public func darkBlueTheme() {
        self.tabBarTint = #colorLiteral(red: 0.2531840801, green: 0.220611304, blue: 0.8930563927, alpha: 1)
        self.tabBarBarTint = #colorLiteral(red: 0.06274510175, green: 0, blue: 0.1921568662, alpha: 1)
        self.tabBarUnselectedTintColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        self.writeButton = #colorLiteral(red: 0.2531840801, green: 0.220611304, blue: 0.8930563927, alpha: 1)
        self.dateLabel = #colorLiteral(red: 0.2683359385, green: 0.3678353727, blue: 0.7584179044, alpha: 1)
        self.mainLabel = #colorLiteral(red: 0.2531840801, green: 0.220611304, blue: 0.8930563927, alpha: 1)
        self.cardView = #colorLiteral(red: 0.2531840801, green: 0.220611304, blue: 0.8930563927, alpha: 1)
        self.cardViewText = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
    }
    
    static public func pinkTheme() {
        self.tabBarTint = #colorLiteral(red: 0.9098039269, green: 0.4784313738, blue: 0.6431372762, alpha: 1)
        self.tabBarBarTint = #colorLiteral(red: 0.8078431487, green: 0.02745098062, blue: 0.3333333433, alpha: 1)
        self.tabBarUnselectedTintColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        self.writeButton = #colorLiteral(red: 0.9098039269, green: 0.4784313738, blue: 0.6431372762, alpha: 1)
        self.dateLabel = #colorLiteral(red: 0.8549019694, green: 0.250980407, blue: 0.4784313738, alpha: 1)
        self.mainLabel = #colorLiteral(red: 0.9098039269, green: 0.4784313738, blue: 0.6431372762, alpha: 1)
        self.cardView = #colorLiteral(red: 0.9098039269, green: 0.4784313738, blue: 0.6431372762, alpha: 1)
        self.cardViewText = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
    }
    
    static public func updateDisplay() {
        let proxyButton = UIButton.appearance()
        proxyButton.backgroundColor = Theme.writeButton
        
        let proxyDateLabel = UILabel.appearance()
        proxyDateLabel.textColor = Theme.dateLabel
        
        let proxyTextLabel = UILabel.appearance()
        proxyTextLabel.textColor = Theme.mainLabel
        
        let proxyTabBarTint = UITabBar.appearance()
        proxyTabBarTint.tintColor = Theme.tabBarBarTint
        
        let proxyTapBarColor = UITabBar.appearance()
        proxyTapBarColor.barTintColor = Theme.tabBarTint
        
        let proxyTapBarUnselect = UITabBar.appearance()
        proxyTapBarUnselect.unselectedItemTintColor = Theme.tabBarUnselectedTintColor
        
        let proxyCellColor = UIView.appearance()
        proxyCellColor.backgroundColor = Theme.cardView
        
        let proxyCellTextColor = UILabel.appearance()
        proxyCellTextColor.textColor = Theme.cardViewText
    }
    
}

let themeName: [String] = ["하늘하늘", "블루블루", "핑크핑크"]
