//
//  DetailsViewModel.swift
//  NYCSchools
//
//  Created by YUSUF KESKİN on 1.08.2022.
//

class DetailsViewModel {
    var schoolViewModel = SchoolViewModel()
    var dbn : Observable<String> = Observable("")
    
    var schoolDetail : SchoolDetails?
    
    func getSchoolDetails (completion : @escaping (_ success: Bool)-> ()) {

        SchoolDetailsService.instance.getSchoolExamScore(withUrl: DETAILS_URL!) { detailsList in
            for i in detailsList {
                if i.dbn == self.dbn.value {
                    self.schoolDetail = i
                    completion(true)
                }
            }
        }
        
    }
}


