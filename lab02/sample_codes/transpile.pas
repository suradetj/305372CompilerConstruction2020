Program Transpiler;

{$mode objfpc} {$H+}

Uses SysUtils;

Const
    srcFileExtension = '.src';
    substibuteMark = '####';

Var
    srcFileName     : String;
    tplFileName     : String;
    tgtFileName     : String;
    srcFile         : Text;
    tplFile         : Text;
    tgtFile         : Text;
    numstr          : String;
    tplStr          : String;
    markPos         : Integer;
    newStart        : Integer;


{---------------------------------------------------------------------------}
{ Show the program usage.                                                   }
{---------------------------------------------------------------------------}
Procedure ShowUsage;
Begin
    WriteLn('A minimal transpiler (source-to-source compiler)');
    WriteLn('Usage: transpile source-file template-file target-file');
    WriteLn('   e.g. >transpile sample.src template.cs target.cs')
End;


{---------------------------------------------------------------------------}
{ Handle the command line parameters.                                       }
{---------------------------------------------------------------------------}
Procedure HandleCommandLineParameters;
Begin
    If ParamCount <> 3 Then
        Begin
            ShowUsage;
            Halt(1);
        End;
    srcFileName := ParamStr(1);
    tplFileName := ParamStr(2);
    tgtFileName := ParamStr(3);
End;


{---------------------------------------------------------------------------}
{ Check if the numstr is out of the specified range.                        }
{---------------------------------------------------------------------------}
Function InRange(Const numstr : String) : Boolean;
Var
    number : Integer;
Begin
    Try
        number := StrToInt(numstr);
        InRange := True;
    except
        On E : EConvertError do
            InRange := False;
    end;
End;


{---------------------------------------------------------------------------}
{ Analyze the semantic of the input.                                        }
{---------------------------------------------------------------------------}
Procedure AnalyzeSemantic;
Begin
    If not InRange(numstr) Then
        Begin
            WriteLn('The number is out-of-range [0 - 2,147,483,647]');
            Halt(1);
        End;
End;


{---------------------------------------------------------------------------}
{ Generate the target codes.                                                }
{---------------------------------------------------------------------------}
Procedure GenerateTargetCode;
Begin
    AssignFile(tplFile, tplFileName);
    AssignFile(tgtFile, tgtFileName);
    Reset(tplFile);
    ReWrite(tgtFile);
    While Not Eof(tplFile) Do
    Begin
        ReadLn(tplFile, tplStr);
        markPos := Pos(substibuteMark, tplStr);
        if markPos <> 0 Then
            Begin
                Write(tgtFile, Copy(tplStr, 1, markPos - 1));
                Write(tgtFile, numstr);
                newStart := markPos + Length(substibuteMark);
                WriteLn(tgtFile, Copy(tplStr, newStart, Length(tplStr) - newStart + 1));
            End
        Else
            Begin
                WriteLn(tgtFile, tplStr);
            End;

    End;

    CloseFile(tplFile);
    CloseFile(tgtFile);
End;

{***************************************************************************}
{ Main program                                                              }
{***************************************************************************}
Begin

    HandleCommandLineParameters;

    AssignFile(srcFile, srcFileName);
    Reset(srcFile);

    { Read only one number from the source file}
    Read(srcFile, numstr);

    CloseFile(srcFile);

    AnalyzeSemantic;

    GenerateTargetCode;
End.
