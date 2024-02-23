unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, ComCtrls, StdCtrls, Buttons, ExtCtrls, FileCtrl,
  IdHashMessageDigest, idHash, Menus, ShellApi;

type
  TForm1 = class(TForm)
    Panel1: TPanel;
    page: TPanel;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    TabSheet3: TTabSheet;
    TabSheet4: TTabSheet;
    TabSheet5: TTabSheet;
    StringGrid1: TStringGrid;
    StringGrid2: TStringGrid;
    StringGrid3: TStringGrid;
    StringGrid4: TStringGrid;
    StringGrid5: TStringGrid;
    Panel2: TPanel;
    Panel3: TPanel;
    Panel4: TPanel;
    Panel5: TPanel;
    Panel6: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    StatusBar1: TStatusBar;
    PopupMenu1: TPopupMenu;
    LaunchFile1: TMenuItem;
    ShowinExplorer1: TMenuItem;
    N1: TMenuItem;
    FileProperties1: TMenuItem;
    OpenwithNotepad1: TMenuItem;
    N2: TMenuItem;
    Savefilelist1: TMenuItem;
    SaveDialog1: TSaveDialog;
    ProgressBar1: TProgressBar;
    SortFilelist1: TMenuItem;
    byNumber1: TMenuItem;
    byFilename1: TMenuItem;
    bySize1: TMenuItem;
    byMD51: TMenuItem;
    byLocation1: TMenuItem;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    SpeedButton3: TSpeedButton;
    SpeedButton4: TSpeedButton;
    SpeedButton5: TSpeedButton;
    SpeedButton6: TSpeedButton;
    SpeedButton7: TSpeedButton;
    SpeedButton8: TSpeedButton;
    SpeedButton9: TSpeedButton;
    SpeedButton10: TSpeedButton;
    MainMenu1: TMainMenu;
    Action1: TMenuItem;
    N1SetFolder11: TMenuItem;
    N2SetFolder21: TMenuItem;
    N3Scanfoldersforfiles1: TMenuItem;
    N4CalculateMD5hashs1: TMenuItem;
    N5Determinedifferentfiles1: TMenuItem;
    N3: TMenuItem;
    N6ResetAll1: TMenuItem;
    View1: TMenuItem;
    LaunchFile2: TMenuItem;
    OpenwithNotepad2: TMenuItem;
    ShowinExplorer2: TMenuItem;
    FileProperties2: TMenuItem;
    N4: TMenuItem;
    SortFilelist2: TMenuItem;
    byNumber2: TMenuItem;
    byFilename2: TMenuItem;
    bySize2: TMenuItem;
    byLocation2: TMenuItem;
    bySize3: TMenuItem;
    N5: TMenuItem;
    Savefilelist2: TMenuItem;
    Edit1: TMenuItem;
    CopyfilesonlyinFolder1toFolder21: TMenuItem;
    CopyfilesonlyinFolder2toFolder11: TMenuItem;
    N6: TMenuItem;
    DeletefilesinbothFoldersfromFolder11: TMenuItem;
    DeletefilesinbothFoldersfromFolder21: TMenuItem;
    Help1: TMenuItem;
    About1: TMenuItem;
    N7: TMenuItem;
    Quit1: TMenuItem;
    procedure SpeedButton1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
    procedure SpeedButton5Click(Sender: TObject);
    procedure SpeedButton6Click(Sender: TObject);
    procedure LaunchFile1Click(Sender: TObject);
    procedure ShowinExplorer1Click(Sender: TObject);
    procedure OpenwithNotepad1Click(Sender: TObject);
    procedure FileProperties1Click(Sender: TObject);
    procedure Savefilelist1Click(Sender: TObject);
    procedure StatusBar1DrawPanel(StatusBar: TStatusBar; Panel: TStatusPanel; const Rect: TRect);
    procedure PopupMenu1Popup(Sender: TObject);
    procedure byNumber1Click(Sender: TObject);
    procedure byFilename1Click(Sender: TObject);
    procedure bySize1Click(Sender: TObject);
    procedure byMD51Click(Sender: TObject);
    procedure byLocation1Click(Sender: TObject);
    procedure aStringGridDrawCell(Var aStringGrid:TStringGrid;Sender: TObject; ACol, ARow: Integer; Rect: TRect; State: TGridDrawState);
    procedure StringGrid1DrawCell(Sender: TObject; ACol, ARow: Integer; Rect: TRect; State: TGridDrawState);
    procedure StringGrid2DrawCell(Sender: TObject; ACol, ARow: Integer; Rect: TRect; State: TGridDrawState);
    procedure StringGrid3DrawCell(Sender: TObject; ACol, ARow: Integer; Rect: TRect; State: TGridDrawState);
    procedure StringGrid4DrawCell(Sender: TObject; ACol, ARow: Integer; Rect: TRect; State: TGridDrawState);
    procedure StringGrid5DrawCell(Sender: TObject; ACol, ARow: Integer; Rect: TRect; State: TGridDrawState);
    procedure SpeedButton9Click(Sender: TObject);
    procedure SpeedButton7Click(Sender: TObject);
    procedure SpeedButton8Click(Sender: TObject);
    procedure SpeedButton10Click(Sender: TObject);
    procedure Quit1Click(Sender: TObject);
    procedure About1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

uses Unit3;

{$R *.dfm}

Var Folder1Address,Folder2Address:AnsiString;

{ Set the Folder. This procedure are used for both folder: 1 & 2 }
Procedure SetFolder(Var FolderAddress:AnsiString;
                    Var aLabel:TLabel;
                    Var aButton1,aButton2:TSpeedButton);
Var NewFolderAddress:AnsiString;
begin
  NewFolderAddress:='';
{ Open the Select Directory Dialog... }
  If SelectDirectory('Select Directory','',NewFolderAddress) Then
{ Check if selected folder exists.
  The user could select by mistake the "My Computer" or "My Network Places".
  This folders could not be processed... }
    If DirectoryExists(NewFolderAddress) Then
      Begin
        FolderAddress:=NewFolderAddress;
        aLabel.Caption:=NewFolderAddress;
      End;
{ Disable the current action button and enable the next one
  Should be carefully when invoke the function:
  enabled & disable the right button! }
  aButton2.Enabled:=DirectoryExists(FolderAddress);
  aButton1.Enabled:=Not aButton2.Enabled;
