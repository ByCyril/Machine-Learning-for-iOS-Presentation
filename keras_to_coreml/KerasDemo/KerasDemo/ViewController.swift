//
//  ViewController.swift
//  KerasDemo
//
//  Created by Cyril Garcia on 10/7/19.
//  Copyright © 2019 Cyril Garcia. All rights reserved.
//

import UIKit
import CoreML

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let model = KerasModel()
        
        let prediction1 = try? model.prediction(array: convertToMLArray([1,1,0])!)
        print(prediction1?.results)
        
        let prediction2 = try? model.prediction(array: convertToMLArray([1,0,0])!)
        print(prediction2?.results)
        
        let prediction3 = try? model.prediction(array: convertToMLArray([1,-1,0])!)
        print(prediction3?.results)
        
    }
    
    func convertToMLArray(_ input: [Int]) -> MLMultiArray? {

        do {
            let mlArray = try MLMultiArray(shape: [3], dataType: MLMultiArrayDataType.float32)
            
            for i in 0..<input.count {
                mlArray[i] = NSNumber(value: input[i])
            }
            
            return mlArray

        } catch {
            print(error.localizedDescription)
            return nil
        }

     }


}

