//
//  Task.swift
//  TodoMakeSchool
//
//  Created by William Fernandes on 7/16/18.
//  Copyright © 2018 William Fernandes. All rights reserved.
//

import Foundation

struct Task {
    var name: String
    var createdDate: Date
    var priority: Int
    var dueDate: Date
    var isCompleted: Bool = false
    var category: Category?
    var pomoCount: Int
    
    
}
