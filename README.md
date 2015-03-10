#対象と趣旨
このページは，PCの性能をFPGAで高速化するために，ハードウェアプロトコルを理解しようというもので，村井研@SFCと以下のような極々一部の初・中級者を対象とするFPGAチュートリアルです．

 1. PCや拡張ボードなど既存製品の機能や性能に不満があり自作で追求したい方．10Gイサーネットでは最低ギャップで常に上り下りパケットがきつきつに埋まった状態にもできるし，PCI Expressバスでは上下方向，常にどのサイクルでも（フロークレジットが許す限り）データを流すことができる設計にしたい，HDMIなら4Kを直接しゃべりたい．もちろん低遅延は当たり前．
 2. 覚えたいのは標準仕様プロトコルで，ベンダーに依存した高レイヤーのIP (Intellectual Property)はなるべく使いたくない方．実装に必要なところだけ自分でしゃべって，性能を追求したいし，Logic synthesisやPAR (Place And Route)の時間を削減したい．MacBook買えるくらいのFPGAボード買ったからIP買うなんてもう無理という方．

#メニュー（公開済みと予定）

##[1. FPGAで10G Ethernet (XGMIIの勉強)](https://github.com/tmatsuya/wiki/wiki/FPGA_10G)
![](https://github.com/tmatsuya/wiki/blob/master/figs/10g_fpga_sfpp.png)

 FPGAを使って，MAC IPを使わず10G Ethernetを使う方法について興味のある方向け

 Xilinx Kintex-7 (KC705 Board)を使っていますが，XGMII を直接たたいているので、
 他のFPGAやASICでも参考になるはず．

##2. FPGAでPCI Express (TLPの勉強)

（準備中）

 MMIO (Memory Mapped I/O)と拡張BIOS ROMブートをサポートするスレーブ実装と，バスマスター実装の2つのプロジェクト

 Xilinx Kintex-7 (KC705 Board)を使っていますが，TLP (Transaction Layer Protocol)を直接たたいているので、
 他のFPGAやASICでも参考になるはず．
 LinuxでのPCI Expressのドライバーコードの解説つき．

##3. FPGAでHDMI (4Kモニター，カメラ，オーディオ)

（準備中）

#補足
 1. 表タイトルは表の上，図と写真のタイトルは下に記載しています．
 2. チュートリアルなので効率より可読性を優先したコードにしてあります．
 3. 今後，英語版でも共通できるように，図内は英語表記にしてあります．
 4. HDLはVerilog HDLを使用しています．理由は某CPU，某GPUなどメジャーなものはVerilog HDLやSystem Verilogで記述されているものが多いからです．( https://www.linkedin.com/job/ で"verilog"か"vhdl" でキーワード検索すれば今の会社ごとの求人傾向がわかるかも）