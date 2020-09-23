VERSION 5.00
Begin VB.Form keygen 
   Caption         =   "Key Generator"
   ClientHeight    =   1920
   ClientLeft      =   60
   ClientTop       =   330
   ClientWidth     =   4440
   Icon            =   "keygen.frx":0000
   LinkTopic       =   "Form1"
   ScaleHeight     =   1920
   ScaleWidth      =   4440
   StartUpPosition =   3  'Windows Default
   Begin VB.TextBox Text4 
      Height          =   285
      Left            =   3480
      Locked          =   -1  'True
      MaxLength       =   5
      TabIndex        =   8
      Top             =   720
      Width           =   615
   End
   Begin VB.TextBox Text3 
      Height          =   285
      Left            =   480
      Locked          =   -1  'True
      MaxLength       =   7
      TabIndex        =   6
      Top             =   720
      Width           =   735
   End
   Begin VB.CommandButton Command2 
      Caption         =   "Cancel"
      Height          =   330
      Left            =   2640
      TabIndex        =   5
      Top             =   1320
      Width           =   1200
   End
   Begin VB.CommandButton Command1 
      Caption         =   "Create"
      Height          =   330
      Left            =   360
      TabIndex        =   4
      Top             =   1320
      Width           =   1200
   End
   Begin VB.TextBox Text2 
      Height          =   315
      Left            =   1440
      Locked          =   -1  'True
      MaxLength       =   17
      TabIndex        =   3
      Top             =   720
      Width           =   1725
   End
   Begin VB.TextBox Text1 
      Height          =   300
      Left            =   1560
      TabIndex        =   1
      Top             =   240
      Width           =   2385
   End
   Begin VB.Label Label4 
      Alignment       =   2  'Center
      Caption         =   "-"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   12
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   255
      Left            =   3240
      TabIndex        =   9
      Top             =   720
      Width           =   255
   End
   Begin VB.Label Label3 
      Alignment       =   2  'Center
      Caption         =   "-"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   12
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   255
      Left            =   1200
      TabIndex        =   7
      Top             =   720
      Width           =   255
   End
   Begin VB.Label Label2 
      Caption         =   "Registration Code"
      Height          =   270
      Left            =   120
      TabIndex        =   2
      Top             =   480
      Width           =   1395
   End
   Begin VB.Label Label1 
      Caption         =   "Registration Name:"
      Height          =   225
      Left            =   120
      TabIndex        =   0
      Top             =   240
      Width           =   1545
   End
End
Attribute VB_Name = "keygen"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub Command1_Click()
Dim Code1 As Single

If Len(Text1.Text) < 4 Then
    MsgBox "The Name must be more than 4 characters.", vbInformation + vbOKOnly, "Ooops"
    Exit Sub
End If

For i = 1 To Len(Text1.Text) - 1
    Code1 = Format(Asc(Right(Text1.Text, Len(Text1.Text) - i)) * 2 + (31 / i) + (i + 3 / 7), "#.#")
    zip = zip & Code1
Next i
zip = Right(zip, 8)

For i = 1 To Len(zip) - 1
    Code1 = Format(Asc(Right(zip, Len(zip) - i)) * 2 + (1 / i) + (i + 1 / 7), "#00")
    final = final & Code1
Next i
Text3.Text = "8546854"
Text4.Text = "64381"
final = Right(final, Len(final) - 4)
final = final & Asc(Text1)
Text2 = final
End Sub

Private Sub Command2_Click()
Unload Me
End Sub
