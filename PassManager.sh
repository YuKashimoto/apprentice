#!/bin/bash
echo "パスワードマネージャーへようこそ！"

while true; do

read -p "次の選択肢から入力してください(Add Password/Get Password/Exit)" select

#Add Passwordが入力された時

if [ "$select" =  "Add Password" ]; then

read -p "サービス名を入力してください：" service
read -p "ユーザー名を入力してください：" user
read -p "パスワードを入力してください：" pass

echo $service $user $pass >> data.txt

echo "パスワードの追加は成功しました。"

#Get Passwordが入力されたとき

elif [ "$select" = "Get Password" ]; then

read -p "サービス名を入力してください：" serchservice
#サービス名が存在するとき
	 if [ -n "$serchservice" ]; then
echo "サービス名：$serchservice"
echo "ユーザー名：$(grep "^$serchservice" data.txt | cut -f 2 -d " ")"
echo "パスワード：$(grep "^$serchservice" data.txt | cut -f 3 -d " ")"
#サービス名が存在しない場合
	else
echo "そのサービスは登録されていません。"
	fi

#Exitが入力されたとき

elif [ "$select" =  "Exit" ]; then

echo "Thank you!" #プログラムが終了
exit


#Add Password/Get Password/Exit 以外が入力された場合
else
echo "入力が間違えています。Add Password/Get Password/Exit から入力してください。"

fi

done
# パスワードマネージャーへようこそ！

# # Add Password が入力された場合
# サービス名を入力してください：
# ユーザー名を入力してください：
# パスワードを入力してください：
#
# パスワードの追加は成功しました。
# 次の選択肢から入力してください(Add Password/Get Password/Exit)：
#
# # Get Password が入力された場合
# サービス名を入力してください：
# ## サービス名が保存されていなかった場合
# そのサービスは登録されていません。
# ## サービス名が保存されていた場合
# サービス名：hoge
# ユーザー名：fuga
# パスワード：piyo
#
# 次の選択肢から入力してください(Add Password/Get Password/Exit)：
#
# # Exit が入力された場合
# Thank you!
# ## プログラムが終了
#
# # Add Password/Get Password/Exit 以外が入力された場合
# 入力が間違えています。Add Password/Get Password/Exit から入力してください。
