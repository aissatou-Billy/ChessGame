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
MyPawn >> isTheFirstMove [

^self isWhite 
       ifTrue: [ self square file = $2 ]
       ifFalse: [ self square file = $7 ]
]

{ #category : 'rendering' }
MyPawn >> renderPieceOn: aSquare [ 
	
	^ aSquare renderPawn: self
]

{ #category : 'rendering' }
MyPawn >> targetSquaresLegal: aBoolean [

    | firstSquare secondSquare |

    firstSquare := self isWhite
        ifTrue: [ self square up ]
        ifFalse: [ self square down ].

    firstSquare ifNil: [ ^ #() ].
    firstSquare hasPiece ifTrue: [ ^ #() ].

    self isTheFirstMove ifFalse: [ ^ { firstSquare } ].

    secondSquare := self isWhite
        ifTrue: [ firstSquare up ]
        ifFalse: [ firstSquare down ].

    (secondSquare notNil and: [ secondSquare hasPiece not ])
        ifTrue: [ ^ { firstSquare. secondSquare } ].

    ^ { firstSquare }
]
