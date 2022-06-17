//
//  ViewController.swift
//  TrafficLight
//
//  Created by Андрей on 17.06.2022.
//

import UIKit

class ViewController: UIViewController {

	// MARK: - IB Outlets
	@IBOutlet var redView: UIView!
	@IBOutlet var yellowView: UIView!
	@IBOutlet var greenView: UIView!
	
	@IBOutlet var nextButton: UIButton!
	
	// MARK: - Private properties
	private var currentLight: TrafficLight? = nil
	
	// MARK: - Life Cycles Methods
	override func viewDidLoad() {
		super.viewDidLoad()
		
		redView.alpha = 0.3
		yellowView.alpha = 0.3
		greenView.alpha = 0.3
		
		nextButton.layer.cornerRadius = 10
	}
	
	override func viewDidLayoutSubviews() {
		redView.layer.cornerRadius = redView.frame.width / 2
		yellowView.layer.cornerRadius = yellowView.frame.width / 2
		greenView.layer.cornerRadius = greenView.frame.width / 2
	}

	// MARK: - IB Actions
	@IBAction func nextButtonTapped() {
		switch currentLight {
		case .red:
			currentLight = .yellow
			switchLight(from: redView, to: yellowView)
		case .yellow:
			currentLight = .green
			switchLight(from: yellowView, to: greenView)
		case .green:
			currentLight = .red
			switchLight(from: greenView, to: redView)
		default:
			currentLight = .red
			switchLight(from: redView, to: redView)
			nextButton.setTitle("NEXT", for: .normal)
		}
	}
	
	// MARK: - Private Methods
	private func switchLight(from: UIView, to: UIView) {
		from.alpha = 0.3
		to.alpha = 1
	}
	
}

