function Test-IsAdministrator
{
    <#
    .Synopsis
    Tells whether the current user is an administrator.

    .Description
    The Test-IsAdministrator function determines whether the current user is a member of the 
    Administrators group on the local computer.
    It returns TRUE if a user is an administrator and FALSE otherwise.
    This function has no parameters.

    .Example
    C:\PS> Test-IsAdministrator
    False

    .Example
    # This prompt uses the Test-IsAdministrator function to change the prompt when the user
    is an administrator.

    function prompt 
    {
       if (Test-IsAdministrator) { '[ADMIN]: ' }

        elseif $(if (test-path variable:/PSDebugContext) { '[DBG]: ' } 

        else { '' }) + 'PS ' + $(Get-Location) + $(if ($nestedpromptlevel -ge 1) { '>>' }) + '> '
    }
    #>   
    param() 
    $currentUser = [Security.Principal.WindowsIdentity]::GetCurrent()
    (New-Object Security.Principal.WindowsPrincipal $currentUser).IsInRole([Security.Principal.WindowsBuiltinRole]::Administrator)
}
