//
//  quest.swift
//  Brandiary
//
//  Created by young on 28/07/2019.
//  Copyright © 2019 young. All rights reserved.
//
import Foundation
import UIKit

class quest: UIViewController,UITableViewDataSource,UITableViewDelegate{
    @IBOutlet weak var reward: UIImageView!
    @IBOutlet weak var cellview: UIView!
    @IBOutlet weak var complete: UILabel!
    @IBOutlet weak var proceeding: UILabel!
    @IBOutlet weak var progressbar: UIProgressView!
    @IBOutlet weak var xnumber: UILabel!
    @IBOutlet weak var thunder: UIButton!
    
    var segmentindex : Int?
    
    @IBAction func back(_ sender: Any) {
        let view = self.storyboard?.instantiateViewController(withIdentifier: "tabbar")
        //이동할 때 화면 coverVertical로 보여줘
        view?.modalTransitionStyle = UIModalTransitionStyle.coverVertical
        self.present(view!, animated: true, completion: nil)
        
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = table.dequeueReusableCell(withIdentifier: "QuestCell") as! QuestCell
        
        if segmentindex == 0 {

            cell.thunder.setImage(UIImage(named: "green.png"), for: .normal)
            cell.progressbar.progressImage = UIImage(named: "greenbar.png")
            cell.reward.textColor = UIColor(displayP3Red: 174/255, green: 203/255, blue: 168/255, alpha: 1)

        }

        else if segmentindex == 1 {

            cell.thunder.setImage(UIImage(named: "bluethunder.png"), for: .normal)
            cell.progressbar.progressImage = UIImage(named: "bluebar.png")
            cell.reward.textColor = UIColor(displayP3Red: 116/255, green: 165/255, blue: 202/255, alpha: 1)

        }
        else if segmentindex == 2{

            cell.thunder.setImage(UIImage(named: "purplethunder.png"), for: .normal)
            cell.progressbar.progressImage = UIImage(named: "purplebar.png")
            cell.reward.textColor = UIColor(displayP3Red: 92/255, green: 66/255, blue: 183/255, alpha: 1)

        }
        else {

            cell.thunder.setImage(UIImage(named: "purplethunder.png"), for: .normal)
        }
        
        
 
        
        
        return cell
    }

