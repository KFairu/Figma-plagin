from flask import Flask, request, jsonify
from flask_cors import CORS
import base64
from io import BytesIO
from PIL import Image
import os
import sys

# Проверка библиотек
try:
    from transformers import pipeline
except ImportError:
    print("Ошибка! Установите библиотеки:")
    print("pip install flask flask-cors transformers torch torchvision pillow")
    sys.exit(1)

app = Flask(__name__)
# Разрешаем Figma делать запросы к этому локальному серверу
CORS(app)
# Лимит запроса 150 МБ — PNG от 4K-фрейма в base64 может быть > 16 МБ (дефолт)
app.config['MAX_CONTENT_LENGTH'] = 150 * 1024 * 1024

@app.errorhandler(413)
def too_large(e):
    return jsonify({"error": "Изображение слишком большое. Уменьшите фрейм или масштаб экспорта."}), 413

print("Загрузка модуля карт глубины...")
pipe = pipeline(task="depth-estimation", model="LiheYoung/depth-anything-small-hf")
print("✅ Сервер карт глубины готов! Ожидание запросов от Figma на порту 5000...")

def process_image(base64_str):
    # Убираем заголовок data:image/png;base64,
    if base64_str.startswith('data:image'):
        base64_str = base64_str.split(',')[1]
    
    img_data = base64.b64decode(base64_str)
    image = Image.open(BytesIO(img_data)).convert("RGB")
    
    # Генерация карты глубины
    result = pipe(image)
    depth_img = result["depth"]
    
    # Конвертация обратно в base64
    buffered = BytesIO()
    depth_img.save(buffered, format="PNG")
    return "data:image/png;base64," + base64.b64encode(buffered.getvalue()).decode()

@app.route('/api/depth', methods=['POST'])
def get_depth():
    print("Получены фреймы из Figma! Генерация карт глубины...")
    data = request.json
    try:
        base_depth = process_image(data['base'])
        reveal_depth = process_image(data['reveal'])
        print("✅ Карты сгенерированы и отправлены обратно в Figma!")
        return jsonify({
            "base_depth": base_depth, 
            "reveal_depth": reveal_depth
        })
    except Exception as e:
        print("Ошибка генерации:", str(e))
        return jsonify({"error": str(e)}), 500

if __name__ == '__main__':
    # threaded=True позволяет обрабатывать несколько запросов параллельно
    app.run(port=5000, threaded=True)