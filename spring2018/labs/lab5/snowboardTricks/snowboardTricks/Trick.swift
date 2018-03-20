//
//  Trick.swift
//  snowboardTricks
//
//  Created by Tyler MIRONUCK on 3/19/18.
//  Copyright © 2018 Tyler MIRONUCK. All rights reserved.
//

import Foundation
import RealmSwift

class Trick: Object {
    @objc dynamic var name = ""
    @objc dynamic var landed = false
}
