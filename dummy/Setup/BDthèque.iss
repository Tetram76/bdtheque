; Script generated by the Inno Setup Script Wizard.
; SEE THE DOCUMENTATION FOR DETAILS ON CREATING INNO SETUP SCRIPT FILES!

[Languages]
Name: fr; MessagesFile: compiler:Languages\French.isl

[Setup]
AppVersion={#GetFileVersion("D:\Bureautique\BDth�que\BD.exe")}
AppName=BDth�que
AppVerName=BDth�que {#SetupSetting("AppVersion")}
AppMutex=TetramCorpBDMutex
AppPublisher=Tetr�m Corp
AppPublisherURL=http://www.tetram.org
AppSupportURL=mailto:dev@tetram.org
AppUpdatesURL=http://www.tetram.org
UninstallDisplayIcon={app}\BD.exe
DefaultDirName={pf}\Tetr�m Corp\BDth�que
DefaultGroupName=Tetr�m Corp\BDth�que
PrivilegesRequired=poweruser
AppCopyright=Tetr�m Corp � 1997-2004
AppID={{A86E29B5-D1EE-431F-A5BF-E4A10D36CBDC}
LicenseFile=G:\Programmation\MEDIA.KIT\LicenceFreeWare.rtf
WindowVisible=false
BackColor=$8080ff
BackColor2=clPurple
BackColorDirection=toptobottom
WizardImageBackColor=clBlack
OutputBaseFilename=BDTheque-setup-{#SetupSetting("AppVersion")}
MinVersion=4.1.1998,5.0.2195
EnableDirDoesntExistWarning=true
AllowUNCPath=false
AppendDefaultDirName=false
ShowLanguageDialog=yes
InternalCompressLevel=ultra
SolidCompression=true
Compression=lzma/ultra
VersionInfoVersion={#SetupSetting("AppVersion")}
VersionInfoCompany=Tetr�m Corp
VersionInfoTextVersion={#SetupSetting("AppVersion")}
WizardImageFile=fond.bmp
WizardSmallImageFile=SetupModernSmall19.bmp

[Tasks]
Name: desktopicon; Description: Cr�er un raccourci sur le &bureau; GroupDescription: Raccourcis suppl�mentaires:
Name: interneticon; Description: Cr�er un raccourci vers le site de Tetr�m Corp; GroupDescription: Raccourcis suppl�mentaires:

[Files]
Source: D:\Bureautique\BDth�que\BD.exe; DestDir: {app}
Source: D:\Bureautique\BDth�que\BDPic.dll; DestDir: {app}; Flags: ignoreversion
Source: D:\Bureautique\BDth�que\fbembed.dll; DestDir: {app}
Source: D:\Bureautique\BDth�que\firebird.msg; DestDir: {app}; Flags: ignoreversion
Source: D:\Bureautique\BDth�que\ib_util.dll; DestDir: {app}
Source: D:\Bureautique\BDth�que\UDF\BDT_UDF.dll; DestDir: {app}\UDF
Source: Base vide\BD.GDB; DestDir: {app}; Flags: onlyifdoesntexist ignoreversion
Source: D:\Bureautique\BDth�que\WebServer\Acceuil.html; DestDir: {app}\WebServer; Flags: ignoreversion
Source: D:\Bureautique\BDth�que\WebServer\Fond.html; DestDir: {app}\WebServer; Flags: ignoreversion
Source: D:\Bureautique\BDth�que\WebServer\RepInitiales.html; DestDir: {app}\WebServer; Flags: ignoreversion
Source: D:\Bureautique\BDth�que\WebServer\Repertoire.html; DestDir: {app}\WebServer; Flags: ignoreversion
Source: D:\Bureautique\BDth�que\WebServer\FicheAlbum.html; DestDir: {app}\WebServer; Flags: ignoreversion
Source: D:\Bureautique\BDth�que\WebServer\FichePersonne.html; DestDir: {app}\WebServer; Flags: ignoreversion
Source: D:\Bureautique\BDth�que\WebServer\FicheSerie.html; DestDir: {app}\WebServer; Flags: ignoreversion
Source: D:\Bureautique\BDth�que\WebServer\Manquants.html; DestDir: {app}\WebServer; Flags: ignoreversion
Source: D:\Bureautique\BDth�que\WebServer\Previsions.html; DestDir: {app}\WebServer; Flags: ignoreversion
Source: D:\Bureautique\BDth�que\WebServer\Styles.css; DestDir: {app}\WebServer; Flags: ignoreversion
Source: D:\Bureautique\BDth�que\WebServer\graphics\Acceuil.jpg; DestDir: {app}\WebServer\graphics; Flags: ignoreversion
Source: D:\Bureautique\BDth�que\WebServer\graphics\logo.jpg; DestDir: {app}\WebServer\graphics; Flags: ignoreversion
Source: D:\Bureautique\BDth�que\WebServer\graphics\fondbdd.jpg; DestDir: {app}\WebServer\graphics; Flags: ignoreversion
Source: What's New.txt; DestDir: {app}; Flags: ignoreversion
; NOTE: Don't use "Flags: ignoreversion" on any shared system files

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

[UninstallDelete]
Type: files; Name: {app}\BD.url
Type: files; Name: {app}\BD.ini
Type: files; Name: {app}\*.lck
Type: files; Name: {app}\firebird.log

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
