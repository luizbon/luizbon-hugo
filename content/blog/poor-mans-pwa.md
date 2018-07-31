---
title: "The poor man's Progressive Wep App"
date: 2018-07-31T19:41:37+10:00
draft: true
---

Last week my father sent me a message asking if I could build an electronic spreadsheet of the following image.

![plan](/img/poor-mans-pwa-1.jpeg)

Looking at the image I promptly reply with "Can't you use Excel for this?"

Then when I got home I opened my Excel and started to create a simple plan with the data from the image and that's when I saw the notes.

![instructions](/img/poor-mans-pwa-2.jpeg)

This note says "Days = Difference between previous and actual date". This was the moment when my Excel skills failed me!
I tried to create a form input, but my research led me to some Visual Basic code and good old visual designer which I don't want to play with it anymore.
So I stopped and put some thinking on the issue.

- "What are my options?"
- "What do I know?"
- "This thing need to work on an offline environment" - There's no internet where he use this

Building a desktop app means I'll need to create a setup, send to him, control the installation and updates. So is not a good option.
A web page seems simpler to solve the deployment, I'm currently working with React, so no learning curve.

Based on this I though about doing an PWA app.
