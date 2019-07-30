//
//  GuestPass.swift
//  AmusementParkPassGenerator
//
//  Created by Henry Trinh on 7/15/19.
//  Copyright © 2019 HR-Soft. All rights reserved.
//

import Foundation

/*           Passes for Guest           */
class GuestPass : Passes {
    override init(typeOfPass: TypeOfPasses) {
        super.init(typeOfPass: typeOfPass)
    }
}

class ClassicPass: GuestPass {
    init() {
        super.init(typeOfPass: .ClassicPass)
    }
}

class VipPass : GuestPass {
    init() {
        super.init(typeOfPass: .VipPass)
    }
}

class ChildrenPass : GuestPass {
    init() {
        super.init(typeOfPass: .ChildrenPass)
    }
}

class SeniorPass: GuestPass {
    init() {
        super.init(typeOfPass: .SeniorPass)
    }
}

class SeasonPass: GuestPass {
    init() {
        super.init(typeOfPass:  .SeasonPass)
    }
}
