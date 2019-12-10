//
//  ViewController.swift
//  MySwiftFirst
//
//  Created by Chun-Yen Wang on 7/14/18.
//  Copyright © 2018 Chun-Yen Wang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var recordingLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func recordAudio(_ sender: Any) {
        print("Record button is pressed")
        recordingLabel.text = "Recording in progress"
    }
    
    @IBAction func stopRecording(_ sender: Any) {
        print("Stop Recording button is pressed")
        recordingLabel.text = "Tab to Record"
    }
}

