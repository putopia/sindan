[call storage="init.ks"]
; ロゴ削除
[freeimage layer="1"]
[bg storage="bg1.png" time=600]

; 初期設定（最初の一回でOK）
[deffont size="30" color="000000"]
[resetfont]

; メッセージウィンドウ（左右余白入り）
[position layer="message0" frame="flame3.png" left=60 top=500 width=1160 height=220 visible=true]

;診断ゲーム：スキルツリー診断
;@title=診断スタート

*start

 [cm]
次の質問に直感的に答えてね！
[l]



;-----------------------------
; スコア初期化
;-----------------------------
[eval exp="pt_01=0"]
[eval exp="pt_02=0"]
[eval exp="pt_03=0"]
[eval exp="pt_04=0"]
[eval exp="pt_05=0"]
[eval exp="pt_06=0"]
[eval exp="pt_07=0"]
[eval exp="pt_08=0"]

;-----------------------------
; Q1
;-----------------------------



[cm]
文章を書くとき、まず大事にするのは？

[glink target="*q1_a" text="伝えやすさ<br>分かりやすさ" x="150" y="200" width="300" color="btn_07_black"]
[glink target="*q1_b" text="感情・雰囲気を<br>伝えること" x="490" y="200" width="300" color="btn_07_black"]
[glink target="*q1_c" text="相手が動いて<br>くれるかどうか" x="830" y="200" width="300" color="btn_07_black"]
[s]

*q1_a
[eval exp="pt_01+=1"]
[eval exp="pt_07+=1"]
[jump target="*q2"]
*q1_b
[eval exp="pt_03+=1"]
[eval exp="pt_06+=1"]
[jump target="*q2"]
*q1_c
[eval exp="pt_02+=1"]
[eval exp="pt_08+=1"]
[jump target=*q2]

*q2
あなたの“強み”はどれに近い？

[glink target="*q2_a" text="情報を整理して<br>伝える" x="150" y="200" width="300" color="btn_07_black"]
[glink target="*q2_b" text="人の気持ちを<br>汲み取る" x="490" y="200" width="300" color="btn_07_black"]
[glink target="*q2_c" text="想像で新しい<br>世界を描ける" x="830" y="200" width="300" color="btn_07_black"]
[s]

*q2_a
[eval exp="pt_01+=1"]
[eval exp="pt_04+=1"]
[jump target="*q3"]
*q2_b
[eval exp="pt_03+=1"]
[eval exp="pt_08+=1"]
[jump target="*q3"]
*q2_c
[eval exp="pt_05+=1"]
[eval exp="pt_06+=1"]
[jump target=*q3]


[cm]

;-----------------------------
; Q3
;-----------------------------

*q3
読者にしてほしい理想のリアクションは？

[glink target="*q3_a" text="わかりやすい！<br>助かった！" x="150" y="200" width="300" color="btn_07_black"]
[glink target="*q3_b" text="心に響いた…<br>感動した…！" x="490" y="200" width="300" color="btn_07_black"]
[glink target="*q3_c" text="もっと読みたい！<br>ハマった！" x="830" y="200" width="300" color="btn_07_black"]
[s]

*q3_a
[eval exp="pt_01+=1"]
[eval exp="pt_04+=1"]
[jump target="*q4"]
*q3_b
[eval exp="pt_03+=1"]
[eval exp="pt_06+=1"]
[jump target="*q4"]
*q3_c
[eval exp="pt_05+=1"]
[eval exp="pt_02+=1"]
[jump target=*q4]

[cm]


;-----------------------------
; Q4
;-----------------------------

*q4
どんな文章を書くのが好き？

[glink target="*q4_a" text="実用的な<br>解説や整理" x="150" y="200" width="300" color="btn_07_black"]
[glink target="*q4_b" text="自分や他人の<br>心情を綴る" x="490" y="200" width="300" color="btn_07_black"]
[glink target="*q4_c" text="小説や創作を<br>形にする！" x="830" y="200" width="300" color="btn_07_black"]
[s]

