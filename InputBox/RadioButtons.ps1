function PromptWithCheckboxesAndRadionbuttons(
    [String] $title, 
    [String] $message, 
    [Object] $caller = $null 
    ){

  [void] [System.Reflection.Assembly]::LoadWithPartialName('System.Drawing') 
  [void] [System.Reflection.Assembly]::LoadWithPartialName('System.Collections') 
  [void] [System.Reflection.Assembly]::LoadWithPartialName('System.ComponentModel') 
  [void] [System.Reflection.Assembly]::LoadWithPartialName('System.Windows.Forms')
  [void] [System.Reflection.Assembly]::LoadWithPartialName('System.Data') 

  $f = New-Object System.Windows.Forms.Form 
  $f.Text = $title
  $groupBox1 = New-Object System.Windows.Forms.GroupBox
  $checkBox1 = New-Object System.Windows.Forms.CheckBox
  $checkBox2 = New-Object System.Windows.Forms.CheckBox
  $checkBox3 = New-Object System.Windows.Forms.CheckBox
  $radioButton1 = New-Object System.Windows.Forms.RadioButton
  $radioButton2 = New-Object System.Windows.Forms.RadioButton
  $radioButton3 = New-Object System.Windows.Forms.RadioButton
  $button1  = New-Object System.Windows.Forms.Button
  $components =  New-Object System.ComponentModel.Container

  $groupBox1.SuspendLayout()
  $f.SuspendLayout()
  $color = ''
  $shapes = @()     

  # groupBox1   
  $groupBox1.Controls.AddRange(  
     @(
       $radioButton1,
       $radioButton2,
       $radioButton3 
      ))
  $groupBox1.Location = New-Object System.Drawing.Point(8, 120)
  $groupBox1.Name = 'groupBox1'
  $groupBox1.Size = New-Object System.Drawing.Size(120, 144)
  $groupBox1.TabIndex = 0
  $groupBox1.TabStop = $false
  $groupBox1.Text = 'Color'

  # checkBox1   
  $checkBox1.Location = New-Object System.Drawing.Point(8, 8)
  $checkBox1.Name = 'checkBox1'
  $checkBox1.TabIndex = 1
  $checkBox1.Text = 'Circle'
   
  # checkBox2
   
  $checkBox2.Location = New-Object System.Drawing.Point(8, 40)
  $checkBox2.Name = 'checkBox2'
  $checkBox2.TabIndex = 2
  $checkBox2.Text = 'Rectangle'
   
  # checkBox3
   
  $checkBox3.Location = New-Object System.Drawing.Point(8, 72)
  $checkBox3.Name = 'checkBox3'
  $checkBox3.TabIndex = 3
  $checkBox3.Text = 'Triangle'
  
  # radioButton1
   
  $radioButton1.Location = New-Object System.Drawing.Point(8, 32)
  $radioButton1.Name = 'radioButton1'
  $radioButton1.TabIndex = 4
  $radioButton1.Text = 'Red'
  $radioButton1.Add_CheckedChanged({ })
   
  # radioButton2
   
  $radioButton2.Location = New-Object System.Drawing.Point(8, 64)
  $radioButton2.Name = 'radioButton2'
  $radioButton2.TabIndex = 5
  $radioButton2.Text = 'Green'
   
  # radioButton3
   
  $radioButton3.Location = New-Object System.Drawing.Point(8, 96)
  $radioButton3.Name = 'radioButton3'
  $radioButton3.TabIndex = 6
  $radioButton3.Text = 'Blue'
   
  # button1
   
  $button1.Location = New-Object System.Drawing.Point(8, 280)
  $button1.Name = 'button1'
  $button1.Size = New-Object System.Drawing.Size(112, 32)
  $button1.TabIndex = 4
  $button1.Text = 'Draw'

  $button1.Add_Click({

  $color = ''
  $shapes = @()     
  foreach ($o in @($radioButton1, $radioButton2, $radioButton3)){
  if ($o.Checked){
      $color = $o.Text}
  }
  foreach ($o in @($checkBox1, $checkBox2, $checkBox3)){
  if ($o.Checked){
      $shapes += $o.Text}

  }
  $g = [System.Drawing.Graphics]::FromHwnd($f.Handle)
  $rc = New-Object System.Drawing.Rectangle(150, 50, 250, 250)
  $brush = New-Object System.Drawing.SolidBrush([System.Drawing.Color]::White)
  $g.FillRectangle($brush, $rc)
  $font = New-Object System.Drawing.Font('Verdana', 12)
  $col = New-Object System.Drawing.SolidBrush([System.Drawing.Color]::Black)
  $str = [String]::Join(';', $shapes )
  $pos1 = New-Object System.Drawing.PointF(160, 60)
  $pos2 = New-Object System.Drawing.PointF(160, 80)

  $g.DrawString($color, $font, $col , $pos1)
  $g.DrawString($str, $font, $col , $pos2)
  start-sleep 1

  $caller.Message =  ('color:{0} shapes:{1}' -f $color , $str)

  $f.Close()
 })
   
  # Form1
  
  $f.AutoScaleBaseSize = New-Object System.Drawing.Size(5, 13)
  $f.ClientSize = New-Object System.Drawing.Size(408, 317)
  $f.Controls.AddRange( @(
     $button1,
     $checkBox3,
     $checkBox2,
     $checkBox1,
     $groupBox1))

  $f.Name = 'Form1'
  $f.Text = 'CheckBox and RadioButton Sample'
  $groupBox1.ResumeLayout($false)
  $f.ResumeLayout($false)

  $f.StartPosition = 'CenterScreen'

  $f.KeyPreview = $True

  $f.Add_KeyDown({

    if ($_.KeyCode -eq 'Escape')  { $caller.Data = $RESULT_CANCEL }
    else          {  }  
    $f.Close()
  })


  $f.Topmost = $True
  if ($caller -eq $null ){
    $caller = New-Object Win32Window -ArgumentList 
    ([System.Diagnostics.Process]::GetCurrentProcess().MainWindowHandle)
  }

  $f.Add_Shown( { $f.Activate() } )

  [Void] $f.ShowDialog([Win32Window ] ($caller) )
  $F.Dispose()

  return $caller.Data
}

PromptWithCheckboxesAndRadionbuttons ("Testing","Type Some Stuff",$Null)