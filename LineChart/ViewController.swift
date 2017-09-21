//
//  ViewController.swift
//  LineChart
//
//  Created by Daniel Huang on 9/21/17.
//  Copyright © 2017 Daniel Huang. All rights reserved.
//

import UIKit
import Charts
class ViewController: UIViewController {

    @IBOutlet weak var chartView: LineChartView!
    
    var numbers: [Double] = []
    
    @IBOutlet weak var textBox: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    @IBAction func goBtnPressed(_ sender: Any) {
        
        let input = Double(textBox.text!)   //the input num is expected to be double
            
        
        numbers.append(input!) //here we add the data entered by the user to the array
        updateGraph()
    }
    
    func updateGraph(){
        
        var lineChartEntry = [ChartDataEntry]()
        
        //iterate through a
        for i in 0..<numbers.count{
            
            let value = ChartDataEntry(x: Double(i), y: numbers[i])
            
            lineChartEntry.append(value)
            
        }
        
        //now we need to create the actual line
        
        let line = LineChartDataSet(values: lineChartEntry, label: "Number")
        
        //set the color to yellow
        
        line.colors = [NSUIColor.yellow]
        
        
    }
    
}

