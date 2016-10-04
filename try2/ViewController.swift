//
//  ViewController.swift
//  try2
//
//  Created by kei ikeuchi on 2016/10/04.
//  Copyright © 2016年 mycompany. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var goButton: UIButton!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var play: UIButton!
    
    @IBAction func tap(sender: AnyObject) {
        performSegueWithIdentifier("second", sender: nil)
        
    }
    
    
    var countnumber: Int = 0
    var photosImage: UIImage!
    var timer: NSTimer!
    
    let images = ["IMG_1010","IMG_1694","IMG_1718","IMG_1963","IMG_2131"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let image:UIImage! = UIImage(named: images[0])
        imageView.image = image
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    
    
    //進むボタンで次の写真
    @IBAction func go(sender: AnyObject) {
        nextPage()
    }
    
    //戻るボタンで前の写真
    @IBAction func back(sender: AnyObject) {
        if countnumber != 0{
            countnumber -= 1
        }else if countnumber == 0{
            countnumber = images.count-1
        }
        imageDisplay()
    }
    
    
    //スライドショー開始/停止ボタン
    @IBAction func play(sender: AnyObject) {
        if timer == nil{
            onUpdate()
            goButton.enabled = false
            backButton.enabled = false
            play.setTitle("Stop", forState: UIControlState())
        }else{
            timer?.invalidate()
            timer = nil
            goButton.enabled = true
            backButton.enabled = true
            play.setTitle("Play", forState: UIControlState())
        }
    }
    
    //次の画像表示
    func nextPage(){
        if countnumber < images.count-1{
            countnumber += 1
        } else if countnumber == images.count-1{
            countnumber = 0
        }
        
        imageDisplay()
    }
    
    //imageView.imageの画像を更新
    func imageDisplay(){
        photosImage = UIImage(named: images[countnumber])
        imageView.image = photosImage
    }
    
    //決めた秒数になると画像を自動でスライド
    func onUpdate(){
        timer = NSTimer.scheduledTimerWithTimeInterval(2.0, target:self, selector:#selector(ViewController.nextPage) , userInfo: nil, repeats: true)
    }
    
    @IBAction func unwind(segue: UIStoryboardSegue) {
        if timer == nil{
            onUpdate()
        }
        
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?){
        let secondViewController:SecondViewController = segue.destinationViewController as! SecondViewController
        secondViewController.image = imageView.image
        timer?.invalidate()
        timer = nil
    }

    

}

