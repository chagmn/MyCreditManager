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
                finish()
            default:
                inputError()
            }
            
        } while inputValue != "X"
    }
    
    private func getInputValue() -> String {
        print("\n원하는 기능을 입력해주세요.")
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
        print("삭제할 학생의 이름을 입력해주세요")
        let name = String(readLine()!)
        
        if studentList.contains(where: { $0.name == name }) {
            print("\(name) 학생을 삭제하였습니다.")
            
            let index = studentList.firstIndex(where: { $0.name == name })
            studentList.remove(at: index!)
            
        } else {
            print("\(name) 학생을 찾지 못했습니다.")
        }
    }

    private func insertOrUpdateGrade() {
        print("성적을 추가할 학생의 이름, 과목 이름, 성적(A+, A, F 등)을 띄어쓰기로 구분하여 차례로 작성해주세요.")
        print("입력예) Mickey Swift A+")
        print("만약에 학생의 성적 중 해당 과목이 존재하면 기존 점수가 갱신됩니다.")
        
        let input = readLine()!.split(separator: " ").map { String($0) }
        
        guard input.count == 3 else {
            print("입력이 잘못되었습니다. 다시 확인해주세요.")
            return
        }
        
        let (name, subjectName, grade) = (input[0], input[1], input[2])
        
        guard studentList.contains(where: { $0.name == name }) else {
            print("\(name) 학생을 찾지 못했습니다.")
            return
        }
        
        if let index = studentList.firstIndex(where: { $0.name == name }) {
            studentList[index].addGrade(name: subjectName, grade: grade)
            print("\(name) 학생의 \(subjectName) 과목이 \(grade)로 추가(변경)되었습니다.")
        }
    }

    private func deleteGrade() {
        print("성적을 삭제할 학생의 이름, 과목 이름을 띄어쓰기로 구분하여 차례로 작성해주세요.")
        print("입력예) Mickey Swift")
        
        let input = readLine()!.split(separator: " ").map { String($0) }
        
        guard input.count == 2 else {
            print("입력이 잘못되었습니다. 다시 확인해주세요.")
            return
        }
        
        let (name, subjectName) = (input[0], input[1])
        
        guard studentList.contains(where: { $0.name == name }) else {
            print("\(name) 학생을 찾지 못했습니다.")
            return
        }
        
        if let index = studentList.firstIndex(where: { $0.name == name }) {
            if studentList[index].removeGrade(name: subjectName) {
                print("\(name) 학생의 \(subjectName) 과목이 삭제되었습니다.")
            } else {
                print("\(name) 학생의 \(subjectName) 과목을 수강중이지 않습니다.")
            }
        }
    }

    private func getGradePerAverage() {
        print("평점을 알고싶은 학생의 이름을 입력해주세요.")
        
        let name = String(readLine()!)
        guard name != "" else {
            print("입력이 잘못되었습니다. 다시 확인해주세요.")
            return
        }
        
        guard studentList.contains(where: { $0.name == name }) else {
            print("\(name) 학생을 찾지 못했습니다.")
            return
        }
        
        if let index = studentList.firstIndex(where: { $0.name == name }) {
            studentList[index].showGradePerAverage()
        }
    }
    
    private func finish() {
        print("프로그램을 종료합니다...")
    }

    private func inputError() {
        print("뭔가 입력이 잘못되었습니다. 1~5 사이의 숫자 혹은 X를 입력해주세요.")
    }
}