end;

{ Set the folder 1 }
procedure TForm1.SpeedButton1Click(Sender: TObject);
begin
  SetFolder(Folder1Address,Label1,SpeedButton1,SpeedButton2);
  N1SetFolder11.Enabled:=SpeedButton1.Enabled;
  N2SetFolder21.Enabled:=SpeedButton2.Enabled;
end;

{ Set the folder 2}
procedure TForm1.SpeedButton2Click(Sender: TObject);
begin
  SetFolder(Folder2Address,Label2,SpeedButton2,SpeedButton3);
  N2SetFolder21.Enabled:=SpeedButton2.Enabled;
  N3Scanfoldersforfiles1.Enabled:=SpeedButton3.Enabled;
end;

{ Determine the filesize of each file }
function FileSize(fileName : wideString) : Int64;
Var SR:TSearchRec;
Begin
  If FindFirst(fileName,faAnyFile,SR)=0 Then
    Result:=Int64(SR.FindData.nFileSizeHigh) SHL Int64(32)+Int64(SR.FindData.nFileSizeLow)
  Else
{ The Result will be -1 if file not exists }
    Result:=-1;
  FindClose(sr);
end;

{ Search the files from all subdirectories with filemask if you wish
  The program can be modified to check only *.MP3 files (If FileMask=*.MP3) }
procedure FindFiles(Var FilesList:TStringList;
                        StartDir,FileMask:String);
Var SR: TSearchRec;
    DirList: TStringList;
    IsFound: Boolean;
    i: Integer;
Begin
  If StartDir[Length(StartDir)]<>'\' Then
    StartDir:=StartDir+'\';
  { Build a list of the files in directory StartDir  (not the directories!) }
  IsFound:=FindFirst(StartDir+FileMask,faAnyFile-faDirectory,SR)=0;
  While IsFound Do Begin
    FilesList.Add(StartDir+SR.Name);
    IsFound:=FindNext(SR)=0;
  End;
  FindClose(SR);
  { Build a list of subdirectories }
  DirList:=TStringList.Create;
  IsFound:=FindFirst(StartDir+'*.*',faAnyFile,SR)=0;
  While IsFound Do Begin
    If ((SR.Attr And faDirectory)<>0) And (SR.Name[1]<>'.') Then
      DirList.Add(StartDir+SR.Name);
    IsFound:=FindNext(SR)=0;
  End;
  FindClose(SR);
  { Scan the list of subdirectories }
  For i:=0 To DirList.Count-1 Do
    Begin
      FindFiles(FilesList,DirList[i],FileMask);
      Application.ProcessMessages();
    End;
  DirList.Free;
end;

{ Empty all cells from given stringgrid, except the antet
  and set the lines at value 2}
Procedure ClearStringGrid(Var aStringGrid:TStringGrid);
Var i,j:Integer;
Begin
  For i:=1 To aStringGrid.RowCount-1 Do
    For j:=1 To aStringGrid.ColCount-1 Do
      aStringGrid.Cells[j,i]:='';
  aStringGrid.RowCount:=2;
End;

{ Populate the StringGrid with searched files from a directory, including the files from all subdirectories }
Procedure PopulateStringGrid(FolderAddress:AnsiString;
                         Var aStringGrid:TStringGrid;
                         Var aProgressBar:TProgressBar);
Var i:Integer;
    FilesList:TStringList;
    aListBox:TListBox;
begin
{ Create a Listbox to save the FileList }
  aListBox:=TListBox.Create(Nil);
  aListBox.Parent:=Form1;
  aListBox.Visible:=False;
  aListBox.Clear;
{ Set the ProgressBar & clear the StringGrid }
  aProgressBar.Position:=0;
  aProgressBar.Visible:=True;
  ClearStringGrid(aStringGrid);
{ Search the files... }
  FilesList:=TStringList.Create;
  Try
{ Could replace the '*.*' with '*.MP3' to search only the MP3 files}
    FindFiles(FilesList,FolderAddress,'*.*');
    aListBox.Items.AddStrings(FilesList);
  Finally
    FilesList.Free;
  End;
{ Populate the StringGrid with FileName, FileSize, FileLocation}
  For i:=1 To aListBox.Items.Capacity Do
    Begin
      aStringGrid.Cells[4,i]:=aListBox.Items[i-1];
{ Filesize is calculate in bytes, but I want to be displayed in MB
  Could be modified to show the KB (for filesize <1MB),
                                MB (for filesize >=1MB and <1GB),
                                GB (for filesize >=1GB)}
      aStringGrid.Cells[2,i]:=Format('%f MB',[FileSize(aListBox.Items[i-1])/1024/1024]);
      aStringGrid.Cells[1,i]:=ExtractFileName(aListBox.Items[i-1]);
      aStringGrid.Cells[0,i]:=IntToStr(i);
{ Increase the number of rows to number of writed lines}
      If i>=0 Then
        Begin
          aStringGrid.RowCount:=i+1;
          aStringGrid.Row:=i;
        End
{ Minimum number of lines in StringGrid is 2, to keep the first line (antet line) to ReadOnly }
      Else
        aStringGrid.RowCount:=2;
{ Set the ProgressBar position to current progress }
      aProgressBar.Position:=Round(i*100/aListBox.Items.Capacity);
{ Allow the Application to process the other events
  Could be used to extend the program to press an Abort button...) }
      Application.ProcessMessages();
    End;
{ Destroy the Listbox. No more needed }
  aListBox.Free;
  aListBox:=Nil;
{ Hide the ProgressBar }
  aProgressBar.Visible:=False;
end;

{ Calculate the MD5 hash.
  This is very slow.
  The application is freezing if hashing file with filesize over 50 MB
  Need to reprogram this algorithm. Maybe with a ProgressBar and an Abort options}
function MD5(Const fileName:String):String;
Var idmd5:TIdHashMessageDigest5;
    fs:TFileStream;
Begin
  idmd5:=TIdHashMessageDigest5.Create;
  fs:=TFileStream.Create(fileName, fmOpenRead OR fmShareDenyWrite);
  Try
    Result:=idmd5.AsHex(idmd5.HashValue(fs));
  Finally
    fs.Free;
    idmd5.Free;
  End;
