---
title: "An MCP registry isn't enough. You need a review gate too"
date: 2026-08-28T09:00:00+10:00
draft: false
---

I wrote about [setting up an MCP Registry with Azure API Center](/blog/setup-mcp-registry) last year. That post covers the mechanics: register your MCP servers, expose an endpoint, point Copilot at it, restrict access to registry-only. It works, and it's a real control. But a registry alone answers one question: is this server on the approved list? It doesn't answer the harder one: should it be.

That second question is what an agentic security review is for.

## The gap a static registry leaves open

A registry is a list someone maintains. Someone has to decide what goes on it, and that decision usually happens once, at onboarding time. The problem is that an MCP server's behaviour isn't fixed at onboarding. It can change with an update, expose a tool it didn't before, or request a data scope nobody reviewed the second time around. A registry checks membership. It doesn't check behaviour.

The obvious fix is a manual review before every server (or update) goes on the list. It doesn't scale. Review capacity stays flat while the number of servers and updates keeps growing, and a slow review queue is indistinguishable from a "no" to an engineer trying to ship this sprint. Slow the queue down enough and people stop asking, which brings back the exact shadow-tooling problem the registry was meant to solve.

## Putting the review in CI instead

We run the security review as a CI step, in the same pipeline that already runs tests and static analysis, triggered whenever an MCP server is added or updated. An agent checks the server's declared scopes against what it actually requests at runtime, looks at outbound network calls, and confirms the tool surface it exposes matches what it claims to expose. A failing review blocks the merge.

That timing matters more than the checks themselves. Putting the review in CI means it fires at the point a real decision gets made, a merge to a branch that will actually run, rather than at a hypothetical "can I use this" moment that may or may not turn into real usage. An engineer can pull a server down and try it locally without waiting on anyone. The review only has an opinion once there's something worth reviewing.

## What this costs

Nothing here is free. Someone can spend an afternoon on a server that fails review a day later, which is a worse experience than knowing up front. We accepted that trade deliberately. Wasted local experimentation is a smaller cost than either unreviewed tooling sitting in production or a review queue so slow that people route around it.

## Where this sits in the wider conversation

Security and governance around agentic tooling dominated the conversation at RSAC 2026 and the MCP Dev Summit this year, and most of that conversation comes from platform teams at large tech companies or from security vendors. Less of it comes from engineering leaders at mid-size, regulated companies who built a governance layer because they needed one operating day to day, not because it's the product. That's the gap this post and the last one are trying to close from our side of the fence.

If you've built something similar, or hit different failure modes putting a review gate in front of MCP adoption, I'd like to hear about it.
