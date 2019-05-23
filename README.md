# nim-release-sample

[![Build Status](https://travis-ci.org/jiro4989/nim-release-sample.svg?branch=master)](https://travis-ci.org/jiro4989/nim-release-sample)
[![Build status](https://ci.appveyor.com/api/projects/status/3sxolceoniegn1n3?svg=true)](https://ci.appveyor.com/project/jiro4989/nim-release-sample)

NimでCI環境を利用して実行ファイルを生成してGitHubReleaseにリリースする。

# 目的

Nimで各プラットフォーム向けに実行可能ファイルを生成してGitHubReleaseにリリースできるようにすること。

各プラットフォーム向けに実行可能ファイルを生成するのだとGo言語がよく話題に上がる。
Goは言語自体がクロスコンパイルをサポートしているのが非常に強力である。
僕も今までクロスコンパイルが可能である点や開発がすごくやりやすい言語仕様などの様々な利点から
Goで開発をしていた。

しかしながら、他の言語でもCLIを作ってみたくなったので、このプロジェクトではNimを使用して
簡易なCLIツールを作成した。

NimではGoのようにクロスコンパイルは可能でないが、CI環境を利用することでクロスコンパイルを可能とする。
ここではTravisCIとAppVeyorを使用して、Windows向け、Linux向け、MacOS向けのバイナリをそれぞれ生成し、
TagをPushした時を契機にGitHubReleaseにリリースできるようにしたもの。

# やること

以降のテキストは僕がハマったとこを備忘録的にメモしただけのものなので余り参考にならないと思う。
.travis.ymlとappvayor.ymlを直接見たほうがずっと参考になると思う。

## TravisCI

- TravisCIのSettingsからプロジェクトをCI対象に登録する
- TravisCIのプロジェクトの画面から"More options" -> "Settings"
- Environment VariablesにGitHubのAuth tokenを追加
- 登録した環境変数を`deploy`タスクの`api_key`に指定する

## AppVeyor

- AppVeyorにプロジェクトを登録する
- プロジェクトのSettingsタブを開く
- Deployments -> GitHub Releases を選び、GitHub Authentication tokenにトークンを追加
- Export YAMLタブを選択肢、encryptで暗号化されたキーをコピー
- appveyor.yamlの`dpeloy`:`auth_token`:`secure`に暗号化されたキーを登録
- あとはモニョモニョ設定する

# はまったこと

この指定を忘れていた。
ここでzipという名前を、後続の`deploy`で使う。

```
artifacts:
  - path: nim_release_sample_windows.zip
    name: zip
```
