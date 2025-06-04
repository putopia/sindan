;虚構の編者（ファブラー）
*result_05
[layopt layer=message0 visible=false]

; --- トランジション＆貯め演出 ---
[bg storage="bg3.png" time=100]
[trans layer=base time=800 method=crossfade]
[wt 1200]
[bg storage="result_05.jpg" time=1000]
[wt 500]

[cm]

[s]

[button text="もう一度診断する" x=200 y=480 width=300 height=50 fontsize=22 target=*back_to_title]

*back_to_title
[jump storage="first.ks" target="*start"]

