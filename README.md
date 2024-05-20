# PE
## Windows PE/ADK scripts (10 IoT 2021)

(c) Dmitry Ponyatov <dponyatov@gmail.com> 2024 MIT

github: https://github.com/ponyatov/PE

## необходимые пакеты и компоненты

- **ADK**
    - пакет разработчика кастомных дистрибутивов
  - **WinPE**: Windows Preinstallation Environment
    - набор загрузочных образов Windows PE для всех архитектур
  - DISM: Deployment Image Servicing and Management
    - основной инструмент развертывания и обслуживания образов [[Windows]] в командной строке
- WMI: Windows Management Instrumentation
    - технология, которая с помощью единого интерфейса позволяет управлять компонентами OS

## WinPE.ru

- https://www.winpe.ru/

## outsidethebox

- https://www.outsidethebox.ms/12922/comment-page-2/
- [Customize WinPE](https://learn.microsoft.com/en-us/windows-hardware/manufacture/desktop/customize-windows-re?view=windows-10)
- https://www.outsidethebox.ms/9951/
- [применение твиков реестра](http://www.oszone.net/8597)
- [Установка приложений в режиме аудита](http://www.oszone.net/8596)

## Технический блог компании [[org/True System]]

### Работа с образами Windows. Часть 1. Собираем Windows PE.
http://true-system.blogspot.com/2013/10/windows-1-windows-pe.html

## WMI

- https://habr.com/ru/articles/70806/

### WMI Code Creator

- https://habr.com/ru/articles/70806/
- https://www.microsoft.com/en-us/download/details.aspx?id=8572

tool allows you to generate VBScript, C#, and VB .NET code that uses WMI to complete a management tasks

### MgmtClassGen.exe

- https://learn.microsoft.com/en-us/dotnet/framework/tools/mgmtclassgen-exe

## VirtualBox

Guest Additions drivers dumped to `%PE%\driver\%ARCH%\vbox`

- https://learn.microsoft.com/en-us/windows-hardware/manufacture/desktop/winpe-network-drivers-initializing-and-adding-drivers?view=windows-10

## FAR

- https://forum.farmanager.com/viewtopic.php?t=7626

