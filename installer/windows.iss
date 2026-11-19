; Installs a beta of the Waves LV1 module into Companion's modules folder (this user's
; %APPDATA%\companion\modules), where Companion looks for installed modules when it starts.
; Build: ISCC /DAppVersion=2.1.0-beta.1 /DWinVersion=2.1.0.1 /DModuleDir=<extracted waves-lv1 folder> windows.iss

#ifndef AppVersion
  #error Pass /DAppVersion=<module version>
#endif
#ifndef WinVersion
  #error Pass /DWinVersion=<a.b.c.d>
#endif
#ifndef ModuleDir
  #error Pass /DModuleDir=<extracted module folder>
#endif

[Setup]
AppId={{5E4A5CB4-CA3C-418A-98E0-93D30AD43ACF}
AppName=Waves LV1 for Companion (beta)
AppVersion={#AppVersion}
AppVerName=Waves LV1 for Companion {#AppVersion}
AppPublisher=Miguel Lourenço
AppPublisherURL=https://www.azlourenco.work
VersionInfoVersion={#WinVersion}
DefaultDirName={userappdata}\companion\modules\waves-lv1-{#AppVersion}
UsePreviousAppDir=no
; Uninstaller outside the module folder: Companion may delete that folder itself.
UninstallFilesDir={localappdata}\Waves LV1 Companion Beta\{#AppVersion}
DisableDirPage=yes
DisableProgramGroupPage=yes
DisableReadyPage=yes
PrivilegesRequired=lowest
OutputDir=..\out
OutputBaseFilename=WavesLV1-Companion-{#AppVersion}-Setup
Compression=lzma2
SolidCompression=yes
WizardStyle=modern
UninstallDisplayName=Waves LV1 for Companion {#AppVersion}

[Languages]
Name: "pt"; MessagesFile: "compiler:Languages\Portuguese.isl"
Name: "en"; MessagesFile: "compiler:Default.isl"

[Messages]
pt.FinishedLabelNoIcons=O módulo Waves LV1 {#AppVersion} foi instalado no Companion.%n%n1. Fecha o Companion (ícone junto ao relógio → Quit) e abre-o outra vez.%n2. Na ligação Waves LV1, escolhe a versão {#AppVersion} (Beta).%n%nO driver Companion Surface (para o computador da eMotion) instala-se a partir da página que o módulo mostra nas definições da ligação.
en.FinishedLabelNoIcons=The Waves LV1 module {#AppVersion} is installed in Companion.%n%n1. Quit Companion (tray icon → Quit) and open it again.%n2. In the Waves LV1 connection, pick version {#AppVersion} (Beta).%n%nThe Companion Surface driver (for the eMotion computer) installs from the page the module links to in the connection settings.

[Files]
Source: "{#ModuleDir}\*"; DestDir: "{app}"; Flags: ignoreversion recursesubdirs createallsubdirs

[UninstallDelete]
Type: filesandordirs; Name: "{app}"
