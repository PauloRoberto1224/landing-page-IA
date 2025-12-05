@echo off
title Iniciar Aplicação Vite + Tailwind CSS
color 0A
cls

echo =========================================
echo  INICIANDO APLICACAO VITE + TAILWIND CSS
echo =========================================
echo.
echo [1] Instalar dependencias (apenas primeira vez)
echo [2] Iniciar servidor de desenvolvimento
echo [3] Criar build de producao
echo [4] Visualizar build de producao
echo [5] Verificar erros de codigo
echo [6] Sair
echo.
set /p opcao="Escolha uma opcao (1-6): "

if "%opcao%"=="1" (
    echo.
    echo Instalando dependencias...
    echo ==========================
    npm install
    if %errorlevel% equ 0 (
        echo.
        echo Dependencias instaladas com sucesso!
        echo Pressione qualquer tecla para continuar...
        pause >nul
    ) else (
        echo.
        echo Erro ao instalar dependencias. Verifique sua conexao com a internet.
        echo Pressione qualquer tecla para continuar...
        pause >nul
    )
    call "%~dp0%~nx0"
)

if "%opcao%"=="2" (
    echo.
    echo Iniciando servidor de desenvolvimento...
    echo ===================================
    echo A aplicacao estara disponivel em: http://localhost:5173/
    echo Pressione Ctrl+C para parar o servidor
    echo.
    npm run dev
    pause
)

if "%opcao%"=="3" (
    echo.
    echo Criando build de producao...
    echo ==========================
    npm run build
    if %errorlevel% equ 0 (
        echo.
        echo Build de producao criado com sucesso na pasta 'dist'!
    ) else (
        echo.
        echo Erro ao criar build de producao.
    )
    echo Pressione qualquer tecla para continuar...
    pause >nul
    call "%~dp0%~nx0"
)

if "%opcao%"=="4" (
    echo.
    echo Iniciando visualizacao do build de producao...
    echo ===========================================
    echo A aplicacao estara disponivel em: http://localhost:4173/
    echo Pressione Ctrl+C para parar o servidor
    echo.
    npm run preview
    pause
)

if "%opcao%"=="5" (
    echo.
    echo Verificando erros de codigo...
    echo ===========================
    npm run lint
    echo.
    echo Verificacao concluida!
    echo Pressione qualquer tecla para continuar...
    pause >nul
    call "%~dp0%~nx0"
)

if "%opcao%"=="6" (
    exit
)

if not defined opcao (
    call "%~dp0%~nx0"
)
