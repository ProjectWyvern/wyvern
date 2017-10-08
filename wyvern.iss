#define MyAppName "Wyvern"
#define MyAppPublisher "Project Wyvern Developers"
#define MyAppURL "https://projectwyvern.com"
#define MyAppExeName "wyvern-qt.exe"

#if !Defined(PWD)
#define PWD "."
#endif

#define MyAppSrc PWD + "\release\wyvern-qt.exe"
#pragma message MyAppSrc

#if !FileExists(MyAppSrc)
#error "Unable to find MyAppSrc"
#endif

#define FileVerStr GetFileVersion(MyAppSrc)
#define QtDir GetEnv('QTDIR')

[Setup]
AppName={#MyAppName}
AppVersion={#FileVerStr}
AppPublisher={#MyAppPublisher}
AppPublisherURL={#MyAppURL}
AppSupportURL={#MyAppURL}
AppUpdatesURL={#MyAppURL}
DefaultDirName={pf}\{#MyAppName}
DisableDirPage=yes
DefaultGroupName={#MyAppName}
DisableProgramGroupPage=yes
OutputDir={#PWD}
OutputBaseFilename={#MyAppName}_v{#FileVerStr}
Compression=lzma
SolidCompression=yes
UninstallDisplayIcon={app}\{#MyAppExeName}
AppId="20138f47-a963-4e6f-a4e1-1972a3c799ad"
LicenseFile="COPYING"

[Languages]
Name: "english"; MessagesFile: "compiler:Default.isl"

[Tasks]
Name: "desktopicon"; Description: "{cm:CreateDesktopIcon}"; GroupDescription: "{cm:AdditionalIcons}"; Flags: unchecked

[Files]
Source: "{#MyAppSrc}"; DestDir: "{app}"; Flags: ignoreversion
Source: "{#PWD}\*.dll"; DestDir: "{app}"; Flags: ignoreversion
Source: "{#PWD}\platforms\*.dll"; DestDir: "{app}\platforms"; Flags: ignoreversion

[Icons]
Name: "{group}\{#MyAppName}"; Filename: "{app}\{#MyAppExeName}"
Name: "{group}\{cm:UninstallProgram,{#MyAppName}}"; Filename: "{uninstallexe}"
Name: "{commondesktop}\{#MyAppName}"; Filename: "{app}\{#MyAppExeName}"; Tasks: desktopicon

[Run]
Filename: "{app}\{#MyAppExeName}"; Description: "{cm:LaunchProgram,{#StringChange(MyAppName, '&', '&&')}}"; Flags: nowait postinstall skipifsilent