End;

{ Compare the MD5 from the StringGrids
  and generate the 3rd StringList (aStringGrid3)
  with the files that are unique in aStringGrid1 (compared with aStringGrid2) }
Procedure CompareTwoStringGrids(aStringGrid1,aStringGrid2:TStringGrid;
                                Var aStringGrid3:TStringGrid;
                                Var aProgressBar:TProgressBar);
Var i,j,k:Integer;
    Unik:Boolean;
Begin
{ Set the ProgressBar }
  aProgressBar.Position:=0;
  aProgressBar.Visible:=True;
  k:=0;
{ Check all files from aStringGrid1 }
  For i:=1 To aStringGrid1.RowCount-1 Do
    Begin
      Unik:=True;
{ Compare the MD5 from aStringGrid1 with MD5 from aStringGrid2 }
      For j:=1 To aStringGrid2.RowCount-1 Do
        Begin
{ At first same MD5 in aString1 and aString2, stop the searching }
          If (aStringGrid1.Cells[3,i]=aStringGrid2.Cells[5,j]) And (aStringGrid1.Cells[3,i]<>'') Then
            Begin
              Unik:=False;
              Break;
            End;
        End;
{ After comparing with all MD5 from aStringGrid2, check the uniqueness
  and add one line in aStringGrid3 }
      If (Unik) And (aStringGrid1.Cells[3,i]<>'') Then
        Begin
          Inc(k);
          aStringGrid3.Cells[0,k]:=IntToStr(k);               // Position
          aStringGrid3.Cells[1,k]:=aStringGrid1.Cells[1,i];   // File Name
          aStringGrid3.Cells[2,k]:=aStringGrid1.Cells[2,i];   // File Size
          aStringGrid3.Cells[3,k]:=aStringGrid1.Cells[3,i];   // MD5
          aStringGrid3.Cells[4,k]:=aStringGrid1.Cells[4,i];   // File location
          aStringGrid3.RowCount:=k+1;
{ Select the row of new unique file added }
          aStringGrid3.Row:=k;
        End;
{ Set the ProgressBar position to current progress }
      aProgressBar.Position:=Round(i*100/(aStringGrid1.RowCount));
{ Allow the Application to process the other events
  Could be used to extend the program to press an Abort button...) }
      Application.ProcessMessages();
    End;
{ Hide the ProgressBar }
  aProgressBar.Visible:=False;
End;

{ Display the Properties window for the selected file }
procedure PropertiesDialog(FileName:String);
Var sei:TShellExecuteInfo;
Begin
  FillChar(sei,SizeOf(sei),0);
  sei.cbSize:=SizeOf(sei);
  sei.lpFile:=PChar(FileName);
  sei.lpVerb:='properties';
  sei.fMask:=SEE_MASK_INVOKEIDLIST;
  ShellExecuteEx(@sei);
End;

{ Set the antet of StringGrid. Could be use for 1, 2, 3 and 4 StringGrid}
Procedure SetStringGrid(Var StringGrid:TStringGrid);
Begin
  StringGrid.Cells[0,0]:='Poz';
  StringGrid.Cells[0,1]:='1';
  StringGrid.Cells[1,0]:='Filename';
  StringGrid.Cells[2,0]:='Size';
  StringGrid.Cells[3,0]:='MD5';
  StringGrid.Cells[4,0]:='Location';
End;

{ Save the list of Files in a comma delimited file.
  The tab delimiter is TAB char }
Procedure SaveInCSVFile(Var aStringGrid:TStringGrid;
                            aFileName:AnsiString);
Var CSVFile:TextFile;
    i,j:Integer;
    s:AnsiString;
begin
  AssignFile(CSVFile,aFileName);
  ReWrite(CSVFile);
  For i:=0 To aStringGrid.RowCount-1 Do
    Begin
      s:='';
      For j:=0 To aStringGrid.ColCount-1 Do
        Begin
          If s='' Then
            s:=s+aStringGrid.Cells[j,i]
          Else
            s:=s+#9+aStringGrid.Cells[j,i]
        End;
      WriteLn(CSVFile,s);
    End;
  CloseFile(CSVFile);
end;

{ Sort a StringGrid }
procedure SortStringGrid(var GenStrGrid:TStringGrid;ThatCol:Integer;Invers:Boolean);
Const TheSeparator='@';
Var CountItem,i,j,k,ThePosition:Integer;
    MyList:TStringList;
    MyString,TempString:String;
begin
  CountItem:=GenStrGrid.RowCount;
  MyList:=TStringList.Create;
  MyList.Sorted:=False;
  Try
    Begin
      For i:=1 To (CountItem-1) Do
        MyList.Add(GenStrGrid.Rows[i].Strings[ThatCol]+TheSeparator+GenStrGrid.Rows[i].Text);
      Mylist.Sort;
      For k:=1 To Mylist.Count Do
        Begin
          MyString:=MyList.Strings[(k-1)];
          ThePosition:=Pos(TheSeparator,MyString);
          TempString:='';
{ Eliminate the Text of the column on which we have sorted the StringGrid }
          TempString:=Copy(MyString,(ThePosition+1),Length(MyString));
          MyList.Strings[(k-1)]:='';
          MyList.Strings[(k-1)]:=TempString;
        End;
{ Could invert the sorting direction }
      If Invers Then
        For j:=1 To (CountItem-1) Do
          GenStrGrid.Rows[CountItem-j].Text:=MyList.Strings[(j-1)]
      Else
        For j:=1 To (CountItem-1) Do
          GenStrGrid.Rows[j].Text:=MyList.Strings[(j-1)];
    End;
  Finally
    MyList.Free;
  End;
end;

{ The event of showing About window }
procedure TForm1.About1Click(Sender: TObject);
begin
  Form3.ShowModal;  
end;

{ Put stripe on a StringGrid }
procedure TForm1.aStringGridDrawCell(Var aStringGrid:TStringGrid;
                                         Sender:TObject;
                                         ACol,ARow:Integer;
                                         Rect:TRect;
                                         State:TGridDrawState);
