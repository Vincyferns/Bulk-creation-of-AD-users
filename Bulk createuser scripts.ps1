$users= import-csv "C:\Users\vincy\Downloads\users.csv"
$PasswordProfile = New-Object -TypeName Microsoft.Open.AzureAD.Model.PasswordProfile
$PasswordProfile.Password = "Monday@123"

foreach($user in $users)
{
write-host "The display name for this user is $($user.displayname)" -ForegroundColor Green
New-AzureADUser -DisplayName $user.DisplayName -PasswordProfile $PasswordProfile -UserPrincipalName $user.UserPrincipalName -AccountEnabled $true -MailNickName $user.MailNickName
}