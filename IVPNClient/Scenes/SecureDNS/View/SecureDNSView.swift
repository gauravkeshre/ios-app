//
//  SecureDNSView.swift
//  IVPN iOS app
//  https://github.com/ivpn/ios-app
//
//  Created by Juraj Hilje on 2021-02-15.
//  Copyright (c) 2021 Privatus Limited.
//
//  This file is part of the IVPN iOS app.
//
//  The IVPN iOS app is free software: you can redistribute it and/or
//  modify it under the terms of the GNU General Public License as published by the Free
//  Software Foundation, either version 3 of the License, or (at your option) any later version.
//
//  The IVPN iOS app is distributed in the hope that it will be useful,
//  but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY
//  or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for more
//  details.
//
//  You should have received a copy of the GNU General Public License
//  along with the IVPN iOS app. If not, see <https://www.gnu.org/licenses/>.
//

import UIKit

class SecureDNSView: UITableView {
    
    // MARK: - @IBOutlets -
    @IBOutlet weak var enableSwitch: UISwitch!
    @IBOutlet weak var ipAddressField: UITextField!
    @IBOutlet weak var serverURLField: UITextField!
    @IBOutlet weak var serverNameField: UITextField!
    @IBOutlet weak var typeControl: UISegmentedControl!
    @IBOutlet weak var mobileNetworkSwitch: UISwitch!
    @IBOutlet weak var wifiNetworkSwitch: UISwitch!
    
    // MARK: - View lifecycle -
    
    override func awakeFromNib() {
        addObservers()
    }
    
    // MARK: - Methods -
    
    func setupView(model: SecureDNS) {
        let type = SecureDNSType.init(rawValue: model.type)
        ipAddressField.text = model.ipAddress
        serverURLField.text = model.serverURL
        serverNameField.text = model.serverName
        typeControl.selectedSegmentIndex = type == .dot ? 1 : 0
        mobileNetworkSwitch.isOn = model.mobileNetwork
        wifiNetworkSwitch.isOn = model.wifiNetwork
        updateEnableSwitch()
    }
    
    @objc func updateEnableSwitch() {
        guard #available(iOS 14.0, *) else {
            return
        }
        
        DNSManager.shared.loadProfile { _ in
            self.enableSwitch.isOn = DNSManager.shared.isEnabled
        }
    }
    
    // MARK: - Observers -
    
    private func addObservers() {
        if #available(iOS 13.0, *) {
            NotificationCenter.default.addObserver(self, selector: #selector(updateEnableSwitch), name: UIScene.didActivateNotification, object: nil)
        } else {
            NotificationCenter.default.addObserver(self, selector: #selector(updateEnableSwitch), name: UIApplication.didBecomeActiveNotification, object: nil)
        }
    }
    
}
