//
//  TaskModel.swift
//  RosAtomApp
//
//  Created by Admin on 28.11.2020.
//

import Foundation

struct TaskModel {
    let isImportent: Bool
    let status: String
    let title: String
    let description: String
    let owner: User
    var comments: [String]
    let hours: Int
    let date: String
    let users: [User]
}

struct User {
    let fio: String
    let position: String
}
