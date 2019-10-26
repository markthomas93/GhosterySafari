//
// ModalViewController
// GhosteryLite
//
// Ghostery Lite for Safari
// https://www.ghostery.com/
//
// Copyright 2019 Ghostery, Inc. All rights reserved.
//
// This Source Code Form is subject to the terms of the Mozilla Public
// License, v. 2.0. If a copy of the MPL was not distributed with this
// file, You can obtain one at http://mozilla.org/MPL/2.0
//

import Cocoa
import SafariServices

protocol ModalViewControllerDelegate {
	func hideSafariExtensionPopOver()
}

class ModalViewController: NSViewController {
	
	@IBOutlet weak var enableGhosteryLiteText: NSTextField!
	@IBOutlet weak var enableGhosteryLiteBtn: NSButton!
	@IBOutlet weak var skipButton: NSButton!
	
	var delegate: ModalViewControllerDelegate? = nil
	
	override func viewDidLoad() {
		super.viewDidLoad()
		initComponents()
	}
	
	@IBAction func enableGhosteryLite(_ sender: NSButton) {
		self.delegate?.hideSafariExtensionPopOver()
		// Needs to be refactored
		HomeViewController.showSafariPreferencesForExtension()
	}
	
	@IBAction func skip(_ sender: NSButton) {
		self.delegate?.hideSafariExtensionPopOver()
	}
	
	@IBAction func activateExtensionButtonClicked(_ sender: Any) {
		
	}
	
	private func initComponents() {
		enableGhosteryLiteText.stringValue = Strings.SafariExtensionPromptText
		
		enableGhosteryLiteBtn.attributedTitle = Strings.SafariExtensionPromptEnableGhosteryLiteButtonTitle.attributedString(withTextAlignment: .center,
																															fontName: "Roboto-Medium",
																															fontSize: 14.0,
																															fontColor: NSColor(rgb: 0xffffff),
																															isUnderline: true)
		
		skipButton.attributedTitle = Strings.SafariExtensionPromptSkipButtonTitle.attributedString(withTextAlignment: .center,
																								   fontName: "Roboto-Regular",
																								   fontSize: 14.0,
																								   fontColor: NSColor(rgb: 0x4a4a4a),
																								   isUnderline: true)
		
	}
}