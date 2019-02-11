//
//  BatteryAPI.swift
//  mAh Battery
//
//  Created by Radu Vasilescu on 2/10/19.
//  Copyright © 2019 Radu Vasilescu. All rights reserved.
//

import Foundation

class BatteryAPI {
    private var battery : Battery;
    
    init() {
        self.battery = Battery();
        _ = self.openBattery();
    }
    
    deinit {
        self.closeBattery();
    }
    
    func openBattery() -> Bool {
        return battery.open() == kIOReturnSuccess;
    }
    
    func closeBattery() {
        _ = battery.close();
    }
    
    // --- Getters ---
    
    func isCharging() -> String {
        return String(battery.isCharging());
    }
    
    func charge() -> String {
        return String(battery.charge());
    }
    
    func currentCapacity(unit : Bool = true) -> String {
        return String(battery.currentCapacity()) + (unit ? " mAh" : "");
    }
    
    func maxCapacity(unit : Bool = true) -> String {
        return String(battery.maxCapactiy()) + (unit ? " mAh" : "");
    }
    
    func designCapacity(unit : Bool = true) -> String {
        return String(battery.designCapacity()) + (unit ? " mAh" : "");
    }
    
    func voltage(unit : Bool = true) -> String {
        return String(battery.voltage()) + (unit ? " mV" : "");
    }
    
    func wattHours(unit : Bool = true) -> String {
        let mAh = Double(battery.currentCapacity());
        let mV = Double(battery.voltage());
        let V = mV / 1000.0;
        
        let result = (mAh * V) / 1000.0;
        let resultStr = String(format: "%.3f", result);
        
        return resultStr + (unit ? " Wh" : "");
    }

    /*
 
     Battery also exposes the following methods:
     
             isACPowered()
             isCharged()
             isCharging()
             charge()
             currentCapacity()
             maxCapactiy()
             designCapacity()
             cycleCount()
             designCycleCount()
             temperature()
             timeRemainingFormatted()
 
    */
    
}
