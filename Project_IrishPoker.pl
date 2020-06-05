

%creates a new deck of cards
new_deck(Deck) :-
        Suits = [clubs, hearts, spades, diamonds],
        Ranks = [2, 3, 4, 5, 6, 7, 8, 9, 10, jack, queen, king, ace],
        setof(card(Rank, Suit), (member(Suit, Suits), member(Rank, Ranks)), Deck).

%method that adds keys to deck
addKey([],[]). %adds a random number as key to be used for shuffling
addKey([H|T],KeyDeck):-
  addKey(T,TailDeck),
  random(0,10,Key),
  append([[H,Key]],TailDeck,KeyDeck).

%helper method to print deck.
print_deck([]).
print_deck([H|T]):-
  print_deck(T),
  write(H),nl.

%make a list of cards with keys of 0
zeroMembers([],[]).
zeroMembers([[Card1,Key1]|Tail],NewDeck):-
  zeroMembers(Tail,TailDeck),
  (Key1 =:= 0 -> append([[Card1,Key1]], TailDeck,NewDeck);
  append([],TailDeck,NewDeck)).

%make a list of cards with key of one
oneMembers([],[]).
oneMembers([[Card1,Key1]|Tail],NewDeck):-
  oneMembers(Tail,TailDeck),
  (Key1 =:= 1 -> append([[Card1,Key1]], TailDeck,NewDeck);
  append([],TailDeck,NewDeck)).
%make a list of keys of two
twoMembers([],[]).
twoMembers([[Card1,Key1]|Tail],NewDeck):-
  twoMembers(Tail,TailDeck),
  (Key1 =:= 2 -> append([[Card1,Key1]], TailDeck,NewDeck);
  append([],TailDeck,NewDeck)).
%make a list of keys of three
threeMembers([],[]).
threeMembers([[Card1,Key1]|Tail],NewDeck):-
  threeMembers(Tail,TailDeck),
  (Key1 =:= 3 -> append([[Card1,Key1]], TailDeck,NewDeck);
  append([],TailDeck,NewDeck)).
%make a list of keys of four
fourMembers([],[]).
fourMembers([[Card1,Key1]|Tail],NewDeck):-
fourMembers(Tail,TailDeck),
  (Key1 =:= 4 -> append([[Card1,Key1]], TailDeck,NewDeck);
  append([],TailDeck,NewDeck)).
%make a list of keys of five
fiveMembers([],[]).
fiveMembers([[Card1,Key1]|Tail],NewDeck):-
  fiveMembers(Tail,TailDeck),
  (Key1 =:= 5 -> append([[Card1,Key1]], TailDeck,NewDeck);
  append([],TailDeck,NewDeck)).
%make a list of keys of six
sixMembers([],[]).
sixMembers([[Card1,Key1]|Tail],NewDeck):-
  sixMembers(Tail,TailDeck),
  (Key1 =:= 6 -> append([[Card1,Key1]], TailDeck,NewDeck);
  append([],TailDeck,NewDeck)).
%make a list of keys of seven
sevenMembers([],[]).
sevenMembers([[Card1,Key1]|Tail],NewDeck):-
  sevenMembers(Tail,TailDeck),
  (Key1 =:= 7 -> append([[Card1,Key1]], TailDeck,NewDeck);
  append([],TailDeck,NewDeck)).
%make a list of keys of eight
eightMembers([],[]).
eightMembers([[Card1,Key1]|Tail],NewDeck):-
  eightMembers(Tail,TailDeck),
  (Key1 =:= 8 -> append([[Card1,Key1]], TailDeck,NewDeck);
  append([],TailDeck,NewDeck)).
%make a list with keys of 9
nineMembers([],[]).
nineMembers([[Card1,Key1]|Tail],NewDeck):-
  nineMembers(Tail,TailDeck),
  (Key1 =:= 9 -> append([[Card1,Key1]], TailDeck,NewDeck);
  append([],TailDeck,NewDeck)).
%make a list with keys of 10
tenMembers([],[]).
tenMembers([[Card1,Key1]|Tail],NewDeck):-
tenMembers(Tail,TailDeck),
  (Key1 =:= 10 -> append([[Card1,Key1]], TailDeck,NewDeck);
  append([],TailDeck,NewDeck)).
