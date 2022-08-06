//
//  ListVC.swift
//  20220716-YusufKeskin-NYCSchools
//
//  Created by YUSUF KESKİN on 16.07.2022.
//

import UIKit

class ListVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var schoolViewModel =  SchoolViewModel()
    var selectedSchool : School?

    @IBOutlet weak var tableview: UITableView!
    
    override func viewWillAppear(_ animated: Bool) {
        schoolViewModel.getExamData { success in

            DispatchQueue.main.async {
                self.tableview.reloadData()
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableview.delegate = self
        tableview.dataSource = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return schoolViewModel.schoolModel.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableview.dequeueReusableCell(withIdentifier: "shoolScoreDetailsCell", for: indexPath) as? SchoolListCell else {return UITableViewCell()}
        let school = schoolViewModel.schoolModel[indexPath.row]
        self.selectedSchool = school
        cell.setupCell(withSchoolAndExamData: school)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let selectedCell = tableView.cellForRow(at: indexPath) as? SchoolListCell

        
        let board = UIStoryboard(name: "Main", bundle: nil)
        let detailsVC = board.instantiateViewController(withIdentifier: "DetailsVC") as! DetailsVC
        detailsVC.dbn =  selectedCell?.dbnCodeLbl.text

        DispatchQueue.main.async {
            detailsVC.mathScoreLbl.text = self.selectedSchool?.sat_math_avg_score
            detailsVC.readingScoreLbl.text = self.selectedSchool?.sat_critical_reading_avg_score
            detailsVC.writingScoreLbl.text = self.selectedSchool?.sat_writing_avg_score
            detailsVC.examTakersNumLbl.text = self.selectedSchool?.num_of_sat_test_takers
        }
        
        detailsVC.modalPresentationStyle = .fullScreen
        present(detailsVC, animated: true)
    }

}
