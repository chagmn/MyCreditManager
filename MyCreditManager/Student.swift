//
//  Student.swift
//  MyCreditManager
//
//  Created by ChangMin on 2023/04/23.
//

import Foundation

final class Student {
    let name: String
    var subject: Subject?
    
    init(name: String) {
        self.name = name
        self.subject = nil
    }
    
    func addGrade(name: String, grade: String) {
        subject = Subject(name: name, grade: grade)
    }
}
