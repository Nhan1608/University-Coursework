% ----- Courses -----
course(cs101).
course(cs201).
course(cs301).
course(math201).
course(ai401).

% ----- Prerequisites -----
prerequisite(cs201, cs101).
prerequisite(cs301, cs201).
prerequisite(ai401, cs301).
prerequisite(ai401, math201).

% ----- Professors -----
professor(dr_smith).
professor(dr_lee).

% --- Teaching Assignments ---
teaches(dr_smith, cs101).
teaches(dr_lee, ai401).

% ----- Students -----
student(alice).
student(bob).
student(carol).

% --- Enrollments ---
enrolled(alice, cs101).
enrolled(bob, cs201).
enrolled(carol, ai401).
enrolled(bob, math201).

% ----- Course Times -----
time(cs101, mon_9am).
time(cs201, tue_9am).
time(cs301, wed_9am).
time(math201, tue_9am).
time(ai401, thu_11am).

% ----- Departments -----
department(computer_science).
department(mathematics).

offers(computer_science, cs101).
offers(computer_science, cs201).
offers(computer_science, cs301).
offers(computer_science, ai401).
offers(mathematics, math201).

% ----- Rules -----
can_take(Student, Course) :-
    course(Course),
    forall(prerequisite(Course, Precourse), enrolled(Student, Precourse)).

teaches_student(Professor, Student) :-
    teaches(Professor, Course),
    enrolled(Student, Course).

same_department(Course1, Course2) :-
    offers(Dept, Course1),
    offers(Dept, Course2),
    Course1 \= Course2.

% ------Recursive-----
% Base case: PreCourse is a direct prerequisite of Course
prerequisite_chain(Course, Precourse) :-
    prerequisite(Course, Precourse).

% Recursive case: PreCourse is an indirect prerequisite
prerequisite_chain(Course, Precourse) :-
    prerequisite(Course, Intermediate),
    prerequisite_chain(Intermediate, Precourse).

% A conflict occurs if both courses have the same scheduled time
% and the student is enrolled in both.
conflict(Student, Course1, Course2) :-
    enrolled(Student, Course1),
    enrolled(Student, Course2),
    Course1 \= Course2,
    time(Course1, Time),
    time(Course2, Time).

