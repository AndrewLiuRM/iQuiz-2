//
//  QuestionList.swift
//  iQuiz
//
//  Created by Andrew Liu on 11/12/17.
//  Copyright © 2017 Andrew Liu. All rights reserved.
//

import Foundation

class QuestionList {
    public var list:[Question]
    init(_ question: Question... ) {
        self.list = question;
    }
}
