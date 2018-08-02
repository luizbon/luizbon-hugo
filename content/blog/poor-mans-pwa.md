---
title: "The poor man's Progressive Wep App"
date: 2018-07-31T19:41:37+10:00
draft: false
---

# A bit of context

[*I don't care about the context, show me the solution!*](#solution)

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

According to [Wikipedia](https://en.wikipedia.org/wiki/Progressive_Web_Apps) this is a list of things your app should tick to be called as PWA.

- [ ] Progressive - Work for every user, regardless of browser choice because they’re built with progressive enhancement as a core tenet.
- [ ] Responsive - Fit any form factor: desktop, mobile, tablet, or forms yet to emerge.
- [ ] Connectivity independent - Service workers allow work offline, or on low quality networks.
- [ ] App-like - Feel like an app to the user with app-style interactions and navigation.
- [ ] Fresh - Always up-to-date thanks to the service worker update process.
- [ ] Safe - Served via HTTPS to prevent snooping and ensure content hasn’t been tampered with.
- [ ] Discoverable - Are identifiable as “applications” thanks to W3C manifests and service worker registration scope allowing search engines to find them.
- [ ] Re-engageable - Make re-engagement easy through features like push notifications.
- [ ] Installable - Allow users to “keep” apps they find most useful on their home screen without the hassle of an app store.
- [ ] Linkable - Easily shared via a URL and do not require complex installation.

<a id="solution"></a>With that in mind, let's go to my solution.

# 1. The App

To create the app I used the [Create React App](https://github.com/facebook/create-react-app) project from Facebook. The output is a basic app with a service worker in place.
So with a simple command I can check some items from the PWA list.

- [x] Connectivity independent
- [x] Fresh

This is really nice, but still have some checkboxes to tick.

# 2. Bootstrap

The app looks nice but it does nothing. Knowing I'll need to create a simple form for data input and a table to show the data, I've pulled the [Bootstrap 4](http://getbootstrap.com/) package and changed the inport from index.html.

And now I can tick one more item.

- [x] Connectivity independent
- [x] Fresh
- [x] Responsive

That's really nice, I have an app with 3 checkboxes ticked, but what about the functionality? It's time to write some code.

# 3. React App

I'm not going into much detail here, it's not the intention of the post.

The app consists in a form with three fields pushing into an array and a table with the array contents.

All work fine, but what about persistence? I need to save this data somewhere.

# 4. Firebase

After a quick research I've choosed [Firebase](https://firebase.google.com/) to persist my data. It has a service called [Realtime Database](https://firebase.google.com/products/realtime-database/) where I can save documents.
It's Javascript SDK has support for offline access and syncronization, so I don't lose my **Connectivity independent** tick.

The next challenge is to integrate Firebase SDK to React, that's when come in handy a simple package called [Re-Base](https://github.com/tylermcginnis/re-base), it's integration is very easy and I only needed to write a few lines of code to have everything in place.

After that integration I could say the app was ready. It was saving the data online and offline. Most importantly was the syncronization happening when connection was restablished.
Because the app have a service worker registered, I don't need to open the app to syncronize, it just works.

With the data being saved online, now was time to secure the data.

# 5. Authentication

To solve the Autentication issue Firebase came in handy again. It's SDK has auth integration with [Firebase Authentication](https://firebase.google.com/products/auth/), so I only needed to build a simple account creatiion form and a login page.
After that I configured my database security and it's all in place, each user has access only to their data.

To have another checkbox ticked I need to solve the hosting.

# 6. CI/CD

To deploy my code as easly as possible I choosed [Netlify](https://www.netlify.com/) as it can integrate with a Git repository and do the deployment.
When configuring the app Netlify could identify it was a Create React App application and suggested me the build command. So it was a next>next>finish experience to have my site up and running on my custom domain with a [Let's Encrypt](https://letsencrypt.org/) certificate.

After that I was able to tick on last checkbox

- [x] Connectivity independent
- [x] Fresh
- [x] Responsive
- [x] Linkable
- [x] Safe

# The Result

At the end I spend less than a full day of work of my free time build a fully function app hosted on a HTTPS address with online database and offline capabilities.

If you're curious, below are a couple of screen shots. The source code can be found on [Github](https://github.com/luizbon/pesagem-ventania).

![desktop view](/img/poor-mans-pwa-3.jpeg)
![mobile view](/img/poor-mans-pwa-4.jpeg)