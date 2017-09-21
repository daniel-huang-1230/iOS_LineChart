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
        
        if let input = Double(textBox.text!) {  //the input num is expected to be double
      
        textBox.text? = ""    //clean the text field once the button is pressed
        numbers.append(input) //here we add the data entered by the user to the array
        updateGraph()
        } else{
            textBox.text? = ""   
            
        }
    }
    func updateGraph(){
        
        var lineChartEntry = [ChartDataEntry]()
        
        //iterate through a
        for i in 0..<numbers.count{
            
            let value = ChartDataEntry(x: Double(i), y: numbers[i])
            
            lineChartEntry.append(value)
            
        }
        
        //now we need to create the actual line
        
        let first_line = LineChartDataSet(values: lineChartEntry, label: "Number")
        
        //set the color to yellow
        
        first_line.colors = [NSUIColor.yellow]
        
        // CAN-DO: further customization!!
        
        let data = LineChartData() // the object that the chart displays and will be plotted with the line I just created
        
        data.addDataSet(first_line)
        
        chartView.chartDescription?.text = "Daniel's first line chart"
        chartView.data = data // lastly, update the view, bang!
        
    }
    
}

