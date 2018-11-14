//
//  Mocks.swift
//  EventsAppTests
//
//  Created by Gabriel Conte on 12/11/18.
//  Copyright © 2018 Gabriel Conte. All rights reserved.
//

import UIKit

class Mocks: NSObject {
    
    static var shared = Mocks()
    
    lazy var event1 = Event(id: "1", title: "Feira de adoção de animais na Redenção", image: "http://lproweb.procempa.com.br/pmpa/prefpoa/seda_news/usu_img/Papel%20de%20Parede.png")
    
    lazy var event2 = Event(id: "2", title: "", image: "")
    
}
