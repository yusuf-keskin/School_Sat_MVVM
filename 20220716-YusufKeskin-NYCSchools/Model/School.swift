//
//  School.swift
//  20220716-YusufKeskin-NYCSchools
//
//  Created by YUSUF KESKİN on 16.07.2022.
//

import Foundation

struct School : Codable {
   
    var dbn : String
    var school_name : String
    var num_of_sat_test_takers : String
    var sat_critical_reading_avg_score : String
    var sat_math_avg_score : String
    var sat_writing_avg_score : String
}
