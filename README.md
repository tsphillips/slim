# slim: Super-Lightweight Issue Manager

Issue tracking software is often cumbersome and overkill for small projects.  Slim is a very low-impact issue tracking system.

- Issues do not have an explicit state.
- Records dates issue was successfully tested (unit, integration, system).

## Components

| Component    | Description                                     |
|:-------------|:------------------------------------------------|
| slim         | The main executable. This is a python script.   |
| slim.html    | A web interface to the slim database.           |
| slim.sqlite3 | A SQLite3 database that contains issue records. |

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

| Field   | Description                |
|:--------|:---------------------------|
| id      | Reference to an issue id.  |
| date    | Date the note was created. |
| comment | Text of the comment.       |
