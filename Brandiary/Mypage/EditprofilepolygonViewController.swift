
import UIKit

class EditprofilepolygonViewController: UIViewController,UITableViewDelegate,UITableViewDataSource,UICollectionViewDataSource,UICollectionViewDelegate {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       let cell = table.dequeueReusableCell(withIdentifier: "profilepolygonHeader") as! profilepolygonHeader
               
               return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        8
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
         let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "polygonprofileCollection", for: indexPath) as! polygonprofileCollection
        
        cell.something.layer.cornerRadius = 5
        cell.something.layer.masksToBounds = true
        let tap = UITapGestureRecognizer(target: self, action: #selector(EditprofilepolygonViewController.tap(_:)))
        cell.something.isUserInteractionEnabled = true
        cell.something.addGestureRecognizer(tap)
               return cell
    }
    @objc func tap(_ sender:UITapGestureRecognizer){

       let label:UILabel = (sender.view as! UILabel)
        if label.backgroundColor == UIColor(displayP3Red: 162/255, green: 32/255, blue: 58/255, alpha: 1) {
                 label.backgroundColor = UIColor(displayP3Red: 174/255, green: 174/255, blue: 174/255, alpha: 1)
             }else{
                  label.backgroundColor = UIColor(displayP3Red: 162/255, green: 32/255, blue: 58/255, alpha: 1)
             }
        
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let cell = table.dequeueReusableCell(withIdentifier: "profilepolygonCell") as! profilepolygonCell
    

        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        135
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        285
    }
    
    
   
    
    @IBOutlet weak var table: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based appliㄴcation, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
