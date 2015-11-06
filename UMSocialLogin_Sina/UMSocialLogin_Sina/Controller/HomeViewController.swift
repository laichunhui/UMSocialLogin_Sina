//
//  HomeViewController.swift
//  UMSocialLogin_Sina
//
//  Created by laichunhui on 15/11/5.
//  Copyright © 2015年 lch. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet weak var userName: UILabel!
    @IBOutlet weak var imageIcon: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func awakeFromNib() {
        
        UMSocialDataService.defaultDataService().requestSnsInformation(UMShareToSina) { (response) -> Void in
            print(response.data)
            self.userName.text = response.data["screen_name"] as? String
            self.userName.sizeToFit()
            self.imageIcon.kf_setImageWithURL(NSURL(string: (response.data["profile_image_url"] as? String)!)!)
            
        }

    }
    
    /// 注销

    @IBAction func logout() {
            
            self.dismissViewControllerAnimated(true, completion: nil)
        
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
