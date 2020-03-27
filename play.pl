move([X,Y],[NX,Y],U,down):-
    dim(U,_),
    NX is X+1,
    NX < U.

move([X,Y],[NX,Y],_,up):-
    NX is X-1,
    NX >= 0.

move([X,Y],[X,NY],_,left):-
    NY is Y-1,
    NY >=0.

move([X,Y],[X,NY],U,right):-
    dim(_,U),
    NY is Y+1,
    NY < U.

unsave(X):-
    bomb(X).

getStars(X):-
    star(X).

starcheckker(CurrentLocation,L):-
    star(CurrentLocation),
    L is 1;
    \+star(CurrentLocation),
    L is 0.

game(Moves,Stars):-
    start(J),
    path(J,[J],0,Stars,[],Moves).

path(End,_,Q,Q,W,W):-
    end(End).

path(X,Visited,Counter,ResultStars,List,Cap):-
    move(X,Nextmove,_,Direction),
    starcheckker(Nextmove,NCounter),
    Counter2 is Counter+ NCounter,
    \+unsave(Nextmove),
    \+ member(Nextmove,Visited),
    path(Nextmove,[Nextmove|Visited],Counter2,ResultStars,[Direction|List],Cap).