*q4_a
[eval exp="pt_04+=1"]
[eval exp="pt_07+=1"]
[eval exp="pt_02+=1"] 
[jump target="*q5"]
*q4_b
[eval exp="pt_03+=1"]
[eval exp="pt_08+=1"]
[jump target="*q5"]
*q4_c
[eval exp="pt_05+=1"]
[eval exp="pt_06+=1"]
[jump target=*q5]

[cm]

;-----------------------------
; Q5
;-----------------------------

*q5
あなたが文章に込めたいものは？

[glink target="*q5_a" text="事実や<br>現実の価値" x="150" y="200" width="300" color="btn_07_black"]
[glink target="*q5_b" text="人の声や<br>人生そのもの" x="490" y="200" width="300" color="btn_07_black"]
[glink target="*q5_c" text="あなた自身の<br>想像と表現" x="830" y="200" width="300" color="btn_07_black"]
[s]

*q5_a
[eval exp="pt_01+=1"]
[eval exp="pt_07+=1"]
[eval exp="pt_04+=1"] 
[jump target=*q6_result]

*q5_b
[eval exp="pt_03+=1"]
[eval exp="pt_08+=1"]
[jump target=*q6_result]

*q5_c
[eval exp="pt_05+=1"]
[eval exp="pt_06+=1"]
[jump target=*q6_result]

[cm]

;-----------------------------
; 最後に集計して結果へジャンプ！
;-----------------------------

*q6_result
;ここで最大値を比較する（シンプルにif文でOK）
[if exp="pt_01>=pt_02 && pt_01>=pt_03 && pt_01>=pt_04 && pt_01>=pt_05 && pt_01>=pt_06 && pt_01>=pt_07 && pt_01>=pt_08"]
[jump storage="result_01.ks"]
[endif]

;（以下、他のタイプも同様にif〜jumpを書いていく）
[if exp="pt_02>=pt_01 && pt_02>=pt_03 && pt_02>=pt_04 && pt_02>=pt_05 && pt_02>=pt_06 && pt_02>=pt_07 && pt_02>=pt_08"]
[jump storage="result_02.ks"]
[endif]

[if exp="pt_03>=pt_01 && pt_03>=pt_02 && pt_03>=pt_04 && pt_03>=pt_05 && pt_03>=pt_06 && pt_03>=pt_07 && pt_03>=pt_08"]
[jump storage="result_03.ks"]
[endif]

[if exp="pt_04>=pt_01 && pt_04>=pt_02 && pt_04>=pt_03 && pt_04>=pt_05 && pt_04>=pt_06 && pt_04>=pt_07 && pt_04>=pt_08"]
[jump storage="result_04.ks"]
[endif]

[if exp="pt_05>=pt_01 && pt_05>=pt_02 && pt_05>=pt_03 && pt_05>=pt_04 && pt_05>=pt_06 && pt_05>=pt_07 && pt_05>=pt_08"]
[jump storage="result_05.ks"]
[endif]

[if exp="pt_06>=pt_01 && pt_06>=pt_02 && pt_06>=pt_03 && pt_06>=pt_04 && pt_06>=pt_05 && pt_06>=pt_07 && pt_06>=pt_08"]
[jump storage="result_06.ks"]
[endif]

[if exp="pt_07>=pt_01 && pt_07>=pt_02 && pt_07>=pt_03 && pt_07>=pt_04 && pt_07>=pt_05 && pt_07>=pt_06 && pt_07>=pt_08"]
[jump storage="result_07.ks"]
[endif]

[if exp="pt_08>=pt_01 && pt_08>=pt_02 && pt_08>=pt_03 && pt_08>=pt_04 && pt_08>=pt_05 && pt_08>=pt_06 && pt_08>=pt_07"]
[jump storage="result_08.ks"]
[endif]