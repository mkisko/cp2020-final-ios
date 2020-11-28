//
//  TaskModel.swift
//  RosAtomApp
//
//  Created by Admin on 28.11.2020.
//

import Foundation

struct TaskModel: Decodable {
    let isImportent: Bool
    let status: String
    let title: String
    let description: String
    let owner: String
    var comments: [String]
    let hours: Int
    let date: String
}
