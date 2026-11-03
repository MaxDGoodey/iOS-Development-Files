//
//  Book.swift
//  Reading Log
//
//  Created by Max Goodey on 11/3/26.
//
import SwiftUI

struct Book: Identifiable {
    let id = UUID()
    var title: String
    var author: String
    var pageCount: Int
    var isFinished: Bool
}
