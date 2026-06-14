@echo off
chcp 65001 >nul
cd /d "%~dp0"
echo ============================================
echo   Заливка панели Пульт на GitHub Pages
echo ============================================
echo.
echo Шаг 1 уже сделай в браузере (30 секунд):
echo   - открой github.com, кнопка New repository
echo   - имя: pult   тип: Public   НЕ ставь галочки Add README
echo   - Create repository
echo   - скопируй адрес вида https://github.com/ТВОЙ_ЛОГИН/pult.git
echo.
set /p REPO="Вставь сюда этот адрес и нажми Enter: "
if "%REPO%"=="" (
  echo Адрес пустой. Запусти заново.
  pause
  exit /b 1
)
echo.
echo Заливаю...
git remote remove origin 2>nul
git remote add origin %REPO%
git branch -M main
git push -u origin main
if errorlevel 1 (
  echo.
  echo Не вышло запушить. Скорее всего нужно войти в GitHub.
  echo Откроется окно входа - войди и запусти этот файл снова.
  pause
  exit /b 1
)
echo.
echo ============================================
echo   ГОТОВО. Осталось два клика:
echo ============================================
echo   1. На странице репозитория: Settings - Pages
echo      Source: Deploy from a branch - Branch: main - папка / (root) - Save
echo      Через минуту появится адрес https://ТВОЙ_ЛОГИН.github.io/pult/
echo.
echo   2. В Telegram у @BotFather:
echo      /mybots - выбери pult_makov1481_bot - Bot Settings -
echo      Menu Button - вставь адрес панели
echo.
echo   Всё. Жми кнопку в боте - откроется панель.
echo ============================================
pause
