//
//  SettingAlphaViewController.swift
//  Fubiz
//
//  Created by Gone on 1/30/18.
//  Copyright © 2018 Gone. All rights reserved.
//

import UIKit

class SettingAlphaViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    @IBOutlet weak var TrackPicker: UIPickerView!
    
    
    
    let track = [
        "Turkish March", "Eine kleine Nachtmusik", "Queen of the Night", "Allegro Marcha", "Turca Magic Flute, Queen of the Night", "Così fan tutte", "Idomeneo", "La clemenza di Tito", "Oboe Concerto"]
    
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return track[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return track.count
    }

    //Setting
    @IBAction func Alpha(_ sender: UIButton) {
       
    }
    
    //
    @IBAction func Piano(_ sender: UIButton) {
        if TrackPicker.isHidden{
            TrackPicker.isHidden = false
        }
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        TrackPicker.isHidden = true
       
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