Var TempPString:Array [0..255] of char;
begin
  //If (gdFixed In State) Or (gdSelected In State) Then Exit;
  If (gdFixed In State) Then Exit;
  aStringGrid.Canvas.Brush.Style:=bsSolid;
  If gdSelected In State Then
    aStringGrid.Canvas.Brush.Color:=clHotLight
  Else
{ Choose Cream Color for Even Row and white }
    Case Odd(ARow) Of
      True:aStringGrid.Canvas.Brush.Color:=clWhite;
      False:aStringGrid.Canvas.Brush.Color:=clCream;
    End;
{ Erase data }
  aStringGrid.Canvas.FillRect(Rect);
{ Get text in a PChar string }
  StrPCopy(TempPString,aStringGrid.Cells[ACol,ARow]);
{ DrawText - see other options in Windows API help
  Change the DT_LEFT to DT_RIGHT for right justified text}
  If ACol In [0,2] Then
    DrawText(aStringGrid.Canvas.Handle,TempPString,-1,Rect,DT_RIGHT)
  Else
    DrawText(aStringGrid.Canvas.Handle,TempPString,-1,Rect,DT_LEFT);
end;

{ Delete a file by seding to Recycle Bin }
procedure RecycleFile(s:AnsiString);
Var SHFileOpStruct:TSHFileOpStruct;
Begin
  With SHFileOpStruct Do Begin
    Wnd:=0;
{ Set action to delete files }
    wFunc:=FO_DELETE;
{ Set the list of files we want to delete }
    pFrom:=PChar(s);
    pTo:=Nil;
{ Allow to Undo the operation - recycle files }
    fFlags:=FOF_ALLOWUNDO;
    hNameMappings:=Nil;
    lpszProgressTitle:=Nil;
  End;
{ Action to recycle the files }
  SHFileOperation(SHFileOpStruct);
end;

{ The event of populating the StringGrid1 and StringGrid2
  with FileList from Folder1 and Folder2 }
procedure TForm1.SpeedButton3Click(Sender: TObject);
begin
{ Set the Folder1 tab }
  PageControl1.ActivePageIndex:=0;
  StatusBar1.Panels[0].Text:='Searching file in folder 1';
  PopulateStringGrid(Folder1Address,StringGrid1,ProgressBar1);
{ Set the Folder2 tab }
  PageControl1.ActivePageIndex:=1;
  StatusBar1.Panels[0].Text:='Searching file in folder 2';
  PopulateStringGrid(Folder2Address,StringGrid2,ProgressBar1);
  StatusBar1.Panels[0].Text:='Ready';
{ Disable the current action button & Enable the next button }
  SpeedButton3.Enabled:=False;
  SpeedButton4.Enabled:=True;
  N3Scanfoldersforfiles1.Enabled:=SpeedButton3.Enabled;
  N4CalculateMD5hashs1.Enabled:=SpeedButton4.Enabled;
end;

{ The event of generating the MD5 strings for both FileLists }
procedure TForm1.SpeedButton4Click(Sender: TObject);
Var i:Integer;
begin
  StatusBar1.Panels[0].Text:='Generate MD5 for Filelist 1';
{ Set the ProgressBar }
  ProgressBar1.Position:=0;
  ProgressBar1.Visible:=True;
{ Set the Folder1 tab }
  PageControl1.ActivePageIndex:=0;
{ Generate hash for Folder1 files }
  For i:=1 To StringGrid1.RowCount-1 Do
    Begin
      If FileExists(StringGrid1.Cells[4,i]) Then
        StringGrid1.Cells[3,i]:=MD5(StringGrid1.Cells[4,i]);
{ Select the row of file procesed }
      StringGrid1.Row:=i;
{ Set the ProgressBar position to current progress }
      ProgressBar1.Position:=Round(i*100/(StringGrid1.RowCount));
{ Allow the Application to process the other events
  Could be used to extend the program to press an Abort button...) }
      Application.ProcessMessages();
    End;
  StatusBar1.Panels[0].Text:='Generate MD5 for Filelist 2';
{ Set the Folder2 tab }
  PageControl1.ActivePageIndex:=1;
{ Generate hash for Folder2 files }
  For i:=1 To StringGrid2.RowCount-1 Do
    Begin
      If FileExists(StringGrid2.Cells[4,i]) Then
        StringGrid2.Cells[3,i]:=MD5(StringGrid2.Cells[4,i]);
{ Select the row of file procesed }
      StringGrid2.Row:=i;
{ Set the ProgressBar position to current progress }
      ProgressBar1.Position:=Round(i*100/(StringGrid2.RowCount));
{ Allow the Application to process the other events
  Could be used to extend the program to press an Abort button...) }
      Application.ProcessMessages();
    End;
  StatusBar1.Panels[0].Text:='Ready';
{ Disable the current action button & Enable the next button }
  SpeedButton4.Enabled:=False;
  SpeedButton5.Enabled:=True;
  N4CalculateMD5hashs1.Enabled:=SpeedButton4.Enabled;
  N5Determinedifferentfiles1.Enabled:=SpeedButton5.Enabled;
{ Hide the ProgressBar }
  ProgressBar1.Visible:=False;
end;

{ The event of comparing the MD5 strings
  Populate the StringGrid from "Files only in folder 1",
                               "Files only in folder 2",
                               "Files in both folders" }
