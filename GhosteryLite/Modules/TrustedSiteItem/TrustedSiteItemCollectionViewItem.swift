//
// TrustedSiteItemCollectionViewItem
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

protocol TrustedSiteItemDelegate: class {
	func trustedSiteDidRemove(indexPath: IndexPath, url: String)
}

class TrustedSiteItemCollectionViewItem: NSCollectionViewItem {
	
	weak var delegate: TrustedSiteItemDelegate?
	
	@IBOutlet weak var siteLbl: NSTextField!
	
	private var indexPath: IndexPath!
	
	override func viewDidLoad() {
		super.viewDidLoad()
		view.wantsLayer = true
	}
	
	func update(_ url: String, for indexPath: IndexPath?) {
		self.siteLbl.attributedStringValue = url.attributedString(withTextAlignment: .left, fontName: "Roboto-Regular", fontSize: 14, fontColor: NSColor.panelTextColor())
		self.indexPath = indexPath
	}
	
	@IBAction func removeTrustedSite(_ sender: Any) {
		self.delegate?.trustedSiteDidRemove(indexPath: self.indexPath, url: self.siteLbl.stringValue)
	}
}