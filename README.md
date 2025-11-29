# 問い合わせ対応自動化AIエージェント

ユーザーがアップロードしたファイル（PDF、DOCX、TXT）の内容を参照して、質問に自動回答するStreamlitアプリケーションです。

## 主な機能

- **ファイルアップロード機能**: PDF、DOCX、TXTファイルをアップロードして、その内容を基に質問に回答
- **RAG (Retrieval-Augmented Generation)**: アップロードされたファイルをベクトル化して、関連情報を検索
- **AIエージェント機能**: より高度な回答生成のためのマルチステップ推論
- **会話履歴**: 過去の会話を記憶して、文脈を考慮した回答を生成
- **ユーザーフィードバック**: 回答の質を向上させるためのフィードバック機能

## 新機能（追加要件の実装）

### 1. ファイルアップロード機能
- メイン画面にファイルアップロードエリアを追加
- PDF、DOCX、TXTファイルをドラッグ&ドロップまたは選択してアップロード
- 複数ファイルの同時アップロードに対応

### 2. アップロードファイルを優先した回答生成
- アップロードされたファイルがある場合、そのファイルの内容を優先的に参照
- ファイルがない場合は、既存のRAGデータベース（`data/`フォルダ）を参照
- どのファイルから情報を取得したか明示

## セットアップ

### 1. 環境構築

```bash
# リポジトリのクローン
git clone https://github.com/kokobayashi-ctrl/ai_agent_chatbot.git
cd ai_agent_chatbot

# 仮想環境の作成（推奨）
python -m venv venv

# 仮想環境の有効化
# Windows
venv\Scripts\activate
# Mac/Linux
source venv/bin/activate
```

### 2. 依存パッケージのインストール

```bash
# 統一版を使用する場合（推奨）
pip install -r requirements.txt

# または、OS固有のファイルを使用する場合
# Macの場合
pip install -r requirements_mac.txt

# Windowsの場合
pip install -r requirements_windows.txt
```

### 3. 環境変数の設定

`.env.example`をコピーして`.env`ファイルを作成し、APIキーを設定してください。

**Windowsの場合：**
```bash
copy .env.example .env
```

**Mac/Linuxの場合：**
```bash
cp .env.example .env
```

**`.env.example`ファイルが存在しない場合：**

プロジェクトルートに`.env.example`ファイルを以下の内容で作成してください：

```
OPENAI_API_KEY=your_openai_api_key_here
SERPAPI_API_KEY=your_serpapi_key_here
```

その後、`.env`ファイルを作成して編集：

```
OPENAI_API_KEY=your_actual_openai_api_key
SERPAPI_API_KEY=your_actual_serpapi_key  # Web検索を使用する場合のみ
```

### 4. データフォルダの準備

既存のRAGデータベースを使用する場合、以下のフォルダ構造を作成してください：

```
ai_agent_chatbot/
├── data/
│   ├── company/    # 会社情報のファイル
│   ├── service/    # サービス情報のファイル
│   └── customer/   # 顧客情報のファイル
├── images/
│   ├── user_icon.jpg
│   └── ai_icon.jpg
└── logs/           # 自動生成されます
```

**注意**: `images/`フォルダに`user_icon.jpg`と`ai_icon.jpg`を配置してください。

## 使い方

### 1. アプリケーションの起動

```bash
streamlit run main.py
```

ブラウザで自動的に開かれます（通常は`http://localhost:8501`）。

### 2. ファイルのアップロード

1. アプリ画面上部の「問い合わせに関連するファイルをアップロード」エリアにファイルをドラッグ&ドロップ
2. または「Browse files」ボタンをクリックしてファイルを選択
3. 対応形式: PDF、DOCX、TXT
4. 複数ファイルの同時アップロード可能

### 3. 質問の入力

画面下部のチャット入力欄に質問を入力して送信してください。

### 4. AIエージェント機能の切り替え

サイドバーで「AIエージェント機能の利用有無」を選択できます：

- **利用する**: より高度な推論を行い、複数のデータソースを参照
- **利用しない**: シンプルなRAG検索で高速に回答

### 5. フィードバックの提供

AIの回答後、「はい」「いいえ」のフィードバックボタンが表示されます。回答の質向上にご協力ください。

## プロジェクト構成

```
ai_agent_chatbot/
├── main.py                    # メインアプリケーション
├── components.py              # UI コンポーネント
├── constants.py               # 定数定義
├── initialize.py              # 初期化処理
├── utils.py                   # ユーティリティ関数
├── requirements.txt          # 統一版依存パッケージ（推奨）
├── requirements_mac.txt       # Mac用依存パッケージ
├── requirements_windows.txt   # Windows用依存パッケージ
├── .env.example              # 環境変数テンプレート
├── .gitignore                # Git除外設定
├── README.md                 # このファイル
├── data/                     # RAG用データフォルダ
├── images/                   # アイコン画像
└── logs/                     # ログファイル（自動生成）
```

## 技術スタック

- **Streamlit**: Webアプリケーションフレームワーク
- **LangChain**: LLMアプリケーション開発フレームワーク
- **OpenAI GPT-4**: 言語モデル
- **Chroma**: ベクトルデータベース
- **PyMuPDF, Docx2txt**: ドキュメント処理

## トラブルシューティング

### エラー: "OpenAI API key not found"
- `.env`ファイルに正しいAPIキーが設定されているか確認してください

### ファイルアップロードがうまくいかない
- ファイル形式がPDF、DOCX、TXTであることを確認してください
- ファイルサイズが大きすぎる場合は、分割して複数ファイルとしてアップロードしてください

### 回答生成が遅い
- AIエージェント機能をオフにすると高速化します
- GPT-4からGPT-4o-miniなど、より軽量なモデルに変更できます（`constants.py`の`MODEL`を編集）

## ライセンス

このプロジェクトはMITライセンスの下で公開されています。

## サポート

問題が発生した場合は、Issuesセクションで報告してください。
