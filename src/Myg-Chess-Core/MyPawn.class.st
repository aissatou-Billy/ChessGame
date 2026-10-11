Class {
	#name : 'MyPawn',
	#superclass : 'MyPiece',
	#category : 'Myg-Chess-Core',
	#package : 'Myg-Chess-Core'
}

{ #category : 'accessing' }
MyPawn >> id [

	^ 'P'
]

{ #category : 'accessing' }
MyPawn >> id2 [

	^ 'P'
]

{ #category : 'testing' }
MyPawn >> isEmptySquare: aSquare [
    ^ aSquare notNil and: [ aSquare hasPiece not ]
]

{ #category : 'testing' }
MyPawn >> isTheFirstMove [

^self isWhite 
       ifTrue: [ self square file = $2 ]
       ifFalse: [ self square file = $7 ]
]

{ #category : 'as yet unclassified' }
MyPawn >> moveToOneSquare [

    ^ self isWhite
        ifTrue: [ self square up ]
        ifFalse: [ self square down ]
]

{ #category : 'as yet unclassified' }
MyPawn >> moveToTwoSquare [

    | firstSquare |

    firstSquare := self moveToOneSquare .
    firstSquare ifNil: [ ^ nil ].

    ^ self isWhite
        ifTrue: [ firstSquare up ]
        ifFalse: [ firstSquare down ]
]

{ #category : 'rendering' }
MyPawn >> renderPieceOn: aSquare [ 
	
	^ aSquare renderPawn: self
]

{ #category : 'rendering' }
MyPawn >> targetSquaresLegal: aBoolean [

   | firstSquare secondSquare |

    firstSquare := self moveToOneSquare .

    (self isEmptySquare: firstSquare)
        ifFalse: [ ^ #() ].

    self isTheFirstMove
        ifFalse: [ ^ { firstSquare } ].

    secondSquare := self moveToTwoSquare .

    (self isEmptySquare: secondSquare)
        ifTrue: [ ^ { firstSquare. secondSquare } ].

    ^ { firstSquare }
]