procedure TForm1.SpeedButton5Click(Sender: TObject);
Var i,j,i5:Integer;
begin
  StatusBar1.Panels[0].Text:='Determine different files';
{ Set the ProgressBar }
  ProgressBar1.Position:=0;
  ProgressBar1.Visible:=True;
{ Set the File in both Folders tab }
  PageControl1.ActivePageIndex:=4;
{ Clear the StringGrids 3, 4 and 5 }
  ClearStringGrid(StringGrid3);
  ClearStringGrid(StringGrid4);
  ClearStringGrid(StringGrid5);
{ Generate the list with files that exists in Folder1 AND Folder2 }
  i5:=0;
  For i:=1 To StringGrid1.RowCount-1 Do
    Begin
      For j:=1 To StringGrid2.RowCount-1 Do
        Begin
          If (StringGrid1.Cells[3,i]=StringGrid2.Cells[3,j]) And (StringGrid1.Cells[3,i]<>'') Then
            Begin
              Inc(i5);
              StringGrid5.Cells[0,i5]:=IntToStr(i5);
              StringGrid5.Cells[1,i5]:=StringGrid1.Cells[1,i]; // File Name 1
              StringGrid5.Cells[2,i5]:=StringGrid1.Cells[2,i]; // Size of File 1
              StringGrid5.Cells[3,i5]:=StringGrid2.Cells[1,j]; // File Name 2
              StringGrid5.Cells[4,i5]:=StringGrid2.Cells[2,j]; // Size of File 2
              StringGrid5.Cells[5,i5]:=StringGrid1.Cells[3,i]; // MD5
              StringGrid5.Cells[6,i5]:=StringGrid1.Cells[4,i]; // Location of File 1
              StringGrid5.Cells[7,i5]:=StringGrid2.Cells[4,j]; // Location of File 2
              StringGrid5.RowCount:=i5+1;
{ Select the row of file procesed }
              StringGrid5.Row:=i5;
            End;
{ Set the ProgressBar position to current progress }
          ProgressBar1.Position:=Round((i*(StringGrid2.RowCount)+j)*100/(StringGrid1.RowCount*StringGrid2.RowCount));
{ Allow the Application to process the other events
  Could be used to extend the program to press an Abort button...) }
          Application.ProcessMessages();
        End;
    End;
{ Generate the list with unique file in Folder1. Set that tab }
  PageControl1.ActivePageIndex:=2;
  CompareTwoStringGrids(StringGrid1,StringGrid5,StringGrid3,ProgressBar1);
{ Generate the list with unique file in Folder1. Set that tab }
  PageControl1.ActivePageIndex:=3;
  CompareTwoStringGrids(StringGrid2,StringGrid5,StringGrid4,ProgressBar1);
  StatusBar1.Panels[0].Text:='Ready';
{ Disable the current action button }
  SpeedButton5.Enabled:=False;
  N5Determinedifferentfiles1.Enabled:=SpeedButton5.Enabled;
{ Hide the ProgressBar }
  ProgressBar1.Visible:=False;
{ Set the Files in both Folders tab }
  PageControl1.ActivePageIndex:=4;
end;

{ The event of RESET the current job.
  Could be use at any time, but will reset the current progress }
