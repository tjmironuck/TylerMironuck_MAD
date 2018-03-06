//
//  Record.swift
//  nflrapsheet
//
//  Created by Tyler MIRONUCK on 3/4/18.
//  Copyright © 2018 Tyler MIRONUCK. All rights reserved.
//

import Foundation

struct Record: Decodable{
    let Team_preffered_name: String
    let Team_city: String
    let arrest_count: String
}