%method to shuffle deck (works by adding keys (digits 0-9) to each card via random number generator)
%then makes a new list by adding cards with key of 0, then 1, then 2, etc.
shuffle_deck(Deck,ShuffledDeck):-
  zeroMembers(Deck,Zero),
  oneMembers(Deck,One),
  twoMembers(Deck,Two),
  threeMembers(Deck,Three),
  fourMembers(Deck,Four),
  fiveMembers(Deck,Five),
  sixMembers(Deck,Six),
  sevenMembers(Deck,Seven),
  eightMembers(Deck,Eight),
  nineMembers(Deck,Nine),
  tenMembers(Deck,Ten),
  append(Zero,One,ZeroOne),
  append(ZeroOne,Two,ZeroOneTwo),
  append(ZeroOneTwo,Three,ZeroThree),
  append(ZeroThree,Four,ZeroFour),
  append(ZeroFour,Five,ZeroFive),
  append(ZeroFive,Six,ZeroSix),
  append(ZeroSix,Seven,ZeroSeven),
  append(ZeroSeven,Eight,ZeroEight),
  append(ZeroEight,Nine,ZeroNine),
  append(ZeroNine,Ten,ShuffledDeck).
%deals cards to four players
dealer(_,[],[],[],[],0).
dealer([C1,C2,C3,C4|Cards],[C1|H1],[C2|H2],[C3|H3],[C4|H4],Count) :-
  NewCount is Count-1,
  dealer(Cards,H1,H2,H3,H4,NewCount).

deal(Deck,A,B,C,D) :-
    dealer(Deck,A,B,C,D,4).
%checks if user input was right about color (diamonds and hearts are red and clubs and spades are black)
suit(diamonds,red):-
  write('Correct!'),nl,!.
suit(diamonds, _):-
  write('Wrong!'),nl.

suit(hearts,red):-
  write('Correct!'),nl,!.
suit(hearts, _):-
  write('Wrong!'),nl.

suit(clubs,black):-
  write('Correct!'),nl,!.
suit(clubs, _):-
  write('Wrong!'),nl.

suit(spades,black):-
  write('Correct!'),nl,!.
suit(spades, _):-
  write('Wrong!'),nl.

redOrBlackHelper([card(Rank,Suit),_],Input):-
  write('Card is: '),
  write(Rank), write(' of '), write(Suit),nl,
  suit(Suit,Input).

%checks if card is red or black
redOrBlack([H|_]):-
  write('Guess the color of your first card!'),nl,
  write('Input must be \'red\' or \'black\'.'),nl,
  read(Input),redOrBlackHelper(H,Input).

%takes in rank for input and converts it to an int so it can be comapred
rankToInt(ace, Int):-
  Int is 1.
rankToInt(2, Int):-
  Int is 2.
rankToInt(3, Int):-
  Int is 3.
rankToInt(4, Int):-
  Int is 4.
rankToInt(5, Int):-
  Int is 5.
rankToInt(6, Int):-
  Int is 6.
rankToInt(7, Int):-
  Int is 7.
rankToInt(8, Int):-
  Int is 8.
rankToInt(9, Int):-
  Int is 9.
rankToInt(10, Int):-
  Int is 10.
rankToInt(jack, Int):-
  Int is 11.
rankToInt(queen, Int):-
  Int is 12.
rankToInt(king, Int):-
  Int is 13.
%checks user input to see if they are right about card 2 being higher/lower than card 1
hiOrLow(A, B, higher) :-
  (A < B),
  write('Correct!'),nl.
hiOrLow(A, B, higher) :-
  (A > B),
  write('Wrong!'),nl.
hiOrLow(A, B, higher) :-
  (A =:= B),
  write('Wrong!'),nl.

hiOrLow(A, B, lower) :-
  (A < B),
  write('Wrong!'),nl.
hiOrLow(A, B, lower) :-
  (A > B),
  write('Correct'),nl.
hiOrLow(A, B, lower) :-
  (A =:= B),
  write('Wrong!'),nl.

%takes in cards and user inputs to get ranks and converts them to ints to be compared via hiorlow/3
highOrLowHelper([card(Rank1,Suit1),_], [card(Rank2,Suit2),_], Input) :-
  rankToInt(Rank1, Int1),
  write(Rank1), write(' of '), write(Suit1), nl,
  rankToInt(Rank2, Int2),
  write('New Card is: '),
  write(Rank2), write(' of '), write(Suit2), nl,
  hiOrLow(Int1, Int2, Input).

