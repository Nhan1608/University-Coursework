:- use_module(library(clpfd)).

% Core model: variables + domains + constraints, but NO search yet.
magic_triangle_vars([A,B,C,D,E,F]) :-
    % 6 variables
    Vars = [A,B,C,D,E,F],

    % Domains 1..6
    Vars ins 1..6,

    % All values must be distinct
    all_different(Vars),

    % Side sums must be equal
    A + B + C #= S,
    C + D + E #= S,
    E + F + A #= S.
