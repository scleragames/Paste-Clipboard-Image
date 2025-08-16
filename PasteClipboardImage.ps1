Add-Type -AssemblyName System.Windows.Forms
Add-Type -AssemblyName System.Drawing

$img = [Windows.Forms.Clipboard]::GetImage()
if ($img -ne $null) {
    $filename = Join-Path -Path $PWD -ChildPath ("clipboard_" + (Get-Date -Format "yyyyMMdd_HHmmss") + ".png")
    $img.Save($filename, [System.Drawing.Imaging.ImageFormat]::Png)
    Write-Output "Image saved to $filename"
} else {
    Write-Output "No image in clipboard!"
}
