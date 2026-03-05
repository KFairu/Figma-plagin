"use strict";
/// <reference types="@figma/plugin-typings" />
// Главный файл плагина (backend Figma)
var __awaiter = (this && this.__awaiter) || function (thisArg, _arguments, P, generator) {
    function adopt(value) { return value instanceof P ? value : new P(function (resolve) { resolve(value); }); }
    return new (P || (P = Promise))(function (resolve, reject) {
        function fulfilled(value) { try { step(generator.next(value)); } catch (e) { reject(e); } }
        function rejected(value) { try { step(generator["throw"](value)); } catch (e) { reject(e); } }
        function step(result) { result.done ? resolve(result.value) : adopt(result.value).then(fulfilled, rejected); }
        step((generator = generator.apply(thisArg, _arguments || [])).next());
    });
};
const selection = figma.currentPage.selection;
if (selection.length !== 2) {
    figma.notify("Пожалуйста, выделите ровно 2 фрейма (Base и Reveal)", { error: true });
    figma.closePlugin();
}
else if (selection[0].type !== 'FRAME' || selection[1].type !== 'FRAME') {
    figma.notify("Оба объекта должны быть фреймами (Frame), не группами или компонентами", { error: true });
    figma.closePlugin();
}
else {
    // Figma clamps showUI size to screen bounds automatically.
    // Use very large values to get as close to full-screen as possible.
    // The UI will then send a postMessage to refine the exact 90% size.
    figma.showUI(__html__, {
        width: 2560, // Figma will clamp to available screen width
        height: 1440, // Figma will clamp to available screen height
        themeColors: false,
    });
    const baseFrame = selection[0];
    const revealFrame = selection[1];
    figma.ui.onmessage = (msg) => __awaiter(void 0, void 0, void 0, function* () {
        // UI sends resize request on load and when user manually resizes
        if (msg.type === 'resize') {
            const w = Math.max(900, Math.min(3840, Math.round(msg.width || 1600)));
            const h = Math.max(600, Math.min(2160, Math.round(msg.height || 1000)));
            figma.ui.resize(w, h);
        }
    });
    function exportAndSend() {
        return __awaiter(this, void 0, void 0, function* () {
            try {
                figma.notify("Подготовка изображений...");
                const exportSettings = {
                    format: 'PNG',
                    constraint: { type: 'SCALE', value: 1 }
                };
                const baseBytes = yield baseFrame.exportAsync(exportSettings);
                const revealBytes = yield revealFrame.exportAsync(exportSettings);
                figma.ui.postMessage({
                    type: 'init-images',
                    baseData: baseBytes,
                    revealData: revealBytes,
                    width: baseFrame.width,
                    height: baseFrame.height,
                });
            }
            catch (error) {
                figma.notify("Ошибка при экспорте фреймов", { error: true });
                figma.closePlugin();
            }
        });
    }
    exportAndSend();
}
