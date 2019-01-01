//
//  main.swift
//  FirstCourseSecondTask
//
//  Copyright © 2017 E-Legion. All rights reserved.
//

import Foundation
import FirstCourseSecondTaskChecker


let checker = Checker()


checker.checkFirstFunction() {
    let a = $0.filter({$0 % 2 == 0}).count
    let b = $0.filter({$0 % 2 == 1}).count
    return (a, b)
}

// equivalant to this:
//var closure: ([Int]) -> (Int, Int) = {
//    let a = $0.filter({$0 % 2 == 0}).count
//    let b = $0.filter({$0 % 2 == 1}).count
//    return (a, b)
//}
//checker.checkFirstFunction(function: closure)


var closure2: ([Checker.Circle]) -> ([Checker.Circle]) = {
    let changedArray: [Checker.Circle] = $0.filter({$0.color != .red}).map({
        if ($0.color == .black) {
            var a = $0
            a.radius *= 2
            return a
        }
        if ($0.color == .green) {
            var a = $0
            a.color = .blue
            return a
        }
        return $0
    })
    
    var newArray = [Checker.Circle]()
    for element in changedArray {
        if (element.color == .white) {
            newArray.append(element)
        }
    }
    for element in changedArray {
        if element.color != .white, element.color != .blue {
            newArray.append(element)
        }
    }
    for element in changedArray {
        if (element.color == .blue) {
            newArray.append(element)
        }
    }
    return newArray
}



checker.checkSecondFunction(function: closure2)


checker.checkThirdFunction() {
    var result = [Checker.Employee]()
    for element in $0 {
        if (element.keys.count != 3) {
            continue
        }
        if (element["company"] == nil || element["fullName"] == nil || element["salary"] == nil) {
            continue
            
        }
        result.append(Checker.Employee.init(fullName: element["fullName"]!, salary: element["salary"]!, company: element["company"]!))
    }
    return result;
}

checker.checkFourthFunction() {
    var result = [String: [String]]()
    for element in $0 {
        let firstCharacter = String(element.prefix(1))
        if (result[firstCharacter] == nil) {
            result[firstCharacter] = [String]()
        }
        if (!result[firstCharacter]!.contains(element)) {
            result[firstCharacter]!.append(element)
        }
    }
    result = result.filter({$0.value.count > 1})
    for key in result.keys {
        result[key]?.sort(by: >)
    }
    return result
}
