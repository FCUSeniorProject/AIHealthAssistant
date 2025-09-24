# AIHealthAssistant (VitaBot)

---

## 專案簡介  
AIHealthAssistant（VitaBot）是一款針對 Apple Watch 平臺設計的智能健康助理 App，結合語音助理功能與健康數據監測。用戶可透過語音與應用互動，並讓系統在背景收集健康資料、上傳至後端，以為用戶提供個人化建議與分析。

---

## 核心功能

- 語音交互：語音辨識與語音回覆，支援日常問答、語音控制  
- 健康監測：透過 HealthKit 讀取心率、步數、活動量等生理數據  
- 資料傳輸：自動把健康數據同步至後端 API 或雲端  
- 模型／分析：內建或串接 LLM 模型，處理語音輸入並生成對話或分析結果  
- 測試：單元測試與 UI 測試，確保系統穩定性

---

## 技術架構與流程

1. **需求分析 & 規劃**  
   - 定義目標用戶、使用情境、要實作的「必備功能」與「加分功能」  
2. **系統設計**  
   - UML ／流程圖繪製  
   - 模組化分層：UI、語音處理、健康數據、網路層  
3. **開發階段**  
   - 使用 Swift、SwiftUI / AVKit 進行前端／介面開發  
   - 整合 HealthKit、語音辨識、Firebase 或自建後端 API  
   - 撰寫單元測試（Unit Tests）、UI Tests  
4. **版本控制與團隊協作**  
   - 使用 Git / GitHub 進行版本控制、分支管理（feature / development / main）  
   - Pull Request 與 code review 流程  
5. **測試、修正與優化**  
   - 功能測試、Edge Case 測試  
   - 效能優化、錯誤處理、記憶體管理  
6. **部署與發佈 / Demo 演示**  
   - App 在 Apple Watch / iOS 平臺的部署流程 (尚未發佈)

---

## 專案展示與連結

- GitHub 原始碼：`https://github.com/FCUSeniorProject/AIHealthAssistant`  
- Demo / 試用影片：`[https://github.com/FCUSeniorProject/AIHealthAssistant](https://drive.google.com/drive/u/0/folders/1WrfBPLi61atzNPozm9fxAsLRNl6_uXfF)`   

---

## 未來展望

- 支援更多感測器或第三方穿戴裝置資料輸入  
- 增加個人化健康建議與分析模組  
- 優化語音識別模型與語言模型的準確度  
- 強化資料隱私與安全性（加密、使用者同意機制）  

---

## 團隊與貢獻者

（列出專案成員、貢獻者、聯絡方式等）
- [Shiro](https://github.com/xWht1e0122) – LLM/STT/TTS Integrration、Frontend
