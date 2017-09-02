---
title: "Lessons learned from a conference ChatBot"
date: 2017-09-02T19:45:24+10:00
draft: false
---

This year I worked as a volunteer at [NDC Sydney](https://ndcsydney.com/), and since I was involved with it, I decided to write a Bot to help attendees find sessions.

The ChatBot started simple answering questions related to sessions and speakers. It returns an [adaptive card](http://adaptivecards.io/) with all information about each session.

Having all sessions wasn't enough, so I added integration with [QnAMaker](https://qnamaker.ai/), just in case a user asks about something not related to the sessions.

At this point, I wasn't happy yet, so I went one step further and added integration with [Bing search](https://azure.microsoft.com/en-us/services/cognitive-services/bing-web-search-api/) to make sure the user will always receive an answer.

So far so good, what can go wrong? I was using adaptive cards, the content looked great, all information was there, I was covering FAQs and a fallback to Bing search.

Before the conference starts, I asked my colleagues to test the Bot, is always good to ask someone else test your code. The testing data improved the LUIS model, and answers get better.

That's when I started to realise that I needed to improve some things. The first one was the responsiveness. Yes, a ChatBot needs to be responsive. It needs to work on desktop and mobile since I wasn't integrating with any app, the web interface required to be responsive.

*So first tip*: **A ChatBot will not save you from the multi resolution devices issue, it is a lot simpler to solve though.**

With the responsiveness solved, I figured out another problem. The conference agenda has changed. Yes, this is an issue, cause I decided to use a local JSON file with all the data, this means I needed to check the whole agenda and update my file, luckily it didn't change much, and it was easy to update.

At this point, I was pretty confident with the Bot, from all the feedback I received from my colleagues the major ones were easy to fix, and others were just a case to train the [LUIS](https://www.luis.ai/) model. So I started to make improvements and have better cards which show more data from the speaker.

When the conference started, and I was happy with the usage, till I find the first issue. The agenda has changed again. I just figured out when an attendee came to me asking about a session supposed to be in a room but was a different one. I promptly checked with the bot and the data was matching with his printed agenda, but after checking the website, I realised it was wrong again. At this point how do I update the agenda without a laptop? No luck here, I tried to stop thinking about it and enjoyed the conference. We can't win all the time.

On the next day, I was free in the morning, so I brought my laptop and updated the agenda quickly, that's when I realised that having too much data from a session wasn't working well, sometimes the results weren't displaying correctly.

*Here it comes the next tip*: **When showing multiple results, make sure they all have similar content.**

This day I missed the first session working on the result cards and added another result view based on the speaker. With the new cards, the result was consistent, and the user could click on a button to show extra information.

Overall the experience was positive, and I'll do it again, with some different decisions.

*And one last tip*: **A conference agenda is always changing, so is the website does not use an API, make sure you have an easy way to update your data.**