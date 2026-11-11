//
//  MainRouter.swift
//  DragonDex
//
//  Created by Max Goodey on 11/11/26.
//

import SwiftUI

@Observable
class MainRouter {
    enum Tab {
        case dragons
        case riders
    }
    
    var selectedTab: Tab = .dragons
    var isShowingSettings = false
}
