;»»»»»»»»»»»»»»»»»»»»»»»»»»»»»»»»»»»»»»»»»»»»»»»»»»»»»»»»»»»»»»»»»»
; MatrixScript - IRCop/Away/Clone Scanner! Credit: kenzo`
;««««««««««««««««««««««««««««««««««««««««««««««««««««««««««««««««««
alias scanner if ($dialog(scanner)) dialog -v scanner | else dialog -m scanner scanner
dialog scanner {
  title Clone/Away/IRCop Scanner
  size -1 -1 170 157
  option dbu
  box "Scanning", 1, 1 20 168 75
  box "", 2, 1 93 168 19
  check "Clones", 3, 4 99 40 10, push
  check "IRCops", 4, 45 99 40 10, push
  check "Aways", 5, 86 99 40 10, push
  list 6, 4 28 162 53, size hide
  list 7, 4 28 162 53, size hide
  list 8, 4 28 162 53, size hide
  box "Actions", 15, 1 112 100 30
  text "Perform following action:", 16, 5 119 102 8
  button "Scan!", 9, 146 98 20 12, disable
  combo 10, 5 127 65 50, size drop
  button "Perform!", 11, 73 127 25 11, disable
  box "Channels", 12, 102 112 67 30
  text "MatrixScript (c)", 13, 3 146 100 13
  button "OK", 14, 148 144 21 12, ok
  text "Choose scan chan:", 17, 106 119 83 8
  combo 18, 106 127 60 50, size drop
  text "Nicks:", 19, 5 83 20 13, hide
  edit "", 20, 20 81 92 10, read multi autovs return hide
  text "Clone group(s):", 21, 115 83 40 13, hide
  edit "", 22, 154 81 12 10, read hide
  text "IRCop(s):", 23, 130 83 40 13, hide
  edit "", 24, 154 81 12 10, read hide
  text "Away nick(s):", 25, 120 83 40 13, hide
  edit "", 26, 154 81 12 10, read hide
  text "Scan in:", 27, 6 83 40 13, hide
  radio "Network", 28, 31 81 30 12, hide
  radio "Spec. channels", 29, 71 81 45 12, hide
  box "Network", 30, 1 0 168 21
  combo 31, 85 8 80 100, drop
  edit "", 32, 4 8 70 11, read
  text "@", 33, 77 10 6 13
}
on *:dialog:scanner:*:*:{
  if ($devent == init) {
    mdx SetMircVersion $version | mdx MarkDialog $dname 
    mdx SetControlMDX $dname 6,7,8 ListView report flatsb grid rowselect showsel nosortheader single > [ $mdx.vdll ] 
    did -i $dname 6 1 headerdims 275:1 30:2 | did -i $dname 6 1 headertext Host $ch9 $chr(35) | did -i $dname 7 1 headerdims 85:1 218:2 | did -i $dname 7 1 headertext IRCop Nick $ch9 Host | did -i $dname 8 1 headerdims 85:1 220:2 | did -i $dname 8 1 headertext Away Nick $ch9 Host
    var %i = 1 | while (%i <= 33) { mdx SetFont $dname %i 13 300 Tahoma | inc %i }
    var %j = 1 | while ($scon(%j).server) { did -a $dname 31 $ifmatch | inc %j }
    did -c $dname 18,31,32 1 | did -b $dname 10 | _grabinfo $did(31,1)
  }
  elseif ($devent == sclick) {
    if ($did == 3) { did -u $dname 4,5 | dide 9,18 | didv 6,19,20,21,22 | did -h $dname 7,8,23,24,25,26,27,28,29 }
    elseif ($did == 4) { did -u $dname 3,5 | dide 9 | did -h $dname 6,8,19,20,21,22,25,26 | did -b $dname 18 | didv 7,23,24,27,28,29 }
    elseif ($did == 5) { did -u $dname 3,4 | dide 9,18 | didv 8,25,26 | did -h $dname 6,7,19,20,21,22,7,23,24,27,28,29 }
    elseif ($did isnum 3-5) { 
      if ($did($dname,$did).state == 0) { did -h $dname 6,7,8,19,20,21,22,23,24,25,26,27,28,29 | did -b $dname 9,11,18 } 
    }
    elseif ($did == 6) { info $did(31).sel $gettok($did($dname,$did).seltext,6,32) }
    elseif ($did == 9) { 
      did -r $dname 10 | unset %s.action | var %action = scan $did(18).seltext $did(31).sel
      if ($did(18).seltext) { 
        if ($did(3).state) %action clones 
        elseif ($did(5).state) %action away 
        elseif ($did(4).state) { 
          if (%ircop.type) %action ircops
          else echo $color(info) -a * All-In-One Scanner: Choose IRCoperator scan type!
        }
      }
    }
    elseif ($did == 11) { 
      if ($did(10).seltext) && (($did(6).sel) || ($did(7).sel) || ($did(8).sel)) {
        scid $scon($did(31).sel) 
        var %s.action = $did(10).text
        if ($did(3).state) clone.act $did(31).sel $iif($did(10).sel == 1,kick,kban) 
        else { var %t.sel = $iif($did(4).state,7,8) | %s.action $gettok($did($dname,%t.sel).seltext,6,32) }
        scid -r
      }
    }
    elseif ($did == 18) { dialog -t $dname Scanning: $did(18).seltext }
    elseif ($did == 28) { did -b $dname 18 | set %ircop.type network }
    elseif ($did == 29) { dide 18 | set %ircop.type channel }
    elseif ($did == 31) { var %sel = $did(31).sel | _grabinfo $did(31,%sel) }
  }
}

alias -l _grabinfo {
  var %i = 1, %sc = scanner, %dido = did -a %sc 18
  while ($scon(%i)) {
    if ($scon(%i).server == $1) {
      scid $scon(%i)
      did -r %sc 18
      did -o %sc 32 1 $scon(%i).me
      var %i = 1
      while ($chan(%i)) { 
        %dido $ifmatch
        inc %i
      }
      scid -r
      break
    }
    inc %i
  }
  did -c %sc 18 1
}

alias -l scan {
  if ($3 == clones) {
    scid $scon($2) | did -r scanner 6 | if ($chan($1).ial != $true) && ($me ison $1) .who $1
    var %x = 1, %y = 1
    if ($hget(_clones) == $null) { .hmake -s _clones 100 }
    while (%x <= $nick($1,0)) { 
      if ($ialchan($address($nick($1,%x),2),$1,0) > 1) { .hadd _clones $address($nick($1,%x),2) $hget(_clones,$address($nick($1,%x),2)) }
      inc %x
    }
    while (%y <= $hget(_clones,0).item) {
      did -a scanner 6 $hget(_clones,%y).item $ch9 $ialchan($hget(_clones,%y).item,$1,0)
      inc %y
    }
    dide 11 | dialog -t scanner Finished Clone scanning: $did(scanner,18).seltext | did -o scanner 22 1 $calc($did(6).lines - 1) | didtok scanner 10 44 Kick,KickBan | did -c scanner 10 1 | scid -r | did -e scanner 10 | .hfree -s _clones
  }
  elseif ($3 == away) { scid $scon($2) | did -r scanner 8 | .enable #scanaway | .who $$1 | scid -r }
  elseif ($3 == ircops) { scid $scon($2) | did -r scanner 7 | .enable #ircop-scan.net | if (%ircop.type == network) .who 0 o | else .who $did(scanner,18).seltext | scid -r }
}


alias -l info { 
  did -r scanner 20 | scid $scon($1)
  var %x = 1, %y = 1
  if ($hget(_info) == $null) { .hmake -s _info 100 }
  while (%x <= $ialchan($2,$did(scanner,18).seltext,0)) {
    .hadd _info $ialchan($2,$did(scanner,18).seltext,%x).nick
    inc %x
  }
  while (%y <= $hget(_info,0).item) {
    did -a scanner 20 $hget(_info,%y).item $+ ,
    inc %y
  }
  did -ra scanner 20 $left($did(scanner,20).text,-1) | scid -r | .hfree -s _info
}

alias -l clone.act {
  if ($me isop $did(scanner,18).seltext) {
    scid $scon($1) | var %chan = $did(scanner,18).seltext , %t.user = $gettok($did(scanner,6).seltext,11,32) , %t.host = $gettok($did(scanner,6).seltext,6,32)
    $iif($2 == kban,ban %chan %t.host 2)
    var %i = 1
    while (%i <= %t.user) {
      var %t.nicks = $ialchan(%t.host,%chan,%i).nick
      kick %chan %t.nicks Clone %i out of %t.user
      inc %i
    }
    unset %chan,%t.nicks,%t.user,%t.host | scid -r 
  }
}

alias -l dide did -e scanner $1-
alias -l didv did -v scanner $1-
alias -l ch9 return $chr(9)
alias -l mdx { if ($lock(dll)) return | if ($isid) return $dll($mdx.udll,$1,$iif($2- != $null,$2-,.)) | dll $shortfn($mdx.udll) $1- }
alias -l mdx.udll { return $scriptdirmdx.dll }
alias -l mdx.vdll { return $scriptdirviews.mdx }

#ircop-scan.net off
raw 315:*: .disable #ircop-scan.net | dialog -t scanner Finished IRCop scanning: $iif(%ircop.type == channel,$did(scanner,18).seltext),$network) | did -o scanner 24 1 $calc($did(scanner,7).lines - 1) | didtok scanner 10 44 /whois,/query | did -c scanner 10 1 | did -e scanner 10,11 | did -c scanner 18 1 | unset %ircop.type | halt
raw 352:*: { 
  if (%ircop.type == channel) { if (* isin $7) { did -a scanner 7 $6 $chr(9) $address($6,2) } | haltdef }
  else { did -a scanner 7 $6 $chr(9) $address($6,2) }
  halt
}
#ircop-scan.net end
#scanaway off
raw 352:*: if (G isin $7) { did -a scanner 8 $6 $ch9 $address($6,2) | inc %scan.aways } | halt
raw 315:*: dialog -t scanner Finished Away scanning: $did(scanner,18).seltext | did -o scanner 26 1 $calc($did(scanner,8).lines - 1) | .disable #scanaway | unset %scan.aways | didtok scanner 10 44 /whois,/query | did -c scanner 10 1 | did -e scanner 10,11 | did -c scanner 18 1 | halt 
#scanaway end
