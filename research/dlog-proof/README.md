# dlog-proof

zkp for discrete logs

为了实现非交互零知识证明，我们需要使用离散对数问题和 Fiat-Shamir 启发式。离散对数问题是指给定一个素数 p，一个底数 g，和一个数 y，找到一个整数 x，使得 g^x ≡ y (mod p)。在这里，我们将使用此问题来实现非交互零知识证明。

Fiat-Shamir 启发式是一种将交互式协议转化为非交互式协议的技术。它通过在协议的每个交互步骤上将随机数替换为使用哈希函数从先前的步骤中派生的随机数来实现。这样，协议就可以在不进行实际交互的情况下进行。

函数 dlogProof(x, g, p) 接受一个整数 x、一个底数 g 和一个素数 p，并返回残差 y 和证明 pf，证明者知道 x 是 y 的离散对数。函数 verify(y, g, p, pf) 接受一个残差 y、一个底数 g、一个素数 p 和一个证明 pf，如果 pf 是有效的证据，则返回 True，否则返回 False。

在 dlogProof() 函数中，我们首先计算残差 y = g^x (mod p)。然后我们选择一个随机数 r，并计算哈希值 c = H(g, y, r)，其中 H 是 SHA-256 哈希函数。接下来，我们计算一个值 z = r - cx (mod p-1)，然后将残差 y 和证明 pf 作为函数的输出返回。证明 pf 包含两个部分：哈希值 c 和值 z，其中 c 是基于 g、y 和 r 计算得出的哈希值，z 是随机数 r 和 x 的乘积减去 c 的乘积得出的值。

在 verify() 函数中，我们首先解压缩证明 pf。然后，我们计算 v1 = g^z * y^c (mod p) 和 v2 = g^r (mod p)。如果 v1 等于 v2，则证明 pf 是有效的证据，即证明者确实知道 x 是 y 的离散对数。因为哈希函数是单向的，所以在不知道离散对数的情况下，无法通过残差 y 和证明 pf 推导出离散对数 x。