//
//  AlphaWavesViewController.swift
//  Fubiz
//
//  Created by Gone on 1/26/18.
//  Copyright © 2018 Gone. All rights reserved.
//

import UIKit
import AVFoundation
import AudioToolbox

class AlphaWavesViewController: UIViewController, CAAnimationDelegate, CountdownTimerDelegate  {
    
    //    @IBOutlet weak var yanying: UIButton!
    var isRotating = false
    var shouldStopRotating = false
    var timer: Timer!
    
    var myString = String()
    var pushData = String()
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func rotateRec(imageView: UIImageView, aCircleTime: Double) { //CABasicAnimation
        
        let rotationAnimation = CABasicAnimation(keyPath: "transform.rotation")
        rotationAnimation.fromValue = 0.0
        rotationAnimation.toValue = -Double.pi * 2 //Minus can be Direction
        rotationAnimation.duration = aCircleTime
        rotationAnimation.repeatCount = .infinity
        imageView.layer.add(rotationAnimation, forKey: nil)
    }
    
    func rotateCir(imageView: UIImageView , aCircleTime: Double){
        
        let rotationAnimation = CABasicAnimation(keyPath: "transform.rotation")
        rotationAnimation.fromValue = 0.0
        rotationAnimation.toValue = Double.pi * 2 //Minus can be Direction
        rotationAnimation.duration = aCircleTime
        rotationAnimation.repeatCount = .infinity
        imageView.layer.add(rotationAnimation, forKey: nil)
    }
    
    @IBOutlet weak var RecUIImageView: UIImageView!
    
    //SOUND
    var alphaPlayer = AVAudioPlayer()
    var pianoPlayer = AVAudioPlayer()
    var oceanPlayer = AVAudioPlayer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        do {
            alphaPlayer = try AVAudioPlayer(contentsOf: URL.init(fileURLWithPath: Bundle.main.path(forResource: "Alpha8.5Hz", ofType: "mp3")!))
            alphaPlayer.prepareToPlay()
            
            let audioSession = AVAudioSession.sharedInstance()
            do{
                try audioSession.setCategory(AVAudioSessionCategoryPlayback)
            }catch{
            }
            
        }
        catch{
            print(error)
        }
        
        do {
            pianoPlayer = try AVAudioPlayer(contentsOf: URL.init(fileURLWithPath: Bundle.main.path(forResource: "Pista", ofType: "mp3")!))
            
            let pianoSession = AVAudioSession.sharedInstance()
            
            do {
                try pianoSession.setCategory(AVAudioSessionCategoryPlayback)
            } catch{
                
            }
            
        } catch {
            print(error)
        }
        do {
            
            oceanPlayer = try AVAudioPlayer(contentsOf: URL.init(fileURLWithPath: Bundle.main.path(forResource: "Oceansound", ofType: "mp3")!))
            
            //pianoPlayer.prepareToPlay() // To pause...
            let oceanSession = AVAudioSession.sharedInstance()
            
            do {
                try oceanSession.setCategory(AVAudioSessionCategoryPlayback)
            } catch{
                
            }
        } catch {
            print(error)
        }
        
        //selectedSecs = Int(myString)!
        countdownTimer.delegate = self
        countdownTimer.setTimer(hours: 0, minutes: 0, seconds: selectedSecs*60)
        progressBar.setProgressBar(hours: 0, minutes: 0, seconds: selectedSecs*60)
        stopBtn.isEnabled = false
        stopBtn.alpha = 0.5
        
        view.addSubview(messageLabel)
        
        var constraintCenter = NSLayoutConstraint(item: messageLabel, attribute: .centerX, relatedBy: .equal, toItem: self.view, attribute: .centerX, multiplier: 1, constant: 0)
        self.view.addConstraint(constraintCenter)
        constraintCenter = NSLayoutConstraint(item: messageLabel, attribute: .centerY, relatedBy: .equal, toItem: self.view, attribute: .centerY, multiplier: 1, constant: 0)
        self.view.addConstraint(constraintCenter)
        
