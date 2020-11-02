unit uCollectionBaseNEW;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uTabBase, System.Actions, Vcl.ActnList,
  Vcl.ComCtrls, Vcl.ToolWin, Vcl.ExtCtrls,
  JD.InnoSetup, JD.InnoSetup.Common;

type
  TfrmCollectionBaseNEW = class(TfrmTabBase)
    actAddItem: TAction;
    actDeleteItem: TAction;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    ToolButton4: TToolButton;
    Details: TPanel;
    Items: TListView;
    procedure ItemsSelectItem(Sender: TObject; Item: TListItem;
      Selected: Boolean);
    procedure actAddItemExecute(Sender: TObject);
    procedure actDeleteItemExecute(Sender: TObject);
    procedure actSaveItemExecute(Sender: TObject);
  private
    FCollection: TJDISBaseCollection;
    FIsNew: Boolean;
    function SelectedItem: TJDISBaseCollectionItem;
  public
    constructor CreateEmbedded(AOwner: TWinControl; AScript: TJDInnoSetupScript;
      ACollection: TJDISBaseCollection); reintroduce; virtual;
    procedure UpdateActions; override;

    procedure PrepareColumns(AColumns: TListColumns); virtual;
    procedure ClearList; virtual;
    procedure PopulateList; virtual;
    procedure GetListItemDetails(AItem: TJDISBaseCollectionItem;
      AListItem: TListItem); virtual;
    procedure LoadItemDetail(AItem: TJDISBaseCollectionItem); virtual;
    procedure SaveItemDetail(AItem: TJDISBaseCollectionItem); virtual;
    procedure Load; override;
    procedure Save; override;
  end;

var
  frmCollectionBaseNEW: TfrmCollectionBaseNEW;

implementation

{$R *.dfm}

{ TfrmCollectionBaseNEW }

constructor TfrmCollectionBaseNEW.CreateEmbedded(AOwner: TWinControl;
  AScript: TJDInnoSetupScript; ACollection: TJDISBaseCollection);
begin
  inherited CreateEmbedded(AOwner, AScript);
  FCollection:= ACollection;
  PrepareColumns(Items.Columns);
end;

procedure TfrmCollectionBaseNEW.actAddItemExecute(Sender: TObject);
begin
  Items.ItemIndex:= -1;
  ClearDetail;
  FIsNew:= True;
  SetEditState(True);
end;

procedure TfrmCollectionBaseNEW.actDeleteItemExecute(Sender: TObject);
begin
  //
end;

procedure TfrmCollectionBaseNEW.actSaveItemExecute(Sender: TObject);
begin
  if IsValid then begin
    if FIsNew then begin
      //TODO: Create a new item...

    end else begin
      //TODO: Save over selected item...
      Self.SaveItemDetail(SelectedItem);
      Items.Selected.SubItems.Clear;
      Self.GetListItemDetails(SelectedItem, Items.Selected);
      SetEditState(False);
    end;
  end else begin
    MessageDlg('The information entered is not valid.', mtError, [mbOK], 0);
  end;
end;

procedure TfrmCollectionBaseNEW.ClearList;
begin
  Items.Items.Clear;
  ClearDetail;
end;

procedure TfrmCollectionBaseNEW.GetListItemDetails(
  AItem: TJDISBaseCollectionItem; AListItem: TListItem);
begin
  AListItem.Caption:= AItem.GetFullText;
  //TODO: Expected to override...
end;

procedure TfrmCollectionBaseNEW.ItemsSelectItem(Sender: TObject;
  Item: TListItem; Selected: Boolean);
var
  I: TJDISBaseCollectionItem;
begin
  if Selected then begin
    I:= TJDISBaseCollectionItem(Item.Data);
    Self.LoadItemDetail(I);
  end else begin
    Self.ClearDetail;
  end;
  UpdateActions;
end;

procedure TfrmCollectionBaseNEW.PopulateList;
var
  X: Integer;
  I: TJDISBaseCollectionItem;
  Itm: TListItem;
begin
  ClearList;
  for X := 0 to FCollection.Count-1 do begin
    I:= TJDISBaseCollectionItem(FCollection.Items[X]);
    Itm:= Items.Items.Add;
    Itm.Data:= I;
    GetListItemDetails(I, Itm);
  end;
  UpdateActions;
end;

procedure TfrmCollectionBaseNEW.PrepareColumns(AColumns: TListColumns);
var
  C: TListColumn;
begin
  AColumns.Clear;
  C:= AColumns.Add;
  C.Width:= 200;
  C.Caption:= 'Item Name';
  //TODO: Expected to override...
end;

procedure TfrmCollectionBaseNEW.Load;
begin
  inherited;
  Self.PopulateList;
end;

procedure TfrmCollectionBaseNEW.LoadItemDetail(AItem: TJDISBaseCollectionItem);
begin
  ClearDetail;

end;

procedure TfrmCollectionBaseNEW.Save;
begin
  inherited;

end;

procedure TfrmCollectionBaseNEW.SaveItemDetail(AItem: TJDISBaseCollectionItem);
begin

end;

function TfrmCollectionBaseNEW.SelectedItem: TJDISBaseCollectionItem;
begin
  Result:= TJDISBaseCollectionItem(Items.Selected.Data);
end;

procedure TfrmCollectionBaseNEW.UpdateActions;
begin
  inherited;
  actEditItem.Enabled:= (not Editing) and (Items.Selected <> nil);
  actAddItem.Enabled:= not Editing;
  actDeleteItem.Enabled:= (not Editing) and (Items.Selected <> nil);
end;

end.
