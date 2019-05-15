$(function(){
  if ($.cookie('LibnodeFlg') != 'on') {
    tutorial();
  }
});

function tutorial() {
  introJs().setOptions({
    'nextLabel': '次 →',
    'prevLabel': '← 前',
    'skipLabel': 'スキップ',
    'doneLabel': '終了',
    'exitOnOverlayClick': false,
    'showStepNumbers': false,
    steps: [
      {
        intro: "<b>Libnodeへようこそ！</b><br>簡単にLibnodeの機能をご紹介します！"
      },
      {
        element: '#introjs-step1',
        intro: "Libnodeに登録されている全ての書籍を確認できます！"
      },
      {
        element: '#introjs-step2',
        intro: "タイトルやカテゴリから書籍を効率的に検索することができます！"
      },
      {
        element: '#introjs-step3',
        intro: "各書籍の画像をクリックすると、<br>こちらに書籍の詳細情報が表示されます！"
      },
      {
        element: '#introjs-step4',
        intro: "いいね数や貸出数によるランキングを表示し、<br>新たな本との出会いを助長します！"
      },
      {
        element: '#introjs-step5',
        intro: "流行りの技術書を表示します。<br>トレンドへのキャッチアップを目指してください！"
      },
      {
        intro: "<p>Googleアカウントでログインすると『貸出』や<br>『返却』などのメイン機能を使えます。<br>" +
              "書籍番号欄には各書籍の裏側に貼られた<br>QRコードの番号を入力して下さい！<br>" +
              "</p><br><b>動作確認用アカウント(READMEにも記載有り)</b><br>" +
              "・メールアドレス<br>&emsp;3isawa.libnode[at]gmail.com<br>・パスワード<br>&emsp;thisismysecretpasswordthatisverysecure"
      },
    ]
  }).start().onexit(function() {
    $.cookie('LibnodeFlg', 'on', { expires: 30,path: '/' });
  });
}
