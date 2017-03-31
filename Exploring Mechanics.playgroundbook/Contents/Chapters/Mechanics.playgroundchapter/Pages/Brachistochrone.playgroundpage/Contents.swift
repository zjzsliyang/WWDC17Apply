//#-hidden-code

// Contents.swift
// Created by Yang Li on 27/03/2017.
//
// Copyright © 2017 Yang Li, Tongji University, Shanghai.
// All rights reserved.
//

import UIKit
import PlaygroundSupport

let page = PlaygroundPage.current
let proxy = page.liveView as? PlaygroundRemoteLiveViewProxy

page.liveView = BrachistochroneViewController()

func randomPokemon() {
  proxy?.send(PlaygroundValue.string("randomPokemon"))
}

func catchIt() {
  proxy?.send(PlaygroundValue.string("catchIt"))
}

//#-end-hidden-code
/*:
 After our rocket was launched, let's catch our first Pokemon!
 
 We already known that *The nearest distance between two points is always a straight line*! 
 
 However, have you think about *what is the curve traced out by a point acted on only by gravity in the shortest time*?
 
 This is a famous problem called [Brachistochrone Problem](glossary://Brachistochrone%20Problem) posed by [Johann Bernoulli](glossary://Johann%20Bernoulli) in June 1696.
 
 [Galileo](glossary://Galileo) in 1638 had studied the problem in his famous work(Discourse on two new sciences). He think that the path of quickest descent from A to B would be an arc of a circle.
 
 At the end, five mathematicians responded with solutions via [calculus of variations](glossary://calculus%20of%20variations) or [Snell's law](glossary://Snell's%20law): [Newton](glossary://Newton), Jakob Bernoulli (Johann's brother), [Gottfried Leibniz](glossary://Gottfried%20Leibniz), [Ehrenfried Walther von Tschirnhaus](glossary://Ehrenfried%20Walther%20von%20Tschirnhaus) and [Guillaume de l'Hôpital](glossary://Guillaume%20de%20l'Hopital).
 
 What's your idea?
 
 Think about it and experiment now!
 
 You can also draw a path yourself!
 
 */

//#-editable-code

// Try to run it!

catchIt()

//#-code-completion(identifier, show, RandomCatchIt())

// and then catch one randoly by yourself!
//#-end-editable-code
