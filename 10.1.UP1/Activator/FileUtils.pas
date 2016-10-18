{ *********************************************************************** }
{                                                                         }
{   ���ߵ�Ԫ                                                              }
{                                                                         }
{   ��ƣ�Lsuper 2013.02.16                                               }
{   ��ע��                                                                }
{   ��ˣ�                                                                }
{                                                                         }
{   Copyright (c) 1998-2014 Super Studio                                  }
{                                                                         }
{ *********************************************************************** }

unit FileUtils;

interface

uses
  SysUtils, Classes;

function  LoadDataFromFile(const AFile: string): AnsiString;
procedure SaveDataToFile(const AFile: string; const ABuffer; ASize: Integer);

implementation

uses
  Windows;

////////////////////////////////////////////////////////////////////////////////
//��ƣ�Lsuper 2010.01.19
//���ܣ������ļ�����
//������
////////////////////////////////////////////////////////////////////////////////
function LoadDataFromFile(const AFile: string): AnsiString;
begin
  with TFileStream.Create(AFile, fmOpenRead or fmShareDenyWrite) do
  try
    SetLength(Result, Size);
    ReadBuffer(PAnsiChar(Result)^, Size);
  finally
    Free;
  end;
end;

////////////////////////////////////////////////////////////////////////////////
//��ƣ�Lsuper 2010.01.19
//���ܣ������ļ�����
//������
////////////////////////////////////////////////////////////////////////////////
procedure SaveDataToFile(const AFile: string; const ABuffer;
  ASize: Integer);
var
  F: string;
begin
  F := ExtractFileDir(AFile);
  ForceDirectories(F);
  with TFileStream.Create(AFile, fmCreate or fmShareDenyWrite) do
  try
    Position := 0;
    WriteBuffer(ABuffer, ASize);
  finally
    Free;
  end;
end;

end.
