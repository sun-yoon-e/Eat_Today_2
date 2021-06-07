//
//  TutorialChartViewController.swift
//  Eat_Today
//
//  Created by KPUGAME on 2021/06/08.
//

import UIKit

class TutorialChartViewModel {
    var dataPoints = [Int]()
    var barColor = UIColor.systemBlue
    var maxY : Int { return dataPoints.sorted(by: >).first ?? 0 }
    var barGapPctOfTotal : CGFloat {
        return CGFloat(0.3) / CGFloat (dataPoints.count - 1)
    }
    var barWidthPctOfTotal : CGFloat {
        return CGFloat(0.7) / CGFloat(dataPoints.count)
    }
    var barCornerRadius : CGFloat {
        return CGFloat(70 / dataPoints.count)
    }
}

class TutorialChartView: UIView {
    var viewModel = TutorialChartViewModel()
    
    func setData(_ dataPoints: [Int]) {
        viewModel.dataPoints = dataPoints
        clearViews()
        //guard viewModel.maxY > 0 else { return }
        createChart()
    }
    
    func clearViews() {
        for view in subviews {
            view.removeFromSuperview()
        }
    }
    
    func createChart() {
        var lastBar:UIView?
        
        for (i, dataPoint) in viewModel.dataPoints.enumerated() {
            let barView = createBarView(barNumber: i, barValue: dataPoint)
            
            if let lastBar = lastBar {
                let gapView = createGapView(lastBar: lastBar)
                barView.leftAnchor.constraint(equalTo: gapView.rightAnchor).isActive = true
            } else {
                barView.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
            }
            
            if i == viewModel.dataPoints.count - 1 {
                barView.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
            }
            
            barView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
            barView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: CGFloat(dataPoint / viewModel.maxY)).isActive = true
            
            lastBar = barView
        }
    }
    
    func createBarView(barNumber: Int, barValue: Int) -> UIView {
        let barView = UIView()
        addSubview(barView)
        barView.translatesAutoresizingMaskIntoConstraints = false
        barView.widthAnchor.constraint(equalTo: widthAnchor, multiplier: viewModel.barWidthPctOfTotal).isActive = true
        
        barView.tag = barNumber + 1000
        barView.backgroundColor = viewModel.barColor
        barView.layer.cornerRadius = viewModel.barCornerRadius

        return barView
    }
    
    func createGapView(lastBar: UIView) -> UIView {
        let gapView = UIView()
        addSubview(gapView)
        gapView.translatesAutoresizingMaskIntoConstraints = false
        gapView.heightAnchor.constraint(equalToConstant: 1.0).isActive = true
        gapView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        gapView.widthAnchor.constraint(equalTo: widthAnchor, multiplier: viewModel.barGapPctOfTotal).isActive = true
        gapView.leftAnchor.constraint(equalTo: lastBar.rightAnchor).isActive = true
        return gapView
    }
}
