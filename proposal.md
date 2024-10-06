# VimConf 2024 Proposal

## Title

Vim meets Local LLM: Edit Text beyond the Speed of Thought

## Abstract

発表の目的はローカルLLMによるコード生成プラグインの作り方を共有することにより、同様のプラグインの開発を活発化させることです。
難しいことをしているように思えるかも知れませんが、いくつかのポイントをおさえれば実現可能です。
Vimのプラグインとして開発するために必要な知識を共有するので、一緒に開発していきましょう。
また現状の課題を共有することにより、生成するコードの質の向上やよりよいUIについての議論も活発化したいと考えています。
↓
The purpose of the presentation is to share how to create a local LLM code generation plugin and to stimulate the development of similar plugins.
This may seem like a difficult task, but it can be achieved by following a few points.
We will share the knowledge needed to develop it as a Vim plugin, so let's develop it together.
By sharing current issues, we also want to stimulate discussions about improving the quality of the generated code and a better UI.
↓
The goal of this presentation is to guide you through the process of building a local LLM code generation plugin. We aim to inspire the creation of similar tools and foster collaboration among developers.
While this might sound challenging, we'll break it down into manageable steps. We'll focus on building a Vim plugin together, sharing the essential knowledge along the way.
By openly discussing current limitations, we hope to spark conversations about enhancing code quality and improving the user interface. Let's work together to create a valuable tool for the community.

あなたは思考の速度でテキスト編集していますか。
私は思考の速度でテキスト編集していますが、思考がしばしば止まります。
思考が止まっている間、LLMにテキストを書いてもらう事により、思考の速度を上回る速さでテキスト編集が可能です。
本発表ではローカルLLMによるコード生成プラグインの作り方や課題を共有します。
我々で同種のプラグインの開発を活発にし、Vimでの生産性を向上しましょう。
↓
Are you editing text at the speed of thought?
I'm editing text at the speed of thought, but my thoughts often come to a standstill.
By having an LLM write text for me during these pauses in thought, I can edit text faster than the speed of thought.
In this presentation, I will share how to create a code generation plugin using a local LLM and the challenges involved.
Let's actively develop similar plugins together and improve our productivity in Vim.

## Pitch for reviewers

Please promote yourself and your talk for us in English or Japanese.
You can use markdown to format.
We can accept link to Gist, Scrapbox, etc.

## 発表の目的

- VimでローカルLLMを使って思考の速度を越えたい
- LLMを活用してコードを生成するプラグインの開発も活発にしたい
  - LLMを活用するプラグインは数あるが、コードを生成するプラグインは少ないように感じている
- VimでローカルLLMを使った生産性の向上についての議論を活発にしたい

## 対象者

- VimでのローカルLLM/コード生成に興味がある人
- プラグインを自分でも作ってみたいが、何を調べて良いかとっかかりが掴めない人
- プログラミングができる人(VimのAPIの知識は求めない)

## 登壇者について

- Vim/Neovim pluginを作成することができる
  - [Ollamaを用いたAIコード生成プラグイン](https://github.com/yuys13/collama.nvim)
  - [asyncompleteのzshソース](https://github.com/yuys13/asyncomplete-zsh.vim)
- Vim/Neovim pluginにPRを送ることもできる
  - null-ls.nvim, dracula/vim, gen_tags.vimなどにPRを送った
- プラグインを使い初めたのは10年くらい前
  - 記録に残していないが、NeoBundleやNeoCompleteあたりの時期
  - ただこの頃は実用していなかった
  - ほとんど素のVimとIDEを併用したりしていた
- vimをメインで本格的に使い初めたのは2017年頃
  - 最初は得意な言語しか使わなかったので補完があればタグジャンプとgrepで十分だった
  - その後LanguageClient-neovimの登場からNeovimメインとした

## 話そうと考えていること

- 導入
  - 実現したいことの説明
    - collama.nvimのデモを見せて、こういう事がやりたいと示す
    - collama.nvimのUIの思想。思考の速度を越えるとは？
      - 思考が止まった時に手伝ってくれるという考え方
  - 今回話したいことの説明
    - Ollamaの簡単な使い方の説明
    - FIM(Fill-In-the-Middle)の簡単な説明
    - Vim/Neovimからの活用方法の紹介
    - これからのAIによるコード生成について
  - なぜローカルLLMなのか？
    - 業務では生成AIを使いたくても使えないことは多い(と思う)
      - ローカルLLMなら業務での利用範囲が増える
    - 昨今のマシン性能なら結構イケる
- Part.1 Ollamaの簡単な使い方について
  - CLIでの利用方法
  - APIでの利用方法
- Part.2 FIM(Fill-In-The-Middle)の説明
  - LLMは「続き」を生成するが、「中間」を生成する手法について
  - OllamaでFIMを実行する方法
- Part.3 Vim/Neovimからの活用方法の紹介
  - collama.nvimを実現するためのVim/NeovimのAPIの紹介
    - 非同期でcurlを呼び出す方法
    - バッファ内のカーソル前後のテキストの取得方法
    - 候補をバッファ内に表示する方法(textprop/extmark)
    - 候補をバッファに書き出す方法
- Part.4 これからのAIによるコード生成について
  - a. 生成するコードの質の向上
    - 今回の手法ではバッファの内容から推論させているが、もっと良い方法があるはず
      - import文を展開してから送る
      - RAGのようにimportしているプロジェクト内のソースコードをcontextとして与える
      - Language Serverと強調して関係するソースを取得して送る
      - etc.
  - b. Vim/Neovimで思考を妨げないUIの模索
    - 自分なりに思考を妨げず、無いよりはあった方が良いというUIを構築したつもりだが、
      もっと良い方法があるはず
      - 編集しているバッファを見た目だけでも変更して欲しくない
      - 生成されたコードをもっとじっくり確認してから適用したい
      - 複数の候補から選択したい
      - などの欲求は当然出てくるはず
- まとめ
  - OSS開発者にとってまだまだ伸び代があると考えている
  - みんなで色々作って試して、よりよい開発環境を構築していきましょう!

## なぜ私が登壇しなくてはいけないのか？

- 自己評価としてはただのVimmer
  - 人に使われるようなOSSを作れてもいないし、特定の分野で活躍している訳でもない
- そんな一般的なVimmerでも作れるなら、自分にも出来そうと思ってもらいたい
- 私が登壇することによって、目立った実績が無くとも応募して良いんだという実績を作り、
  今後のVimConfで多様な発表者が生まれて欲しい

## 懸念事項

- カンファレンスの登壇経験が無いため漠然とした不安はある
- 英語も自信は無いので、正しいニュアンスでスライド作成できるか不安
