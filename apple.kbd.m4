;; Based on keymap/template/apple.kbd

(defcfg
  ;; Override iokit-name as follows
  ;;
  ;;     kmonad --input "iokit-name 'Magic Keyboard'" apple.kbd
  ;;
  ;; See https://github.com/kmonad/kmonad/issues/156#issuecomment-748485220
  input (iokit-name "__NAME__")
  output (kext)
  fallthrough true
)

(defsrc
  esc  f1   f2   f3   f4   f5   f6   f7   f8   f9   f10  f11  f12
  grv  1    2    3    4    5    6    7    8    9    0    -    =    bspc
  tab  q    w    e    r    t    y    u    i    o    p    [    ]    \
  caps a    s    d    f    g    h    j    k    l    ;    '    ret
  lsft z    x    c    v    b    n    m    ,    .    /    rsft up
  fn   lctl lalt lmet           spc            rmet ralt left down rght
)


(defalias
  esc (tap-hold-next-release 200 esc lctl)
  fn (around (layer-toggle function) fn)
  sym (tap-hold-next-release 200 spc (layer-toggle symbols))
  ext (layer-toggle extend)

  ;; Home row mods (https://precondition.github.io/home-row-mods)
  hra (tap-hold-next-release 200 a lctl)
  hrs (tap-hold-next-release 200 s lalt)
  hrd (tap-hold-next-release 200 d lmet)
  hrf (tap-hold-next-release 200 f lsft)

  hrj (tap-hold-next-release 200 j rsft)
  hrk (tap-hold-next-release 200 k rmet)
  hrl (tap-hold-next-release 200 l lalt)
  hr; (tap-hold-next-release 200 ; rctl)

  hop (tap-hold-next-release 200 S-9 lctl)
  hcp (tap-hold-next-release 200 S-0 lalt)
  hob (tap-hold-next-release 200 [ lmet)
  hcb (tap-hold-next-release 200 ] lsft)

  hos (tap-hold-next-release 200 { rsft)
  hcs (tap-hold-next-release 200 } rmet)
  hus (tap-hold-next-release 200 S-- lalt)
  hpl (tap-hold-next-release 200 + rctl)
)

(deflayer default
  _    f14  f15  mctl lp   _    _    prev pp   next mute vold volu
  _    _    _    _    _    _    _    _    _    _    _    _    _    _
  _    _    _    _    _    _    _    _    _    _    _    _    _    _
  @esc @hra @hrs @hrd @hrf _    _    @hrj @hrk @hrl @hr; _    _
  _    _    _    _    _    _    _    _    _    _    _    _    _
  @fn  _    _    _              @sym           @ext _    _    _    _
)

(deflayer function
  _    f1   f2   f3   f4   f5   f6   f7   f8   f9   f10  f11  f12
  _    _    _    _    _    _    _    _    _    _    _    _    _    del
  _    _    _    _    _    _    _    _    _    _    _    _    _    _
  _    _    _    _    _    _    _    _    _    _    _    _    _
  _    _    _    _    _    _    _    _    _    _    _    _    pgup
  _    _    _    _              _              _    _    home pgdn end
)

(deflayer symbols
  _    _    _    _    _    _    _    _    _    _    _    _    _
  _    _    _    _    _    _    _    _    _    _    _    _    _    _
  grv  !    @    #    $    %    ^    &    *    -    =    _    _    _
  ~    @hop @hcp @hob @hcb _    _    @hos @hcs @hus @hpl \    _
  _    _    _    _    _    _    _    A-1  _    _    _    |    _
  _    _    _    _              _              _    _    _    _    _
 )

(deflayer extend
  _    _    _    _    _    _    _    _    _    _    _    _    _
  _    _    _    _    _    _    _    _    _    _    _    _    _    _
  _    _    _    _    _    _    pgup home up   end  del  _    _    _
  _    lctl lalt lmet lsft _    pgdn left down rght bspc _    _
  _    _    _    _    _    _    _    _    _    _    _    _    _
  _    _    _    _              _              _    _    _    _    _
 )
