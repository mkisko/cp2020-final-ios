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
    let description: String
    let date: String
}
