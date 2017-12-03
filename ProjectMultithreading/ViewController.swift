//
//  ViewController.swift
//  ProjectMultithreading
//
//  Created by Elena Goroshko on 11/29/17.
//  Copyright © 2017 Elena Goroshko. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet private weak var ibStackView: UIStackView!
    @IBOutlet private weak var imageView1: UIImageView!
    @IBOutlet private weak var imageView2: UIImageView!
    @IBOutlet private weak var imageView3: UIImageView!
    
    private let imageArray1 = [
        "http://www.kartinki.me/mini/201508/21765.jpg",
        "http://www.kartinki.me/mini/201409/20844.jpg",
        "http://www.kartinki.me/mini/201501/21333.jpg",
        "http://www.kartinki.me/mini/201309/15787.jpg"
    ]
    private let imageArray2 = [
        "http://www.kartinki.me/mini/201307/14415.jpg",
        "http://www.kartinki.me/mini/201308/14991.jpg",
        "http://www.kartinki.me/mini/201306/12019.jpg",
        "http://www.kartinki.me/mini/201209/8133.jpg"
    ]
    private let imageArray3 = [
        "http://www.kartinki.me/mini/201405/20025.jpg",
        "http://www.kartinki.me/mini/201509/21808.jpg",
        "http://www.kartinki.me/mini/201508/21766.jpg",
        "http://www.kartinki.me/mini/201312/16606.jpg"
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        if size.height < size.width {
           ibStackView.axis = .horizontal
        } else {
            ibStackView.axis = .vertical
        }
    }

    @IBAction func pefreshPresed(_ sender: UIButton) {
    }
}
