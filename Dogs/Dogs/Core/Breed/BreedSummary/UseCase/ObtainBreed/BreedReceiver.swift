//
//  BreedReceiver.swift
//  Dogs
//
//  Created by Rodrigo Miyashiro on 28/06/19.
//  Copyright © 2019 Rodrigo Miyashiro. All rights reserved.
//

protocol BreedReceiver: AnyObject {
    func receiveBreed(_ breed: Breed?)

    func handleErrorObtainingBreed()
}
