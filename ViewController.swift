//
//  ViewController.swift
//  dynamicChart
//
//  Created by Gering Dong on 11/4/19.
//  Copyright © 2019 Gering Dong. All rights reserved.
//

import UIKit
import Charts

class ViewController: UIViewController {

    @IBOutlet weak var thor: UIStepper!
    @IBOutlet weak var superman: UIStepper!
    @IBOutlet weak var hulk: UIStepper!
    
    @IBOutlet weak var chart: PieChartView!
    
    
    
    var thor1 = PieChartDataEntry(value:0)
    var superman1 = PieChartDataEntry(value:0)
    var hulk1 = PieChartDataEntry(value:0)
    
    var numOfDataEntry = [PieChartDataEntry]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //chart.chartDescription?.text = ""
        thor1.value = thor.value
        thor1.label = "thor"
        superman1.value = superman.value
        superman1.label = "superman"
        hulk1.value = hulk.value
        hulk1.label = "hulk"
        
        numOfDataEntry = [thor1,superman1,hulk1]
        updateChartData()
        
        
    }
    
    func updateChartData(){
        let chartDataSet = PieChartDataSet(entries: numOfDataEntry, label: nil)
        let chartData = PieChartData(dataSet: chartDataSet)
        
        let redcolor = UIColor(red: CGFloat(255.0/255), green: CGFloat(0/255), blue: CGFloat(0/255), alpha: 1)
       // let greencolor = UIColor(red: CGFloat(0/255), green: CGFloat(128.0/255), blue: CGFloat(0/255), alpha: 1)
        
        var  colors: [UIColor] = []
        colors.append(UIColor.green)
        colors.append(UIColor.blue)
        colors.append(UIColor.black)
        
        for i in 0..<chartDataSet.count {
            let red = Double(arc4random_uniform(256))
            let green = Double(arc4random_uniform(256))
            let blue = Double(arc4random_uniform(256))

            let color = UIColor(red: CGFloat(red/255), green: CGFloat(green/255), blue: CGFloat(blue/255), alpha: 1)
        colors.append(color)
            
        }
        chartDataSet.colors = colors
    
        
        //chartDataSet.colors = [redcolor]
        
        chart.data = chartData
    }

    @IBAction func forThor(_ sender: UIStepper) {
        thor1.value = sender.value
        updateChartData()
    }
    
    @IBAction func forSuperman(_ sender: UIStepper) {
        superman1.value = sender.value
        updateChartData()
    }
    
    @IBAction func froHulk(_ sender: UIStepper) {
        hulk1.value = sender.value
        updateChartData()
    }
    
}

