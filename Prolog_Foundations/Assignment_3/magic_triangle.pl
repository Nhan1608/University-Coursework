% 1) and 2)
:- use_module(library(clpfd)).

magic_triangle_vars([A,B,C,D,E,F]) :-
    %variables
    Vars = [A,B,C,D,E,F],

    %Domains 
    Vars ins 1..6,

    %values must be distinct
    all_different(Vars),

    %Side sums must be equal
    A + B + C #= S,
    C + D + E #= S,
    E + F + A #= S.

%Default strategy: left-to-right, ascending values
solve_default(Vars) :-
    magic_triangle_vars(Vars),
    labeling([], Vars).

%First-fail (ff): choose variable with smallest remaining domain first
solve_ff(Vars) :-
    magic_triangle_vars(Vars),
    labeling([ff], Vars).

%Minimum (min): choose the variable with the smallest possible value first
solve_min(Vars) :-
    magic_triangle_vars(Vars),
    labeling([min], Vars).
