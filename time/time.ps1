# �X�g�b�v�E�H�b�`

# �A�Z���u���̓ǂݍ���
Add-Type -AssemblyName System.Windows.Forms
Add-Type -AssemblyName System.Drawing

# �t�H�[���̍쐬
$Time_Form = New-Object System.Windows.Forms.Form
$Time_Form.Size = "190,170"
$Time_Form.StartPosition = "Manual"
$Time_Form.Location = "1200,10"
$Time_Form.font = New-Object System.Drawing.Font("���C���I",9)
$Time_Form.MinimizeBox = $False
$Time_Form.MaximizeBox = $False
$Time_Form.TopLevel = $True
$Time_Form.Text = "���v"

# ���ԕ\�����x��
$Label = New-Object System.Windows.Forms.Label
$Label.Location = "10,10"
$Label.Size = "150,50"
$Label.text = Get-Date -Format "HH:mm:ss"
$Label.Font = New-Object System.Drawing.Font("���C���I",10)
$Label.textAlign = "MiddleCenter"

#�^�C�}�[
$Timer = New-Object System.Windows.Forms.Timer
$Timer.Interval = 1000
$Time = {
    $Label.Text = Get-Date -Format "HH:mm:ss"
    $Time_Form.Update
}
$Timer.Add_Tick($Time)
$Timer.Start()

# ����{�^��
$Button = New-Object System.Windows.Forms.Button
$Button.Location = "10,70"
$Button.Size = "70,40"
$Button.Text = "����"
$Click = {
    $Time_Form.Dispose()
}
$Button.Add_Click($Click)

# �t�H�[���Ɋe�A�C�e����ݒu 
$Time_Form.Controls.AddRange(@($Label,$Button))

# �t�H�[����\��
$Time_Form.Show()

[System.Windows.Forms.Application]::Run($Time_Form)
