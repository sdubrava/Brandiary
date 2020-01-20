//
//  location.swift
//  Brandiary
//
//  Created by young on 27/07/2019.
//  Copyright © 2019 young. All rights reserved.
//

import UIKit
import GooglePlaces



class location: UIViewController , UITableViewDelegate, UITableViewDataSource,UISearchBarDelegate {
    
    var placetext = String()
    var writeimage = UIImage()
    
    @IBOutlet weak var search: UISearchBar!
  

    @IBOutlet weak var table: UITableView!

    @IBOutlet weak var nextbtn: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        search.delegate = self

         self.nextbtn.backgroundColor = #colorLiteral(red: 0.9490196078, green: 0.9490196078, blue: 0.968627451, alpha: 1)
        self.nextbtn.setTitleColor(#colorLiteral(red: 0.7370592952, green: 0.7370767593, blue: 0.7370672822, alpha: 1), for: .normal)
        let backImage = UIImage(named: "back.png")

        self.navigationController?.navigationBar.backIndicatorImage = backImage

        self.navigationController?.navigationBar.backIndicatorTransitionMaskImage = backImage

        /*** If needed Assign Title Here ***/
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: UIBarButtonItem.Style.plain, target: nil, action: nil)

    }

    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        placetext = search.text ?? ""
        table.reloadData()
        

    }
    


    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "locationCell") as! locationCell
        
        if indexPath.row == 0{
            cell.location1.text = search.text
        }
        let colorView = UIView()
                                   colorView.backgroundColor = UIColor(displayP3Red: 238/255, green: 238/255, blue: 238/255, alpha: 1)
         cell.selectedBackgroundView = colorView
     

        return cell
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {

        return 65
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

         self.nextbtn.backgroundColor = #colorLiteral(red: 0.7031922936, green: 0.2011226714, blue: 0.2912405133, alpha: 1)
        self.nextbtn.setTitleColor(UIColor.white, for: .normal)
    }

    @IBAction func back(_ sender: Any) {
        NotificationCenter.default.post(name: NSNotification.Name("back"), object: nil)
       dismiss(animated: true, completion: nil)
    }

    @IBAction func next(_ sender: Any) {
       writeimage = UIImage(named: "pinNon.png")!
        writeimagesarray.append(writeimage)
        writetextsarray.append(placetext)
        receiveplacetext = placetext
        nextlocation = true
        print(writeimagesarray)
        NotificationCenter.default.post(name: NSNotification.Name("nextlocation"), object: nil)
           let view = self.storyboard?.instantiateViewController(withIdentifier: "write")
                         view?.modalTransitionStyle = UIModalTransitionStyle.coverVertical
                view?.modalPresentationStyle = .fullScreen
               self.present(view!, animated: true, completion: nil)
        

    }

}
extension location: GMSAutocompleteViewControllerDelegate {
    func viewController(_ viewController: GMSAutocompleteViewController, didAutocompleteWith place: GMSPlace) {
        print("Place name:\(place.name ?? ""))")
       dismiss(animated: true, completion: nil)
    }
    
    func viewController(_ viewController: GMSAutocompleteViewController, didFailAutocompleteWithError error: Error) {
        print(error.localizedDescription)
    }
    
    func wasCancelled(_ viewController: GMSAutocompleteViewController) {
        dismiss(animated: true, completion: nil)
    }
    
    
}


