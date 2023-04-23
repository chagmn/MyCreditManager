//
//  CreditManager.swift
//  MyCreditManager
//
//  Created by ChangMin on 2023/04/23.
//

import Foundation

final class CreditManager {
    private var inputValue = ""
    private var studentList = [Student]()
    
    func execute() {
        repeat {
            inputValue = getInputValue()
            
            switch inputValue {
            case "1":
                insertStudent()
            case "2":
                deleteStudent()
            case "3":
                insertOrUpdateGrade()
            case "4":
                deleteGrade()
            case "5":
                getGradePerAverage()
            case "X":
                break
            default:
                inputError()
            }
            
        } while inputValue != "X"
    }
    
    private func getInputValue() -> String {
        print("원하는 기능을 입력해주세요.")
        print("1: 학생추가, 2: 학생삭제, 3: 성적추가(변경), 4: 성적삭제, 5: 평점보기, X: 종료")
        
        return String(readLine()!)
    }

    private func insertStudent() {
        print("추가할 학생의 이름을 입력해주세요")
        
        let name = String(readLine()!)
        guard name != "" else {
            print("입력이 잘못되었습니다. 다시 확인해주세요.")
            return
        }
        
        
        if studentList.contains(where: { $0.name == name }) {
            print("\(name)은 이미 존재하는 학생입니다. 추가하지 않습니다.")
            
        } else {
            print("\(name) 학생을 추가했습니다.")
            
            let student = Student(name: name)
            studentList.append(student)
        }
    }

    private func deleteStudent() {
        print("2")
    }

    private func insertOrUpdateGrade() {
        print("3")
    }

    private func deleteGrade() {
        print("4")
    }

    private func getGradePerAverage() {
        print("5")
    }

    private func inputError() {
        print("뭔가 입력이 잘못되었습니다. 1~5 사이의 숫자 혹은 X를 입력해주세요.")
    }
}
