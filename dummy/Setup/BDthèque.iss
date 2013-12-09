[Languages]
Name: fr; MessagesFile: compiler:Languages\French.isl

[Setup]
AppVersion={#GetFileVersion("D:\MEDIA.KIT\BDTh�que\bin\BD.exe")}
AppName=BDth�que
AppVerName=BDth�que {#SetupSetting("AppVersion")}
AppMutex=TetramCorpBDMutex
AppPublisher=Tetr�m Corp
AppPublisherURL=http://www.tetram.org
AppSupportURL=http://forums.tetram.org
AppUpdatesURL=http://www.tetram.org
UninstallDisplayIcon={app}\BD.exe
DefaultDirName={pf}\Tetr�m Corp\BDth�que
DefaultGroupName=Tetr�m Corp\BDth�que
PrivilegesRequired=poweruser
AppCopyright=Tetr�m Corp � 1997-2008
AppID={{A86E29B5-D1EE-431F-A5BF-E4A10D36CBDC}
LicenseFile=D:\MEDIA.KIT\LicenceFreeWare.rtf
WindowVisible=false
BackColor=$008080FF
BackColor2=clPurple
BackColorDirection=toptobottom
WizardImageBackColor=clBlack
OutputBaseFilename=BDTheque-setup-{#SetupSetting("AppVersion")}
MinVersion=0,5.0.2195
EnableDirDoesntExistWarning=true
AllowUNCPath=false
AppendDefaultDirName=false
ShowLanguageDialog=yes
InternalCompressLevel=Ultra
SolidCompression=true
Compression=lzma/Ultra
VersionInfoVersion={#SetupSetting("AppVersion")}
VersionInfoCompany=Tetr�m Corp
VersionInfoTextVersion={#SetupSetting("AppVersion")}
WizardImageFile=fond.bmp
WizardSmallImageFile=SetupModernSmall19.bmp
LanguageDetectionMethod=locale
SetupLogging=true

[Tasks]
Name: desktopicon; Description: Cr�er un raccourci sur le &bureau; GroupDescription: Raccourcis suppl�mentaires:
Name: interneticon; Description: Cr�er un raccourci vers le site de Tetr�m Corp; GroupDescription: Raccourcis suppl�mentaires:

[Files]
; NOTE: Don't use "Flags: ignoreversion" on any shared system files

Source: ..\..\bin\BD.exe; DestDir: {app}; Flags: ignoreversion
Source: ..\..\bin\BDPic.dll; DestDir: {app}; Flags: ignoreversion
Source: ..\..\bin\fbembed.dll; DestDir: {app}; Flags: ignoreversion
Source: ..\..\bin\firebird.msg; DestDir: {app}; Flags: ignoreversion
Source: ..\..\bin\ib_util.dll; DestDir: {app}; Flags: ignoreversion
Source: ..\..\bin\UDF\BDT_UDF.dll; DestDir: {app}\UDF; Flags: ignoreversion
Source: What's New.txt; DestDir: {app}; Flags: ignoreversion
Source: ..\..\bin\icuuc30.dll; DestDir: {app}; Flags: ignoreversion
Source: ..\..\bin\icuin30.dll; DestDir: {app}; Flags: ignoreversion
Source: ..\..\bin\icudt30.dll; DestDir: {app}; Flags: ignoreversion
Source: ..\..\bin\ssleay32.dll; DestDir: {app}; Flags: ignoreversion
Source: ..\..\bin\libeay32.dll; DestDir: {app}; Flags: ignoreversion
Source: ..\..\bin\intl\fbintl.dll; DestDir: {app}\Intl; Flags: ignoreversion
Source: ..\..\bin\intl\fbintl.conf; DestDir: {app}\Intl; Flags: ignoreversion
Source: ..\..\bin\DelZip179.dll; DestDir: {app}; Flags: ignoreversion
;Source: vcredist_x86.exe; DestDir: {tmp}; Flags: deleteafterinstall
Source: ..\..\bin\msvcp80.dll; DestDir: {app}; Flags: ignoreversion
Source: ..\..\bin\msvcr80.dll; DestDir: {app}; Flags: ignoreversion
Source: ..\..\bin\Microsoft.VC80.CRT.manifest; DestDir: {app}; Flags: ignoreversion
;Source: ..\..\bin\pcre3.dll; DestDir: {app}; Flags: ignoreversion
Source: ..\..\bin\7z.dll; DestDir: {app}; Flags: ignoreversion

Source: Base vide\BD.GDB; DestDir: {userappdata}\TetramCorp\BDTheque; Flags: onlyifdoesntexist ignoreversion; Check: FirstInstall
Source: ..\..\bin\scripts\*.bds; DestDir: {commonappdata}\TetramCorp\BDTheque\Scripts; Flags: ignoreversion promptifolder; 
Source: ..\..\bin\scripts\*.bdu; DestDir: {commonappdata}\TetramCorp\BDTheque\Scripts; Flags: ignoreversion promptifolder
Source: ..\..\bin\WebServer\interface.zip; DestDir: {commonappdata}\TetramCorp\BDTheque\WebServer; Flags: ignoreversion
Source: ..\..\bin\WebServer\Site par d�faut.zip; DestDir: {commonappdata}\TetramCorp\BDTheque\WebServer; Flags: ignoreversion
Source: ..\..\bin\WebServer\BDthequeWeb.zip; DestDir: {commonappdata}\TetramCorp\BDTheque\WebServer; Flags: ignoreversion

[INI]
Filename: {app}\BD.url; Section: InternetShortcut; Key: URL; String: http://www.tetram.org; Tasks: interneticon

[Icons]
Name: {group}\BDth�que; Filename: {app}\BD.exe; IconIndex: 0
Name: {group}\BDth�que on the Web; Filename: {app}\BD.url; Tasks: interneticon
Name: {group}\D�sinstaller BDth�que; Filename: {uninstallexe}
Name: {userdesktop}\BDth�que; Filename: {app}\BD.exe; Tasks: desktopicon; IconIndex: 0

[Run]
Filename: {app}\BD.exe; Description: Lancer BDth�que; Flags: nowait postinstall skipifsilent
Filename: {app}\What's New.txt; Flags: nowait shellexec skipifdoesntexist postinstall skipifsilent
;Filename: {tmp}\vcredist_x86.exe; Flags: skipifdoesntexist; Parameters: /q; MinVersion: 0,5.01.2600; OnlyBelowVersion: 0,5.01.2600sp1
;Filename: {tmp}\vcredist_x86.exe; Flags: skipifdoesntexist; Parameters: /q; MinVersion: 0,5.02.3790; OnlyBelowVersion: 0,5.02.3790

[UninstallDelete]
Type: files; Name: {app}\BD.url
Type: files; Name: {app}\BD.ini
Type: files; Name: {app}\*.lck
Type: files; Name: {app}\firebird.log
;Type: files; Name: {app}\msvcr71.dll
;Type: files; Name: {app}\msvcp71.dll
Type: filesandordirs; Name: {app}\WebServer

[LangOptions]
LanguageName=French
LanguageID=$040C

[_ISTool]
UseAbsolutePaths=false

[InstallDelete]
Name: {app}\UDF\VDO_UDF.dll; Type: files
Name: {app}\BDws.dll; Type: files

[CustomMessages]
CustomFormCaption=BDth�que est d�j� install�
CustomFormDescription=Le programme d'installation a d�tect� que BDth�que est d�j� install� sur cet ordinateur.
UninstallRegKey=SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\{A86E29B5-D1EE-431F-A5BF-E4A10D36CBDC}_is1

[Code]
  var
    CanUpdate, IsUpdate: Boolean;
    Label2: TLabel;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;

  function FirstInstall: Boolean;
  begin
    Result := not IsUpdate;
  end;

  procedure CustomForm_Activate(Page: TWizardPage);
  begin
  end;

  function CustomForm_ShouldSkipPage(Page: TWizardPage): Boolean;
  begin
    Result := False;
  end;

  function CustomForm_BackButtonClick(Page: TWizardPage): Boolean;
  begin
    Result := True;
  end;

  function CustomForm_NextButtonClick(Page: TWizardPage): Boolean;
  begin
    Result := True;
    IsUpdate := RadioButton2.Checked;
  end;

  procedure CustomForm_CancelButtonClick(Page: TWizardPage; var Cancel, Confirm: Boolean);
  begin
  end;

  function CustomForm_CreatePage(PreviousPageId: Integer): Integer;
  var
    Page: TWizardPage;
  begin
    Page := CreateCustomPage(
      PreviousPageId,
      ExpandConstant('{cm:CustomFormCaption}'),
      ExpandConstant('{cm:CustomFormDescription}')
    );

    { Label2 }
    Label2 := TLabel.Create(Page);
    with Label2 do
    begin
      Parent := Page.Surface;
      Left := ScaleX(24);
      Top := ScaleY(40);
      Width := ScaleX(366);
      Height := ScaleY(58);
      AutoSize := False;
      Caption := 'Selectionnez l''action que vous voulez effectuer et cliquer sur Suivant pour continuer.';
      WordWrap := True;
    end;

    { RadioButton1 }
    RadioButton1 := TRadioButton.Create(Page);
    with RadioButton1 do
    begin
      Parent := Page.Surface;
      Left := ScaleX(120);
      Top := ScaleY(136);
      Width := ScaleX(113);
      Height := ScaleY(17);
      Caption := 'Installer de nouveau';
      TabOrder := 0;
    end;

    { RadioButton2 }
    RadioButton2 := TRadioButton.Create(Page);
    with RadioButton2 do
    begin
      Parent := Page.Surface;
      Left := ScaleX(120);
      Top := ScaleY(112);
      Width := ScaleX(113);
      Height := ScaleY(17);
      Caption := 'Mettre � jour';
      Checked := True;
      TabOrder := 1;
      TabStop := True;
    end;


    with Page do
    begin
      OnActivate := @CustomForm_Activate;
      OnNextButtonClick := @CustomForm_NextButtonClick;
    end;

    Result := Page.ID;
  end;

  procedure InitializeWizard();
  var
    CurVersion: string;
  begin
    IsUpdate := False;
    CanUpdate := RegQueryStringValue(HKLM, ExpandConstant('{cm:UninstallRegKey}'), 'DisplayVersion', CurVersion) and (CurVersion <> '');
    if CanUpdate then
      CustomForm_CreatePage(wpLicense);
  end;

  function ShouldSkipPage(PageID: Integer): Boolean;
  begin
    Result := ((PageID = wpSelectDir) or (PageID = wpSelectProgramGroup)) and CanUpdate and IsUpdate;
  end;

[InnoIDE_Settings]
LogFileOverwrite=false

