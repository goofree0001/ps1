# ストップウォッチ

# アセンブリの読み込み
Add-Type -AssemblyName System.Windows.Forms
Add-Type -AssemblyName System.Drawing

# フォームの作成
$Time_Form = New-Object System.Windows.Forms.Form
$Time_Form.Size = "190,170"
$Time_Form.StartPosition = "Manual"
$Time_Form.Location = "1200,10"
$Time_Form.font = New-Object System.Drawing.Font("メイリオ",9)
$Time_Form.MinimizeBox = $False
$Time_Form.MaximizeBox = $False
$Time_Form.TopLevel = $True
$Time_Form.Text = "時計"

# 時間表示ラベル
$Label = New-Object System.Windows.Forms.Label
$Label.Location = "10,10"
$Label.Size = "150,50"
$Label.text = Get-Date -Format "HH:mm:ss"
$Label.Font = New-Object System.Drawing.Font("メイリオ",10)
$Label.textAlign = "MiddleCenter"

#タイマー
$Timer = New-Object System.Windows.Forms.Timer
$Timer.Interval = 1000
$Time = {
    $Label.Text = Get-Date -Format "HH:mm:ss"
    $Time_Form.Update
}
$Timer.Add_Tick($Time)
$Timer.Start()

# 閉じるボタン
$Button = New-Object System.Windows.Forms.Button
$Button.Location = "10,70"
$Button.Size = "70,40"
$Button.Text = "閉じる"
$Click = {
    $Time_Form.Dispose()
}
$Button.Add_Click($Click)

# フォームに各アイテムを設置 
$Time_Form.Controls.AddRange(@($Label,$Button))

# フォームを表示
$Time_Form.Show()

[System.Windows.Forms.Application]::Run($Time_Form)