procedure TForm1.SpeedButton6Click(Sender: TObject);
begin
  If MessageDlg('Are you sure?'+#13+'You will lose the current job!',mtConfirmation,[mbYes,mbNo],0)=mrYes Then
    Begin
{ Enable the first button "Set folder 1" and disable the all others}
      SpeedButton1.Enabled:=True;
      SpeedButton2.Enabled:=False;
      SpeedButton3.Enabled:=False;
      SpeedButton4.Enabled:=False;
      SpeedButton5.Enabled:=False;
{ Do the same with menu commands }
      N1SetFolder11.Enabled:=SpeedButton1.Enabled;
      N2SetFolder21.Enabled:=SpeedButton2.Enabled;
      N3Scanfoldersforfiles1.Enabled:=SpeedButton3.Enabled;
      N4CalculateMD5hashs1.Enabled:=SpeedButton4.Enabled;
      N5Determinedifferentfiles1.Enabled:=SpeedButton5.Enabled;
{ Set Folder1 and Folder2 to '' }
      Folder1Address:='';
      Label1.Caption:='No folder selected';
      Folder2Address:='';
      Label2.Caption:='No folder selected';
{ Clear all StringGrids }
      ClearStringGrid(StringGrid1);
      ClearStringGrid(StringGrid2);
      ClearStringGrid(StringGrid3);
      ClearStringGrid(StringGrid4);
      ClearStringGrid(StringGrid5);
    End;
end;

{ Sort StringGrid by Position Number }
procedure TForm1.byNumber1Click(Sender: TObject);
begin
  If PageControl1.ActivePageIndex=0 Then
    SortStringGrid(StringGrid1,0,False)
  Else If PageControl1.ActivePageIndex=1 Then
    SortStringGrid(StringGrid2,0,False)
  Else If PageControl1.ActivePageIndex=2 Then
    SortStringGrid(StringGrid3,0,False)
  Else If PageControl1.ActivePageIndex=3 Then
    SortStringGrid(StringGrid4,0,False);
end;

{ Sort StringGrid by Position FileName }
procedure TForm1.byFilename1Click(Sender: TObject);
begin
  If PageControl1.ActivePageIndex=0 Then
    SortStringGrid(StringGrid1,1,False)
  Else If PageControl1.ActivePageIndex=1 Then
    SortStringGrid(StringGrid2,1,False)
  Else If PageControl1.ActivePageIndex=2 Then
    SortStringGrid(StringGrid3,1,False)
  Else If PageControl1.ActivePageIndex=3 Then
    SortStringGrid(StringGrid4,1,False);
end;

{ Sort StringGrid by File Size }
procedure TForm1.bySize1Click(Sender: TObject);
begin
  If PageControl1.ActivePageIndex=0 Then
    SortStringGrid(StringGrid1,2,False)
  Else If PageControl1.ActivePageIndex=1 Then
    SortStringGrid(StringGrid2,2,False)
  Else If PageControl1.ActivePageIndex=2 Then
    SortStringGrid(StringGrid3,2,False)
  Else If PageControl1.ActivePageIndex=3 Then
    SortStringGrid(StringGrid4,2,False);
end;

{ Sort StringGrid by MD5 }
procedure TForm1.byMD51Click(Sender: TObject);
begin
  If PageControl1.ActivePageIndex=0 Then
    SortStringGrid(StringGrid1,3,False)
  Else If PageControl1.ActivePageIndex=1 Then
    SortStringGrid(StringGrid2,3,False)
  Else If PageControl1.ActivePageIndex=2 Then
    SortStringGrid(StringGrid3,3,False)
  Else If PageControl1.ActivePageIndex=3 Then
    SortStringGrid(StringGrid4,3,False);
end;

{ Sort StringGrid by File Location }
procedure TForm1.byLocation1Click(Sender: TObject);
begin
  If PageControl1.ActivePageIndex=0 Then
    SortStringGrid(StringGrid1,4,False)
  Else If PageControl1.ActivePageIndex=1 Then
    SortStringGrid(StringGrid2,4,False)
  Else If PageControl1.ActivePageIndex=2 Then
    SortStringGrid(StringGrid3,4,False)
  Else If PageControl1.ActivePageIndex=3 Then
    SortStringGrid(StringGrid4,4,False);
end;

{ The event of launching application }
procedure TForm1.FormCreate(Sender: TObject);
Var ProgressBarStyle:Integer;
begin
{ Disable the button for "Set Folder 2", "" }
{ Set antet for the StringGrids 1, 2, 3 and 4. They are the same }
  SetStringGrid(StringGrid1);
  SetStringGrid(StringGrid2);
  SetStringGrid(StringGrid3);
  SetStringGrid(StringGrid4);
{ Set the antet for StringGrid 5. Is different from StringGrid 1, 2, 3 and 4 }
  StringGrid5.Cells[0,0]:='Poz';
  StringGrid5.Cells[0,1]:='1';
  StringGrid5.Cells[1,0]:='Filename 1';
  StringGrid5.Cells[2,0]:='Size 1';
  StringGrid5.Cells[3,0]:='Filename 2';
  StringGrid5.Cells[4,0]:='Size 2';
  StringGrid5.Cells[5,0]:='MD5';
  StringGrid5.Cells[6,0]:='Location 1';
  StringGrid5.Cells[7,0]:='Location 2';
{ Set the PageIndex to zero.
  Display the Folder1 filelist tab }
  PageControl1.ActivePageIndex:=0;
{ Enable status bar 2nd Panel custom drawing }
  StatusBar1.Panels[1].Style:=psOwnerDraw;
{ Place the progress bar into the status bar }
  ProgressBar1.Parent:=StatusBar1;
{ Remove progress bar border }
  ProgressBarStyle:=GetWindowLong(ProgressBar1.Handle,GWL_EXSTYLE);
  ProgressBarStyle:=ProgressBarStyle-WS_EX_STATICEDGE;
  SetWindowLong(ProgressBar1.Handle,GWL_EXSTYLE,ProgressBarStyle);
{ Set ProgressBar Position to zero, and Maximum value to 100 }
  ProgressBar1.Position:=0;
  ProgressBar1.Max:=100;
{ Hide the ProgressBar. It will be displayed later when we launch a progress that take time }
  ProgressBar1.Visible:=False;
end;

{ The event of displaing the Properties window.
  Depends of which Page of PageControl is active }
procedure TForm1.FileProperties1Click(Sender: TObject);
begin
  If PageControl1.ActivePageIndex=0 Then
    PropertiesDialog(StringGrid1.Cells[4,StringGrid1.Row])
  Else If PageControl1.ActivePageIndex=1 Then
    PropertiesDialog(StringGrid2.Cells[4,StringGrid2.Row])
  Else If PageControl1.ActivePageIndex=2 Then
    PropertiesDialog(StringGrid3.Cells[4,StringGrid3.Row])
  Else If PageControl1.ActivePageIndex=3 Then
    PropertiesDialog(StringGrid4.Cells[4,StringGrid4.Row])
end;

{ The event of selecting the "Launch file" command from popup menu
  Depends of which Page of PageControl is active }
procedure TForm1.LaunchFile1Click(Sender: TObject);
begin
  If PageControl1.ActivePageIndex=0 Then
    ShellExecute(Handle,'open',PChar(StringGrid1.Cells[4,StringGrid1.Row]),Nil,Nil,SW_SHOWNORMAL)
  Else If PageControl1.ActivePageIndex=1 Then
    ShellExecute(Handle,'open',PChar(StringGrid2.Cells[4,StringGrid2.Row]),Nil,Nil,SW_SHOWNORMAL)
  Else If PageControl1.ActivePageIndex=2 Then
    ShellExecute(Handle,'open',PChar(StringGrid3.Cells[4,StringGrid3.Row]),Nil,Nil,SW_SHOWNORMAL)
  Else If PageControl1.ActivePageIndex=3 Then
    ShellExecute(Handle,'open',PChar(StringGrid4.Cells[4,StringGrid4.Row]),Nil,Nil,SW_SHOWNORMAL)
end;

{ The event of selecting the "Open with Notepad" command from popup menu
  Depends of which Page of PageControl is active }
procedure TForm1.OpenwithNotepad1Click(Sender: TObject);
begin
  If PageControl1.ActivePageIndex=0 Then
    ShellExecute(Handle,'open',PChar('c:\windows\notepad.exe'),PChar(StringGrid1.Cells[4,StringGrid1.Row]),Nil,SW_SHOWNORMAL)
  Else If PageControl1.ActivePageIndex=1 Then
    ShellExecute(Handle,'open',PChar('c:\windows\notepad.exe'),PChar(StringGrid2.Cells[4,StringGrid2.Row]),Nil,SW_SHOWNORMAL)
  Else If PageControl1.ActivePageIndex=2 Then
    ShellExecute(Handle,'open',PChar('c:\windows\notepad.exe'),PChar(StringGrid3.Cells[4,StringGrid3.Row]),Nil,SW_SHOWNORMAL)
  Else If PageControl1.ActivePageIndex=3 Then
    ShellExecute(Handle,'open',PChar('c:\windows\notepad.exe'),PChar(StringGrid4.Cells[4,StringGrid4.Row]),Nil,SW_SHOWNORMAL)
end;

{ The event of enabling or disabling the menu items depending on File existence
  Depends of which Page of PageControl is active }
procedure TForm1.PopupMenu1Popup(Sender: TObject);
Var s:String;
    b:Boolean;
begin
  b:=False;
{ Determine which tab is active and set the selected FileName and check if FileExists }
  If PageControl1.ActivePageIndex=0 Then
    Begin
      s:=StringGrid1.Cells[1,StringGrid1.Row];
      b:=FileExists(StringGrid1.Cells[4,StringGrid1.Row]);
    End
  Else If PageControl1.ActivePageIndex=1 Then
    Begin
      s:=StringGrid2.Cells[1,StringGrid2.Row];
      b:=FileExists(StringGrid2.Cells[4,StringGrid2.Row]);
    End
  Else If PageControl1.ActivePageIndex=2 Then
    Begin
      s:=StringGrid3.Cells[1,StringGrid3.Row];
      b:=FileExists(StringGrid3.Cells[4,StringGrid3.Row]);
    End
  Else If PageControl1.ActivePageIndex=3 Then
    Begin
      s:=StringGrid4.Cells[1,StringGrid4.Row];
      b:=FileExists(StringGrid4.Cells[4,StringGrid4.Row]);
    End;
{ Enable or disable the PopupMenu items }
  LaunchFile1.Enabled:=b;
  OpenwithNotepad1.Enabled:=b;
  ShowinExplorer1.Enabled:=b;
  Fileproperties1.Enabled:=b;
{ Enable or disable the MainMenu items }
  LaunchFile2.Enabled:=b;
  OpenwithNotepad2.Enabled:=b;
  ShowinExplorer2.Enabled:=b;
  Fileproperties2.Enabled:=b;
{ Trying to personalize the menu items with FileName, but is ugly :) }
//  If b Then
//    Begin
//      Launchfile1.Caption:='Launch File "'+s+'"';
//      OpenwithNotepad1.Caption:='Open "'+s+'" with &Notepad';
//      ShowinExplorer1.Caption:='Show "'+s+'" in E&xplorer';
//      Fileproperties1.Caption:='"'+s+'" File &Properties';
//{ Do the same with menu items... LaunchFile2.Captions, OpenwithNotepad2.Captions etc... }
//    End
//  Else
//    Begin
//      Launchfile1.Caption:='&Launch File';
//      OpenwithNotepad1.Caption:='Open with &Notepad';
//      ShowinExplorer1.Caption:='Show in E&xplorer';
//      Fileproperties1.Caption:='File &Properties'
//{ Do the same with menu items... LaunchFile2.Captions, OpenwithNotepad2.Captions etc... }
//    End;
end;

