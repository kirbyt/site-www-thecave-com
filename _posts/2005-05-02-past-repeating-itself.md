---
layout: post
title: 'Past Repeating Itself'
category: uncategorized
---

I have started work on the application framework for Vertigo.  Well sort of.  \[Vertigo is the code name for the product I have mentioned a couple of times over the last week.\]  I have a very nice framework implemented in C# that has evolved over the years, but Vertigo is being written in Delphi.  And now I face the hardest part...starting with an empty palette.

The last time I did any real work in Delphi was 2000.  At that time starting work on a new project was second nature to me.  In 2001 I decided that C# would be my development language of choice.  I started with an empty palette at that time too and felt much like I do today.

Today it's not Delphi that is second nature to me but C#.  When I start a new project in C# I know exactly how I want to structure the solution file.  I setup my NAnt templates for automated builds, partition the code across multiple projects, typically by tiers, create my NUnit test project, and reference my existing code library already compiled as an assembly.  But today I feel like I don't know where to begin.

Should I start setting up custom VCLs for reusable code?  Should I create a project group with just 2 projects, one for Vertigo and the other for DUnit unit tests?  And how do I structure the Vertigo project?  Should I place interface declarations in one directory and implementations in other directory?  And what part should I start writing first, the translation manager, message stores, pieces of the low-level framework, or the application framework for the presentation?

I have completed the design of certain areas of the application.  I have captured product requirements which have been logged to FogBugz.  I just need to get over this programmer's block.

**Update:** The blog entry did the trick for me.  Programmer's block is over.
