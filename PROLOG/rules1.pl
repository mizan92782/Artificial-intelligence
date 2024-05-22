
sell(mizan,book).
sell(arif,pen).
sell(huree,flower).
sell(huree,pen).

buy(sijan,banana).
buy(mizan,pen).
buy(jisan,book).


father(milon,mizan).
father(milon,sijan).
father(milon,sathe).
father(milon,suchona).

father(arif,josim).
father(huree,josim).

mother(nasima,mizan).
mother(nasima,sizan).


% whose fathe is milon,they are sibling
sibling(X):- father(milon,X).

% if childers are same then they are couple
couple(X,Y,Z):- father(X,Z),mother(Y,Z).
