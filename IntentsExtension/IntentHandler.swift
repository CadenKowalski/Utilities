//
//  IntentHandler.swift
//  IntentsExtension
//
//  Created by Caden Kowalski on 4/27/20.
//  Copyright © 2020 Caden Kowalski. All rights reserved.
//

import Intents
import IntentsKit

class IntentHandler: INExtension {
    
    override func handler(for intent: INIntent) -> Any {
        switch intent {
        case is SleepIntent:
            return IntentsHandler()
        case is TimeIntent:
            return IntentsHandler()
        default:
            fatalError("Undhandled Intent")
        }
    }
}
