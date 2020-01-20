//
//  Selecttag.swift
//  Brandiary
//
//  Created by young on 27/07/2019.
//  Copyright © 2019 young. All rights reserved.
//

import UIKit

class Selecttag: UIViewController,UITableViewDelegate,UITableViewDataSource {

    var moreless = "more"
    var test = false
    var headerheight = 485
    var currentimage = 0
    var image = UIImage(named: "rollsroyce-4.jpg")
    var label1 = "something"
    var label2 = "something"
    var label3 = "something"
    var caption = "somethingsomethingsomethingsomethingsomethingsomethingsomethingsomethingsomethingsomethingsomethingsomethingsomethingsomethingsomethingsomethingsomethingsomethingsomethingsomethingsomethingsomethingsomethingsomethingsomethingsomethingsomethingsomethingsomethingsomethingsomethingsomethingsomethingsomethingsomethingsomethingsomethingsomethingsomethingsomethingsomethingsomethingsomethingsomethingsomethingsomethingsomethingsomethingsomethingsomethingsomethingsomethingsomethingsomethingsomethingsomethingsomethingsomethingsomethingsomethingsomethingsomethingsomethingsomethingsomethingsomethingsomethingsomethingsomething"
    private var morebool = false
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 1
    }
    
 
     @objc func respondToSwipeGesture(gesture: UIGestureRecognizer) {
                    

                    if let swipeGesture = gesture as? UISwipeGestureRecognizer {


                        switch swipeGesture.direction {
                        case UISwipeGestureRecognizer.Direction.left:
                            if currentimage == images.count - 1 {
                                currentimage = 0
    
                            }else{
                                currentimage += 1
                            }
                            image = images[currentimage]
                            
                            table.reloadData()
                            
                            print("skfjkslafjsalk")

                        case UISwipeGestureRecognizer.Direction.right:
                            if currentimage == 0 {
                                currentimage = images.count - 1
                            }else{
                                currentimage -= 1
                            }

                            
                             image = images[currentimage]
                             table.reloadData()
                            print("skfjkslafjsalk")
                        default:
                            break
                        }
                    }
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = table.dequeueReusableCell(withIdentifier: "SelecttagCell") as! SelecttagCell
                    
                  cell.tag1.text = label1
                  cell.tag2.text = label2
                  cell.tag3.text = label3
                  cell.caption.text = caption
                    
                    cell.morebtn.addTarget(self, action: #selector(Selecttag.more), for: .touchUpInside)

                  cell.caption.numberOfLines = 0
                        cell.caption.sizeToFit()
                   cell.morebtn.setTitle(moreless, for: .normal)
                  cell.morebtn.isHidden = morebool
                  cell.photonumber.backgroundColor = #colorLiteral(red: 0.3536440134, green: 0.3536530137, blue: 0.3536481857, alpha: 1)
                  cell.photo.image = image
                       cell.photonumber.text = "\(currentimage)" + "/" + "\(images.count - 1)"
                  
                  
                   return cell
       }
    
    
    @objc
        func more(sender:UIButton) {
        
         let more:UIButton = sender
        
        let Font = UIFont.italicSystemFont(ofSize: 12)
              let height = heightForView(text:caption, font: Font, width: 360)
        
        if more.currentTitle == "more"{
                  headerheight = 485 - 45 + Int(height)
                  morebool = true
              }
       
              print("\(String(describing: more.currentTitle))")
              
              table.reloadData()
        
    }
    
func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
    return CGFloat(headerheight)
    }
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        165
    }
    
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let cell = table.dequeueReusableCell(withIdentifier: "SelecttagFooterCell") as! SelecttagFooterCell
      cell.nextbtn.addTarget(self, action:#selector(Selecttag.next(_sender:)) , for: UIControl.Event.touchUpInside)
        cell.select.layer.cornerRadius = 5
        cell.select.layer.masksToBounds = true
       
        return cell
    }
    
     @objc
       func next(_sender:UIButton) {
        
        morebool = false
        headerheight = 485

            image = UIImage(named: "Chancetherapper.jpeg")
                   caption = "뭔가 예감 좋아 번뜩 악상이 떠올라 금토일도 월요일같이 사는 내게상 줄 거야 alright 올해도 스케줄 꽉 찼고 길 가면 다 알아보고 Fanxy child 겁나 핫하고 그런데도 나 외로워 What should I do 지루해 죽기 직전인 사람뭔가 예감 좋아 번뜩 악상이 떠올라 금토일도 월요일같이 사는 내게상 줄 거야 alright 올해도 스케줄 꽉 찼고 길 가면 다 알아보고 Fanxy child 겁나 핫하고 그런데도 나 외로워 What should I do 지루해 죽기 직전인 사람뭔가 예감 좋아 번뜩 악상이 떠올라 금토일도 월요일같이 사는 내게상 줄 거야 alright 올해도 스케줄 꽉 찼고 길 가면 다 알아보고 Fanxy child 겁나 핫하고 그런데도 나 외로워 What should I do 지루해 죽기 직전인 사람"
                   label1 = "#something"
                   label2 = "#anyoung"
                   label3 = "#test"
                    selecttapnumber = 0
                   table.reloadData()
    }
    
    @IBAction func store(_ sender: Any) {
        if storeitem.image == UIImage(named: "back1.png"){
                  storeitem.image = UIImage(named: "store.png")
                  
              }else{
                  tabbarindex = 3
                  let view = self.storyboard?.instantiateViewController(withIdentifier: "Store")
                                                               //이동할 때 화면 coverVertical로 보여줘
                                                               view?.modalTransitionStyle = UIModalTransitionStyle.coverVertical
             view?.modalPresentationStyle = .fullScreen
                                                               self.present(view!, animated: true, completion: nil)
                  
              }
    }
    @IBAction func setting(_ sender: Any) {
        tabbarindex = 3
        let view = self.storyboard?.instantiateViewController(withIdentifier: "SearchSetting")
                                              //이동할 때 화면 coverVertical로 보여줘
                                              view?.modalTransitionStyle = UIModalTransitionStyle.coverVertical
        view?.modalPresentationStyle = .fullScreen
                                              self.present(view!, animated: true, completion: nil)
        print("눌렀어용")
    }
    
   

    @IBOutlet weak var storeitem: UIBarButtonItem!
    @IBOutlet weak var settingbtn: UIBarButtonItem!
    @IBOutlet weak var table: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
  
        
        let swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(Main.respondToSwipeGesture(gesture:)))
                                      swipeRight.direction = UISwipeGestureRecognizer.Direction.right
                                     

                                let swipeLeft = UISwipeGestureRecognizer(target: self, action: #selector(Main.respondToSwipeGesture(gesture:)))
                                      swipeLeft.direction = UISwipeGestureRecognizer.Direction.left
                                      
                                
                                
                                table.addGestureRecognizer(swipeLeft)
                                table.addGestureRecognizer(swipeRight)
        
        let imageView = UIImageView(frame: CGRect(x: 100, y: 0, width: 300, height: 30))
        imageView.contentMode = .scaleAspectFit
        let image = UIImage(named: "titlelogo.png")
        imageView.image = image
        navigationItem.titleView = imageView

    }
    
    
    @IBAction func bell(_ sender: Any) {
        
        let alertservice = alertService()
        let alert = alertservice.Reporttable()
                  present(alert,animated: true,completion: nil)
    }
    

    }
    
    



//라벨에 패딩주기
@IBDesignable class PaddingLabel: UILabel {
    
    @IBInspectable var topInset: CGFloat = 2.0
    @IBInspectable var bottomInset: CGFloat = 2.0
    @IBInspectable var leftInset: CGFloat = 5.0
    @IBInspectable var rightInset: CGFloat = 5.0
    
    override func drawText(in rect: CGRect) {
        let insets = UIEdgeInsets.init(top: topInset, left: leftInset, bottom: bottomInset, right: rightInset)
        super.drawText(in: rect.inset(by: insets))
    }
    
    override var intrinsicContentSize: CGSize {
        let size = super.intrinsicContentSize
        return CGSize(width: size.width + leftInset + rightInset,
                      height: size.height + topInset + bottomInset)
    }
}

func heightForView(text:String, font:UIFont, width:CGFloat) -> CGFloat{
    let label:UILabel = UILabel(frame: CGRect(x: 0, y: 0, width: width, height: CGFloat.greatestFiniteMagnitude))
    label.numberOfLines = 0
    label.lineBreakMode = NSLineBreakMode.byWordWrapping
    label.font = font
    label.text = text
    label.sizeToFit()

    return label.frame.height
}