%checks if the second card is higher than the first card
highOrLow([One|[Two|_]]):-
  write('Will the next card be higher or lower than the last card?'), nl,
  write('Input must be \'higher\' or \'lower\'.'),nl,
  read(Input),%trace,
  highOrLowHelper(One,Two,Input).

% The first two cards must be in order by rank for comparison to make sense
inBetweenOrOutsideHelper([card(Rank1,Suit1),Key1], [card(Rank2,Suit2),Key2], Three, Input) :-
  rankToInt(Rank1, Int1),
  rankToInt(Rank2, Int2),
  Int1 > Int2,
  inBetweenOrOutsideHelper([card(Rank2,Suit2),Key2], [card(Rank1,Suit1),Key1], Three, Input), !.

inBetweenOrOutsideHelper([card(Rank1,_),_], [card(Rank2,_),_], [card(Rank3,_),_], inbetween) :-
  rankToInt(Rank1, Int1),
  rankToInt(Rank2, Int2),
  rankToInt(Rank3, Int3),
  Int1 =< Int3,
  Int3 =< Int2,
  write('Correct'), !.

inBetweenOrOutsideHelper([card(Rank1,_),_], [card(Rank2,_),_], [card(Rank3,_),_], outside) :-
  rankToInt(Rank1, Int1),
  rankToInt(Rank2, Int2),
  rankToInt(Rank3, Int3),
  (Int3 < Int1;
  Int3 > Int2),
  write('Correct!'), !.

inBetweenOrOutsideHelper(_,_,_,_) :-
  write('Wrong!').
%checks it card is in between or outside
inBetweenOrOutside([One,Two,Three|_]):-
  write('Will the next card lie in between the previous two, or not?'), nl,
  write('Input must be \'inbetween\' or \'outside\'.'),nl,
  read(X),
  inBetweenOrOutsideHelper(One, Two, Three, X), nl.
%helper methods for suit check
suitCheckHelper2(diamonds,diamonds):-
  write('Correct!'),nl,!.

suitCheckHelper2(diamonds,_):-
  write('Correct Suit: diamonds'),nl,
  write('Wrong!'),nl.

suitCheckHelper2(hearts,hearts):-
  write('Correct!'),nl,!.

suitCheckHelper2(hearts,_):-
  write('Correct Suit: hearts'),nl,
  write('Wrong!'),nl.

suitCheckHelper2(clubs,clubs):-
  write('Correct!'),nl,!.

suitCheckHelper2(clubs,_):-
  write('Correct Suit: clubs'),nl,
  write('Wrong!'),nl.

suitCheckHelper2(spades,spades):-
  write('Correct!'),nl,!.

suitCheckHelper2(spades,_):-
  write('Correct Suit: Spades'),
  nl,
  write('Wrong!'),nl.

suitCheckHelper([card(_,Suit),_],Input):- %helper method for suitcheck
  suitCheckHelper2(Suit,Input).
suitCheck([_,_,_,Four]):-   %checks to see if suit is corret
  write('Guess the suit of the final card: Hearts, Diamonds, Clubs, or Spades'),
  nl,
  write('Input must be lowercase.'),
  nl,
  read(Input),
  suitCheckHelper(Four,Input).

run(x) :- %runs the game
  randomize,
  new_deck(GameDeck),
  %%print_deck(GameDeck),
  addKey(GameDeck,KeyDeck),
  shuffle_deck(KeyDeck,ShuffledDeck),
  deal(ShuffledDeck,A,B,C,D),nl,
  write('Player 1, your turn!'),nl,
  redOrBlack(A),nl,
  highOrLow(A),nl,
  inBetweenOrOutside(A),nl,
  suitCheck(A),nl,
  write('Player 2, your turn!'),nl,
  redOrBlack(B),nl,
  highOrLow(B),nl,
  inBetweenOrOutside(B),nl,
  suitCheck(B),nl,
  write('Player 3, your turn!'),nl,
  redOrBlack(C),nl,
  highOrLow(C),nl,
  inBetweenOrOutside(C),nl,
  suitCheck(C),nl,
  write('Player 4, your turn!'),nl,
  redOrBlack(D),nl,
  highOrLow(D),nl,
  inBetweenOrOutside(D),nl,
  suitCheck(D).
