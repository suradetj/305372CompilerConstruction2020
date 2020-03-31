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

Procedure ShowUsage;
Begin
    WriteLn('A minimal transpiler (source-to-source compiler)');
    WriteLn('Usage: transpile source-file template-file target-file');
    WriteLn('   e.g. >transpile sample.src template.cs target.cs')
End;

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


{***************************************************************************}
{ Main program                                                              }
{***************************************************************************}
Begin

    HandleCommandLineParameters;

    AssignFile(srcFile, srcFileName);
    AssignFile(tplFile, tplFileName);
    AssignFile(tgtFile, tgtFileName);
    Reset(srcFile);
    Reset(tplFile);
    ReWrite(tgtFile);

    { Read only one number from the source file}
    Read(srcFile, numstr);

    CloseFile(srcFile);

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
End.
