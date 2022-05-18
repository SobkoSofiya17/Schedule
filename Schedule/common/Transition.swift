//
//  Transition.swift
//  Schedule
//
//  Created by Тест on 09.03.2022.
//

import SwiftUI

struct Transition: View {
    @State var transition = 0
    var body: some View {
        if transition == 0 {
            SignUp()
        }
    }
}

struct Transition_Previews: PreviewProvider {
    static var previews: some View {
        Transition()
    }
}
