//
//  DetailsVC.swift
//  20220716-YusufKeskin-NYCSchools
//
//  Created by YUSUF KESKİN on 16.07.2022.
//

import UIKit

class DetailsVC: UIViewController {
    
    var detailsModel = DetailsViewModel()
    var dbn : String!

        
    @IBOutlet weak var schoolNameLbl: UILabel!
    @IBOutlet weak var readingScoreLbl: UILabel!
    @IBOutlet weak var mathScoreLbl: UILabel!
    @IBOutlet weak var writingScoreLbl: UILabel!
    @IBOutlet weak var examTakersNumLbl: UILabel!
    @IBOutlet weak var phoneNumberLbl: UILabel!
    @IBOutlet weak var emailLbl: UILabel!
    @IBOutlet weak var adressLbl: UILabel!
    @IBOutlet weak var overviewTxtView: UITextView!
    @IBOutlet weak var backBtn: UIButton!
    
    @IBOutlet weak var headerBckgrnView: UIView!
    
    @IBOutlet weak var overViewDownloadIndicator: UIActivityIndicatorView!
    @IBOutlet weak var contactInfoDownloadIndicator: UIActivityIndicatorView!

    
    override func viewDidLoad() {
        setupViewElements()
        
        detailsModel.dbn.value = self.dbn!
        detailsModel.dbn.bind({ value in
            self.detailsModel.getSchoolDetails(completion: { [self] success in
                DispatchQueue.main.async { [self] in
                    
                    self.phoneNumberLbl.text = self.detailsModel.schoolDetail?.phone_number
                    self.emailLbl.text = self.detailsModel.schoolDetail?.website
                    self.overviewTxtView.text = self.detailsModel.schoolDetail?.overview_paragraph
                    self.adressLbl.text = self.detailsModel.schoolDetail?.location
                    self.schoolNameLbl.text = self.detailsModel.schoolDetail?.school_name.uppercased()
                    
                    setupViewAfterDataLoaded()
                }
            })
        })
        
        }
    
    func setupViewAfterDataLoaded () {
        overviewTxtView.isHidden = false
        contactInfoDownloadIndicator.stopAnimating()
        overViewDownloadIndicator.stopAnimating()
        contactInfoDownloadIndicator.isHidden = true
        overViewDownloadIndicator.isHidden = true
        self.view.reloadInputViews()
    }
    
    func setupViewElements () {
        overviewTxtView.isHidden = true
        contactInfoDownloadIndicator.isHidden = false
        overViewDownloadIndicator.isHidden = false
        contactInfoDownloadIndicator.startAnimating()
        overViewDownloadIndicator.startAnimating()
        overviewTxtView.layer.cornerRadius = 8
        headerBckgrnView.layer.cornerRadius = 8
        overviewTxtView.textContainerInset = UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8)
    }
    
    @IBAction func backBtnTapped(_ sender: Any) {
        dismiss(animated: true)
    }
    
}
