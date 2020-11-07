unit uItemsFiles;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uCollectionBase, System.Actions,
  Vcl.ActnList, Vcl.ComCtrls, Vcl.ToolWin, Vcl.ExtCtrls,
  JD.InnoSetup, JD.InnoSetup.Common, Vcl.StdCtrls, Vcl.CheckLst,
  Vcl.Samples.Spin, Vcl.Grids, Vcl.ValEdit;

type
  TfrmFiles = class(TfrmCollectionBase)
    Label11: TLabel;
    Label2: TLabel;
    lstFlags: TCheckListBox;
    txtComponents: TMemo;
    txtSource: TEdit;
    Label9: TLabel;
    txtDestDir: TEdit;
    Label1: TLabel;
    txtDestName: TEdit;
    Label3: TLabel;
    txtExcludes: TEdit;
    Label4: TLabel;
    seExternalSize: TSpinEdit;
    Label5: TLabel;
    lstAttribs: TCheckListBox;
    Label6: TLabel;
    txtFontInstall: TEdit;
    Label7: TLabel;
    txtStrongAssemblyName: TEdit;
    Label8: TLabel;
    lstPermissions: TValueListEditor;
    Label10: TLabel;
  private
    { Private declarations }
  public
    constructor CreateEmbedded(AOwner: TWinControl; AScript: TJDInnoSetupScript;
      ACollection: TJDISBaseCollection); override;
    procedure PrepareColumns(AColumns: TListColumns); override;
    procedure ClearDetail; override;
    procedure SetEditState(const AEditing: Boolean); override;
    procedure GetListItemDetails(AItem: TJDISBaseCollectionItem;
      AListItem: TListItem); override;
    function IsValid: Boolean; override;
    procedure LoadItemDetail(AItem: TJDISBaseCollectionItem); override;
    procedure SaveItemDetail(AItem: TJDISBaseCollectionItem); override;
  end;

var
  frmFiles: TfrmFiles;

implementation

{$R *.dfm}

{ TfrmFiles }

constructor TfrmFiles.CreateEmbedded(AOwner: TWinControl;
  AScript: TJDInnoSetupScript; ACollection: TJDISBaseCollection);
begin
  inherited;

end;

procedure TfrmFiles.PrepareColumns(AColumns: TListColumns);
  procedure AC(const ACaption: String; AWidth: Integer);
  var
    C: TListColumn;
  begin
    C:= AColumns.Add;
    C.Caption:= ACaption;
    C.Width:= AWidth;
  end;
begin
  AColumns.Clear;
  AC('Source', 250);
  AC('Dest Dir', 150);
  AC('Dest Name', 120);
  AC('Excludes', 80);
  AC('External Size', 100);
  AC('Attributes', 150);
  AC('Permissions', 80);
  AC('Font Install', 80);
  AC('Strong Assembly Name', 100);
  AC('Components', 200);
  AC('Flags', 200);
end;

procedure TfrmFiles.GetListItemDetails(AItem: TJDISBaseCollectionItem;
  AListItem: TListItem);
var
  I: TJDISFile;
begin
  inherited;
  I:= TJDISFile(AItem);
  AListItem.SubItems.Clear;
  AListItem.Caption:= I.Source;
  AListItem.SubItems.Add(I.DestDir);
  AListItem.SubItems.Add(I.DestName);
  AListItem.SubItems.Add(I.Excludes);
  AListItem.SubItems.Add(IntToStr(I.ExternalSize));
  AListItem.SubItems.Add(I.AttribsStr);
  AListItem.SubItems.Add(I.Permissions.GetFullText);
  AListItem.SubItems.Add(I.FontInstall);
  AListItem.SubItems.Add(I.StrongAssemblyName);
  AListItem.SubItems.Add(GetSpacedList(I.Components));
  AListItem.SubItems.Add(I.Flags.GetFlagText);
end;

