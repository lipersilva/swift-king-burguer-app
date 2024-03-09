//
//  SignInCoordinator.swift
//  KingBurguer
//
//  Created by Filipe Rodrigues da Silva on 29/02/24.
//

import Foundation
import UIKit

class SignInCoordinator {
	
	private let window: UIWindow?
	private let navigationController: UINavigationController
	
	init(window: UIWindow?) {
		self.window = window
		self.navigationController = UINavigationController()
	}
	
	func start(){
		let viewModel = SignInViewModel()
		viewModel.coordinator = self
		
		let signInVC = SignInViewController()
		signInVC.viewModel = viewModel
		
		
		// = a rootViewController
		navigationController.pushViewController(signInVC, animated: true)
		window?.rootViewController = navigationController
		window?.makeKeyAndVisible()
	}
	
	func signUp() {
		let signUpCoordinator = SignUpCoordinator(navigationController: navigationController)
		signUpCoordinator.start()
	}
}
