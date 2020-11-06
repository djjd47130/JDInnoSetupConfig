unit uCollectionBase;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uTabBase, System.Actions, Vcl.ActnList,
  Vcl.ComCtrls, Vcl.ToolWin, Vcl.ExtCtrls,
  System.UITypes,
  JD.InnoSetup, JD.InnoSetup.Common;

type
  TfrmCollectionBase = class;

  TfrmCollectionBaseClass = class of TfrmCollectionBase;

  TfrmCollectionBase = class(TfrmTabBase)
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
  frmCollectionBase: TfrmCollectionBase;

implementation

{$R *.dfm}

{ TfrmCollectionBaseNEW }

constructor TfrmCollectionBase.CreateEmbedded(AOwner: TWinControl;
  AScript: TJDInnoSetupScript; ACollection: TJDISBaseCollection);
begin
  inherited CreateEmbedded(AOwner, AScript);
  FCollection:= ACollection;
  PrepareColumns(Items.Columns);
end;

procedure TfrmCollectionBase.actAddItemExecute(Sender: TObject);
begin
  Items.ItemIndex:= -1;
  ClearDetail;
  FIsNew:= True;
  SetEditState(True);
end;

procedure TfrmCollectionBase.actDeleteItemExecute(Sender: TObject);
var
  I: Integer;
begin
  if SelectedItem <> nil then begin
    if MessageDlg('Are you sure you want to delete selected item?',
      mtConfirmation, [mbYes,mbNo], 0) = mrYes then
    begin
      I:= SelectedItem.Index;
      FCollection.Delete(I);
      Items.Items.Delete(I);
      ClearDetail;
    end;
  end;
end;

procedure TfrmCollectionBase.actSaveItemExecute(Sender: TObject);
var
  I: TJDISBaseCollectionItem;
  LI: TListItem;
begin
  if IsValid then begin
    if FIsNew then begin
      //Create a new item...
      I:= FCollection.Add;
      SaveItemDetail(I);
      LI:= Items.Items.Add;
      LI.Data:= I;
      GetListItemDetails(I, LI);
      SetEditState(False);
      FIsNew:= False;
      Items.ItemIndex:= LI.Index;
    end else begin
      //Save existing item
      SaveItemDetail(SelectedItem);
      Items.Selected.SubItems.Clear;
      GetListItemDetails(SelectedItem, Items.Selected);
      SetEditState(False);
    end;
  end else begin
    MessageDlg('The information entered is not valid.', mtError, [mbOK], 0);
  end;
  Self.Modified:= True;
  Self.DoOnChanged;
end;

procedure TfrmCollectionBase.ClearList;
begin
  Items.Items.Clear;
  ClearDetail;
end;

procedure TfrmCollectionBase.GetListItemDetails(
  AItem: TJDISBaseCollectionItem; AListItem: TListItem);
begin
  AListItem.Caption:= AItem.GetFullText;
  //TODO: Expected to override...
end;

procedure TfrmCollectionBase.ItemsSelectItem(Sender: TObject;
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

procedure TfrmCollectionBase.PopulateList;
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

procedure TfrmCollectionBase.PrepareColumns(AColumns: TListColumns);
var
  C: TListColumn;
begin
  AColumns.Clear;
  C:= AColumns.Add;
  C.Width:= 200;
  C.Caption:= 'Item Name';
  //TODO: Expected to override...
end;

procedure TfrmCollectionBase.Load;
begin
  inherited;
  Self.PopulateList;
end;

procedure TfrmCollectionBase.LoadItemDetail(AItem: TJDISBaseCollectionItem);
begin
  ClearDetail;

end;

procedure TfrmCollectionBase.Save;
begin
  inherited;
  Self.DoOnChanged;
end;

procedure TfrmCollectionBase.SaveItemDetail(AItem: TJDISBaseCollectionItem);
begin

end;

function TfrmCollectionBase.SelectedItem: TJDISBaseCollectionItem;
begin
  Result:= TJDISBaseCollectionItem(Items.Selected.Data);
end;

procedure TfrmCollectionBase.UpdateActions;
begin
  inherited;
  actEditItem.Enabled:= (not Editing) and (Items.Selected <> nil);
  actAddItem.Enabled:= not Editing;
  actDeleteItem.Enabled:= (not Editing) and (Items.Selected <> nil);
end;

end.
