Feature: 受け入れテストの練習
  Scenario: グーグル検索とその結果の表示
    Given 実行環境は 'iPhone Simulator'
    Then 'https://google.com' へアクセス
    Then 検索フォームに 'happy hacking!' と入力する
    Then フォームをsubmitする
    Then 検索結果に遷移したことを確認する
    Then 検索結果をスクリーンショットに保存する
