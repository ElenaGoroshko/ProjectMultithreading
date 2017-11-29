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
