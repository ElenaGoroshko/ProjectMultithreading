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

    @IBOutlet weak var activityIndicatorView1: UIActivityIndicatorView!
    @IBOutlet weak var activityIndicatorView2: UIActivityIndicatorView!
    @IBOutlet weak var activityIndicatorView3: UIActivityIndicatorView!

    
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

    private var imageIndex1 = 0
    private var imageIndex2 = 0
    private var imageIndex3 = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        loadAllImage()

    }
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        if size.height < size.width {
           ibStackView.axis = .horizontal
        } else {
            ibStackView.axis = .vertical
        }
    }

    @IBAction func pefreshPresed(_ sender: UIButton) {
        imageIndex1 = (imageIndex1 + 1) % imageArray1.count
        imageIndex2 = (imageIndex2 + 1) % imageArray2.count
        imageIndex3 = (imageIndex3 + 1) % imageArray3.count
        loadAllImage()
    }

    // MARK: private methods
    private func loadAllImage() {
        loadImage(imageView: imageView1, imageArray: imageArray1, indexImage: imageIndex1,
                  indicator: activityIndicatorView1)

        loadImage(imageView: imageView2, imageArray: imageArray2, indexImage: imageIndex2,
                  indicator: activityIndicatorView2)

        loadImage(imageView: imageView3, imageArray: imageArray3, indexImage: imageIndex3,
                  indicator: activityIndicatorView3)
    }

    private func indicatorStart(indicator: UIActivityIndicatorView) {
        indicator.startAnimating()
        indicator.isHidden = false
    }
    private func indicatorStop(indicator: UIActivityIndicatorView) {
        DispatchQueue.main.async {
            indicator.stopAnimating()
            indicator.isHidden = true
        }
    }
    private func loadImage(imageView: UIImageView, imageArray: [String],
                           indexImage: Int, indicator: UIActivityIndicatorView ) {
        imageView.image = nil
        guard indexImage >= 0, indexImage < imageArray.count else { return }
        let imageStringUrl = imageArray[indexImage]
        guard let url = URL(string: imageStringUrl) else { return }
        indicatorStart(indicator: indicator)

        DispatchQueue.global().async { [weak self] in
            guard let imageData = try? Data(contentsOf: url) else {
                self?.indicatorStop(indicator: indicator)
                return
            }
            let loadedImage = UIImage(data: imageData)
            DispatchQueue.main.async { [weak self] in
               imageView.image = loadedImage
               self?.indicatorStop(indicator: indicator)
            }
        }
    }
}
