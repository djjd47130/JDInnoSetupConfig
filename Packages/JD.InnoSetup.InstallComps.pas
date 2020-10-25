unit JD.InnoSetup.InstallComps;

interface

uses
  System.Classes, System.SysUtils,
  JD.InnoSetup;

procedure Register;

implementation

procedure Register;
begin
  RegisterComponents('JD Inno Setup', [TJDInnoSetupScript]);
end;

end.
