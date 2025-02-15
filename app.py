import streamlit as st
import pandas as pd
import numpy as np

# タイトルを設定
st.title('シンプルなStreamlitアプリ')

# サンプルデータフレームの作成
sales_data = {
    'date': pd.date_range(start='2024-01-01', periods=7, freq='D'),
    'sales': [120, 150, 80, 200, 170, 220, 190],
    'customers': [25, 30, 15, 45, 35, 50, 40]
}
data = pd.DataFrame(sales_data)

# データフレームを表示
st.subheader('サンプルデータ')
st.dataframe(data)

# グラフを表示
st.subheader('折れ線グラフ')
st.line_chart(data.set_index('date'))

# スライダーを追加
number = st.slider('数字を選んでください', 0, 100, 50)
st.write(f'選択された数字: {number}')