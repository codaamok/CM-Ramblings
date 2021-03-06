function Get-UpdateFromDB {

    param
    (
        [parameter(Mandatory = $true)]
        [string]$ComputerName,
        [parameter(Mandatory = $true)]
        [string]$RBInstance,
        [parameter(Mandatory = $true)]
        [string]$ArticleID,
        [parameter(Mandatory = $true)]
        [string]$SQLServer,
        [parameter(Mandatory = $true)]
        [string]$Database
    )
    $Query = [string]::Format("SELECT * from dbo.SoftwareUpdates WHERE ServerName='{0}' and RBInstance='{1}' and ArticleID='{2}'", $ComputerName, $RBInstance, $ArticleID)
    $startCompPatchQuerySplat = @{
        Query     = $Query
        SQLServer = $SQLServer
        Database  = $Database
    }
    Start-CompPatchQuery @startCompPatchQuerySplat
}