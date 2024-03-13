//
//  SignUpCoordinator.swift
//  KingBurguer
//
//  Created by Filipe Rodrigues da Silva on 29/02/24.
//

import Foundation
import UIKit

class SignUpCoordinator {
	private let navigationController: UINavigationController
	
	var parentCoordinator: SignInCoordinator?
	
	init(navigationController: UINavigationController) {
		self.navigationController = navigationController
	}
	
	func start() {
		let viewModel = SignUpViewModel()
		viewModel.coordinator = self
		
		let signUpVC = SignUpViewController()
		signUpVC.viewModel = viewModel
		//terá um viewModel
		
		navigationController.pushViewController(signUpVC, animated: true)
	}
	
	func home(){
		parentCoordinator?.home()
	}
}
