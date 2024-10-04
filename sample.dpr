program aestest;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.SysUtils,
  System.Classes,
  ElAES in 'ElAES.pas';

var inStream, outStream: TMemoryStream;
    CryptKey: TAESKey256;
    InitV: TAESBuffer;
    i: Int32;
    tmpBuf: array [0 .. 32] of Byte;
    S: String;
begin
  inStream := TMemoryStream.Create;
  outStream := TMemoryStream.Create;
  try
    for i := 0 to 31 do
      tmpBuf[i] := i;

    inStream.Write(tmpBuf[0], 32);

    // Generate CryptKey
    for i := 1 to SizeOf(CryptKey) do
      CryptKey[i - 1] := Byte(trunc((i * $D1) mod $FA));

    // Generate InitV
    for i := 1 to SizeOf(InitV) do
      InitV[i - 1] := Byte(trunc((i * $B9) mod $CE));

    // Encrypt inStream
    EncryptAESStreamCBC(inStream, 0, CryptKey, InitV, outStream);

    outStream.Position := 0;
    outStream.Read(tmpBuf[0], 32);

    for i := 0 to 31 do
      S := S + IntToStr(tmpBuf[i]) + ' ';
    WriteLn(S);
  finally
    inStream.Free;
    outStream.Free;
  end;

  ReadLn;
end.
