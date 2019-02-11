//
//  StatusMenuController.swift
//  mAh Battery
//
//  Created by Radu Vasilescu on 2/10/19.
//  Copyright © 2019 Radu Vasilescu. All rights reserved.
//

import Cocoa

class StatusMenuController: NSObject {
    @IBOutlet weak var statusMenu: NSMenu!
    
    let statusItem = NSStatusBar.system.statusItem(withLength: NSStatusItem.variableLength);
    
    // -- Values in menu -- //
    
    @IBOutlet weak var currentCapacityOutlet: NSMenuItem!
    @IBOutlet weak var maxCapacityOutlet: NSMenuItem!
    @IBOutlet weak var designCapacityOutlet: NSMenuItem!
    
    @IBOutlet weak var powerOutlet: NSMenuItem!     // Lol, "power outlet"
    
    @IBOutlet weak var chargeOutlet: NSMenuItem!
    @IBOutlet weak var chargingOutlet: NSMenuItem!
    
    let batteryApi = BatteryAPI();
    
    override func awakeFromNib() {
        statusItem.menu = statusMenu;
        statusItem.button?.font = NSFont.init(name: "San Francisco", size: 14);
        statusItem.button?.title = "Fetching...";
        
        updateValues();
        
        
        Timer.scheduledTimer(timeInterval: 5, target: self, selector: #selector(StatusMenuController.timerFire), userInfo: nil, repeats: true);
    }
    
    @objc func timerFire() {
        updateValues()
    }
    
    func updateValues() {
        statusItem.button?.title = batteryApi.currentCapacity(unit: true);
        
        currentCapacityOutlet.title = "Current Capacity: " + batteryApi.currentCapacity();
        maxCapacityOutlet.title = "Maximum Capacity: " + batteryApi.maxCapacity();
        designCapacityOutlet.title = "Design Capacity: " + batteryApi.designCapacity();
        
        powerOutlet.title = "Power: " + batteryApi.wattHours();
        
        chargeOutlet.title = "Charge: " + batteryApi.charge();
        chargingOutlet.title = "Is Charging: " + batteryApi.isCharging();
    }
    
    @IBAction func refreshClicked(_ sender: NSMenuItem) {
        updateValues();
    }
    
    @IBAction func quitClicked(sender: NSMenuItem) {
        NSApplication.shared.terminate(self);
    }
}