        messageLabel.isHidden = true
        counterView.isHidden = false
        
    }
    
    //Alpha waves
    @IBAction func Alpha(_ sender: UIButton) {
        alphaPlayer.numberOfLoops = -1;
//        alphaPlayer
        alphaPlayer.play()
        
        //rotate
        self.rotateCir(imageView: self.RecUIImageView, aCircleTime: 7.0)
        
        if sender.currentImage == #imageLiteral(resourceName: "alpha-wave") {
            sender.setImage(#imageLiteral(resourceName: "alpha-waves-active"), for: .normal)
            alphaPlayer.play()
            //            self.yanying.rotate360Degrees(completionDelegate: self)
            //            self.isRotating = true
            
        }else{
            sender.setImage(#imageLiteral(resourceName: "alpha-wave"), for: .normal)
            //            self.shouldStopRotating = true
            self.rotateCir(imageView: self.RecUIImageView, aCircleTime: 10000.0)
            if alphaPlayer.play(){
                alphaPlayer.pause()
            }else{
                
            }
        }
    }
    
    //Ocean sound
    @IBAction func Ocean(_ sender: UIButton) {
        
        if sender.currentImage == #imageLiteral(resourceName: "alpha-volume-full"){
            sender.setImage(#imageLiteral(resourceName: "alpha-volume-first"), for: .normal)
            oceanPlayer.play()
            oceanPlayer.volume = 0.2
            
        }else if sender.currentImage == #imageLiteral(resourceName: "alpha-volume-first"){
            sender.setImage(#imageLiteral(resourceName: "alpha-volume-second"), for: .normal)
            oceanPlayer.volume = 0.4
            
        }else if sender.currentImage == #imageLiteral(resourceName: "alpha-volume-second"){
            sender.setImage(#imageLiteral(resourceName: "alpha-volume-ocean-maximun"), for: .normal)
            oceanPlayer.volume = 0.6
            
        }else if sender.currentImage == #imageLiteral(resourceName: "alpha-volume-ocean-maximun"){
            sender.setImage(#imageLiteral(resourceName: "alpha-ocean-volume-mute"), for: .normal)
            oceanPlayer.pause()
        }else{
            sender.setImage(#imageLiteral(resourceName: "alpha-volume-first"), for: .normal)
            oceanPlayer.play()
            oceanPlayer.volume = 0.2
        }
    }
    
    //Piano
    @IBAction func Piano(_ sender: UIButton) {
        
        if sender.currentImage == #imageLiteral(resourceName: "alpha-piano"){
            pianoPlayer.play()
            sender.setImage(#imageLiteral(resourceName: "alpha-volume-piano-st"), for: .normal)
            pianoPlayer.volume = 0.35
            
        }else if sender.currentImage == #imageLiteral(resourceName: "alpha-volume-piano-st"){
            sender.setImage(#imageLiteral(resourceName: "alpha-volume-piano-nd"), for: .normal)
            pianoPlayer.volume = 0.7
            
        }else if sender.currentImage == #imageLiteral(resourceName: "alpha-volume-piano-nd"){
            sender.setImage(#imageLiteral(resourceName: "alpha-volume-piano-rd"), for: .normal)
            pianoPlayer.volume = 1
        }else if sender.currentImage == #imageLiteral(resourceName: "alpha-volume-piano-rd"){
            sender.setImage(#imageLiteral(resourceName: "alpha-piano-mute"), for: .normal)
            pianoPlayer.pause()
        }else{
            pianoPlayer.play()
            sender.setImage(#imageLiteral(resourceName: "alpha-volume-piano-st"), for: .normal)
            pianoPlayer.volume = 0.35
        }
    }
    
    //Botton back to home
    @IBAction func BackToHome(_ sender: Any) {
        
        if pianoPlayer.isPlaying || oceanPlayer.isPlaying || alphaPlayer.isPlaying {
            pianoPlayer.pause()
            alphaPlayer.pause()
            oceanPlayer.pause()
        }
    }
    
    // Picker For Tracks
    @IBOutlet weak var progressBar: ProgressBar!
    @IBOutlet weak var hours: UILabel!
    @IBOutlet weak var minutes: UILabel!
    @IBOutlet weak var seconds: UILabel!
    @IBOutlet weak var counterView: UIStackView!
    @IBOutlet weak var stopBtn: UIButton!
    @IBOutlet weak var startBtn: UIButton!
    
    
    //MARK - Vars
    
    var countdownTimerDidStart = false
    
    lazy var countdownTimer: CountdownTimer = {
        let countdownTimer = CountdownTimer()
        return countdownTimer
    }()
    
    
    // Test, for dev
    var selectedSecs:Int = 0
    
    
    lazy var messageLabel: UILabel = {
        let label = UILabel(frame:CGRect.zero)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 24.0, weight: UIFont.Weight.light)
        label.textColor = UIColor.white
        label.textAlignment = .center
        //      label.text = "Done!"
        
        return label
    }()
    
    override var preferredStatusBarStyle : UIStatusBarStyle {
        return .lightContent
    }
    
    //MARK: - Countdown Timer Delegate
    func countdownTime(time: (hours: String, minutes: String, seconds: String)) {
        hours.text = time.hours
        minutes.text = time.minutes
        seconds.text = time.seconds
    }
    
    // Timer Done
    func countdownTimerDone() {
        
        counterView.isHidden = true
        messageLabel.isHidden = false
        seconds.text = String(selectedSecs*60)
        countdownTimerDidStart = false
        stopBtn.isEnabled = false
        stopBtn.alpha = 0.5
        //startBtn.setTitle("START",for: .normal)
        
        AudioServicesPlayAlertSound(SystemSoundID(kSystemSoundID_Vibrate))
        print("countdown Timer Done")
        
        
        // media and animate
        if pianoPlayer.isPlaying || oceanPlayer.isPlaying || alphaPlayer.isPlaying {
            
            self.rotateRec(imageView: self.UIcountdown, aCircleTime: 10000.0)
            self.rotateCir(imageView: self.RecUIImageView, aCircleTime: 10000.0)
            alphaPlayer.pause()
            oceanPlayer.pause()
            pianoPlayer.pause()
            
        }
    }
    
    @IBOutlet weak var UIcountdown: UIImageView!
    
    //MARK: - Actions
    @IBAction func startTimer(_ sender: UIButton) {
        
        messageLabel.isHidden = true
        counterView.isHidden = false
        
        if selectedSecs == 0{
            //createAlert(title: "Hi!", message: "You need to set-up countdown time")
            createAlertAndGoToLogin(errorTitle: "Hi !", errorMessage: "You need to set-up countdown time")
        }
        
        if sender.currentImage == #imageLiteral(resourceName: "timer-btn-bf") && selectedSecs != 0  {
            self.rotateRec(imageView: self.UIcountdown, aCircleTime: 7.0)
            sender.setImage(#imageLiteral(resourceName: "timer-btn-active"), for: .normal)
            
            stopBtn.isEnabled = true
            stopBtn.alpha = 1.0
            countdownTimer.start()
            progressBar.start()
            countdownTimerDidStart = true
            
        }else if sender.currentImage == #imageLiteral(resourceName: "timer-btn-active"){
            
            self.rotateRec(imageView: self.UIcountdown, aCircleTime: 10000.0)
            sender.setImage(#imageLiteral(resourceName: "timer-btn-bf"), for: .normal)
            
            countdownTimer.stop()
            progressBar.stop()
            countdownTimerDidStart = false
            stopBtn.isEnabled = false
            stopBtn.alpha = 0.5
        }
    }
    
    //Setting
    @IBAction func Setting(_ sender: Any) {
        
        performSegue(withIdentifier: "seq_alpha_to_setting", sender: self)
        
        if pianoPlayer.isPlaying || oceanPlayer.isPlaying || alphaPlayer.isPlaying {
            self.rotateRec(imageView: self.UIcountdown, aCircleTime: 10000.0)
            self.rotateCir(imageView: self.RecUIImageView, aCircleTime: 10000.0)
            alphaPlayer.pause()
            oceanPlayer.pause()
            pianoPlayer.pause()
        }
    }
    
    func createAlertAndGoToLogin(errorTitle: String, errorMessage: String) {
        let alert = UIAlertController(title: errorTitle, message: errorMessage, preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { (action) in
            // go back to the setting view controller
            // go back through the alpha view controller
            // how to? set for Storyboard ID of SettingViewController = seques
            
            let vc = self.storyboard!.instantiateViewController(withIdentifier: "alpha_setting_controller") as! AlphaSettingViewController
            self.present(vc, animated: false, completion: nil)
            
            if self.pianoPlayer.isPlaying || self.alphaPlayer.isPlaying || self.oceanPlayer.isPlaying{
                
                self.rotateRec(imageView: self.UIcountdown, aCircleTime: 10000.0)
                self.rotateCir(imageView: self.RecUIImageView, aCircleTime: 10000.0)
                self.alphaPlayer.pause()
                self.oceanPlayer.pause()
                self.pianoPlayer.pause()
                
            }
        }))
        
        alert.addAction(UIAlertAction(title: "Cancel", style: UIAlertActionStyle.default, handler: { (action) in alert.dismiss(animated: true, completion: nil)
            print("NO") }))
        
        self.present(alert, animated: true, completion: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let settingViewContr = segue.destination as! AlphaSettingViewController
        //        secondCtr.myString = String(times)
        settingViewContr.times = selectedSecs
        
        pushData = String(selectedSecs)
        
        if selectedSecs != 0 {
            settingViewContr.countdown_push = pushData
        }
    }
    
    
}


























