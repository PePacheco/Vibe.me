//
//  Constants.swift
//  Vibe.me
//
//  Created by Pedro Gomes Rubbo Pacheco on 17/03/21.
//

import Foundation

struct Constants {

    struct Banners {
        static let mainBanner = """

        ##################################
        ###         Vibe.me            ###
        ##################################

        ###################################################
        ###    TODAY IS  \(Date())      ###
        ###################################################

        """
        
        static let musicSelection = """

        ###################################################
        ###         TYPE THE ACTION YOU WANT TO DO      ###
        ###################################################

        [] To exit the program, type [end]
        [] To choose a song, type the song code shown below
        """
        
        static let loginScreen = """

        #####################################################
        ###   To log in, type:{username} {password}       ###
        ######################################################

        """
        
        static let signUpScreen = """

        #######################################################
        ###   To sign up, type:{username} {password}       ####
        #######################################################

        """
        
        static let firstScreen = """

        ###################################
        ###     TO LOG IN, PRESS 1      ###
        ###     TO SIGN UP, PRESS 2     ###
        ###################################
        
        """
    }
}
