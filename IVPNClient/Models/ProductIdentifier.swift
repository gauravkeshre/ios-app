//
//  ProductIdentifier.swift
//  IVPNClient
//
//  Created by Juraj Hilje on 18/04/2019.
//  Copyright © 2019 IVPN. All rights reserved.
//

//
//  ProductIdentifier.swift
//  IVPN iOS app
//  https://github.com/ivpn/ios-app
//
//  Created by Juraj Hilje on 2019-04-18.
//  Copyright (c) 2020 Privatus Limited.
//
//  This file is part of the IVPN iOS app.
//
//  The IVPN iOS app is free software: you can redistribute it and/or
//  modify it under the terms of the GNU General Public License as published by the Free
//  Software Foundation, either version 3 of the License, or (at your option) any later version.
//
//  The IVPN iOS app is distributed in the hope that it will be useful,
//  but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY
//  or FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License for more
//  details.
//
//  You should have received a copy of the GNU General Public License
//  along with the IVPN iOS app. If not, see <https://www.gnu.org/licenses/>.
//

import Foundation

struct ProductIdentifier {
    
    static let standardWeek = ""
    static let standardMonth = ""
    static let standardYear = ""
    static let standardTwoYears = ""
    static let standardThreeYears = ""
    static let proWeek = ""
    static let proMonth = ""
    static let proYear = ""
    static let proTwoYears = ""
    static let proThreeYears = ""
    
    static var all: Set<String> {
        return [
            standardWeek,
            standardMonth,
            standardYear,
            standardTwoYears,
            standardThreeYears,
            proWeek,
            proMonth,
            proYear,
            proTwoYears,
            proThreeYears
        ]
    }
    
}
