param ($url)
$hreflinks = (Invoke-WebRequest –Uri $url).Links.href
$uniqlinks = ($hreflinks | Sort-Object | Get-Unique)
foreach ($uniqlink in $uniqlinks){
    if($uniqlink -match "^([a-z0-9+.-]+):\/\/"){
        write-output $uniqlink
    }
    elseif($uniqlink -match "^\/"){
        write-output $url$uniqlink
    }
    else{
         write-output $url"/"$uniqlink
    }
    
}