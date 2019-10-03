//
//  ViewController.swift
//  ImageRecognitionDemo
//
//  Created by Cyril Garcia on 10/2/19.
//  Copyright © 2019 Cyril Garcia. All rights reserved.
//

import UIKit
import Vision

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        classify(image: UIImage(named: "dog")!.cgImage!)
        classify(image: UIImage(named: "cat")!.cgImage!)
        classify(image: UIImage(named: "parrot")!.cgImage!)
    }
    
    func classify(image: CGImage) {
        
        let petsModel = try? VNCoreMLModel(for: Pets().model)
        
        let visionRequest = VNCoreMLRequest(model: petsModel!) { (request, error) in
            
            let results = request.results as? [VNClassificationObservation]
            
            let label = results?.first?.identifier
            let confidenceLevel = results?.first?.confidence
            
            print(label!, confidenceLevel!)
            
        }
        
        try? VNImageRequestHandler(cgImage: image, options: [:]).perform([visionRequest])
        
    }

}