    @IBAction func segment(_ sender: UISegmentedControl) {
        
        segmentindex = sender.selectedSegmentIndex
        
        
        //Daily
        if sender.selectedSegmentIndex == 0 {

           segment.tintColor = UIColor(displayP3Red: 174/255, green: 203/255, blue: 168/255, alpha: 1)
            let gradientImage = UIImage.gradientImage(with: progressbar.frame,
                                                      colors: [UIColor(displayP3Red: 132/255, green: 205/255, blue: 0/255, alpha: 0.7).cgColor, UIColor(displayP3Red: 0/255, green: 201/255, blue: 178/255, alpha: 0.7).cgColor],
                                                      locations: nil)
            
            progressbar.progressImage = gradientImage!
            progressbar.setProgress(1, animated: true)
            
            self.thunder.setImage(UIImage(named: "green.png"), for: .normal)
            self.reward.image = UIImage(named: "greenreward.png")

            
            
            
           
        }
        //Weekly
        else if sender.selectedSegmentIndex == 1 {
            
             segment.tintColor = UIColor(red: 116/255, green: 165/255, blue: 202/255, alpha: 1)
            let gradientImage = UIImage.gradientImage(with: progressbar.frame,
                                                      colors: [UIColor(displayP3Red: 87/255, green: 155/255, blue: 207/255, alpha: 0.7).cgColor, UIColor(displayP3Red: 4/255, green: 65/255, blue: 255/255, alpha: 0.7).cgColor],
                                                      locations: nil)
            progressbar.progressImage = gradientImage!
            progressbar.setProgress(1, animated: true)
            
             self.thunder.setImage(UIImage(named: "bluethunder.png"), for: .normal)
             self.reward.image = UIImage(named: "bluereward.png")

            

           
        }
        //Monthly
        else if sender.selectedSegmentIndex == 2 {

            segment.tintColor = UIColor(red: 92/255, green: 66/255, blue: 183/255, alpha: 1)
            
            let gradientImage = UIImage.gradientImage(with: progressbar.frame,
                                                      colors: [UIColor(displayP3Red: 142/255, green: 87/255, blue: 207/255, alpha: 0.7).cgColor, UIColor(displayP3Red: 202/255, green: 0/255, blue: 70/255, alpha: 0.7).cgColor],
                                                      locations: nil)
            
            progressbar.progressImage = gradientImage!
            progressbar.setProgress(0.75, animated: true)
            
            self.thunder.setImage(UIImage(named: "purplethunder.png"), for: .normal)
            let purple = UIImage(named: "purplereward.png")
            self.reward.image = purple
   
            


            
        }
        //Chlalenge
        else {
            segment.tintColor = UIColor(red: 162/255, green: 32/255, blue: 58/255, alpha: 1)
            
            let gradientImage = UIImage.gradientImage(with: progressbar.frame,
                                                      colors: [UIColor(displayP3Red: 255/255, green: 255/255, blue: 255/255, alpha: 0.7).cgColor, UIColor(displayP3Red: 162/255, green: 32/255, blue: 58/255, alpha: 0.7).cgColor],
                                                      locations: nil)
            
            progressbar.progressImage = gradientImage!
            progressbar.setProgress(0.75, animated: true)
            
            self.thunder.setImage(UIImage(named: "redthunder.png"), for: .normal)
            
        }
        //테이블 뷰 셀 값이 바뀌려면 리로드를 꼭 해줘야함!
        table.reloadData()
        
        
        
        
    }
    

    @IBOutlet weak var table: UITableView!
    
    @IBOutlet weak var segment: UISegmentedControl!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        segmentindex = self.segment.selectedSegmentIndex
        
        let gradientImage = UIImage.gradientImage(with: progressbar.frame,
                                                  colors: [UIColor(displayP3Red: 132/255, green: 205/255, blue: 0/255, alpha: 0.7).cgColor, UIColor(displayP3Red: 0/255, green: 201/255, blue: 178/255, alpha: 0.7).cgColor],
                                                  locations: nil)
       
        progressbar.progressImage = gradientImage!
        progressbar.setProgress(0.75, animated: true)
        
        //세그먼트 컨트롤 텍스트 색 바꾸기
        let attributes = [ NSAttributedString.Key.foregroundColor : UIColor.lightGray,
                           NSAttributedString.Key.font : UIFont.systemFont(ofSize: 14)];
        let attributesSelected = [ NSAttributedString.Key.foregroundColor : UIColor.white,
                                   NSAttributedString.Key.font : UIFont.systemFont(ofSize: 14)];
        segment.setTitleTextAttributes(attributes, for: UIControl.State.normal)
        segment.setTitleTextAttributes(attributesSelected, for: UIControl.State.selected)
}
    
    
        
    }

//프로그레스뷰 그레디언트
fileprivate extension UIImage {
    static func gradientImage(with bounds: CGRect,
                              colors: [CGColor],
                              locations: [NSNumber]?) -> UIImage? {
        
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = bounds
        gradientLayer.colors = colors
        // This makes it horizontal
        gradientLayer.startPoint = CGPoint(x: 0.0,
                                           y: 0.5)
        gradientLayer.endPoint = CGPoint(x: 1.0,
                                         y: 0.5)
        
        UIGraphicsBeginImageContext(gradientLayer.bounds.size)
        gradientLayer.render(in: UIGraphicsGetCurrentContext()!)
        guard let image = UIGraphicsGetImageFromCurrentImageContext() else { return nil }
        UIGraphicsEndImageContext()
        return image
    }
}





    


