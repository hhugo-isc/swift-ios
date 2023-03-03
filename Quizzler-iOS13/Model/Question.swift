//
//  Question.swift
//  Quizzler-iOS13
//
//  Created by administrador on 03/03/23.
//  Copyright © 2023 The App Brewery. All rights reserved.
//

import Foundation

struct Question{
    let questionText: String
    let answer: String
    
    init(q questionText: String, a answer: String) {
        self.questionText = questionText
        self.answer = answer
    }
    
}