procedure TfrmFiles.ClearDetail;
begin
  inherited;
  txtSource.Text:= '';
  txtDestDir.Text:= '';
  txtDestName.Text:= '';
  txtExcludes.Text:= '';
  seExternalSize.Value:= 0;
  lstAttribs.CheckAll(TCheckBoxState.cbUnchecked);
  //lstPermissions //TODO
  txtComponents.Lines.Clear;
  txtFontInstall.Text:= '';
  txtStrongAssemblyName.Text:= '';
  lstFlags.CheckAll(cbUnchecked);
end;

function TfrmFiles.IsValid: Boolean;
begin
  Result:= (txtSource.Text <> '') and (txtDestDir.Text<> '');
end;

procedure TfrmFiles.LoadItemDetail(AItem: TJDISBaseCollectionItem);
var
  I: TJDISFile;
  A: TJDISAttrib;
  Ind: Integer;
  procedure CF(const AVal: Boolean);
  begin
    if AVal then
      lstFlags.Checked[Ind]:= True;
    Inc(Ind);
  end;
begin
  inherited;
  if Assigned(AItem) then begin
    I:= TJDISFile(AItem);
    txtSource.Text:= I.Source;
    txtDestDir.Text:= I.DestDir;
    txtDestName.Text:= I.DestName;
    txtExcludes.Text:= I.Excludes;
    seExternalSize.Value:= I.ExternalSize;
    for A := Low(TJDISAttrib) to High(TJDISAttrib) do begin
      if A in I.Attribs then begin
        lstAttribs.Checked[Integer(A)]:= True;;
      end;
    end;
    //TODO: Permissions
    txtComponents.Lines.Assign(I.Components);
    txtFontInstall.Text:= I.FontInstall;
    txtStrongAssemblyName.Text:= I.StrongAssemblyName;

    Ind:= 0;
    CF(I.Flags.Is32bit);
    CF(I.Flags.Is64bit);
    CF(I.Flags.AllowUnsafeFiles);
    CF(I.Flags.CompareTimestamp);
    CF(I.Flags.ConfirmOverwrite);
    CF(I.Flags.CreateAllSubdirs);
    CF(I.Flags.DeleteAfterInstall);
    CF(I.Flags.DontCopy);
    CF(I.Flags.DontVerifyChecksum);
    CF(I.Flags.External);

    CF(I.Flags.FontIsntTrueType);
    CF(I.Flags.GacInstall);
    CF(I.Flags.IgnoreVersion);
    CF(I.Flags.IsReadme);
    CF(I.Flags.NoCompression);
    CF(I.Flags.NoEncryption);
    CF(I.Flags.NoRegError);
    CF(I.Flags.OnlyIfDestFileExists);
    CF(I.Flags.OnlyIfDoesntExists);
    CF(I.Flags.OverwriteReadOnly);

    CF(I.Flags.PromptIfOlder);
    CF(I.Flags.RecurseSubdirs);
    CF(I.Flags.RegServer);
    CF(I.Flags.RegTypeLib);
    CF(I.Flags.ReplaceSameVersion);
    CF(I.Flags.RestartReplace);
    CF(I.Flags.SetNTFSCompression);
    CF(I.Flags.SharedFile);
    CF(I.Flags.Sign);
    CF(I.Flags.SignOnce);

    CF(I.Flags.SkipIfSourceDoesntExist);
    CF(I.Flags.SolidBreak);
    CF(I.Flags.SortFileByExtension);
    CF(I.Flags.SortFileByName);
    CF(I.Flags.Touch);
    CF(I.Flags.UninsNoSharedFilePrompt);
    CF(I.Flags.UninsRemoveReadOnly);
    CF(I.Flags.UninsRestartDelete);
    CF(I.Flags.UninsNeverUninstall);
    CF(I.Flags.UnsetNTFSCompression);

  end;
end;

