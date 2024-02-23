object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Dir Track'
  ClientHeight = 523
  ClientWidth = 693
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Menu = MainMenu1
  OldCreateOrder = False
  WindowState = wsMaximized
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 161
    Height = 504
    Align = alLeft
    TabOrder = 0
    ExplicitHeight = 484
    DesignSize = (
      161
      504)
    object SpeedButton1: TSpeedButton
      Left = 10
      Top = 9
      Width = 145
      Height = 33
      Caption = '1. Set Folder 1'
      Flat = True
      OnClick = SpeedButton1Click
    end
    object SpeedButton2: TSpeedButton
      Left = 10
      Top = 48
      Width = 145
      Height = 33
      Caption = '2. Set Folder 2'
      Enabled = False
      Flat = True
      OnClick = SpeedButton2Click
    end
    object SpeedButton3: TSpeedButton
      Left = 10
      Top = 87
      Width = 145
      Height = 33
      Caption = '3. Scan folders for files'
      Enabled = False
      Flat = True
      OnClick = SpeedButton3Click
    end
    object SpeedButton4: TSpeedButton
      Left = 10
      Top = 126
      Width = 145
      Height = 33
      Caption = '4. Calculate MD5 hashs'
      Enabled = False
      Flat = True
      OnClick = SpeedButton4Click
    end
    object SpeedButton5: TSpeedButton
      Left = 10
      Top = 165
      Width = 145
      Height = 33
      Caption = '5. Determine different files'
      Enabled = False
      Flat = True
      OnClick = SpeedButton5Click
    end
    object SpeedButton6: TSpeedButton
      Left = 10
      Top = 458
      Width = 145
      Height = 33
      Anchors = [akLeft, akBottom]
      Caption = '6. Reset All'
      Flat = True
      OnClick = SpeedButton6Click
      ExplicitTop = 398
    end
  end
  object page: TPanel
    Left = 161
    Top = 0
    Width = 532
    Height = 504
    Align = alClient
    TabOrder = 1
    ExplicitHeight = 484
    object PageControl1: TPageControl
      Left = 1
      Top = 1
      Width = 530
      Height = 502
      ActivePage = TabSheet3
      Align = alClient
      Style = tsFlatButtons
      TabOrder = 0
      ExplicitHeight = 482
      object TabSheet1: TTabSheet
        Caption = 'Folder 1 files'
        ExplicitHeight = 451
        object StringGrid1: TStringGrid
          Left = 0
          Top = 0
          Width = 522
          Height = 422
          Align = alClient
          Ctl3D = False
          DefaultRowHeight = 16
          RowCount = 2
          Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goColSizing, goRowSelect]
          ParentCtl3D = False
          PopupMenu = PopupMenu1
          TabOrder = 0
          OnDblClick = LaunchFile1Click
          OnDrawCell = StringGrid1DrawCell
          ExplicitHeight = 402
          ColWidths = (
            50
            350
            80
            250
            0)
        end
        object Panel2: TPanel
          Left = 0
          Top = 422
          Width = 522
          Height = 49
          Align = alBottom
          BevelOuter = bvLowered
          TabOrder = 1
          ExplicitTop = 402
          object Label1: TLabel
            Left = 16
            Top = 8
            Width = 87
            Height = 13
            Caption = 'No folder selected'
          end
        end
        object ProgressBar1: TProgressBar
          Left = 144
          Top = 248
          Width = 150
          Height = 17
          Position = 33
          TabOrder = 2
        end
      end
      object TabSheet2: TTabSheet
        Caption = 'Folder 2 files'
        ImageIndex = 1
        ExplicitHeight = 451
        object StringGrid2: TStringGrid
          Left = 0
          Top = 0
          Width = 522
          Height = 422
          Align = alClient
          Ctl3D = False
          DefaultRowHeight = 16
          RowCount = 2
          Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goColSizing, goRowSelect]
          ParentCtl3D = False
          PopupMenu = PopupMenu1
          TabOrder = 0
          OnDblClick = LaunchFile1Click
          OnDrawCell = StringGrid2DrawCell
          ExplicitHeight = 402
          ColWidths = (
            50
            350
            80
            250
            0)
        end
        object Panel3: TPanel
          Left = 0
          Top = 422
          Width = 522
          Height = 49
          Align = alBottom
          BevelOuter = bvLowered
          TabOrder = 1
          ExplicitTop = 402
          object Label2: TLabel
            Left = 16
            Top = 8
            Width = 87
            Height = 13
            Caption = 'No folder selected'
          end
        end
      end
      object TabSheet3: TTabSheet
        Caption = 'Files only in folder 1'
        ImageIndex = 2
        ExplicitHeight = 451
        object StringGrid3: TStringGrid
          Left = 0
          Top = 0
          Width = 522
          Height = 422
          Align = alClient
          Ctl3D = False
          DefaultRowHeight = 16
          RowCount = 2
          Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goColSizing, goRowSelect]
          ParentCtl3D = False
          PopupMenu = PopupMenu1
          TabOrder = 0
          OnDblClick = LaunchFile1Click
          OnDrawCell = StringGrid3DrawCell
          ExplicitHeight = 402
          ColWidths = (
            50
            350
            80
            250
            0)
        end
        object Panel4: TPanel
          Left = 0
          Top = 422
          Width = 522
          Height = 49
          Align = alBottom
          BevelOuter = bvLowered
          TabOrder = 1
          ExplicitTop = 402
          object SpeedButton7: TSpeedButton
            Left = 8
            Top = 8
            Width = 145
            Height = 33
            Caption = 'Copy all files to folder 2'
            Enabled = False
            Flat = True
            OnClick = SpeedButton7Click
          end
        end
      end
      object TabSheet4: TTabSheet
        Caption = 'Files only in folder 2'
        ImageIndex = 3
        ExplicitHeight = 451
        object StringGrid4: TStringGrid
          Left = 0
          Top = 0
          Width = 522
          Height = 422
          Align = alClient
          Ctl3D = False
          DefaultRowHeight = 16
          RowCount = 2
          Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goColSizing, goRowSelect]
          ParentCtl3D = False
          PopupMenu = PopupMenu1
          TabOrder = 0
          OnDblClick = LaunchFile1Click
          OnDrawCell = StringGrid4DrawCell
          ExplicitHeight = 402
          ColWidths = (
            50
            350
            80
            250
            0)
        end
        object Panel5: TPanel
          Left = 0
          Top = 422
          Width = 522
          Height = 49
          Align = alBottom
          BevelOuter = bvLowered
          TabOrder = 1
          ExplicitTop = 402
          object SpeedButton8: TSpeedButton
            Left = 8
            Top = 8
            Width = 145
            Height = 33
            Caption = 'Copy all files to folder 1'
            Enabled = False
            Flat = True
            OnClick = SpeedButton8Click
          end
        end
      end
      object TabSheet5: TTabSheet
        Caption = 'Files in both folders'
        ImageIndex = 4
        ExplicitHeight = 451
        object StringGrid5: TStringGrid
          Left = 0
          Top = 0
          Width = 522
          Height = 422
          Align = alClient
          ColCount = 8
          Ctl3D = False
          DefaultRowHeight = 16
          RowCount = 2
          Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goColSizing, goRowSelect]
          ParentCtl3D = False
          TabOrder = 0
          OnDblClick = LaunchFile1Click
          OnDrawCell = StringGrid5DrawCell
          ExplicitHeight = 402
          ColWidths = (
            50
            230
            75
            230
            75
            250
            0
            0)
        end
        object Panel6: TPanel
          Left = 0
          Top = 422
          Width = 522
          Height = 49
          Align = alBottom
          BevelOuter = bvLowered
          TabOrder = 1
          ExplicitTop = 402
          object SpeedButton9: TSpeedButton
            Left = 8
            Top = 8
            Width = 145
            Height = 33
            Caption = 'Delete files from folder 1'
            Flat = True
            OnClick = SpeedButton9Click
          end
          object SpeedButton10: TSpeedButton
            Left = 161
            Top = 8
            Width = 145
            Height = 33
            Caption = 'Delete files from folder 2'
            Flat = True
            OnClick = SpeedButton10Click
          end
        end
      end
    end
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 504
    Width = 693
    Height = 19
    Panels = <
      item
        Text = 'Ready'
        Width = 160
      end
      item
        Width = 50
      end>
    OnDrawPanel = StatusBar1DrawPanel
    ExplicitTop = 484
  end
  object PopupMenu1: TPopupMenu
    OnPopup = PopupMenu1Popup
    Left = 224
    Top = 264
    object LaunchFile1: TMenuItem
      Caption = '&Launch File'
      ShortCut = 13
      OnClick = LaunchFile1Click
    end
    object OpenwithNotepad1: TMenuItem
      Caption = 'Open with &Notepad'
      ShortCut = 8205
      OnClick = OpenwithNotepad1Click
    end
    object ShowinExplorer1: TMenuItem
      Caption = 'Show in E&xplorer'
      ShortCut = 32781
      OnClick = ShowinExplorer1Click
    end
    object FileProperties1: TMenuItem
      Caption = 'File &Properties'
      ShortCut = 16397
      OnClick = FileProperties1Click
    end
    object N2: TMenuItem
      Caption = '-'
    end
    object SortFilelist1: TMenuItem
      Caption = 'Sort &Filelist'
      object byNumber1: TMenuItem
        Caption = 'by Number'
        OnClick = byNumber1Click
      end
      object byFilename1: TMenuItem
        Caption = 'by Filename'
        OnClick = byFilename1Click
      end
      object bySize1: TMenuItem
        Caption = 'by Size'
        OnClick = bySize1Click
      end
      object byMD51: TMenuItem
        Caption = 'by MD5'
        OnClick = byMD51Click
      end
      object byLocation1: TMenuItem
        Caption = 'by Location'
        OnClick = byLocation1Click
      end
    end
    object N1: TMenuItem
      Caption = '-'
    end
    object Savefilelist1: TMenuItem
      Caption = '&Save filelist...'
      OnClick = Savefilelist1Click
    end
  end
  object SaveDialog1: TSaveDialog
    DefaultExt = 'CSV'
    Filter = 'CSV file [*.csv]|*.csv'
    Options = [ofOverwritePrompt, ofHideReadOnly, ofEnableSizing]
    Left = 264
    Top = 264
  end
  object MainMenu1: TMainMenu
    Left = 184
    Top = 264
    object Action1: TMenuItem
      Caption = '&Action'
      OnClick = PopupMenu1Popup
      object N1SetFolder11: TMenuItem
        Caption = '1. Set Folder 1'
        OnClick = SpeedButton1Click
      end
      object N2SetFolder21: TMenuItem
        Caption = '2. Set Folder 2'
        Enabled = False
        OnClick = SpeedButton2Click
      end
      object N3Scanfoldersforfiles1: TMenuItem
        Caption = '3. Scan folders for files'
        Enabled = False
        OnClick = SpeedButton3Click
      end
      object N4CalculateMD5hashs1: TMenuItem
        Caption = '4. Calculate MD5 hashs'
        Enabled = False
        OnClick = SpeedButton4Click
      end
      object N5Determinedifferentfiles1: TMenuItem
        Caption = '5. Determine different files'
        Enabled = False
        OnClick = SpeedButton5Click
      end
      object N3: TMenuItem
        Caption = '-'
      end
      object N6ResetAll1: TMenuItem
        Caption = '6. Reset All'
        OnClick = SpeedButton6Click
      end
      object N7: TMenuItem
        Caption = '-'
      end
      object Quit1: TMenuItem
        Caption = '&Quit'
        ShortCut = 32883
        OnClick = Quit1Click
      end
    end
    object View1: TMenuItem
      Caption = '&View'
      OnClick = PopupMenu1Popup
      object LaunchFile2: TMenuItem
        Caption = '&Launch File'
        ShortCut = 13
        OnClick = LaunchFile1Click
      end
      object OpenwithNotepad2: TMenuItem
        Caption = 'Open with &Notepad'
        ShortCut = 8205
        OnClick = OpenwithNotepad1Click
      end
      object ShowinExplorer2: TMenuItem
        Caption = 'Show in E&xplorer'
        ShortCut = 32781
        OnClick = ShowinExplorer1Click
      end
      object FileProperties2: TMenuItem
        Caption = 'File &Properties'
        ShortCut = 16397
        OnClick = FileProperties1Click
      end
      object N4: TMenuItem
        Caption = '-'
      end
      object SortFilelist2: TMenuItem
        Caption = 'Sort &Filelist'
        object byNumber2: TMenuItem
          Caption = 'by Number'
          OnClick = byNumber1Click
        end
        object byFilename2: TMenuItem
          Caption = 'by Filename'
          OnClick = byFilename1Click
        end
        object bySize3: TMenuItem
          Caption = 'by Size'
          OnClick = bySize1Click
        end
        object bySize2: TMenuItem
          Caption = 'by MD5'
          OnClick = byMD51Click
        end
        object byLocation2: TMenuItem
          Caption = 'by Location'
          OnClick = byLocation1Click
        end
      end
      object N5: TMenuItem
        Caption = '-'
      end
      object Savefilelist2: TMenuItem
        Caption = '&Save filelist...'
        OnClick = Savefilelist1Click
      end
    end
    object Edit1: TMenuItem
      Caption = '&Edit'
      object CopyfilesonlyinFolder1toFolder21: TMenuItem
        Caption = 'Copy files only in Folder 1 to Folder 2'
        Enabled = False
        OnClick = SpeedButton7Click
      end
      object CopyfilesonlyinFolder2toFolder11: TMenuItem
        Caption = 'Copy files only in Folder 2 to Folder 1'
        Enabled = False
        OnClick = SpeedButton8Click
      end
      object N6: TMenuItem
        Caption = '-'
      end
      object DeletefilesinbothFoldersfromFolder11: TMenuItem
        Caption = 'Delete files in both Folders from Folder 1'
        OnClick = SpeedButton9Click
      end
      object DeletefilesinbothFoldersfromFolder21: TMenuItem
        Caption = 'Delete files in both Folders from Folder 2'
        OnClick = SpeedButton10Click
      end
    end
    object Help1: TMenuItem
      Caption = '&Help'
      object About1: TMenuItem
        Caption = '&About'
        ShortCut = 112
        OnClick = About1Click
      end
    end
  end
end
