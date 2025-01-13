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
  esc (tap-hold-next-release 200 esc lalt)
  fn (around (layer-toggle function) fn)
  sym (tap-hold-next-release 200 spc (layer-toggle symbols))
  ext (layer-toggle extend)

  ;; Home row mods (https://precondition.github.io/home-row-mods)
  hra (tap-hold-next-release 200 a lctl)
  hrs (tap-hold-next-release 200 s ralt)
  hrd (tap-hold-next-release 200 d lmet)
  hrf (tap-hold-next-release 200 f lsft)

  hrj (tap-hold-next-release 200 j rsft)
  hrk (tap-hold-next-release 200 k rmet)
  hrl (tap-hold-next-release 200 l ralt)
  hr; (tap-hold-next-release 200 ; rctl)

  hob (tap-hold-next-release 200 [ rsft)
  hcb (tap-hold-next-release 200 ] rmet)
  hmn (tap-hold-next-release 200 - ralt)
  heq (tap-hold-next-release 200 = rctl)
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
  XX   XX   XX   XX   XX   XX   XX   XX   XX   XX   XX   XX   XX   XX
  grv  1    2    3    4    5    6    7    8    9    0    -    =    XX
  _    lctl ralt lmet lsft XX   XX   rsft rmet ralt rctl \    _
  _    XX   XX   XX   XX   XX   XX   [    ]    _    _    _    _
  _    _    _    _              _              _    _    _    _    _
 )

(deflayer extend
  _    _    _    _    _    _    _    _    _    _    _    _    _
  XX   XX   XX   XX   XX   XX   XX   XX   XX   XX   XX   XX   XX   XX
  _    XX   XX   XX   XX   XX   pgup home up   end  del  XX   XX   XX
  _    lctl lalt lmet lsft XX   pgdn left down rght bspc XX   _
  _    M-z  M-x  M-c  M-v  XX   XX   XX   XX   XX   XX   _    _
  _    _    _    _              _              _    _    _    _    _
 )
