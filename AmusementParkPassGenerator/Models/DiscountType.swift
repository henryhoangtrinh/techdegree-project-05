//
//  DiscountType.swift
//  AmusementParkPassGenerator
//
//  Created by Henry Trinh on 7/15/19.
//  Copyright © 2019 HR-Soft. All rights reserved.
//

import Foundation

struct DiscountType {
    var food: Int
    var merchandise: Int
    
    init(food: Int, merchandise: Int) {
        self.food = food
        self.merchandise = merchandise
    }
}
