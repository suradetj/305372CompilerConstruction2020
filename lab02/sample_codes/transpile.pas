Program Transpiler;

{$mode objfpc} {$H+}

Uses SysUtils;

Const
    srcFileExtension = '.src';
    substibuteMark = '####';


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
Procedure HandleCmdParam(Out srcFileName, tplFileName, tgtFileName : String);
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
{ Read from the input stream.                                               }
{---------------------------------------------------------------------------}
Function ReadInputStream(srcFileName : String) : String;
Var
    srcFile : Text;
    srcText : String;
Begin
    AssignFile(srcFile, srcFileName);
    Reset(srcFile);

    { Read only one number from the source file}
    Read(srcFile, srcText);

    CloseFile(srcFile);

    ReadInputStream := srcText;
End;


{---------------------------------------------------------------------------}
{ Check if the numstr is out of the specified range.                        }
{---------------------------------------------------------------------------}
Function InRange(Const numstr : String) : Boolean;
Begin
    Try
        StrToInt(numstr);
        InRange := True;
    except
        On E : EConvertError do
            InRange := False;
    end;
End;


{---------------------------------------------------------------------------}
{ Analyze the semantic of the input.                                        }
{---------------------------------------------------------------------------}
Function AnalyzeSemantic(syntaxTree : String) : String;
Begin
    If not InRange(syntaxTree) Then
        Begin
            WriteLn('The number is out-of-range [0 - 2,147,483,647]');
            Halt(1);
        End;

    AnalyzeSemantic := syntaxTree;
End;


{---------------------------------------------------------------------------}
{ Generate the target codes.                                                }
{---------------------------------------------------------------------------}
Procedure GenerateTargetCode(inputStr, tplFileName, tgtFileName : String);
Var
    markPos     : Integer;      { Position of the mark in a string. }
    newStart    : Integer;      { The position after the mark.      }
    tplStr      : String;       { A line from the template file.    }
    tplFile     : Text;         { The template file.                }
    tgtFile     : Text;         { The target file.                  }
Begin
    AssignFile(tplFile, tplFileName);
    AssignFile(tgtFile, tgtFileName);
    Reset(tplFile);
    ReWrite(tgtFile);

    { Substitute the number mark in the template with the number from the   }
    { stream.                                                               }
    While Not Eof(tplFile) Do
    Begin
        ReadLn(tplFile, tplStr);

        { Assume that there is only one mark in a template string. }
        markPos := Pos(substibuteMark, tplStr);
        if markPos <> 0 Then
            Begin
                Write(tgtFile, Copy(tplStr, 1, markPos - 1));
                Write(tgtFile, inputstr);
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
Var
    srcFileName     : String;
    tplFileName     : String;
    tgtFileName     : String;
    inputStr        : String;
    syntaxTree      : String;
Begin
    HandleCmdParam(srcFileName, tplFileName, tgtFileName);
    inputStr := ReadInputStream(srcFileName);

    syntaxTree := AnalyzeSemantic(inputStr);
    GenerateTargetCode(syntaxTree, tplFileName, tgtFileName);
End.
