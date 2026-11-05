//
//  ViewModel.swift
//  Grids Lab
//
//  Created by Max Goodey on 11/4/26.
//

import SwiftUI

func scrollTo(_ id: Int, anchor: UnitPoint? = nil, proxy: ScrollViewProxy) -> Void {
    withAnimation(.easeInOut(duration: 0.2)) {
        proxy.scrollTo(id, anchor: anchor)
    }
}
