//
//  storeViewController.swift
//  
//
//  Created by young on 02/08/2019.
//

import UIKit
import StoreKit

class storeViewController: UIViewController,UITableViewDelegate,UITableViewDataSource,SKPaymentTransactionObserver {
    
    let boosterID = "com.young.Brandiary.Booster"
    
func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = table.dequeueReusableCell(withIdentifier: "StoreHeaderCell") as! StoreHeadCell
        let backgroundView = UIView()
        backgroundView.backgroundColor = UIColor.white
        cell.selectedBackgroundView = backgroundView
        
        if indexPath.row == 0{
            cell.purple.image = UIImage(named: "p@3x.png")
        }
        else if indexPath.row == 1{
            cell.purple.image = UIImage(named: "bluethunder.png")
        
        }
        else{
        cell.purple.image = UIImage(named: "g@3x.png")
        }
        
        return cell
    }
    
    
    
    @IBOutlet weak var youlabel: UILabel!
    @IBOutlet weak var table: UITableView!
    @IBOutlet weak var dollar1: UIButton!
    @IBOutlet weak var plus: UILabel!
    @IBOutlet weak var xnumber2: UILabel!
    @IBOutlet weak var thunder2: UIImageView!
    @IBOutlet weak var thunderview2: UIView!
    @IBOutlet weak var thunderview1: UIView!
    @IBOutlet weak var xnumber1: UILabel!
    @IBOutlet weak var thunder1: UIImageView!
    @IBOutlet weak var event: UILabel!
    @IBOutlet weak var cellview: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
         SKPaymentQueue.default().add(self)
       
        
        cellview.layer.borderWidth = 1
        cellview.layer.borderColor = UIColor(red:222/255, green:225/255, blue:227/255, alpha: 1).cgColor
        cellview.layer.cornerRadius = 8
        cellview.layer.masksToBounds = true
        
        dollar1.layer.cornerRadius = 20
        dollar1.layer.masksToBounds = true
    }
    
    @IBAction func Purchase(_ sender: Any) {
        if SKPaymentQueue.canMakePayments(){
            let paymentRequest = SKMutablePayment()
            paymentRequest.productIdentifier = boosterID
            SKPaymentQueue.default().add(paymentRequest)
            print("구매가 가능합니다.")
        }
        else {
            print("구매할 수 없습니다.")
        }
    }
 
    
    func paymentQueue(_ queue: SKPaymentQueue, updatedTransactions transactions: [SKPaymentTransaction]) {
           for transaction in transactions {
               if transaction.transactionState == .purchased { // 아이템이 구매되었을 때
                   print("구매 성공")
               }
               else if transaction.transactionState == .failed{ //구매에 실패 했을 때
                   print("구매 실패")
               }
           }
       }

}

@IBDesignable
class GradientView: UIView {

    @IBInspectable var startColor:   UIColor = .black { didSet { updateColors() }}
    @IBInspectable var endColor:     UIColor = .white { didSet { updateColors() }}
    @IBInspectable var startLocation: Double =   0.05 { didSet { updateLocations() }}
    @IBInspectable var endLocation:   Double =   0.95 { didSet { updateLocations() }}
    @IBInspectable var horizontalMode:  Bool =  false { didSet { updatePoints() }}
    @IBInspectable var diagonalMode:    Bool =  false { didSet { updatePoints() }}

    override public class var layerClass: AnyClass { CAGradientLayer.self }

    var gradientLayer: CAGradientLayer { layer as! CAGradientLayer }

    func updatePoints() {
        if horizontalMode {
            gradientLayer.startPoint = diagonalMode ? .init(x: 1, y: 0) : .init(x: 0, y: 0.5)
            gradientLayer.endPoint   = diagonalMode ? .init(x: 0, y: 1) : .init(x: 1, y: 0.5)
        } else {
            gradientLayer.startPoint = diagonalMode ? .init(x: 0, y: 0) : .init(x: 0.5, y: 0)
            gradientLayer.endPoint   = diagonalMode ? .init(x: 1, y: 1) : .init(x: 0.5, y: 1)
        }
    }
    func updateLocations() {
        gradientLayer.locations = [startLocation as NSNumber, endLocation as NSNumber]
    }
    func updateColors() {
        gradientLayer.colors = [startColor.cgColor, endColor.cgColor]
    }
    override public func layoutSubviews() {
        super.layoutSubviews()
        updatePoints()
        updateLocations()
        updateColors()
    }
}
