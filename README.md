# Perplexity-Clone: RAG-Powered AI Search Engine

<video src="perplexity_clone.mp4" controls width="100%" muted autoplay loop></video>


## 💡 Project Overview

**Perplexity-Clone** is a personal project demonstrating a functional clone of an AI-powered search engine (inspired by Perplexity AI). It utilizes a Retrieval-Augmented Generation (RAG) architecture to provide real-time, sourced answers to user queries by searching the web and generating responses using a Large Language Model (LLM).

This project was a significant learning experience in connecting a cross-platform mobile frontend (Flutter) with a high-performance Python backend (FastAPI) and managing external AI APIs.

### 🎥 Dashboard

<img width="1918" height="965" alt="Dashboard" src="https://github.com/user-attachments/assets/5f75b8bc-4408-4262-a47e-1addc30a1c5e" />


## ✨ Features

  * **Real-Time Search:** Integrates the Tavily API to fetch current, relevant web results for any query.
  * **LLM Response Generation:** Uses the Google Gemini API to synthesize search results into a coherent, final answer.
  * **RAG Pipeline:** Manages a complete workflow: Search ➡️ Sort ➡️ Generate (the core of modern, accurate AI applications).
  * **Full-Stack Implementation:** Separate Flutter application for the UI and a dedicated FastAPI service for the AI logic.

-----

## ⚙️ Tech Stack

| Component | Technology | Role |
| :--- | :--- | :--- |
| **Frontend** | Flutter / Dart | User Interface and cross-platform mobile/web client. |
| **Backend** | FastAPI / Python | High-speed API layer, handling RAG orchestration and API calls. |
| **LLM** | Gemini API | Generative model for final answer synthesis. |
| **Retrieval** | Tavily API | Real-time web search and information retrieval. |

-----

## 💻 Installation and Setup

### Prerequisites

1.  **Flutter:** Ensure you have the Flutter SDK installed and configured.
2.  **Python:** Ensure you have Python 3.10+ installed.

### Step 1: Backend Setup (FastAPI)

1.  Navigate to the backend directory (e.g., `server/` or `backend/` depending on your structure).bash
    cd server
    ```
    ```
2.  Create and activate a Python virtual environment to manage dependencies:
    ```bash
    python -m venv venv
    source venv/bin/activate  # On macOS/Linux
    ```

.\\venv\\Scripts\\activate   \# On Windows
`3.  Install the required Python packages:`bash
pip install -r requirements.txt
\`\`\`
*(Note: If you don't have a `requirements.txt`, install dependencies manually: \`pip install fastapi uvicorn python-dotenv gemini-api tavily-api\`)*

4.  **Configure API Keys:** Create a file named `.env` in the `server` directory and add your API keys:

    ```ini
    # server/.env
    GEMINI_API_KEY="YOUR_GEMINI_API_KEY_HERE"
    TAVILY_API_KEY="YOUR_TAVILY_API_KEY_HERE"
    ```

5.  Start the FastAPI server:

    ```bash
    uvicorn main:app --reload
    ```

    The backend will start running, typically at `http://127.0.0.1:8000`.

### Step 2: Frontend Setup (Flutter)

1.  Navigate back to the project root directory.
    ```bash
    cd..
    ```
2.  Install Flutter dependencies:
    ```bash
    flutter pub get
    ```
3.  Ensure your Flutter application is correctly pointing to the FastAPI server address (usually in a constants file).
4.  Run the application on your chosen device or emulator:
    ```bash
    flutter run
    ```
    If running as a web app, ensure you are running on a secure context (HTTPS) or be aware of potential CORS issues connecting to the local backend.

-----

## 🚀 Future Roadmap

This is just the first step\! I plan to implement several advanced features to make this a fully-fledged application:

  - [ ] **Containerization:** Implement **Docker** for the backend to ensure easy, consistent deployment across different environments.
  - [ ] **Conversational Memory:** Add a persistent chat history to allow the LLM to remember context across multiple user turns.
  - [ ] **Hybrid RAG:** Introduce the ability to upload and chat with personal documents (PDFs, images), transforming the system into a hybrid web/local data RAG solution.

-----

## 🙏 Credits and Acknowledgements

This project was created as a significant learning exercise, and I owe a huge debt of gratitude to the resources that guided me.

The foundation of this RAG architecture and its implementation was made possible by the excellent tutorial series provided by:

**Rivaan Ranawat** - Tutorial Link:(https://youtu.be/vPbNnHEjnFU?si=BANevTd-o1maVcus)

Thank you for the detailed guidance on handling complex API integrations\!

```
```
