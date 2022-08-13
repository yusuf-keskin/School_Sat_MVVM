//
//  SchoolDetails.swift
//  20220716-YusufKeskin-NYCSchools
//
//  Created by YUSUF KESKİN on 16.07.2022.
//

import Foundation

struct SchoolDetail : Codable {
    var dbn : String
    var school_name : String
    var phone_number : String
    var overview_paragraph : String
    var location : String
    var website : String
}
