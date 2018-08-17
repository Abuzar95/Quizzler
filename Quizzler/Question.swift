//
//  Questions.swift
//  Quizzler
//  Created by Abuzar Manzoor on 25/08/2017.
//

import Foundation

class Question{
    let questionText : String
    let answer : Bool
    
    init(text: String, correctAnswer: Bool) {
        questionText = text
        answer = correctAnswer
    }
    
}
