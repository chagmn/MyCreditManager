//
//  Student.swift
//  MyCreditManager
//
//  Created by ChangMin on 2023/04/23.
//

import Foundation

final class Student {
    let name: String
    var subject: [Subject]
    
    init(name: String) {
        self.name = name
        self.subject = [Subject]()
    }
    
    func addGrade(name: String, grade: Grade) {
        subject.append(Subject(name: name, grade: grade))
    }
    
    func removeGrade(name: String) -> Bool {
        if let index = subject.firstIndex(where: { $0.name == name }) {
            subject.remove(at: index)
            return true
            
        } else {
            return false
        }
    }
    
    func showGradePerAverage() {
        var sum = 0.0
        subject.forEach {
            print("\($0.name): \($0.grade.rawValue)")
            sum += $0.grade.score
        }
        print("평점 : \(sum/Double(subject.count))")
    }
}
