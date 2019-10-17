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
        classify(image: UIImage(named: "parrot")!.cgImage!)
        classify(image: UIImage(named: "cat")!.cgImage!)
        
    }
    
    func classify(image: CGImage) {
        
        let vnModel = try! VNCoreMLModel(for: Pets().model)
        
        let visionRequest = VNCoreMLRequest(model: vnModel) { (request, error) in
            
            let results = request.results as? [VNClassificationObservation]
            
            let predictedLabel = results?.first?.identifier
            let confidenceLevel = results?.first?.confidence
            
            print(predictedLabel!, confidenceLevel!)
            
        }
        
        try? VNImageRequestHandler(cgImage: image, options: [:]).perform([visionRequest])
        
    }

}
