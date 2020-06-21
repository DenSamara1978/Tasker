//
//  Task.swift
//  Tasker
//
//  Created by Denis Vlaskin on 21.06.2020.
//  Copyright © 2020 Denis Vlaskin. All rights reserved.
//

import Foundation

protocol Taskable: class {
    var tasks: [Taskable] { get set }
    var taskName: String { get set }
    var parent: Taskable? { get set }
}
