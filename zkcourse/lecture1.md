# 初识零知识证明

## 题目

* <https://zkshanghai.xyz/notes/exercise1.html>

## 三染色问题

demo: <https://zkshanghai.xyz/interactive/graph.html>

练习 1：目前，您只能选择相邻的节点对进行检查。如果您可以选择任意节点对来检查，证明仍然是零知识吗？

不是，因为违反了 ZKP 的 Soundness 原则，也就是说，如果 prover 提供的错误的证明，verifier 有可能接受它。

练习 2：当前用于置信度的方程是 1-(1/E)^n，其中 E 是图中的边，n 是运行试验的次数。这是正确的等式吗？为什么没有先验？

是的，因为每轮实验都是独立的，所以可以用乘法原理。

## DLOG 的 ZKP

[dlog-proof](/research/dlog-proof)

## zkmessage.xyz

在 zkmessage 上创建一个帐户并发布消息，这是一个由 zkSNARK 支持的匿名留言板。

> 解释为什么你需要生成并保存一个“秘密值” 。

在 zkmessage 上创建帐户并发布消息需要进行匿名性验证，这是通过 zkSNARK 实现的。为了实现这一点，我们需要在客户端生成并保存一个“秘密值”，这个秘密值可以用于生成 zkSNARK 证明中的证明密钥。证明密钥是在验证阶段用于验证证明的重要组成部分，它必须保密并只能由拥有它的用户使用。

> 用白话写出 ZK 中正在证明的陈述。

在 zkSNARK 中，我们需要证明某个语句是真的，但是不能公开语句的内容或证明的方法。因此，我们使用一些技巧来证明这个语句的真实性，而不暴露任何关于这个语句的信息。我们生成一个证明，这个证明是使用语句的公共参数和证明密钥生成的，这个证明能够证明语句是真的，但不会泄漏任何关于语句的信息。

> 从不同的浏览器或计算机登录到相同的 zkmessage 帐户。解释为什么 zkmessage 不能像大多数社交应用程序一样，只使用简单的“用户名/密码” 。

如果我们使用简单的用户名和密码，那么 zkmessage 帐户将无法保持匿名。因为这些凭据是直接与用户关联的，并且可以通过这些凭据直接找到用户。而使用 zkSNARK 证明则允许用户在不暴露其身份的情况下创建和发布消息，同时保护他们的隐私。因此，zkmessage 使用 zkSNARK 证明保证用户的匿名性。