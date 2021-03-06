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
- It lets me (or you) record issues, or change requests.

Why is it so unconfigurable?
- The workflow seems good.
  - Open ticket.
  - Write code.
  - Unit test.
  - Code review.
  - Integration test. (Pass for an alpha-quality product.)
  - System test. (Pass for a beta-quality product.)
  - Ship it!

Why not use something that is already full-featured and good, like Trac?
- Sometimes I need something very lightweight, quick to deploy, maintenance free, and private.  I could not find anything like that, so I wrote Slim.

How to I set it up, install it, and configure it?
- You don't.  Put **slim** and **slim.html** into a directory with write access and run **slim -h**.  Run **slim --server** if you want to live on the edge.

What can I use for an issue-id?
- You must use one or more digits (0-9) for an issue-id. This is because custom functions are made on-the-fly, each named for an issue-id. Should this be refactored?  Yeah, probably.

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
| issue-id              | Unique identifier for the issue.         |
| desc                  | Brief description of the issue.          |
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
| issue-id     | Reference to an issue id.  |
| date-created | Date the note was created. |
| comment      | Text of the comment.       |

## Copyright

> Copyright (c) 2015 Thomas S. Phillips.
>
> Permission is hereby granted, free of charge, to any person obtaining a copy
> of this software and associated documentation files (the "Software"), to deal
> in the Software without restriction, including without limitation the rights
> to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
> copies of the Software, and to permit persons to whom the Software is
> furnished to do so, subject to the following conditions:
>
> The above copyright notice and this permission notice shall be included in
> all copies or substantial portions of the Software.
>
> THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
> IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
> FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
> AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
> LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
> OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
> THE SOFTWARE.
