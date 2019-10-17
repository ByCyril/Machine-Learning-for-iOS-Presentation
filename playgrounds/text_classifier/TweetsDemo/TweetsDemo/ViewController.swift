//
//  ViewController.swift
//  TweetsDemo
//
//  Created by Cyril Garcia on 10/3/19.
//  Copyright © 2019 Cyril Garcia. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var textField: UITextField!
    @IBOutlet var resultsLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func classify() {
        let model = Tweets()
        let input = bow(text: textField.text!)
        
        let prediction = try? model.prediction(Tweet: input)
        resultsLabel.text = "\(prediction!.Sentiment)"
        print(prediction?.SentimentProbability)
    }
    
//    Straight from the TuriCreate documentation
    func bow(text: String) -> [String: Double] {
        var bagOfWords = [String: Double]()
        
        let tagger = NSLinguisticTagger(tagSchemes: [.tokenType], options: 0)
        let range = NSRange(location: 0, length: text.utf16.count)
        let options: NSLinguisticTagger.Options = [.omitPunctuation, .omitWhitespace]
        tagger.string = text.lowercased()
        
        tagger.enumerateTags(in: range, unit: .word, scheme: .tokenType, options: options) { _, tokenRange, _ in
            let word = (text as NSString).substring(with: tokenRange)
            if bagOfWords[word] != nil {
                bagOfWords[word]! += 1
            } else {
                bagOfWords[word] = 1
            }
        }
        
        return bagOfWords
    }
    


}