{ The event of closing the main form and application }
procedure TForm1.Quit1Click(Sender: TObject);
begin
  Close;
end;

{ The event of selecting the "Show in Explorer" command from popup menu
  Depends of which Page of PageControl is active }
procedure TForm1.ShowinExplorer1Click(Sender: TObject);
begin
  If PageControl1.ActivePageIndex=0 {StringGrid1.Focused} Then
    ShellExecute(Handle, 'open', PChar(ExtractFilePath(StringGrid1.Cells[4,StringGrid1.Row])), nil, nil, SW_SHOWNORMAL)
  Else If PageControl1.ActivePageIndex=1 {StringGrid2.Focused} Then
    ShellExecute(Handle, 'open', PChar(ExtractFilePath(StringGrid2.Cells[4,StringGrid2.Row])), nil, nil, SW_SHOWNORMAL)
  Else If PageControl1.ActivePageIndex=2 {StringGrid3.Focused} Then
    ShellExecute(Handle, 'open', PChar(ExtractFilePath(StringGrid3.Cells[4,StringGrid3.Row])), nil, nil, SW_SHOWNORMAL)
  Else If PageControl1.ActivePageIndex=3 {StringGrid4.Focused} Then
    ShellExecute(Handle, 'open', PChar(ExtractFilePath(StringGrid4.Cells[4,StringGrid4.Row])), nil, nil, SW_SHOWNORMAL)
end;

{ The event of selecting "Save filelist" command from popup menu
  Depends of which Page of PageControl is active }
procedure TForm1.Savefilelist1Click(Sender: TObject);
Begin
  If SaveDialog1.Execute Then
    Begin
      If PageControl1.ActivePageIndex=0 Then
        SaveInCSVFile(StringGrid1,SaveDialog1.FileName)
      Else If PageControl1.ActivePageIndex=1 Then
        SaveInCSVFile(StringGrid2,SaveDialog1.FileName)
      Else If PageControl1.ActivePageIndex=2 Then
        SaveInCSVFile(StringGrid3,SaveDialog1.FileName)
      Else If PageControl1.ActivePageIndex=3 Then
        SaveInCSVFile(StringGrid4,SaveDialog1.FileName);
    End;
End;

{ The event to Copy unique files from Folder 1 to Folder 2 }
procedure TForm1.SpeedButton7Click(Sender: TObject);
begin
//
end;

{ The event to Copy unique files from Folder 2 to Folder 1 }
procedure TForm1.SpeedButton8Click(Sender: TObject);
begin
//
end;

{ The event to Delete files from folder 1 that exist in both folders }
procedure TForm1.SpeedButton9Click(Sender: TObject);
Var i,j,k,l:Integer;
    s:AnsiString;
begin
{ We check if the StringGrid have at least a file that exists on HDD }
  If FileExists(StringGrid5.Cells[6,StringGrid5.RowCount-1]) Then
    Begin
{ Initially I put a message dialog for confirmation,
  but it's not needed, the system will ask for delete confirmation.
  If not, right click on "Recycle Bin" icon from "Desktop",
  in popup menu go to "Properties" -> "Global"
  and mark "Display delete confirmation dialog" options.
  If files are not going to Recycle Bin, unmark this:
  "Do not move files to Recycle Bin" options }
      For i:=1 To StringGrid5.RowCount-1 Do
        Begin
{ Add filenames to StringGrid4 - "Files only in Folder 2" tab }
          StringGrid4.Cells[0,StringGrid4.RowCount]:=IntToStr(StringGrid4.RowCount);  // Position number
          StringGrid4.Cells[1,StringGrid4.RowCount]:=StringGrid5.Cells[1,i];          // Filename 1
          StringGrid4.Cells[2,StringGrid4.RowCount]:=StringGrid5.Cells[2,i];          // File Size 1
          StringGrid4.Cells[3,StringGrid4.RowCount]:=StringGrid5.Cells[5,i];          // MD5 1
          StringGrid4.Cells[4,StringGrid4.RowCount]:=StringGrid5.Cells[6,i];          // File Location 1
          StringGrid4.RowCount:=StringGrid4.RowCount+1;
          StringGrid4.Row:=StringGrid4.RowCount-1;
{ Remove filenames from StringGrid1 - "Folder 1 files" tab }
          For j:=1 To StringGrid1.RowCount-1 Do
            Begin
              If StringGrid5.Cells[6,i]=StringGrid1.Cells[4,j] Then
                Begin
{ Empty the line with the file sended to Recycle Bin }
                  For k:=0 To StringGrid1.ColCount-1 Do
                    StringGrid1.Cells[k,j]:='';
{ Move the lines over the empted line }
                  For k:=j+1 To StringGrid1.RowCount-1 Do
                    For l:=0 To StringGrid1.ColCount-1 Do
                      StringGrid1.Cells[l,k-1]:=StringGrid1.Cells[l,k];
{ Empty the last line in StringGrid1 }
                  For l:=0 To StringGrid1.ColCount-1 Do
                    StringGrid1.Cells[l,k-1]:=StringGrid1.Cells[l,k];
{ Decrease the number of lines in StringGrid1 }
                  StringGrid1.Row:=StringGrid1.RowCount-2;
                  StringGrid1.RowCount:=StringGrid1.RowCount-1;
                  Break;
                End;
            End;
          If i=1 Then
            s:=StringGrid5.Cells[6,1]
          Else
            s:=s+#0+StringGrid5.Cells[6,i];
        End;
      s:=s+#0+#0;
{ Send all files to Recycle Bin }
      RecycleFile(s);
{ Clear all lines from StringGrid5 }
      ClearStringGrid(StringGrid5);
    End;
