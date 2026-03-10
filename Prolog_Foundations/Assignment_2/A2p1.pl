%part 1
%base case: empty list
filter_positive([], []).

%if head is positive, include it
filter_positive([H|T], [H|Result]) :-
    H > 0,
    filter_positive(T, Result).

%if head is not positive, skip it
filter_positive([H|T], Result) :-
    H =< 0,
    filter_positive(T, Result).

%base case
transform_sign([], []).

%negative number
transform_sign([H|T], [negative|R]) :-
    H < 0,
    transform_sign(T, R).

%zero
transform_sign([H|T], [zero|R]) :-
    H =:= 0,
    transform_sign(T, R).

%positive number
transform_sign([H|T], [positive|R]) :-
    H > 0,
    transform_sign(T, R).

%part 2
list_sum([], 0).

%If the list is [H|T], then
%Sum = H + (sum of T).
list_sum([H|T], Sum) :-
    list_sum(T, RestSum),
    Sum is H + RestSum.

list_product([], 1).

%If the list is [H|T], then
%Product = H * (product of T).
list_product([H|T], Product) :-
    list_product(T, RestProduct),
    Product is H * RestProduct.

%part 3
list_length([], 0).
list_length([_|T], N) :-
    list_length(T, N1),
    N is N1 + 1.

classify_list(List, Classification) :-
    list_length(List, Len),
    ( Len =:= 0 -> Classification = empty
    ; Len =:= 1 -> Classification = single
    ; Len =< 5 -> Classification = short
    ; Classification = long
    ).

%part 4
%If the list is empty → flattened version is empty.
%If the head is a list, flatten it recursively, flatten the tail, and concatenate the two.
%If the head is not a list, keep it and continue flattening the tail.

%base case: empty list
flatten_list([], []).

%case 1: Head is a list — flatten both head and tail, then concatenate
flatten_list([H|T], FlatList) :-
    is_list(H),
    flatten_list(H, FlatHead),
    flatten_list(T, FlatTail),
    append(FlatHead, FlatTail, FlatList).

%case 2: Head is not a list — keep head and flatten tail
flatten_list([H|T], [H|FlatTail]) :-
    \+ is_list(H),
    flatten_list(T, FlatTail).
