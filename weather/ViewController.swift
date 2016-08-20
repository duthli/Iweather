//
//  ViewController.swift
//  weather
//
//  Created by do duy hung on 14/08/2016.
//  Copyright © 2016 do duy hung. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var Temp_action: UIButton!
    
    @IBOutlet weak var lbl_City: UILabel!
    @IBOutlet weak var backgroundimageview: UIImageView!
    
    @IBOutlet weak var lbl_quote: UILabel!
    
    @IBOutlet weak var Refesh_button: UIButton!
    
    @IBOutlet weak var lbl_Unit: UIButton!
    @IBAction func Refesh_action(sender: AnyObject) {
        Randtemp()
        RandCity()
        Randquote()
        RandBackground()
        setTemp()
    }
    @IBAction func Change_Temp(sender: AnyObject) {
        ChangeTemp()
    }
    var temp : Double = 0.0
    var temp_ : String = ""
    var city = ["HANOI","HO CHI MINH", "SAIGON","TAY HO"]
    var Background = ["Sun","Moon","Blood"]
    var quote = ["App nay lam boi hung",
                 "Dang Lam Do Chua Xong",
                 "Khong An Bua"]
    override func viewDidLoad() {
        super.viewDidLoad()
        UIView.setAnimationsEnabled(false)
        Randtemp()
        RandCity()
        Randquote()
        RandBackground()
        setTemp()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func Randtemp(){
        temp = Double(arc4random_uniform(18) + 14) + Double(arc4random()) / Double(INT32_MAX);
    }
    
    func RandCity()
    {
    let CityIdx = Int(arc4random_uniform(UInt32(city.count)))
        lbl_City.text = city[CityIdx]
    }
    func Randquote(){
    let quoteIdx = Int(arc4random_uniform(UInt32(quote.count)))
        lbl_quote.text = quote[quoteIdx]
    }
    func setTemp(){
        
        temp_ = String(format: "%2.1f",temp)
        Temp_action.setTitle(temp_, forState: .Normal)
    }
    func ChangeTemp(){
        let Unit = lbl_Unit.titleLabel!.text
        if (Unit == "C"){
            temp = (temp * 1.8) + 32
            setTemp()
            lbl_Unit.setTitle( String("F"), forState: .Normal)
        }
        else{
            temp = (temp - 32) / 1.8
            setTemp()
            lbl_Unit.setTitle( String("C"), forState: .Normal)
        }
    }
    func RandBackground(){
    let BackgroundIdx = Int(arc4random_uniform(UInt32(Background.count)))
        backgroundimageview.image = UIImage.init(named: Background[BackgroundIdx])
    }
}

