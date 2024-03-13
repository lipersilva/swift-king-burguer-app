//
//  HomeCoordinator.swift
//  KingBurguer
//
//  Created by Filipe Rodrigues da Silva on 12/03/24.
//

import Foundation
import UIKit

class HomeCoordinator {
	
	private let navigationController: UINavigationController
	private let window: UIWindow?
	
	init(window: UIWindow?) {
		self.window = window
		self.navigationController = UINavigationController()
		
	}
	
	func start() {
		let homeVC = HomeViewController()
		navigationController.pushViewController(homeVC, animated: true)
		
		//aqui é onde acontece a troca de navigation-controller
		window?.rootViewController = navigationController
	}
}
