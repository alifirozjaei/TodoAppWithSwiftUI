//
//  User.swift
//  Todo
//
//  Created by 1 on 12/1/1402 AP.
//

import Foundation

struct User: Codable {
    let id: String
    let name: String
    let email: String
    let joined: TimeInterval
}
