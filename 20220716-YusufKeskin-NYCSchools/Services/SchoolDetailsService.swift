//
//  SchoolDetailsService.swift
//  20220716-YusufKeskin-NYCSchools
//
//  Created by YUSUF KESKİN on 16.07.2022.
//

import Foundation

class SchoolDetailsService {
    
    
    static let instance = SchoolDetailsService()
    
    var session : SessionProtocol = URLSession.shared
    
    func getSchoolExamScore(withUrl url : URL, completion :@escaping(_ detailsList : [SchoolDetails])->()) {
        
        session.dataTask(with: url) { data, response, error in
            if error != nil {
                print(error!, "Data couldn't be fetched")
            } else {
                guard let data = data else { print("no data") ; return }
                
                let decoder = JSONDecoder()
                do {
                   let schoolDetails =  try decoder.decode([SchoolDetails].self, from: data)
                    completion(schoolDetails)
                } catch  {
                    print(error, "Couldn't be parsed correctly")
                }
            }
        }.resume()
    }
}
