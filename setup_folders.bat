@echo off
REM フォルダ構造を作成するスクリプト（Windows用）

echo プロジェクトフォルダ構造を作成中...

REM 必要なフォルダを作成
if not exist data\company mkdir data\company
if not exist data\service mkdir data\service
if not exist data\customer mkdir data\customer
if not exist images mkdir images
if not exist logs mkdir logs

echo フォルダ構造の作成が完了しました。
echo.
echo 次のステップ:
echo 1. .env.exampleをコピーして.envを作成し、APIキーを設定してください
echo 2. images\フォルダにuser_icon.jpgとai_icon.jpgを配置してください
echo 3. data\フォルダ内の各サブフォルダにPDF、DOCX、TXTファイルを配置してください
echo 4. 'streamlit run main.py'でアプリケーションを起動してください
pause
