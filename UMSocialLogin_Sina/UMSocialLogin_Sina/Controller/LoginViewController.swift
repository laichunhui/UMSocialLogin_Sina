//
//  ViewController.swift
//  UMSocialLogin_Sina
//
//  Created by laichunhui on 15/11/5.
//  Copyright © 2015年 lch. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    @IBAction func login() {
        
        let snsPlatform: UMSocialSnsPlatform = UMSocialSnsPlatformManager.getSocialPlatformWithName(UMShareToSina)
        
        snsPlatform.loginClickHandler(self, UMSocialControllerService.defaultControllerService(), true, {response in
            
            if response.responseCode == UMSResponseCodeSuccess {
                
                let snsAccount:UMSocialAccountEntity = UMSocialAccountManager.socialAccountDictionary()[UMShareToSina] as! UMSocialAccountEntity
                
                print("username is \(snsAccount.userName), uid is \(snsAccount.usid), token is \(snsAccount.accessToken) url is \(snsAccount.iconURL)")

                // 登录成功后的跳转页
                let homeVc = self.storyboard?.instantiateViewControllerWithIdentifier("HomeVc")
                self.presentViewController(homeVc!, animated: true, completion: nil)
            }
        })
    }

}