end;

{ The event to Delete files from folder 2 that exist in both folders }
procedure TForm1.SpeedButton10Click(Sender: TObject);
Var i,j,k,l:Integer;
    s:AnsiString;
begin
{ We check if the StringGrid have at least a file that exists on HDD }
  If FileExists(StringGrid5.Cells[7,StringGrid5.RowCount-1]) Then
    Begin
{ Initially I put a message dialog for confirmation,
  but it's not needed, the system will ask for delete confirmation.
  If not, right click on "Recycle Bin" icon from "Desktop",
  in popup menu go to "Properties" -> "Global"
  and mark "Display delete confirmation dialog" options.
  If files are not going to Recycle Bin, unmark this:
  "Do not move files to Recycle Bin" options }
      For i:=1 To StringGrid5.RowCount-1 Do
        Begin
{ Add filenames to StringGrid3 - "Files only in Folder 1" tab }
          StringGrid3.Cells[0,StringGrid3.RowCount]:=IntToStr(StringGrid3.RowCount);  // Position number
          StringGrid3.Cells[1,StringGrid3.RowCount]:=StringGrid5.Cells[3,i];          // Filename 2
          StringGrid3.Cells[2,StringGrid3.RowCount]:=StringGrid5.Cells[4,i];          // File Size 2
          StringGrid3.Cells[3,StringGrid3.RowCount]:=StringGrid5.Cells[5,i];          // MD5 2
          StringGrid3.Cells[4,StringGrid3.RowCount]:=StringGrid5.Cells[7,i];          // File Location 2
          StringGrid3.RowCount:=StringGrid3.RowCount+1;
          StringGrid3.Row:=StringGrid3.RowCount-1;
{ Remove filenames from StringGrid2 - "Folder 2 files" tab }
          For j:=1 To StringGrid2.RowCount-1 Do
            Begin
              If StringGrid5.Cells[7,i]=StringGrid2.Cells[4,j] Then
                Begin
{ Empty the line with the file sended to Recycle Bin }
                  For k:=0 To StringGrid2.ColCount-1 Do
                    StringGrid2.Cells[k,j]:='';
{ Move the lines over the empted line }
                  For k:=j+1 To StringGrid2.RowCount-1 Do
                    For l:=0 To StringGrid2.ColCount-1 Do
                      StringGrid2.Cells[l,k-1]:=StringGrid2.Cells[l,k];
{ Empty the last line in StringGrid2 }
                  For l:=0 To StringGrid2.ColCount-1 Do
                    StringGrid2.Cells[l,k-1]:=StringGrid2.Cells[l,k];
{ Decrease the number of lines in StringGrid2 }
                  StringGrid2.Row:=StringGrid2.RowCount-2;
                  StringGrid2.RowCount:=StringGrid2.RowCount-1;
                  Break;
                End;
            End;
          If i=1 Then
            s:=StringGrid5.Cells[7,1]
          Else
            s:=s+#0+StringGrid5.Cells[7,i];
        End;
      s:=s+#0+#0;
{ Send all files to Recycle Bin }
      RecycleFile(s);
{ Clear all lines from StringGrid5 }
      ClearStringGrid(StringGrid5);
    End;
end;

{ The event of drawing the StatusBar
  The ProgressBar is moved to StatusBar }
procedure TForm1.StatusBar1DrawPanel(StatusBar:TStatusBar;Panel:TStatusPanel;Const Rect:TRect);
Begin
  If Panel=StatusBar.Panels[1] Then
    With ProgressBar1 Do Begin
      Top:=Rect.Top;
      Left:=Rect.Left;
      Width:=Rect.Right-Rect.Left-15;
      Height:=Rect.Bottom-Rect.Top;
    End;
End;

{ The event of stripe the StringGrid1 }
procedure TForm1.StringGrid1DrawCell(Sender: TObject; ACol, ARow: Integer; Rect: TRect; State: TGridDrawState);
begin
  aStringGridDrawCell(StringGrid1,Sender,ACol,ARow,Rect,State);
end;

{ The event of stripe the StringGrid2 }
procedure TForm1.StringGrid2DrawCell(Sender: TObject; ACol, ARow: Integer; Rect: TRect; State: TGridDrawState);
begin
  aStringGridDrawCell(StringGrid2,Sender,ACol,ARow,Rect,State);
end;

{ The event of stripe the StringGrid3 }
procedure TForm1.StringGrid3DrawCell(Sender: TObject; ACol, ARow: Integer; Rect: TRect; State: TGridDrawState);
begin
  aStringGridDrawCell(StringGrid3,Sender,ACol,ARow,Rect,State);
end;

{ The event of stripe the StringGrid4 }
procedure TForm1.StringGrid4DrawCell(Sender: TObject; ACol, ARow: Integer;
  Rect: TRect; State: TGridDrawState);
begin
  aStringGridDrawCell(StringGrid4,Sender,ACol,ARow,Rect,State);
end;

{ The event of stripe the StringGrid5 }
procedure TForm1.StringGrid5DrawCell(Sender: TObject; ACol, ARow: Integer;
  Rect: TRect; State: TGridDrawState);
begin
  aStringGridDrawCell(StringGrid5,Sender,ACol,ARow,Rect,State);
end;

end.