procedure TfrmFiles.SaveItemDetail(AItem: TJDISBaseCollectionItem);
var
  I: TJDISFile;
  A: TJDISAttrib;
  Ind: Integer;
  function CF: Boolean;
  begin
    Result:= lstFlags.Checked[Ind];
    Inc(Ind);
  end;
begin
  inherited;
  if Assigned(AItem) then begin
    I:= TJDISFile(AItem);
    I.Source:= txtSource.Text;
    I.DestDir:= txtDestDir.Text;
    I.DestName:= txtDestName.Text;
    I.Excludes:= txtExcludes.Text;
    I.ExternalSize:= seExternalSize.Value;
    for A := Low(TJDISAttrib) to High(TJDISAttrib) do begin
      if lstAttribs.Checked[Integer(A)] then begin
        I.Attribs:= I.Attribs + [A];
      end;
    end;
    //TODO: Permissions
    I.Components.Assign(txtComponents.Lines);
    I.FontInstall:= txtFontInstall.Text;
    I.StrongAssemblyName:= txtStrongAssemblyName.Text;

    Ind:= 0;
    I.Flags.Is32bit:= CF;
    I.Flags.Is64bit:= CF;
    I.Flags.AllowUnsafeFiles:= CF;
    I.Flags.CompareTimestamp:= CF;
    I.Flags.ConfirmOverwrite:= CF;
    I.Flags.CreateAllSubdirs:= CF;
    I.Flags.DeleteAfterInstall:= CF;
    I.Flags.DontCopy:= CF;
    I.Flags.DontVerifyChecksum:= CF;
    I.Flags.External:= CF;

    I.Flags.FontIsntTrueType:= CF;
    I.Flags.GacInstall:= CF;
    I.Flags.IgnoreVersion:= CF;
    I.Flags.IsReadme:= CF;
    I.Flags.NoCompression:= CF;
    I.Flags.NoEncryption:= CF;
    I.Flags.NoRegError:= CF;
    I.Flags.OnlyIfDestFileExists:= CF;
    I.Flags.OnlyIfDoesntExists:= CF;
    I.Flags.OverwriteReadOnly:= CF;

    I.Flags.PromptIfOlder:= CF;
    I.Flags.RecurseSubdirs:= CF;
    I.Flags.RegServer:= CF;
    I.Flags.RegTypeLib:= CF;
    I.Flags.ReplaceSameVersion:= CF;
    I.Flags.RestartReplace:= CF;
    I.Flags.SetNTFSCompression:= CF;
    I.Flags.SharedFile:= CF;
    I.Flags.Sign:= CF;
    I.Flags.SignOnce:= CF;

    I.Flags.SkipIfSourceDoesntExist:= CF;
    I.Flags.SolidBreak:= CF;
    I.Flags.SortFileByExtension:= CF;
    I.Flags.SortFileByName:= CF;
    I.Flags.Touch:= CF;
    I.Flags.UninsNoSharedFilePrompt:= CF;
    I.Flags.UninsRemoveReadOnly:= CF;
    I.Flags.UninsRestartDelete:= CF;
    I.Flags.UninsNeverUninstall:= CF;
    I.Flags.UnsetNTFSCompression:= CF;

  end;
end;

procedure TfrmFiles.SetEditState(const AEditing: Boolean);
begin
  inherited;
  txtSource.ReadOnly:= not AEditing;
  txtDestDir.ReadOnly:= not AEditing;
  txtDestName.ReadOnly:= not AEditing;
  txtExcludes.ReadOnly:= not AEditing;
  seExternalSize.ReadOnly:= not AEditing;
  lstAttribs.Enabled:= AEditing;
  lstPermissions.Enabled:= AEditing;
  txtComponents.ReadOnly:= not AEditing;
  txtFontInstall.ReadOnly:= not AEditing;
  txtStrongAssemblyName.ReadOnly:= not AEditing;
  lstFlags.Enabled:= AEditing;
end;

end.
