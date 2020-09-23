VERSION 5.00
Begin VB.Form Form3 
   Caption         =   "Test Application"
   ClientHeight    =   3195
   ClientLeft      =   60
   ClientTop       =   450
   ClientWidth     =   5760
   LinkTopic       =   "Form3"
   ScaleHeight     =   3195
   ScaleWidth      =   5760
   StartUpPosition =   3  'Windows Default
   Begin VB.CommandButton Command1 
      Caption         =   "Unregister"
      Enabled         =   0   'False
      Height          =   375
      Left            =   4320
      TabIndex        =   3
      Top             =   2040
      Width           =   1335
   End
   Begin VB.CommandButton Command2 
      Caption         =   "Test 2"
      Enabled         =   0   'False
      Height          =   495
      Left            =   2040
      TabIndex        =   1
      Top             =   960
      Width           =   1935
   End
   Begin VB.Label Label3 
      Caption         =   "0"
      Height          =   255
      Left            =   0
      TabIndex        =   4
      Top             =   3000
      Width           =   135
   End
   Begin VB.Label Label2 
      Caption         =   "Command Button is Disabled In the Unregistered Version"
      Height          =   615
      Left            =   2160
      TabIndex        =   2
      Top             =   240
      Width           =   1815
   End
   Begin VB.Label Label1 
      Caption         =   "Registered To: Unregistered"
      Height          =   255
      Left            =   1560
      TabIndex        =   0
      Top             =   2640
      Width           =   3015
   End
End
Attribute VB_Name = "Form3"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub Command1_Click()
Kill ("C:\Windows\System\wind32.dat")
MsgBox ("All Done!"), vbInformation, ("Done!")
SaveSetting "Win32", "Startup", "counter", 1
       SaveSetting "Win32", "Startup", "Started", Format(Date, "mm dd yyyy")
       SaveSetting "Win32", "Startup", "Last Used", Format(Date, "mm dd yyyy")
End
End Sub

Private Sub Command2_Click()
MsgBox ("You are in the registered Version!"), vbInformation, ("Registered Version!")
End Sub

Private Sub Form_Load()

'######## This checks if the program has run
'and if the user deleted the registry to start his time over again!

If Label3.Caption = ("0") Then


Open "C:\windows\system\windat2.dat" For Input As #1
Input #1, started
Close #1

' If the program has run before and the counter has 0 when it should have more, then
If started = "yes" And GetSetting("Win32", "Startup", "counter", "") = "" Then
    MsgBox "NO! Deleting the Registry Entries Won't do Crap you stupid Hacker!", vbInformation + vbOKOnly, "Ooops"
     End
     Exit Sub
    End If

End If



'#### End Of Registry code














On Error GoTo 55
Open "C:\windows\system\wind32.dat" For Input As #1
Input #1, final1
Input #1, fname
Close #1
Dim Code1 As Single

If Len(fname) < 4 Then
    MsgBox "The Name must be more than 4 characters.", vbInformation + vbOKOnly, "Ooops"
    Exit Sub
End If

Label1.Caption = ("Registered To: ") & fname

If Label1.Caption = "Registered To:" Then
Label1.Caption = ("Registered To: Unregistered")
End If





For i = 1 To Len(fname) - 1
    Code1 = Format(Asc(Right(fname, Len(fname) - i)) * 2 + (31 / i) + (i + 3 / 7), "#.#")
    zip = zip & Code1
Next i
zip = Right(zip, 8)

For i = 1 To Len(zip) - 1
    Code1 = Format(Asc(Right(zip, Len(zip) - i)) * 2 + (1 / i) + (i + 1 / 7), "#00")
    final = final & Code1
Next i
final = Right(final, Len(final) - 4)
final = final & Asc(fname)
If final1 = final And Len(fname) >= 4 Then
   'ENABLE FUNCTIONS IF REGISTERED
    Command2.Enabled = True
    Command1.Enabled = True
    Label3.Caption = ("1")
Else
55
    Me.Hide
    Form1.Show
    Exit Sub
End If





End Sub

