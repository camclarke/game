# Gotcha #NN — <the rule, as one sentence>

> Numbers are permanent: code comments, plans and QA logs cite `gotcha #NN`.

**Found:** <YYYY-MM-DD> · <finding ID / PR # / commit>

## What happened

The symptom, and what it looked like at first. Include the wrong first diagnosis if there was one; it's often the most useful part.

## Mechanism

One level below the symptom. Label facts and hypotheses.

## The rule

What to always or never do. Prefer a mechanism (a test, a guard, a shared module) over "be careful".

## How to check you're not breaking it

The test name, console command, probe or grep.

## Still open

What this did NOT fix.
