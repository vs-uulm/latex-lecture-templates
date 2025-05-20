# Assignment Template

## Class Options

- **nocolor**: Disable color in the document. _default=false_
- **solution**: Compiles the solution version of the document. _default=false_
- **english**: Use English as the main language. _(default=true)_
- **german**: Use German as the main language. _default=false_
- **compat**: If you're migrating from an older version of this class, you might want to
  set this option to enable environments/macros that have been replaced in this version.

## Required Information

- **assignmenttype**: Type of the assignment (e.g., "Übungsblatt", "Quiz").
  - Can be set by using `\assignmenttype{<type>}`
- **course**: Name of the course.
  - Can be set by using `\course{<course>}`
  - Also accepts a shortened version used where space is limited: `\course[<short>]{<normal>}`
- **faculty**: Name of the faculty. This is usually the institutes name.
  - Can be set by using `\faculty{<faculty>}`
- **publishdate**: Date of the assignment's publication.
  - Can be set by using `\publishdate{<date>}`
- **semester**: Semester in which the assignment is published.
  - Can be set by using `\semester{<semester>}`
  - Also accepts a shortened version used where space is limited: `\semester[<short>]{<normal>}`
- **supervisor**: Name of the assignments creator/supervisor.
  - Can be set by using `\supervisor{<name>}`
  - Also accepts a shortened version used where space is limited: `\supervisor[<short>]{<normal>}`

## Optional Information

- **assignmentno**: Number of the assignment.
  - Can be set by using `\assignmentno{<number>}`
- **deadline**: When the assignment is due.
  - Can be set by using `\deadline{<date>}`
- **duration**: How long students have time to complete the assignment.
  - Can be set by using `\duration{<duration>}`

## Macros and Environments

- **task**: Creates a new task
  - `\task{<title>}` is kinda like `\section{<title>}` but with a different style.
  - To specify points, there's an optional parameter you can use: `\task[4]{<title>}`.
  - There's also a starred version `\task*{<title>}` which doesn't set a task number and
    doesn't add it to the table of contents.
  - For non-mandatory tasks, use `\opttask{<title>}`. There's also a starred version
    `\opttask*{<title>}` similar to the starred version of `\task`.
- **subtasks**: Creates subtasks
  - The `subtasks` environment behaves like a numbered list. Using `\item`, you can
    create individual subtasks.
  - For non-mandatory subtasks, use `\optitem` to mark them as optional.
- **solution**: Creates a solution for the task
  - Content of the `solution` environment will only be set if the `solution` option is
    enabled. Otherwise, it will be ignored.
  - For shorter solutions that fit into a single line, you can use `\inlinesolution{<text>}`.
  - To do stuff when the `solution` option is set, you can use `\onsolution{<macros>}`.
- Miscellaneous
  - **link**: To typeset a link, you can use `\link <text> to <url>;`. Don't forget the
    semicolon at the end ;)
  - **underline**: While `\uline{<text>}` is fine, sometimes the underline has to be
    more pronounced. In that case, use `\ul`. It's usage is a bit more involved, so
    check out `config.tex` for a little tutorial. Maybe I' simplify it in the future.
  - This class also provides some tikz styles for common shapes, like `arrow`,
    `roundednode`, or `pill`. The full list is available in `config.tex`. When rolling
    your own styles, it might be a good idea to use `lw` and/or `rnd` for consistent
    line thickness and corner radii.
  - There are also macros for setting code. `\code[options]{<code}` will accept all
    options that `\lstinline` accepts. There's also `\codename{<name>}` for typesetting,
    e.g., class names and `filename{<name>}` for typesetting file names.

## Usage

Check out `example.tex` for a complete example of how to use this class. Or file an
issue if you have any questions or suggestions.
