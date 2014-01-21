program ICUTests;
{

  Projet de test DUnit Delphi
  -------------------------
  Ce projet contient le framework de test DUnit et les ex�cuteurs de test GUI/Console.
  Ajoutez "CONSOLE_TESTRUNNER" � l'entr�e des d�finitions conditionnelles des options
  de projet pour utiliser l'ex�cuteur de test console.  Sinon, l'ex�cuteur de test GUI sera
  utilis� par d�faut.

}

{$IFDEF CONSOLE_TESTRUNNER}
{$APPTYPE CONSOLE}
{$ENDIF}

uses
  DUnitTestRunner,
  UTestUnum in 'lib\UTestUnum.pas',
  icu_globals in '..\lib\icu_globals.pas',
  parseerr in '..\lib\parseerr.pas',
  umachine in '..\lib\umachine.pas',
  umisc in '..\lib\umisc.pas',
  unum in '..\lib\unum.pas',
  utypes in '..\lib\utypes.pas',
  formattable in '..\lib\formattable.pas',
  uloc in '..\lib\uloc.pas',
  ICUNumberFormatter in '..\ICUNumberFormatter.pas',
  TestICUNumberFormat in 'TestICUNumberFormat.pas';

{$R *.RES}

begin
  DUnitTestRunner.RunRegisteredTests;
end.

