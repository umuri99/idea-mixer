## アプリケーション名
Idea-mixer

## アプリケーション概要
自分で指定したテーマとランダムに出力されるテーマを掛け合わせて新しいアイデアを考えるサービスです。

## URL
https://idea-mixer.herokuapp.com/

## テスト用アカウント
新規アカウント作成時のアカウント認証メールの送信にMailgunを使用しているため、有料登録をしないとMailgunに登録したメールアドレス以外に、メールを送信できないため実質新規アカウント登録はできない状態になっているので、下記のログイン情報を使って、ログインを試してください。  
メールアドレス: ideamixerapp@gmail.com  
パスワード: aaaaaaaa

## 利用方法
ログイン後Mixerページにて、テーマ1の入力フォームに掛け合わせたいテーマを一つ入力して、「Mix」ボタンを押すとランダムなもう一つのテーマが表示されます。 二つのテーマを掛け合わせ３分ほど考えてみて、いいアイデアが思いつかなければ、「やり直す」ボタンを押してください。 もし良いアイデアが思い浮かんだなら、「タイトル」と「アイデアの内容」を記入して「投稿する」ボタンを押して投稿してみましょう。

## 目指した課題解決
私は比較的に楽に新しいアイデアを思いつく方法として２つのパターンを知っているのですが、そのうちの一つが異なる既存のコンテンツを組み合わせることによって新しいアイデアを生み出すことです。  
自分の頭だけで掛け合わせるコンテンツを考えようとすると、ベースとなるコンテンツに近いコンテンツ同士で掛け合わせがちになりますが、掛け合わせるもう一つのコンテンツをランダムで出力してくれる装置があったら、自分の頭で思いつかなかったアイデアやが生まれたりするし、ボタンを押すだけでどんどん掛け合わせる相手のコンテンツが出てくるのでより高速に色々な新しいアイデアが生み出せるのではないかと思い作成しました。

## 使用技術
- Ruby 2.7.4
- Ruby on Rails 6.1.4
- MySQL 5.6.50
- Puma
- Docker/Docker-compose
- CircleCi CI/CD
- Minitest
- Mailgun

## 実装した機能
- ユーザー登録・登録情報変更・ログイン・ログアウト
- ユーザーアイコン画像変更(gravatar)
- 文章投稿・投稿の削除
- 投稿のお気に入り登録(ajax)
- ランダムなテーマの出力
- ページネーション(kaminari)

## データベース設計
![idea_mixer_er](https://user-images.githubusercontent.com/84421494/135770959-c5b40787-372c-4402-9ab1-c28eab8f5498.png)
