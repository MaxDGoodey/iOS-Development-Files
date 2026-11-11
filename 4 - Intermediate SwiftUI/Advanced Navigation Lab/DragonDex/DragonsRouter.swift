//
//  DragonsRouter.swift
//  DragonDex
//
//  Created by Max Goodey on 11/11/26.
//

import SwiftUI

@Observable
class DragonsRouter {
    var navigationPath = NavigationPath()
    
    enum Route: Hashable {
        case dragon(Dragon)
        case power(Power)
    }
    
    @ViewBuilder
    func view(for route: Route) -> some View {
        switch route {
            
        case .dragon(let dragon):
            DragonDetailScreen(dragon: dragon)
            
        case .power(let power):
            PowerDetailScreen(power: power)
        }
    }
    
    func navigateTo(route: Route) {
        navigationPath.append(route)
    }
    
    func goHome() {
        navigationPath = NavigationPath()
    }
}
