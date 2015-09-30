---
layout: post
title: 'Unit Testing Gone Bad'
category: uncategorized
---

Sorry but I have to rant for a minute.  I have been working with a team lately that doesn't get unit testing.  In 4 months, this team has been unable to have all 200+ unit tests run successfully.  This to me is an indication that 1) the team does not understand unit testing and its importance, or 2) the team just does not care.  My initial thought is the team does not care, but after today I am starting to think the team just does not understand unit testing.
<br />
<br />Today a programmer committed code changes to CVS with a comment stating that the class failed unit testing with a stack overflow problem.  The programmer apparently cared enough to run the unit tests prior to committing the code but didn't take the time to fix the code, which by the way would have only taken a minute.  Instead of fixing the code he commented in the log message that the class failed unit testing.
<br />
<br />What kills me is the programmer cared enough to run the unit test against his code prior to committing to the source repository and yet didn't care enough to fix the problem.  Did the programmer think the test was falsely reporting an error against his assumed-to-be perfect code?  It is as if the programmer does not realize that the unit test is trying to help him determine problems in his code.  "Yeah, the unit test failed against my code but I know my code is correct so I'm going to commit anyway."  I don't get it.
