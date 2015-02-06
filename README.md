# slim: Super-Lightweight Issue Manager

Issue tracking software is often cumbersome and overkill for small projects.  Slim is a very low-impact issue tracking system.

- Highly non-configurable!
- It comes with its own web server.
- Issues do not have an explicit state.
- Records dates issue was successfully tested (unit, code review, integration, system).

## QNA
Questions Never Asked

What is this thing?
- Slapdash, lame issue manager.  Um, I mean it is a super-lightweight issue manager.

What does it do?
- It lets me record tickets, or change requests.

Why is it so unconfigurable?
- The workflow seems good.
  - Open ticket.
  - Write code.
  - Unit test.
  - Code review.
  - Integration test. (Pass for an alpha-quality product.)
  - System test. (Pass for a beta-quality product.)
  - Ship it!

How to I set it up, install it, and configure it?
- You don't.  Put **slim** and **slim.html** into a directory with write access and run **slim -h**.  Run **slim --server** if you want to live on the edge.

## Components

| Component    | Description                                                                                                                           |
|:-------------|:--------------------------------------------------------------------------------------------------------------------------------------|
| README.md    | This README file.                                                                                                                     |
| slim         | The main executable. This is a python script.                                                                                         |
| slim.html    | A web interface to the slim database.                                                                                                 |
| slim.sqlite3 | A SQLite3 database that contains issue records. Created automatically when slim is run. Can be named anything with the *--db* option. |

## Records

### Issue Record

An issue record consists of:

| Field                 | Description                              |
|:----------------------|:-----------------------------------------|
| id                    | Unique identifier for the issue.         |
| date-discovered       | Data the issue was first discovered.     |
| version-identified    | First version that identified the issue. |
| unit-test-date        | Date the unit test passed.               |
| code-review-date      | Date the code review passed.             |
| integration-test-date | Date the integration test passed.        |
| system-test-date      | Date the system test passed.             |
| version-deployed      | First version that resolves the issue.   |

### Comment Record

A Comment record consists of:

| Field        | Description                |
|:-------------|:---------------------------|
| id           | Reference to an issue id.  |
| date-created | Date the note was created. |
| comment      | Text of the comment.       |
