//
//  ListVC.swift
//  20220716-YusufKeskin-NYCSchools
//
//  Created by YUSUF KESKİN on 16.07.2022.
//

import UIKit

class ListVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var examDataArray =  [School]()

    @IBOutlet weak var tableview: UITableView!
    
    override func viewWillAppear(_ animated: Bool) {
        
        ExamDataService.instance.getSchoolExamScore(withUrl: EXAM_URL!) {examlist in
            self.examDataArray = examlist
            
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
        return examDataArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableview.dequeueReusableCell(withIdentifier: "shoolScoreDetailsCell", for: indexPath) as? SchoolListCell else {return UITableViewCell()}
        let school = examDataArray[indexPath.row]
        cell.setupCell(withSchoolAndExamData: school)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let board = UIStoryboard(name: "Main", bundle: nil)
        let detailsVC = board.instantiateViewController(withIdentifier: "DetailsVC") as! DetailsVC
        
        let selectedCell = tableView.cellForRow(at: indexPath) as? SchoolListCell
        
        DispatchQueue.main.async {
            for exam in self.examDataArray {
                if exam.dbn == selectedCell?.dbnCodeLbl.text {
                    detailsVC.examTakersNumLbl.text = exam.num_of_sat_test_takers
                    detailsVC.mathScoreLbl.text = exam.sat_math_avg_score
                    detailsVC.readingScoreLbl.text = exam.sat_critical_reading_avg_score
                    detailsVC.writingScoreLbl.text = exam.sat_writing_avg_score
                    detailsVC.schoolNameLbl.text = exam.school_name
                    detailsVC.dbn = exam.dbn
                }
            }
        }

        detailsVC.modalPresentationStyle = .fullScreen
        present(detailsVC, animated: true)
    }
    
}
