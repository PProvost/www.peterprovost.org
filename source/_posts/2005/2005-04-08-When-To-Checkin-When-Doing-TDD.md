---
layout: post
title: "When To Checkin When Doing TDD?"
comments: false
date: 2005-04-08 11:50:00
categories:
 - Technology
subtext-id: aa51b544-ef38-4c36-84a3-4e5272188a24
alias: /blog/post/When-To-Checkin-When-Doing-TDD.aspx
---


Yesterday I was discussing TDD with one of the developers on my project. He is and experienced developer but new to Test-Driven Development.

One of the things that took a little getting used to, other than the whole "write the tests first" part, was the frequent checkin process that most TDD developers use.

He sent me the following TDD workflow asked me, "So when do I checkin?"

  1. Write the test code.
  2. Compile the test code.&nbsp_place_holder;(It should fail because you haven't implemented anything yet.)
  3. Implement just enough to compile.
  4. Run the test and see it fail.
  5. Implement just enough to make the test pass.
  6. Run the test and see it pass.
  7. Refactor for clarity and to eliminate duplication.
  8. Go back to step 1

He pointed out, correctly, that there is a task implied by step 7 which is "Run all of your tests to make sure the refactoring hasn't broken anything." But since I think of the refactoring process as assuming that you do that, I left it out.

But his original question wasn't really about the TDD cycle, per se, but was more about how it relates to the checkin cycle. I suggested the following modified list (I suppose I should draw a nice flowchart for this, but I'm lazy):

  1. Write the test code.
  2. Compile the test code.&nbsp_place_holder;(It should fail because you haven't implemented anything yet.)
  3. Implement just enough to compile.
  4. Run the test and see it fail.
  5. Implement just enough to make the test pass.
  6. Run the test and see it pass.
  7. Refactor for clarity and to eliminate duplication.
  8. Pull updates from the server to get any changes from other people
  9. Compile the code, fix it if it is broken
  10. Re-run all tests, to see if others' changes have broken your tests. If they pass go to step 11 if they fail go to step 5.
  11. Check in the code
  12. Repeat from the top

Another question he asked was if there should be a checkin between step 6 and step 7. I guess I would say, yes if you don't have time right now to do step 7 (e.g. you are going home or something). But if you wanted to commit after step 6, I think you should go to step 8 instead of going to step 11.

HmmmΓÇª maybe this does need a flowchart. If I have time I'll draw one up and post a follow-up.

I'm curiousΓÇª what process do you follow with respect to TDD and source code commits? Does this list ring true with you?
