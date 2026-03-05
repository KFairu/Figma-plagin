# 3D Reveal Pro — Figma Plugin

> Cinematic 3D brush-mask reveal between two Figma frames.
> Кинематографический 3D-эффект кисти-маски между двумя фреймами Figma с картами глубины.

---

## Contents / Содержание

- [English Guide](#english-guide)
- [Русская инструкция](#русская-инструкция)
- [Troubleshooting / Решение проблем](#troubleshooting)

---

## English Guide

### What the Plugin Does

**3D Reveal Pro** exports two Figma frames, sends them to a local server that generates depth maps, then renders an interactive 3D scene. A soft brush-mask sweeps through the canvas, "revealing" the second frame beneath the first.

- **Photo mode** — WebGL 3D with parallax depth (requires local server)
- **Video mode** — Upload two video files, brush reveal effect, no server needed
- **Recording** — Export as `.mp4` / `.webm`

> **Note:** The plugin is currently under review for the Figma Community.
> Install locally using the steps below.

---

### Requirements

| Requirement | Version |
|-------------|---------|
| Figma Desktop | Latest |
| Python | 3.8 or newer |
| Operating System | macOS 11+ or Windows 10+ |
| RAM | 4 GB+ (8 GB recommended) |
| Internet | Required once (to download the depth model, ~200 MB) |

---

### Installation — macOS

#### Step 1: Download the Plugin

```bash
git clone https://github.com/KFairu/Figma-plagin.git
cd 3d-reveal-pro
```

Or download the ZIP and unzip it.

#### Step 2: Install the Server Dependencies

```bash
bash setup-mac.sh
```

This creates a Python virtual environment and installs all required packages.
**First run takes 3–5 minutes** (downloading PyTorch + transformers).

#### Step 3: Start the Server

```bash
bash start-server-mac.sh
```

Wait for:
```
✅ Сервер карт глубины готов! Ожидание запросов от Figma на порту 5000...
```

**Keep this terminal window open** while using the plugin.
The first launch also downloads the depth model (~200 MB).

#### Step 4: Install the Plugin in Figma

1. Open **Figma Desktop** (the desktop app, not the browser)
2. Go to **Menu (☰) → Plugins → Development → Import plugin from manifest...**
3. Navigate to the `plugin/` folder inside this repo
4. Select `manifest.json`
5. The plugin now appears under **Plugins → Development → 3D Reveal Pro**

#### Step 5: Use the Plugin

1. In your Figma file, create or select **2 frames** (Frame 1 = Base, Frame 2 = Reveal)
2. Select both frames (hold Shift and click each)
3. Go to **Plugins → Development → 3D Reveal Pro**
4. The plugin opens and processes both frames
5. Move your mouse over the canvas to reveal the second frame through the brush

---

### Installation — Windows

#### Step 1: Download the Plugin

Download the ZIP from the [Releases page](../../releases) and unzip it,
or use Git Bash:
```bash
git clone https://github.com/YOUR_USERNAME/3d-reveal-pro.git
```

#### Step 2: Install Python (if not installed)

1. Download Python 3.8+ from [python.org](https://www.python.org/downloads/windows/)
2. During installation: **check "Add Python to PATH"** ✅
3. Restart your computer after installation

#### Step 3: Install the Server Dependencies

Double-click `setup-windows.bat`
or run in Command Prompt:
```cmd
setup-windows.bat
```

This installs all Python dependencies into a virtual environment.

#### Step 4: Start the Server

Double-click `start-server-windows.bat`
or run in Command Prompt:
```cmd
start-server-windows.bat
```

Wait for:
```
✅ Сервер карт глубины готов! Ожидание запросов от Figma на порту 5000...
```

**Keep this window open** while using the plugin.

#### Step 5: Install the Plugin in Figma

1. Open **Figma Desktop**
2. Go to **Menu → Plugins → Development → Import plugin from manifest...**
3. Select `plugin/manifest.json` from the repo folder
4. Run via **Plugins → Development → 3D Reveal Pro**

---

### Using the Plugin

#### Photo Mode (requires server)

| Step | Action |
|------|--------|
| 1 | Select 2 frames in Figma |
| 2 | Run the plugin |
| 3 | Wait for depth processing (10–30 sec) |
| 4 | Move mouse — brush reveals the second frame |
| 5 | Click "Начать запись" to export MP4 |

#### Video Mode (no server needed)

| Step | Action |
|------|--------|
| 1 | Run the plugin with any 2 frames selected |
| 2 | Switch source to "Видео" |
| 3 | Upload Base video and Reveal video |
| 4 | Move mouse — brush reveals the Reveal video |
| 5 | Record and export |

#### Settings

| Panel | Controls |
|-------|----------|
| Source | Photo / Video · Record / Code mode |
| Background | Base/Reveal colors · Topographic lines |
| Depth & Physics | 3D intensity · Scale · X/Y rotation |
| Brush | Size · Trail length · Smoothing |
| Auto Mask | On/Off · Speed · 6 trajectory types |

---

## Русская инструкция

### Что делает плагин

**3D Reveal Pro** экспортирует два фрейма Figma, отправляет их на локальный сервер для генерации карт глубины, затем рендерит интерактивную 3D-сцену. Кисть-маска «проявляет» второй фрейм под первым.

- **Режим Фото** — WebGL 3D с параллаксом глубины (требует локальный сервер)
- **Режим Видео** — загрузите два видеофайла, эффект кисти без сервера
- **Запись** — экспорт в `.mp4` / `.webm`

> **Примечание:** Плагин проходит ревью Figma Community (~2 недели).
> До публикации установите его локально по инструкции ниже.

---

### Требования

| Что нужно | Версия |
|-----------|--------|
| Figma Desktop | Последняя |
| Python | 3.8 или новее |
| ОС | macOS 11+ или Windows 10+ |
| ОЗУ | 4 ГБ+ (рекомендуется 8 ГБ) |
| Интернет | Один раз (скачать модель карт глубины, ~200 МБ) |

---

### Установка — macOS

#### Шаг 1: Скачайте репозиторий

```bash
git clone https://github.com/YOUR_USERNAME/3d-reveal-pro.git
cd 3d-reveal-pro
```

Или скачайте ZIP со страницы [Releases](../../releases) и распакуйте.

#### Шаг 2: Установите зависимости сервера

```bash
bash setup-mac.sh
```

Скрипт создаст виртуальное окружение и установит все пакеты.
**Первый запуск занимает 3–5 минут.**

#### Шаг 3: Запустите сервер

```bash
bash start-server-mac.sh
```

Дождитесь сообщения:
```
✅ Сервер карт глубины готов! Ожидание запросов от Figma на порту 5000...
```

**Не закрывайте это окно терминала** во время работы с плагином.
При первом запуске скачивается модель карт глубины (~200 МБ).

#### Шаг 4: Установите плагин в Figma

1. Откройте **Figma Desktop** (десктопное приложение, не браузер)
2. Перейдите в **Меню (☰) → Plugins → Development → Import plugin from manifest...**
3. Откройте папку `plugin/` из репозитория
4. Выберите файл `manifest.json`
5. Плагин появится в **Plugins → Development → 3D Reveal Pro**

#### Шаг 5: Используйте плагин

1. В Figma выделите **ровно 2 фрейма** (первый = Base, второй = Reveal)
2. Запустите **Plugins → Development → 3D Reveal Pro**
3. Подождите обработки (10–30 сек)
4. Двигайте мышью по холсту — кисть проявляет второй фрейм
5. Нажмите «Начать запись» для экспорта MP4

---

### Установка — Windows

#### Шаг 1: Скачайте репозиторий

Скачайте ZIP со страницы [Releases](../../releases) и распакуйте,
или используйте Git Bash:
```bash
git clone https://github.com/YOUR_USERNAME/3d-reveal-pro.git
```

#### Шаг 2: Установите Python (если не установлен)

1. Скачайте Python 3.8+ с [python.org](https://www.python.org/downloads/windows/)
2. При установке: **поставьте галочку «Add Python to PATH»** ✅
3. Перезагрузите компьютер

#### Шаг 3: Установите зависимости

Дважды кликните `setup-windows.bat`
или запустите в Командной строке:
```cmd
setup-windows.bat
```

#### Шаг 4: Запустите сервер

Дважды кликните `start-server-windows.bat`
или:
```cmd
start-server-windows.bat
```

Дождитесь:
```
✅ Сервер карт глубины готов! Ожидание запросов от Figma на порту 5000...
```

**Не закрывайте это окно** во время работы с плагином.

#### Шаг 5: Установите плагин в Figma

1. Откройте **Figma Desktop**
2. **Меню → Plugins → Development → Import plugin from manifest...**
3. Выберите `plugin/manifest.json`
4. Запускайте через **Plugins → Development → 3D Reveal Pro**

---

## Troubleshooting

### «Нет связи с Python сервером» / Server not found

- Make sure the server is running (`start-server-mac.sh` or `start-server-windows.bat`)
- Wait for `✅ Сервер карт глубины готов!` before using the plugin
- Check that nothing else is using port 5000:
  - **Mac:** `lsof -i :5000`
  - **Windows:** `netstat -ano | findstr :5000`
- Try: click **«Повторить»** in the plugin error screen

### Plugin not appearing in Figma

- Use **Figma Desktop**, not the browser version
- Re-import: **Plugins → Development → Import plugin from manifest...**
- Make sure you selected `plugin/manifest.json`, not the root `manifest.json`

### First launch is very slow

Normal — the depth model (~200 MB) downloads once to:
- **Mac:** `~/.cache/huggingface/`
- **Windows:** `C:\Users\<name>\.cache\huggingface\`

Subsequent launches start in seconds.

### «Module not found» error on server start

Run the setup script again:
```bash
# Mac:
bash setup-mac.sh

# Windows:
setup-windows.bat
```

### Video mode not working

Video mode does not require the server. If videos don't play:
- Use common formats: `.mp4`, `.mov`, `.webm`
- Try shorter clips (under 30 seconds for best performance)

### Port 5000 already in use (macOS)

macOS Monterey+ uses port 5000 for AirPlay Receiver.
Disable it: **System Settings → AirDrop & Handoff → AirPlay Receiver → Off**

Or change the port in `server.py` (line: `app.run(port=5000, ...)`) and update `ui.html` accordingly.

---

## Architecture

```
Figma Plugin (code.js + ui.html)
    ↓  exports frames as PNG
    ↓  postMessage API
    ↓
ui.html (WebGL + Canvas2D)
    ↓  fetch() to localhost:5000
    ↓
server.py (Flask + depth model)
    ↓  generates depth maps
    ↓  returns depth maps as base64 PNG
    ↓
WebGL renderer (5 textures: base, reveal, depthBase, depthReveal, mask)
```

**No data leaves your machine.** All processing is fully local.

---

## License

MIT — free to use, modify, and distribute.

---

## Credits

- Depth map model: depth-anything-small
- Figma Plugin API
- Built with WebGL, Canvas 2D, Flask, Transformers
