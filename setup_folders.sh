#!/bin/bash

# フォルダ構造を作成するスクリプト

echo "プロジェクトフォルダ構造を作成中..."

# 必要なフォルダを作成
mkdir -p data/company
mkdir -p data/service
mkdir -p data/customer
mkdir -p images
mkdir -p logs

echo "フォルダ構造の作成が完了しました。"
echo ""
echo "次のステップ:"
echo "1. .env.exampleをコピーして.envを作成し、APIキーを設定してください"
echo "2. images/フォルダにuser_icon.jpgとai_icon.jpgを配置してください"
echo "3. data/フォルダ内の各サブフォルダにPDF、DOCX、TXTファイルを配置してください"
echo "4. 'streamlit run main.py'でアプリケーションを起動してください"
